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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        public DataTable dtPropertyListing = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PhotoGallery();
            }
        }
        public void PhotoGallery()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("USP_Property_Details", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@Action", 4);
            sda.Fill(dtPropertyListing);
        }
    }
}