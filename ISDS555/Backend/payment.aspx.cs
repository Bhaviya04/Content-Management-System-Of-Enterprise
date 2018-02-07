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

public partial class Backend_payment : System.Web.UI.Page
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
        SqlCommand cmd3 = new SqlCommand("select order_id,payment_received_date from orders where CONVERT(VARCHAR(11),payment_received_date,105)=@date;", cn);
        cmd3.Parameters.Add(new SqlParameter("@date", String.Format("{0:dd-MM-yyyy}", System.DateTime.Now)));
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd3;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}