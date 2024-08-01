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
    public partial class Add_Property : System.Web.UI.Page
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
                PropertyTypeMaster();
               
                PropertyFeature();
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
       


        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("PropertyImage/");
            string fileName = Path.GetFileName(PropertyImage.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = PropertyImage.PostedFile;
            int size = postedFile.ContentLength;
            if (PropertyImage.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        PropertyImage.SaveAs(filePath + fileName);
                        string path = "PropertyImage/" + fileName;
                        try
                        {

                            SqlCommand cmd = new SqlCommand("USP_Property_Details", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Action", 1);
                            cmd.Parameters.AddWithValue("@nvc_property_name", txtPropertyName.Text);
                            cmd.Parameters.AddWithValue("@in_property_feature_id", PropertyFeatureDDL.SelectedValue);
                            cmd.Parameters.AddWithValue("@nvc_property_amount", txtPropertyAmount.Text);
                            cmd.Parameters.AddWithValue("@in_property_type_id", PropertyTypeDDL.SelectedValue);
                            cmd.Parameters.AddWithValue("@nvc_property_area", txtPropertyArea.Text);
                            cmd.Parameters.AddWithValue("@nvc_property_bedroom", txtPropertyBedroom.Text);
                            cmd.Parameters.AddWithValue("@nvc_property_bathroom", txtPropertyBathroom.Text);
                            cmd.Parameters.AddWithValue("@nvc_property_image", path);
                            cmd.Parameters.AddWithValue("@nvc_admin_email", Session["admin_username"]);
                            con.Open();

                            int a = cmd.ExecuteNonQuery();
                            if (a > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Success','Add Property SuccessFully !!','success')", true);
                                resetControl();
                                Response.Redirect("Added_Property.aspx");

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure',' Failed !!','error')", true);
                                resetControl();
                            }
                        }
                        catch (SqlException ex)
                        {
                            if (ex.Number == 2601)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed.." + txtPropertyName.Text + " already Exist','error')", true);

                            }
                            else if (ex.Number==2627)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed.." + txtPropertyName.Text + " already Exist','error')", true);

                            }
                            //throw ex;
                            //if (ex.Message.Contains("UNIQUE KEY constrait"))
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed.." + txtPropertyName.Text + " already Exist','error')", true);
                            //}
                            //else
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", " Swal.fire('Failure','Registration Failed..','error')", true);
                            //}
                        }
                        finally
                        {
                            con.Close();
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
        void resetControl()
        {
            txtPropertyName.Text = txtPropertyAmount.Text = txtPropertyArea.Text = txtPropertyBedroom.Text = txtPropertyBathroom.Text = "";
            PropertyFeatureDDL.ClearSelection();
            PropertyTypeDDL.ClearSelection();
            Label1.Visible = false;
        }

        protected void btnCancleProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("Added_Property.aspx");
            resetControl();
        }

        protected void btnResetProperty_Click(object sender, EventArgs e)
        {
            resetControl();
        }
    }
}