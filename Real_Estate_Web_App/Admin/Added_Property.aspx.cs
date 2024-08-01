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
    public partial class Added_Property : System.Web.UI.Page
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
                BindGridView();
                PropertyFeature();
                PropertyLocation();
                PropertyTypeMaster();
            }

        }
        public void PropertyTypeMaster()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@Action", 6);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PropertyTypeDDL.DataSource = dt;
                    PropertyTypeDDL.DataTextField = "nvc_property_type_name";
                    PropertyTypeDDL.DataValueField = "in_property_type_id";
                    PropertyTypeDDL.DataBind();
                    PropertyTypeDDL.Items.Insert(0, new ListItem("Select Property Type..", " "));

                }
            }
        }
        public void PropertyFeature()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@Action", 7);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PropertyFeatureDDL.DataSource = dt;
                    PropertyFeatureDDL.DataTextField = "name";
                    PropertyFeatureDDL.DataValueField = "id";
                    PropertyFeatureDDL.DataBind();
                    PropertyFeatureDDL.Items.Insert(0, new ListItem("Select Property Feature..", " "));

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
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    PropertyFeatureDDL.DataSource = dt;
                    PropertyFeatureDDL.DataTextField = "nvc_property_location";
                    PropertyFeatureDDL.DataValueField = "nvc_property_name";
                    PropertyFeatureDDL.DataBind();
                    PropertyFeatureDDL.Items.Insert(0, new ListItem("Select Property Feature..", " "));

                }
            }
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 25);
          
                DataSet ds = new DataSet();
                sda.Fill(ds);
                AddedGridView.DataSource = ds;
                AddedGridView.DataBind();
        }


        protected void AddedGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = AddedGridView.Rows[e.RowIndex];
            Label editId = (Label)row.FindControl("lid");
            string eId = editId.Text;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(cs);
            //string query = "select * from tbl_property_detail where in_property_id=@id";
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 5);
            sda.SelectCommand.Parameters.AddWithValue("@in_property_id", eId);
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                editTextContainer.Visible = true;
                detailContainer.Visible = false;


                txtPropertyId.Text = dt.Rows[0]["in_property_id"].ToString();
                
                txtPropertyName.Text = dt.Rows[0]["nvc_property_name"].ToString();
                //txtPropertyLocation.Text = dt.Rows[0]["nvc_property_location"].ToString();
                PropertyTypeDDL.SelectedValue = dt.Rows[0]["in_property_type_id"].ToString();
                PropertyFeatureDDL.SelectedValue = dt.Rows[0]["in_property_feature_id"].ToString();
                txtPropertyArea.Text = dt.Rows[0]["nvc_property_area"].ToString();
                txtPropertyAmount.Text = dt.Rows[0]["nvc_property_amount"].ToString();
                txtPropertyBedroom.Text = dt.Rows[0]["nvc_property_bedroom"].ToString();
                txtPropertyBathroom.Text = dt.Rows[0]["nvc_property_bathroom"].ToString();
                imageProperty.ImageUrl = dt.Rows[0]["nvc_property_image"].ToString();
            }
            con.Close();
        }

        protected void AddedGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = AddedGridView.Rows[e.RowIndex];
            Label deleteId = (Label)row.FindControl("lid");
            string dId = deleteId.Text;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("USP_Property_Details", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", 3);
            cmd.Parameters.AddWithValue("@in_property_id", dId);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfully !!')</script>");
                BindGridView();
            }
            con.Close();
        }

        protected void btnCancleProperty_Click(object sender, EventArgs e)
        {
            editTextContainer.Visible = false;
            detailContainer.Visible = true;
        }

        protected void btnUpdateProperty_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("PropertyImage/");
            string fileName = Path.GetFileName(PropertyImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = PropertyImage.PostedFile;
            int size = postedFile.ContentLength;

            string updatePath = "PropertyImage/";
            if (PropertyImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        updatePath = updatePath + fileName;
                        PropertyImage.SaveAs(Server.MapPath(updatePath));

                        //string query = "update tbl_property_detail set nvc_property_name=@nvc_property_name,nvc_property_feature=@nvc_property_feature,nvc_property_amount=@nvc_property_amount,nvc_property_type=@nvc_property_type,nvc_property_location=@nvc_property_location,nvc_property_area=@nvc_property_area,nvc_property_bedroom=@nvc_property_bedroom,nvc_property_bathroom=@nvc_property_bathroom,nvc_property_image=@nvc_property_image,nvc_admin_email=@nvc_admin_email where in_property_id=@in_property_id";
                        SqlCommand cmd = new SqlCommand("USP_Property_Details", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", 2);
                        cmd.Parameters.AddWithValue("@in_property_id", txtPropertyId.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_name", txtPropertyName.Text);
                        cmd.Parameters.AddWithValue("@in_property_feature_id", PropertyFeatureDDL.SelectedValue);
                        cmd.Parameters.AddWithValue("@in_property_amount_id", txtPropertyAmount.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_type", PropertyTypeDDL.SelectedValue);
                        //cmd.Parameters.AddWithValue("@nvc_property_location", txtPropertyLocation.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_area", txtPropertyArea.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_bedroom", txtPropertyBedroom.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_bathroom", txtPropertyBathroom.Text);
                        cmd.Parameters.AddWithValue("@nvc_property_image", updatePath);
                        cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Write("<script>alert('Updated successfully !!')</script>");
                            editTextContainer.Visible = false;
                            detailContainer.Visible = true;
                            BindGridView();
                            Label1.Visible = false;
                            imageProperty.Visible = false;
                            resetControl();

                            string deletePath = Server.MapPath(imageProperty.ImageUrl.ToString());
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
                updatePath = imageProperty.ImageUrl.ToString();

                //string query = "update tbl_property_detail set nvc_property_name=@nvc_property_name,nvc_property_feature=@nvc_property_feature,nvc_property_amount=@nvc_property_amount,nvc_property_type=@nvc_property_type,nvc_property_location=@nvc_property_location,nvc_property_area=@nvc_property_area,nvc_property_bedroom=@nvc_property_bedroom,nvc_property_bathroom=@nvc_property_bathroom,nvc_property_image=@nvc_property_image,nvc_admin_email=@nvc_admin_email where in_property_id=@in_property_id";
                //SqlCommand cmd = new SqlCommand(query, con);
                SqlCommand cmd = new SqlCommand("USP_Property_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", 2);
                cmd.Parameters.AddWithValue("@in_property_id", txtPropertyId.Text);
                cmd.Parameters.AddWithValue("@nvc_property_name", txtPropertyName.Text);
                cmd.Parameters.AddWithValue("@in_property_feature_id", PropertyFeatureDDL.SelectedValue);
                cmd.Parameters.AddWithValue("@nvc_property_amount", txtPropertyAmount.Text);
                cmd.Parameters.AddWithValue("@in_property_type_id", PropertyTypeDDL.SelectedValue);
                //cmd.Parameters.AddWithValue("@nvc_property_location", txtPropertyLocation.Text);
                cmd.Parameters.AddWithValue("@nvc_property_area", txtPropertyArea.Text);
                cmd.Parameters.AddWithValue("@nvc_property_bedroom", txtPropertyBedroom.Text);
                cmd.Parameters.AddWithValue("@nvc_property_bathroom", txtPropertyBathroom.Text);
                cmd.Parameters.AddWithValue("@nvc_property_image", updatePath);
                cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Updated successfully !!')</script>");
                    editTextContainer.Visible = false;
                    detailContainer.Visible = true;
                    BindGridView();
                    Label1.Visible = false;
                    imageProperty.Visible = false;
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
        void resetControl()
        {
            txtPropertyName.Text = txtPropertyAmount.Text = txtPropertyId.Text = txtPropertyArea.Text = txtPropertyBedroom.Text = txtPropertyBathroom.Text = "";
            PropertyFeatureDDL.ClearSelection();
            PropertyTypeDDL.ClearSelection();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 12);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_amount", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_area", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_bedroom", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_bathroom", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_type_name", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location", txtSearch.Text);
            sda.SelectCommand.Parameters.AddWithValue("@Name", txtSearch.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
                AddedGridView.DataSource = dt;
                AddedGridView.DataBind();
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                AddedGridView.DataSource = null;
                AddedGridView.DataBind();
                //Response.Write("<script>alert('No Records Found')</script>");

            }
        }

        protected void AddProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Property.aspx");
        }
    }
}

