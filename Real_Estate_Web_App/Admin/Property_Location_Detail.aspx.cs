using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Drawing.Design;
using System.Data;
using System.Collections;
using System.Drawing;
using System.Data.SqlClient;

namespace Real_Estate_Web_App.Admin
{
    public partial class Property_Location_Detail : System.Web.UI.Page
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
                PropertyName();
                PropertyLocationData();
            }
        }
        public void PropertyName()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@Action", 9);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PropertyNameDDL.DataSource = dt;
                    PropertyNameDDL.DataTextField = "nvc_property_name";
                    PropertyNameDDL.DataValueField = "nvc_property_name";

                    PropertyNameDDL.DataBind();
                    PropertyNameDDL.Items.Insert(0, new ListItem("Select Property Name", "0"));

                }
            }
        }

        protected void btnAddPropertyLocation_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {

                    SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Location", con);
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sda.SelectCommand.Parameters.AddWithValue("@in_property_location_id",txtPropertyLocationId.Text);
                    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", PropertyNameDDL.SelectedValue);
                    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location", txtPropertyLocation.Text);
                    sda.SelectCommand.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                    if (btnAddPropertyLocation.Text == "Update Location")
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@Action", 2);
                        heading.InnerText = "Add Property Location";
                        btnAddPropertyLocation.Text = "Add Location";
                        btnResetPropertyLocation.Text = "Reset";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Update Location SuccessFully !!','success')", true);
                        btnAddPropertyLocation.PostBackUrl = "#detailContainer";

                    }
                    else
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@Action", 1);
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Add Location SuccessFully !!','success')", true);
                        btnAddPropertyLocation.PostBackUrl = "#detailContainer";

                    }
                    con.Open();
                    sda.SelectCommand.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ResetControl();
                PropertyLocationData();
            }
        }

        protected void btnResetPropertyLocation_Click(object sender, EventArgs e)
        {
            if (btnResetPropertyLocation.Text == "Cancle")
            {
                heading.InnerText = "Add Property Location";
                btnAddPropertyLocation.Text = "Add Location";
                btnResetPropertyLocation.Text = "Reset";
                ResetControl();
            }
            else
            {
                ResetControl();
            }
            
        }
        public void PropertyLocationData()
        {
            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Location", con);
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
                    sda.Fill(dt);
                    if (dt.Rows.Count > -1)
                    {
                        LocationGridView.DataSource = dt;
                        LocationGridView.DataBind();
                       
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        void ResetControl()
        {
            PropertyNameDDL.ClearSelection();
            txtPropertyLocation.Text = "";
        }

        protected void AddedGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = LocationGridView.Rows[e.RowIndex];
            Label editId = (Label)row.FindControl("lid");
            string eId = editId.Text;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Location", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@in_property_location_id", eId);
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                txtPropertyLocationId.Text = dt.Rows[0]["in_property_location_id"].ToString();
                PropertyNameDDL.SelectedValue = dt.Rows[0]["nvc_property_name"].ToString();
                txtPropertyLocation.Text = dt.Rows[0]["nvc_property_location"].ToString();
                heading.InnerText = "Update Property Location";
                btnAddPropertyLocation.Text = "Update Location";
                btnResetPropertyLocation.Text = "Cancle";

            }
            con.Close();
        }

        protected void AddedGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = LocationGridView.Rows[e.RowIndex];
            Label deleteId = (Label)row.FindControl("lid");
            string dId = deleteId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Property_Location", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_property_location_id", dId);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                PropertyLocationData();
            }
            con.Close();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Location", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 6);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name",txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location",txtSearch.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
                LocationGridView.DataSource = dt;
                LocationGridView.DataBind();
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                LocationGridView.DataSource = null;
                LocationGridView.DataBind();
                //Response.Write("<script>alert('No Records Found')</script>");

            }
        }
    }
}