using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Real_Estate_Web_App.Admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Admin_Login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 1);
            cmd.Parameters.AddWithValue("@nvc_admin_email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@nvc_admin_password", txtPassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                Session["admin_username"] = txtEmail.Text;
                txtEmail.Text = "";
                txtPassword.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','LogIn Success !!','success')", true);
                Response.Redirect("Default.aspx");
            }
            else
            {
                txtEmail.Text = "";
                txtPassword.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Username Or Password is Incorrect!!','error')", true);
            }
            con.Close();
        }
    }
}