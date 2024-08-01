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
    public partial class Added_Client : System.Web.UI.Page
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
                BindGridViewClient();

            }
        }
        void BindGridViewClient()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Client_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);

            DataSet ds = new DataSet();
            sda.Fill(ds);
            AddedClientGridView.DataSource = ds;
            AddedClientGridView.DataBind();
        }

      
        protected void AddedClientGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = AddedClientGridView.Rows[e.RowIndex];
            Label editId = (Label)row.FindControl("lid");
            string eId = editId.Text;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Client_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@in_Client_id", eId);
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                editTextContainer.Visible = true;
                detailContainer.Visible = false;


                txtClientId.Text = dt.Rows[0]["in_client_id"].ToString();

                txtName.Text = dt.Rows[0]["nvc_client_name"].ToString();
                txtEmail.Text = dt.Rows[0]["nvc_client_email"].ToString();
                GenderDDL.SelectedValue = dt.Rows[0]["nvc_client_gender"].ToString();
                txtProfession.Text = dt.Rows[0]["nvc_client_profession"].ToString();
                txtAddress.Text = dt.Rows[0]["nvc_client_address"].ToString();
                txtMessage.Text = dt.Rows[0]["nvc_client_message"].ToString();
                imageClient.ImageUrl = dt.Rows[0]["nvc_client_image"].ToString();
               
            }
            con.Close();
        }

        protected void AddedClientGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = AddedClientGridView.Rows[e.RowIndex];
            Label deleteId = (Label)row.FindControl("lid");
            string dId = deleteId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Client_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_client_id", dId);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                BindGridViewClient();
            }
            con.Close();
        }
        protected void btnUpdateClient_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("ClientImage/");
            string fileName = Path.GetFileName(ClientImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = ClientImage.PostedFile;
            int size = postedFile.ContentLength;

            string updatePath = "ClientImage/";
            if (ClientImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        updatePath = updatePath + fileName;
                        ClientImage.SaveAs(Server.MapPath(updatePath));

                        SqlCommand cmd = new SqlCommand("USP_Client_Detail", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", 2);
                        cmd.Parameters.AddWithValue("@in_client_id", txtClientId.Text);
                        cmd.Parameters.AddWithValue("@nvc_client_name", txtName.Text);
                        cmd.Parameters.AddWithValue("@nvc_client_email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@nvc_client_gender", GenderDDL.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@nvc_client_profession", txtProfession.Text);
                        cmd.Parameters.AddWithValue("@nvc_client_image", updatePath);
                        cmd.Parameters.AddWithValue("@nvc_client_address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@nvc_client_message", txtMessage.Text);
                        cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);
                       
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Write("<script>alert('Updated successfully !!')</script>");
                            editTextContainer.Visible = false;
                            detailContainer.Visible = true;
                            BindGridViewClient();
                            Label1.Visible = false;
                            imageClient.Visible = false;
                            ResetControl();

                            string deletePath = Server.MapPath(imageClient.ImageUrl.ToString());
                            if (File.Exists(deletePath) == true)
                            {
                                File.Delete(deletePath);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Updation failed !!')</script>");
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
                updatePath = imageClient.ImageUrl.ToString();

                SqlCommand cmd = new SqlCommand("USP_Client_Detail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", 2);
                cmd.Parameters.AddWithValue("@in_client_id", txtClientId.Text);
                cmd.Parameters.AddWithValue("@nvc_client_name", txtName.Text);
                cmd.Parameters.AddWithValue("@nvc_client_email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@nvc_client_gender", GenderDDL.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@nvc_client_profession", txtProfession.Text);
                cmd.Parameters.AddWithValue("@nvc_client_image", updatePath);
                cmd.Parameters.AddWithValue("@nvc_client_address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@nvc_client_message", txtMessage.Text);
                cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Updated successfully !!')</script>");
                    editTextContainer.Visible = false;
                    detailContainer.Visible = true;
                    BindGridViewClient();
                    Label1.Visible = false;
                    imageClient.Visible = false;
                    ResetControl();
                }
                else
                {
                    Response.Write("<script>alert('Updation failed !!')</script>");
                    ResetControl();
                }
                con.Close();
            }
        }
        protected void btnCancleClient_Click(object sender, EventArgs e)
        {
            editTextContainer.Visible = false;
            detailContainer.Visible = true;
        }

        void ResetControl()
        {
            txtName.Text = txtEmail.Text = txtProfession.Text = txtMessage.Text = txtAddress.Text = "";
            GenderDDL.ClearSelection();
        }
         protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Client_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 7);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_name", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_email", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_gender", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_profession", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_address", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_client_message", txtSearch.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
                AddedClientGridView.DataSource = dt;
                AddedClientGridView.DataBind();
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                AddedClientGridView.DataSource = null;
                AddedClientGridView.DataBind();
                //Response.Write("<script>alert('No Records Found')</script>");

            }
        }
        protected void AddProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Client.aspx");
        }
    }
}