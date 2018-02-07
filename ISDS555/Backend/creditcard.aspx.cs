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

public partial class Backend_creditcard : System.Web.UI.Page
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
                    customerdropdown();

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
        SqlDataAdapter da = new SqlDataAdapter("select cc.*,c.* from credit_card_info cc join customer c on cc.customer_id=c.customer_id;", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void customerdropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select customer_id, first_name + ' ' + last_name as name from customer where is_using_credit_card=1;",cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while(dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlcustomer.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mode"] == "Edit")
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("update credit_card_info set credit_card_no=@card,customer_id=@customerid,cvv=@cvv,expiry_date=@edate,cardholder_name=@name where credit_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@card", Convert.ToInt64(txtcreditcard.Text)));
            cmd.Parameters.Add(new SqlParameter("@customerid", Convert.ToInt64(ddlcustomer.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@cvv", Convert.ToInt64(txtcvv.Text)));
            cmd.Parameters.Add(new SqlParameter("@edate", Convert.ToDateTime(txtedate.Text)));
            cmd.Parameters.Add(new SqlParameter("@name", txtholdername.Text));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("creditcard.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into credit_card_info values(@card,@customerid,@cvv,@edate,@name);", cn);
            cmd.Parameters.Add(new SqlParameter("@card", Convert.ToInt64(txtcreditcard.Text)));
            cmd.Parameters.Add(new SqlParameter("@customerid", Convert.ToInt64(ddlcustomer.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@cvv", Convert.ToInt64(txtcvv.Text)));
            cmd.Parameters.Add(new SqlParameter("@edate", Convert.ToDateTime(txtedate.Text)));
            cmd.Parameters.Add(new SqlParameter("@name", txtholdername.Text));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("creditcard.aspx");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("creditcard.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from credit_card_info where credit_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            txtcreditcard.Text = dr4[1].ToString();
            ddlcustomer.SelectedValue = dr4[2].ToString();
            txtcvv.Text = dr4[3].ToString();
            txtedate.Text = dr4[4].ToString();
            txtholdername.Text = dr4[5].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}