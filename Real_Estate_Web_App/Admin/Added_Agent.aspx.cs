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
    public partial class Added_Agent : System.Web.UI.Page
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
                BindGridViewAgent();

            }


        }
        void BindGridViewAgent()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Agent_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);

            DataSet ds = new DataSet();
            sda.Fill(ds);
            AddedAgentGridView.DataSource = ds;
            AddedAgentGridView.DataBind();
        }

        protected void AddedAgentGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = AddedAgentGridView.Rows[e.RowIndex];
            Label deleteId = (Label)row.FindControl("lid");
            string dId = deleteId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Agent_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_agent_id", dId);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                BindGridViewAgent();
            }
            con.Close();
        }

        protected void AddedAgentGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = AddedAgentGridView.Rows[e.RowIndex];
            Label editId = (Label)row.FindControl("lid");
            string eId = editId.Text;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Agent_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@in_agent_id", eId);
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                editTextContainer.Visible = true;
                detailContainer.Visible = false;


                txtAgentId.Text = dt.Rows[0]["in_agent_id"].ToString();

                txtName.Text = dt.Rows[0]["nvc_agent_name"].ToString();
                txtEmail.Text = dt.Rows[0]["nvc_agent_email"].ToString();
                txtMobileNo.Text = dt.Rows[0]["nvc_agent_mobile_no"].ToString();
                GenderDDL.SelectedValue = dt.Rows[0]["nvc_agent_gender"].ToString();
                txtTwitterAccount.Text = dt.Rows[0]["nvc_agent_twitter_account"].ToString();
                txtInstagramAccount.Text = dt.Rows[0]["nvc_agent_instagram_account"].ToString();
                txtFacebookAccount.Text = dt.Rows[0]["nvc_agent_facebook_account"].ToString();
                txtAddress.Text = dt.Rows[0]["nvc_agent_address"].ToString();
                txtDesignation.Text = dt.Rows[0]["nvc_agent_designation"].ToString();
                imageAgent.ImageUrl = dt.Rows[0]["nvc_agent_image"].ToString();
           
            }
            con.Close();
        }

        protected void btnUpdateAgent_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("AgentImage/");
            string fileName = Path.GetFileName(AgentImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = AgentImage.PostedFile;
            int size = postedFile.ContentLength;

            string updatePath = "AgentImage/";
            if (AgentImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        updatePath = updatePath + fileName;
                        AgentImage.SaveAs(Server.MapPath(updatePath));

                        SqlCommand cmd = new SqlCommand("USP_Agent_Detail", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", 2);
                        cmd.Parameters.AddWithValue("@in_agent_id", txtAgentId.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_name", txtName.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_gender", GenderDDL.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@nvc_agent_mobile_no", txtMobileNo.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_designation", txtDesignation.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_instagram_account", txtInstagramAccount.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_facebook_account", txtFacebookAccount.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_twitter_account", txtTwitterAccount.Text);
                        cmd.Parameters.AddWithValue("@nvc_agent_image", updatePath);
                        cmd.Parameters.AddWithValue("@nvc_agent_address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Write("<script>alert('Updated successfully !!')</script>");
                            editTextContainer.Visible = false;
                            detailContainer.Visible = true;
                            BindGridViewAgent();
                            Label1.Visible = false;
                            imageAgent.Visible = false;
                            resetControl();

                            string deletePath = Server.MapPath(imageAgent.ImageUrl.ToString());
                            if (File.Exists(deletePath) == true)
                            {
                                File.Delete(deletePath);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Updation failed !!')</script>");
                            resetControl();
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
                updatePath = imageAgent.ImageUrl.ToString();

                SqlCommand cmd = new SqlCommand("USP_Agent_Detail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", 2);
                cmd.Parameters.AddWithValue("@in_agent_id", txtAgentId.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_name", txtName.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_gender", GenderDDL.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@nvc_agent_mobile_no", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_designation", txtDesignation.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_instagram_account", txtInstagramAccount.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_facebook_account", txtFacebookAccount.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_twitter_account", txtTwitterAccount.Text);
                cmd.Parameters.AddWithValue("@nvc_agent_image", updatePath);
                cmd.Parameters.AddWithValue("@nvc_agent_address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Updated successfully !!')</script>");
                    editTextContainer.Visible = false;
                    detailContainer.Visible = true;
                    BindGridViewAgent();
                    Label1.Visible = false;
                    imageAgent.Visible = false;
                    resetControl();
                }
                else
                {
                    Response.Write("<script>alert('Updation failed !!')</script>");
                    resetControl();
                }
                con.Close();
            }
        }

        protected void btnCancleAgent_Click(object sender, EventArgs e)
        {
            editTextContainer.Visible = false;
            detailContainer.Visible = true;
        }
        void resetControl()
        {
            txtName.Text = txtEmail.Text = txtDesignation.Text = txtInstagramAccount.Text = txtFacebookAccount.Text = txtTwitterAccount.Text = txtAddress.Text = "";
            GenderDDL.ClearSelection();
          
        }
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Agent_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 7);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_name", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_gender", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_email", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_mobile_no", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_designation", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_address", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_instagram_account", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_facebook_account", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_agent_twitter_account", txtSearch.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
                AddedAgentGridView.DataSource = dt;
                AddedAgentGridView.DataBind();
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                AddedAgentGridView.DataSource = null;
                AddedAgentGridView.DataBind();
                //Response.Write("<script>alert('No Records Found')</script>");

            }

        }
        protected void AddProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Agent.aspx");
        }

      
    }
}