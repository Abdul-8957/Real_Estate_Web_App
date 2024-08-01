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

namespace Real_Estate_Web_App
{
    public partial class property_type : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindType();
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
        void BindType()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda1 = new SqlDataAdapter("USP_Property_Details", con);
            sda1.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda1.SelectCommand.Parameters.AddWithValue("@Action", 15);
            SqlDataAdapter sda2 = new SqlDataAdapter("USP_Property_Details", con);
            sda2.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda2.SelectCommand.Parameters.AddWithValue("@Action", 16);
            SqlDataAdapter sda3 = new SqlDataAdapter("USP_Property_Details", con);
            sda3.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda3.SelectCommand.Parameters.AddWithValue("@Action", 17);
            SqlDataAdapter sda4 = new SqlDataAdapter("USP_Property_Details", con);
            sda4.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda4.SelectCommand.Parameters.AddWithValue("@Action", 18);
            SqlDataAdapter sda5 = new SqlDataAdapter("USP_Property_Details", con);
            sda5.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda5.SelectCommand.Parameters.AddWithValue("@Action", 19);
            SqlDataAdapter sda6 = new SqlDataAdapter("USP_Property_Details", con);
            sda6.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda6.SelectCommand.Parameters.AddWithValue("@Action", 20);
            SqlDataAdapter sda7 = new SqlDataAdapter("USP_Property_Details", con);
            sda7.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda7.SelectCommand.Parameters.AddWithValue("@Action", 21);
            SqlDataAdapter sda8 = new SqlDataAdapter("USP_Property_Details", con);
            sda8.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda8.SelectCommand.Parameters.AddWithValue("@Action", 22);
            con.Open();
            int a = Convert.ToInt32(sda1.SelectCommand.ExecuteScalar());
            int v = Convert.ToInt32(sda2.SelectCommand.ExecuteScalar());
            int h = Convert.ToInt32(sda3.SelectCommand.ExecuteScalar());
            int o = Convert.ToInt32(sda4.SelectCommand.ExecuteScalar());
            int b = Convert.ToInt32(sda5.SelectCommand.ExecuteScalar());
            int t = Convert.ToInt32(sda6.SelectCommand.ExecuteScalar());
            int s = Convert.ToInt32(sda7.SelectCommand.ExecuteScalar());
            int g = Convert.ToInt32(sda8.SelectCommand.ExecuteScalar());
            if (a > 0)
            {
                lblApartment.Text = a.ToString();
                lblVilla.Text = v.ToString();
                lblHome.Text = h.ToString();
                lblOffice.Text = o.ToString();
                lblBuilding.Text = b.ToString();
                lblTownhouse.Text = t.ToString();
                lblShop.Text = s.ToString();
                lblGarage.Text = g.ToString();

            }

            else
            {
                lblApartment.Text = "0";
                lblVilla.Text = "0";
                lblHome.Text = "0";
                lblOffice.Text = "0";
                lblBuilding.Text = "0";
                lblTownhouse.Text = "0";
                lblShop.Text = "0";
                lblGarage.Text = "0";

            }
            con.Close();
        }


    }
}