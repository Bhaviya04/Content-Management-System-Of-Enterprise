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

public partial class Backend_backlog : System.Web.UI.Page
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
                    orderdropdown();
                    showitem();

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
                    else
                    {
                     //   showitem();
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
        SqlDataAdapter da = new SqlDataAdapter("select i.name,b.* from order_backlog b join inventory i on i.item_id=b.item_id;", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void orderdropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select order_id from orders;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[0].ToString(), dr[0].ToString());
            ddlorder.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }



    protected void showitem()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select item_id,name from inventory;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlitem.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mode"] == "Edit")
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("update order_backlog set order_id=@oid,item_id=@iid,quantity=@quantity where backlog_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlorder.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt64(txtquantity.Text)));
            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("backlog.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into order_backlog values(@oid,@iid,@quantity);", cn);
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlorder.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt64(txtquantity.Text)));
            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("backlog.aspx");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("backlog.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        string i = "";

        SqlCommand cmd4 = new SqlCommand("select * from order_backlog where backlog_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            ddlorder.SelectedValue = dr4[1].ToString();
            ddlitem.SelectedValue = dr4[2].ToString();
            txtquantity.Text = dr4[3].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

       

        cn.Close();
    }
}