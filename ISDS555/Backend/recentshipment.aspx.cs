using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Text;

public partial class Backend_recentshipment : System.Web.UI.Page
{
    MainClass mc = new MainClass();
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != "")
        {
            if (Session["email"] != null)
            {
                cn = mc.Connect();
                showgrid();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void showgrid()
    {
        SqlCommand cmd3 = new SqlCommand("select i.name,s.* from shipment_received s join inventory i on i.item_id=s.item_id where CONVERT(VARCHAR(11),received_date,105)=(select top 1 CONVERT(NVARCHAR, received_date, 105) AS received_date from shipment_received order by received_date desc);", cn);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd3;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}