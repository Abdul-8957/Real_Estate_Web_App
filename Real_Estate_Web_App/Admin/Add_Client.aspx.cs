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
    public partial class Add_Client : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }

 
        protected void btnAddClient_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("ClientImage/");
            string fileName = Path.GetFileName(ClientImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = ClientImage.PostedFile;
            int size = postedFile.ContentLength;
            if (ClientImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        ClientImage.SaveAs(filePath + fileName);
                        string path = "ClientImage/" + fileName;
                        try
                        {


                            SqlCommand cmd = new SqlCommand("USP_Client_Detail", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Action", 1);
                            cmd.Parameters.AddWithValue("@nvc_client_name", txtName.Text);
                            cmd.Parameters.AddWithValue("@nvc_client_email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@nvc_client_gender", GenderDDL.SelectedItem.ToString());
                            cmd.Parameters.AddWithValue("@nvc_client_profession", txtProfession.Text);
                            cmd.Parameters.AddWithValue("@nvc_client_image", path);
                            cmd.Parameters.AddWithValue("@nvc_client_address", txtAddress.Text);
                            cmd.Parameters.AddWithValue("@nvc_client_message", txtMessage.Text);
                            cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                            con.Open();

                            int a = cmd.ExecuteNonQuery();
                            if (a > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','You have Registered SuccessFully !!','success')", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed !!','error')", true);
                            }
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                            //if (ex.Message.Contains("UNIQUE KEY constrait"))
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed.." + txtName.Text + " already Exist','error')", true);
                            //}
                            //else
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed..','error')", true);
                            //}
                        }
                        finally
                        {
                            con.Close();
                            ResetControl();
                        }


                    }
                    else
                    {
                        Label1.Text = "Length should be less then 1 MB";
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Red;
                    }

                }
                else
                {
                    Label1.Text = "Format not supported ~~";
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Red;
                }

            }
            else
            {
                Label1.Text = "Please Upload an Image.";
                Label1.Visible = true;
                Label1.ForeColor = Color.Red;
            }
        }
        protected void btnResetClient_Click(object sender, EventArgs e)
        {
            ResetControl();
        }
        void ResetControl()
        {
            txtName.Text = txtEmail.Text = txtProfession.Text = txtMessage.Text=txtAddress.Text=  "";
            GenderDDL.ClearSelection();
        }
        protected void btnCancleProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Added_Client.aspx");
            ResetControl();
        }

    }
}