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

public partial class Backend_order : System.Web.UI.Page
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
                    ordertypedropdown();
                    paymentdropdown();
                    statusdropdown();
                    deliverydropdown();

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
        SqlDataAdapter da = new SqlDataAdapter("select o.order_id,c.customer_id,c.first_name + ' ' + c.last_name as name,r.order_type_id,r.mode as OrderMode, p.payment_id, p.mode as PaymentMode, s.status_id, s.status, d.delivery_id, d.delivery, o.order_date, o.payment_received_date, o.dispatch_date, o.total_price from customer c join orders o on c.customer_id = o.customer_id join order_type r on o.order_type_id = r.order_type_id join payment_type p on o.payment_id = p.payment_id join order_status s on o.status_id = s.status_id join delivery_type d on o.delivery_id = d.delivery_id; ", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void customerdropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select customer_id, first_name + ' ' + last_name as name from customer;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlcustomer.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void ordertypedropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select order_type_id, mode from order_type;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlordertype.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void paymentdropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select payment_id, mode from payment_type;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlpayment.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void statusdropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select status_id, status from order_status;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddlstatus.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void deliverydropdown()
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("select delivery_id, delivery from delivery_type;", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem i = new ListItem(dr[1].ToString(), dr[0].ToString());
            ddldelivery.Items.Add(i);
        }
        dr.Close();

        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mode"] == "Edit")
        {
            cn.Open();

            SqlCommand cmd1 = new SqlCommand("select delivery_price from delivery_type where delivery_id=@did;", cn);
            cmd1.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddldelivery.SelectedValue)));
            long price = Convert.ToInt64(cmd1.ExecuteScalar());

            SqlCommand cmd = new SqlCommand("update orders set customer_id=@cid,order_type_id=@oid,payment_id=@pid,status_id=@sid,delivery_id=@did,order_date=@odate,payment_received_date=@pdate,dispatch_date=@ddate,total_price=@price where order_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@cid", Convert.ToInt64(ddlcustomer.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlordertype.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@pid", Convert.ToInt64(ddlpayment.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@sid", Convert.ToInt64(ddlstatus.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddldelivery.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@odate", Convert.ToDateTime(txtorderdate.Text)));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            if (string.IsNullOrWhiteSpace(txtpaymentdate.Text))
            {
                cmd.Parameters.Add(new SqlParameter("@pdate", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@pdate", Convert.ToDateTime(txtpaymentdate.Text)));
            }
            if (string.IsNullOrWhiteSpace(txtdispatchdate.Text))
            {
                cmd.Parameters.Add(new SqlParameter("@ddate", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@ddate", Convert.ToDateTime(txtdispatchdate.Text)));
            }


            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("order.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd1 = new SqlCommand("select delivery_price from delivery_type where delivery_id=@did;",cn);
            cmd1.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddldelivery.SelectedValue)));
            long price = Convert.ToInt64(cmd1.ExecuteScalar());

            SqlCommand cmd = new SqlCommand("insert into orders values(@cid,@oid,@pid,@sid,@did,@odate,@price,@pdate,@ddate);", cn);
            cmd.Parameters.Add(new SqlParameter("@cid", Convert.ToInt64(ddlcustomer.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlordertype.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@pid", Convert.ToInt64(ddlpayment.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@sid", Convert.ToInt64(ddlstatus.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddldelivery.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@odate", Convert.ToDateTime(txtorderdate.Text)));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            if (string.IsNullOrWhiteSpace(txtpaymentdate.Text))
            {
                cmd.Parameters.Add(new SqlParameter("@pdate", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@pdate", Convert.ToDateTime(txtpaymentdate.Text)));
            }
            if (string.IsNullOrWhiteSpace(txtdispatchdate.Text))
            {
                cmd.Parameters.Add(new SqlParameter("@ddate", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@ddate", Convert.ToDateTime(txtdispatchdate.Text)));
            }
            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("order.aspx");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("order.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from orders where order_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            ddlcustomer.SelectedValue = dr4[1].ToString();
            ddlordertype.SelectedValue = dr4[2].ToString();
            ddlpayment.SelectedValue = dr4[3].ToString();
            ddlstatus.SelectedValue = dr4[4].ToString();
            ddldelivery.SelectedValue = dr4[5].ToString();
            txtorderdate.Text = dr4[6].ToString();
            txtpaymentdate.Text = dr4[8].ToString();
            txtdispatchdate.Text = dr4[9].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}