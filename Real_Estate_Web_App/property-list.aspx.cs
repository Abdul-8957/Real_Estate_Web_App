using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing.Design;
using System.Data;
using System.Collections;
using System.Drawing;

namespace Real_Estate_Web_App
{
    public partial class property_list : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
       public  DataTable dtPropertyListing = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PropertyListing();
                PropertyName();
                PropertyLocation();
            }
           
        }
        public void PropertyListing()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
            sda.Fill(dtPropertyListing);
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
                sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name",PropertyNameDDL.SelectedValue.ToString());
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 11);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_type_name", search.Text);
            sda.SelectCommand.Parameters.AddWithValue("@Name", search.Text);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", PropertyNameDDL.SelectedValue);
            sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location", PropertyLocationDDL.SelectedValue);
            //if(PropertyLocationDDL.SelectedValue != "")
            //{
            //    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location", PropertyLocationDDL.SelectedItem.Text);

            //}
            //else
            //{
            //    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_location","");

            //}
            //if (PropertyLocationDDL.SelectedValue != "")
            //{
            //    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", PropertyNameDDL.SelectedItem.Text);

            //}
            //else
            //{
            //    sda.SelectCommand.Parameters.AddWithValue("@nvc_property_name", "");

            //}

            sda.Fill(dtPropertyListing);
            if (dtPropertyListing.Rows.Count > 0)
            {
                lblNoRecordFound.Visible = false;
              
            }
            else
            {
                lblNoRecordFound.Text = "No Records Found.....";
                lblNoRecordFound.Visible = true;

                //Response.Write("<script>alert('No Records Found')</script>");

            }
        }

        protected void forFeature_Click(object sender, EventArgs e)
        {
            PropertyListing();
            forFeature.BackColor = Color.FromArgb(0, 185, 142);
            forFeature.ForeColor = Color.White;
            forSell.BackColor = Color.White;
            forSell.ForeColor = Color.Black;
            forRent.BackColor = Color.White;
            forRent.ForeColor = Color.Black;

        }

        protected void forSell_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("usp_property_details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@action", 24);
            DataTable dt = new DataTable();
            forSell.BackColor = Color.FromArgb(0, 185, 142);
            forSell.ForeColor = Color.White;
            forFeature.BackColor = Color.White;
            forFeature.ForeColor = Color.Black;
            forRent.BackColor = Color.White;
            forRent.ForeColor = Color.Black;
            sda.Fill(dtPropertyListing);
            
        }

        protected void forRent_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 23);
            DataTable dt = new DataTable();
            forRent.BackColor = Color.FromArgb(0, 185, 142);
            forRent.ForeColor = Color.White;
            forFeature.BackColor = Color.White;
            forFeature.ForeColor = Color.Black;
            forSell.BackColor = Color.White;
            forSell.ForeColor = Color.Black;
            sda.Fill(dtPropertyListing);

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
    }

}