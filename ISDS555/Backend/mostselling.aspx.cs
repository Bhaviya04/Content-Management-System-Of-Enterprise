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

public partial class Backend_mostselling : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select * from inventory where name='"+Request.QueryString["name"]+"';", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}