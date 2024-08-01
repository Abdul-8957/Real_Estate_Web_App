using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

namespace Real_Estate_Web_App
{
    public partial class property_agent : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        public DataTable dtPropertyAgents = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PropertyAgents();
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
        public void PropertyAgents()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Agent_Detail", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 6);
            sda.Fill(dtPropertyAgents);
        }
        //void BindTeamRepeter()
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    //string query = "select * from tbl_agent_signup";
        //    //SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //    SqlDataAdapter sda = new SqlDataAdapter("USP_Signup", con);
        //    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);
        //    TeamRepeter.DataSource = dt;
        //    TeamRepeter.DataBind();
        //    //PagedDataSource pds = new PagedDataSource();
        //    //pds.DataSource = dt.DefaultView;
        //    //pds.AllowPaging = true;
        //    //pds.PageSize = 12;
        //    //TeamRepeter.DataSource = pds;
        //    //TeamRepeter.DataBind();

        //    //Create the PagedDataSource that will be used in paging
        //    PagedDataSource pgitems = new PagedDataSource();
        //    pgitems.DataSource = dt.DefaultView;
        //    pgitems.AllowPaging = true;

        //    //Control page size from here 
        //    pgitems.PageSize = 12;
        //    pgitems.CurrentPageIndex = PageNumber;
        //    if (pgitems.PageCount > 1)
        //    {
        //        rptPaging.Visible = true;
        //        ArrayList pages = new ArrayList();
        //        for (int i = 0; i <= pgitems.PageCount - 1; i++)
        //        {
        //            pages.Add((i + 1).ToString());
        //        }
        //        rptPaging.DataSource = pages;
        //        rptPaging.DataBind();
        //    }
        //    else
        //    {
        //        rptPaging.Visible = false;
        //    }

        //    //Finally, set the datasource of the repeater
        //    TeamRepeter.DataSource = pgitems;
        //    TeamRepeter.DataBind();
        //}
        //protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        //{
        //    PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        //    BindTeamRepeter();
        //}

        //public int PageNumber
        //{
        //    get
        //    {
        //        if (ViewState["PageNumber"] != null)
        //        {
        //            return Convert.ToInt32(ViewState["PageNumber"]);
        //        }
        //        else
        //        {
        //            return 0;
        //        }
        //    }
        //    set { ViewState["PageNumber"] = value; }
        //}
    }
}