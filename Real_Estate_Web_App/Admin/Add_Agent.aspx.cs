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
    public partial class Add_Agent : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }
       
        protected void btnAddAgent_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("AgentImage/");
            string fileName = Path.GetFileName(AgentImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = AgentImage.PostedFile;
            int size = postedFile.ContentLength;
            if (AgentImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        AgentImage.SaveAs(filePath + fileName);
                        string path = "AgentImage/" + fileName;
                        try
                        {


                            SqlCommand cmd = new SqlCommand("USP_Agent_Detail", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Action", 1);
                            cmd.Parameters.AddWithValue("@nvc_agent_name", txtName.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_gender", GenderDDL.SelectedItem.ToString());
                            cmd.Parameters.AddWithValue("@nvc_agent_mobile_no",txtMobileNo.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_designation", txtDesignation.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_instagram_account", txtInstagramAccount.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_facebook_account", txtFacebookAccount.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_twitter_account", txtTwitterAccount.Text);
                            cmd.Parameters.AddWithValue("@nvc_agent_image", path);
                            cmd.Parameters.AddWithValue("@nvc_agent_address", txtAddress.Text);
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

        protected void btnResetAgent_Click(object sender, EventArgs e)
        {
            ResetControl();
        }
        void ResetControl()
        {
            txtName.Text = txtEmail.Text =txtMobileNo.Text= txtDesignation.Text = txtInstagramAccount.Text = txtFacebookAccount.Text = txtTwitterAccount.Text = txtAddress.Text = "";
            GenderDDL.ClearSelection();
        }

        protected void btnCancleProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Added_Agent.aspx");
            ResetControl();
        }
       
    }
}