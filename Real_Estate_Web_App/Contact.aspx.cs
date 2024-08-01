using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Text;

namespace Real_Estate_Web_App
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PropertyName();
                PropertyLocation();
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
                    PropertyLocationDDL.Items.Insert(0, new ListItem("Select Property Location", "0"));


                }
            }
        }
        public void PropertyLocation()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@Action", 10);
                sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", PropertyNameDDL.SelectedValue.ToString());
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PropertyLocationDDL.DataSource = dt;
                    PropertyLocationDDL.DataTextField = "nvc_property_location";
                    PropertyLocationDDL.DataValueField = "nvc_property_name";
                    PropertyLocationDDL.DataBind();
                    PropertyLocationDDL.Items.Insert(0, new ListItem("Select Property Location", "0"));

                }
            }
        }

        protected void PropertyNameDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            PropertyLocationDDL.Items.Clear();
            PropertyLocationDDL.Items.Insert(0, new ListItem("Select Property Location", "0"));

            if (PropertyNameDDL.SelectedValue != "")
            {
                PropertyLocation();
            }
            else
            {
                PropertyLocationDDL.Items.Insert(0, new ListItem("Select Property Location", "0"));

            }
        }

        protected void btnSendMsg_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            //string query = "insert into tbl_contact values(@nvc_name,@nvc_profession,@nvc_email,@nvc_subject,@nvc_message)";
            SqlCommand cmd = new SqlCommand("USP_Contact", con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action",1);
            cmd.Parameters.AddWithValue("@nvc_name", name.Text);
            cmd.Parameters.AddWithValue("@nvc_profession", profession.Text);
            cmd.Parameters.AddWithValue("@nvc_email", email.Text);
            cmd.Parameters.AddWithValue("@nvc_subject", subject.Text);
            cmd.Parameters.AddWithValue("@nvc_message", msg.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Form Submitted SuccessFully !!','success')", true);
                
                ResetControl();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Form Submittion Failed !!','error')", true);
                ResetControl();
                //Response.Write("<script>alert('Insertion failed !!')</script>");
            }
            con.Close();

          
        }
        void ResetControl()
        {
            name.Text = profession.Text = email.Text = subject.Text = msg.Text = "";
        }

    }
}