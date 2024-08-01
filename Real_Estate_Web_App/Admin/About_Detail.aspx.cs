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
    public partial class About_Detail : System.Web.UI.Page
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
                BindAboutGridView();
            }
        }
        void BindAboutGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_About_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);

            DataSet ds = new DataSet();
            sda.Fill(ds);
            AboutGridView.DataSource = ds;
            AboutGridView.DataBind();
        }

        protected void btnAddAbout_Click(object sender, EventArgs e)
        {
            if (btnAddAbout.Text == "Update About")
            {
                heading.InnerText = "Add About";
                btnAddAbout.Text = "Add About";
                btnResetAbout.Text = "Reset";
                txtAboutDescription.Height = 140;
                imageAbout.Visible = false;
                UpdateData();
            }
            else
            {
                InsertData();
            }
        }

        protected void btnResetAbout_Click(object sender, EventArgs e)
        {
            if (btnResetAbout.Text == "Cancle")
            {
                heading.InnerText = "Add About";
                btnAddAbout.Text = "Add About";
                btnResetAbout.Text = "Reset";
                imageAbout.Visible = false;
                txtAboutDescription.Height = 140;
                ResetControl();
            }
            else
            {
                ResetControl();
            }

        }
        void ResetControl()
        {
            txtAboutName.Text = txtAboutDescription.Text = "";
            Label1.Visible = false;
        }

        protected void AboutGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = AboutGridView.Rows[e.RowIndex];
            Label editId = (Label)row.FindControl("lid");
            string eId = editId.Text;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_About_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@in_About_id", eId);
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtAboutId.Text = dt.Rows[0]["in_about_id"].ToString();

                txtAboutName.Text = dt.Rows[0]["nvc_about_name"].ToString();
                txtAboutDescription.Text = dt.Rows[0]["nvc_about_description"].ToString();
                imageAbout.ImageUrl = dt.Rows[0]["nvc_about_image"].ToString();
                heading.InnerText = "Update About";
                btnAddAbout.Text = "Update About";
                btnResetAbout.Text = "Cancle";
                imageAbout.Visible = true;
                txtAboutDescription.Height = 250;
            }
            con.Close();
        }

        protected void AboutGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = AboutGridView.Rows[e.RowIndex];
            Label deleteId = (Label)row.FindControl("lid");
            string dId = deleteId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_About_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_about_id", dId);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                BindAboutGridView();
            }
            con.Close();
        }

        void InsertData()
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("AboutImage/");
            string fileName = Path.GetFileName(AboutImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = AboutImage.PostedFile;
            int size = postedFile.ContentLength;
            if (AboutImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        AboutImage.SaveAs(filePath + fileName);
                        string path = "AboutImage/" + fileName;
                        try
                        {


                            SqlCommand cmd = new SqlCommand("USP_About_Detail", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Action", 1);
                            cmd.Parameters.AddWithValue("@nvc_about_name", txtAboutName.Text);
                            cmd.Parameters.AddWithValue("@nvc_about_description", txtAboutDescription.Text);
                            cmd.Parameters.AddWithValue("@nvc_about_image", path);
                            cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                            con.Open();
                            int a = cmd.ExecuteNonQuery();
                            if (a > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Add About SuccessFully !!','success')", true);
                                BindAboutGridView();
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Add About Failed !!','error')", true);
                                BindAboutGridView();
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
        void UpdateData()
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("AboutImage/");
            string fileName = Path.GetFileName(AboutImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = AboutImage.PostedFile;
            int size = postedFile.ContentLength;

            string updatePath = "AboutImage/";
            if (AboutImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        updatePath = updatePath + fileName;
                        AboutImage.SaveAs(Server.MapPath(updatePath));

                        SqlCommand cmd = new SqlCommand("USP_About_Detail", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", 2);
                        cmd.Parameters.AddWithValue("@in_about_id", txtAboutId.Text);
                        cmd.Parameters.AddWithValue("@nvc_about_name", txtAboutName.Text);
                        cmd.Parameters.AddWithValue("@nvc_about_description", txtAboutDescription.Text);
                        cmd.Parameters.AddWithValue("@nvc_about_image", updatePath);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Update About SuccessFully !!','success')", true);
                            BindAboutGridView();
                            Label1.Visible = false;
                            imageAbout.Visible = false;
                            ResetControl();

                            string deletePath = Server.MapPath(imageAbout.ImageUrl.ToString());
                            if (File.Exists(deletePath) == true)
                            {
                                File.Delete(deletePath);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Update About Failed !!','error')", true);
                            ResetControl();
                        }
                        con.Close();
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
                updatePath = imageAbout.ImageUrl.ToString();

                SqlCommand cmd = new SqlCommand("USP_About_Detail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", 2);
                cmd.Parameters.AddWithValue("@in_about_id", txtAboutId.Text);
                cmd.Parameters.AddWithValue("@nvc_about_name", txtAboutName.Text);
                cmd.Parameters.AddWithValue("@nvc_about_description", txtAboutDescription.Text);
                cmd.Parameters.AddWithValue("@nvc_about_image", updatePath);
                cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Update About SuccessFully !!','success')", true);
                    BindAboutGridView();
                    Label1.Visible = false;
                    imageAbout.Visible = false;
                    ResetControl();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Update About Failed !!','error')", true);
                    ResetControl();
                }
                con.Close();
            }
        }
    }
}