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

public partial class Backend_inventory : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select * from inventory;", cn);
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

            SqlCommand cmd = new SqlCommand("update inventory set name=@name,color=@color,size=@size,description=@description,price=@price,available_count=@count,modified_date=@date,threshold_limit=@thresholdlimit where item_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
            cmd.Parameters.Add(new SqlParameter("@name", txtname.Text));
            cmd.Parameters.Add(new SqlParameter("@color", txtcolor.Text));
            cmd.Parameters.Add(new SqlParameter("@size", txtsize.Text));
            cmd.Parameters.Add(new SqlParameter("@description", txtdescription.Text));
            cmd.Parameters.Add(new SqlParameter("@price", Convert.ToInt64(txtprice.Text)));
            cmd.Parameters.Add(new SqlParameter("@count", Convert.ToInt64(txtcount.Text)));
            cmd.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@thresholdlimit", Convert.ToInt64(txtthresholdlimit.Text)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("inventory.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into inventory values(@name,@color,@size,@description,@price,@count,@date,@flag,@thresholdlimit);", cn);
            cmd.Parameters.Add(new SqlParameter("@name", txtname.Text));
            cmd.Parameters.Add(new SqlParameter("@color", txtcolor.Text));
            cmd.Parameters.Add(new SqlParameter("@size", txtsize.Text));
            cmd.Parameters.Add(new SqlParameter("@description", txtdescription.Text));
            cmd.Parameters.Add(new SqlParameter("@price", Convert.ToInt64(txtprice.Text)));
            cmd.Parameters.Add(new SqlParameter("@count", Convert.ToInt64(txtcount.Text)));
            cmd.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@flag", Convert.ToInt64(0)));
            cmd.Parameters.Add(new SqlParameter("@thresholdlimit", Convert.ToInt64(txtthresholdlimit.Text)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("inventory.aspx");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("inventory.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from inventory where item_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            txtname.Text = dr4[1].ToString();
            txtcolor.Text = dr4[2].ToString();
            txtsize.Text = dr4[3].ToString();
            txtdescription.Text = dr4[4].ToString();
            txtprice.Text = dr4[5].ToString();
            txtcount.Text = dr4[6].ToString();
            txtthresholdlimit.Text = dr4[9].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}