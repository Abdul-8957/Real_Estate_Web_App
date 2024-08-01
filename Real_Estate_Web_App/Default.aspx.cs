using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace Real_Estate_Web_App
{
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        public DataTable dtOurClientsSay = new DataTable();
        public DataTable dtImageSlider = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindListRepeter();
                BindTeamRepeter();
                OurClientsSay();
                ImageSlider();
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
        void BindCategory()
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
            con.Open();
            int a = Convert.ToInt32(sda1.SelectCommand.ExecuteScalar());
            int v = Convert.ToInt32(sda2.SelectCommand.ExecuteScalar());
            int h = Convert.ToInt32(sda3.SelectCommand.ExecuteScalar());
            int o = Convert.ToInt32(sda4.SelectCommand.ExecuteScalar());
            if (a > 0 || v > 0 || h > 0 || o > 0)
            {
                lblApartment.Text = a.ToString();
                lblVilla.Text = v.ToString();
                lblHome.Text = h.ToString();
                lblOffice.Text = o.ToString();
              
            }

            else
            {
                lblApartment.Text = "0";
                lblVilla.Text = "0";
                lblHome.Text = "0";
                lblOffice.Text = "0";
               
            }
            con.Close();
        }
        void BindListRepeter()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            PropertyRepeater.DataSource = dt;
            PropertyRepeater.DataBind();
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 3;
            PropertyRepeater.DataSource = pds;
            PropertyRepeater.DataBind();

        }
        void BindTeamRepeter()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Agent_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 6);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            TeamRepeter.DataSource = dt;
            TeamRepeter.DataBind();
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 4;
            TeamRepeter.DataSource = pds;
            TeamRepeter.DataBind();
        }

        //protected void forFeature_Click(object sender, EventArgs e)
        //{
        //    BindListRepeter();
        //    forFeature.BackColor = Color.FromArgb(0, 185, 142);
        //    forFeature.ForeColor = Color.White;
        //    forSell.BackColor = Color.White;
        //    forSell.ForeColor = Color.Black;
        //    forRent.BackColor = Color.White;
        //    forRent.ForeColor = Color.Black;

        //}

        //protected void forSell_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    SqlDataAdapter sda = new SqlDataAdapter("usp_property_details", con);
        //    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    sda.SelectCommand.Parameters.AddWithValue("@action", 24);
        //    DataTable dt = new DataTable();
        //    forSell.BackColor = Color.FromArgb(0, 185, 142);
        //    forSell.ForeColor = Color.White;
        //    forFeature.BackColor = Color.White;
        //    forFeature.ForeColor = Color.Black;
        //    forRent.BackColor = Color.White;
        //    forRent.ForeColor = Color.Black;
        //    sda.Fill(dt);
        //    PropertyRepeater.DataSource = dt;
        //    PropertyRepeater.DataBind();
        //}

        //protected void forRent_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
        //    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    sda.SelectCommand.Parameters.AddWithValue("@Action", 23);
        //    DataTable dt = new DataTable();
        //    forRent.BackColor = Color.FromArgb(0, 185, 142);
        //    forRent.ForeColor = Color.White;
        //    forFeature.BackColor = Color.White;
        //    forFeature.ForeColor = Color.Black;
        //    forSell.BackColor = Color.White;
        //    forSell.ForeColor = Color.Black;
        //    sda.Fill(dt);
        //    PropertyRepeater.DataSource = dt;
        //    PropertyRepeater.DataBind();
        //}
        public void OurClientsSay()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Client_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 6);
            sda.Fill(dtOurClientsSay);
        }

        public void ImageSlider()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 8);
            sda.Fill(dtImageSlider);
        }

    }
}