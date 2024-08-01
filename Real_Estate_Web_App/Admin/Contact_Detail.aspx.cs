using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Data;

namespace Real_Estate_Web_App.Admin
{
    public partial class Contact_Detail : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindContactGridView();
            }
        }
        void BindContactGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Contact", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ContactGridView.DataSource = dt;
            ContactGridView.DataBind();
        }

        protected void ContactGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = ContactGridView.Rows[e.RowIndex];
            Label itemId = (Label)row.FindControl("lblId");
            string Id = itemId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Contact", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_contact_id", Id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                BindContactGridView();
            }
            con.Close();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Contact", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_name", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_email", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_profession", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_subject", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_message", txtSearch.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
                ContactGridView.DataSource = dt;
                ContactGridView.DataBind();
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                ContactGridView.DataSource = null;
                ContactGridView.DataBind();
                //Response.Write("<script>alert('No Records Found')</script>");

            }
        }
    }
}