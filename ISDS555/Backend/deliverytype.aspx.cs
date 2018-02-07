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

public partial class Backend_deliverytype : System.Web.UI.Page
{
    MainClass mc = new MainClass();
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = mc.Connect();

        if (!(Page.IsPostBack))
        {
            if (Session["email"] != "")
            {
                if (Session["email"] != null)
                {
                    showgrid();

                    if (Session["insert"] == "inserted")
                    {
                        Session["insert"] = "";
                        Response.Write("<script language='javascript'>window.alert('Your information added.');</script>");

                    }

                    if (Session["update"] == "updated")
                    {
                        Session["update"] = "";
                        Response.Write("<script language='javascript'>window.alert('Your information updated.');</script>");

                    }

                    if (Request.QueryString["mode"] == "Edit")
                    {
                        getdetails();
                    }

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
    }
    protected void showgrid()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from delivery_type;", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mode"] == "Edit")
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("update delivery_type set delivery=@mode,delivery_price=@price,estimated_delivery_days=@days where delivery_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@mode", txtmode.Text));
            cmd.Parameters.Add(new SqlParameter("@price", Convert.ToInt64(txtprice.Text)));
            cmd.Parameters.Add(new SqlParameter("@days", Convert.ToInt64(txtdays.Text)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("deliverytype.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into delivery_type values(@mode,@price,@days);", cn);
            cmd.Parameters.Add(new SqlParameter("@mode", txtmode.Text));
            cmd.Parameters.Add(new SqlParameter("@price", Convert.ToInt64(txtprice.Text)));
            cmd.Parameters.Add(new SqlParameter("@days", Convert.ToInt64(txtdays.Text)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("deliverytype.aspx");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("deliverytype.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from delivery_type where delivery_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            txtmode.Text = dr4[1].ToString();
            txtprice.Text = dr4[2].ToString();
            txtdays.Text = dr4[3].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}