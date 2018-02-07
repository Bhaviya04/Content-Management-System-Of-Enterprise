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

public partial class Backend_dashboard : System.Web.UI.Page
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
                showdata();
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
    protected void showdata()
    {
        cn.Open();

        SqlCommand cmd1 = new SqlCommand("select count(customer_id) from customer;",cn);
        LinkButton1.Text = cmd1.ExecuteScalar().ToString();

        SqlCommand cmd2 = new SqlCommand("select count(customer_id) from catalogs where customer_id=0;", cn);
        LinkButton2.Text = cmd2.ExecuteScalar().ToString();

        SqlCommand cmd3 = new SqlCommand("select count(order_id) from orders where CONVERT(VARCHAR(11),payment_received_date,105)=@date;", cn);
        cmd3.Parameters.Add(new SqlParameter("@date", String.Format("{0:dd-MM-yyyy}", System.DateTime.Now)));
        LinkButton3.Text = cmd3.ExecuteScalar().ToString();

        SqlCommand cmd4 = new SqlCommand("select count(item_id) from inventory where threshold_flag=1;", cn);
        LinkButton4.Text = cmd4.ExecuteScalar().ToString();

        SqlCommand cmd5 = new SqlCommand("select top 1 CONVERT(NVARCHAR, received_date, 106) AS received_date from shipment_received order by received_date desc;", cn);
        SqlDataReader dr5 = cmd5.ExecuteReader();
        while(dr5.Read())
        {
            LinkButton5.Text = dr5[0].ToString();
        }
        dr5.Close();

        SqlCommand cmd6 = new SqlCommand("select top 1 i.name,count(o.item_id) from inventory i join inventory_order_relation o on i.item_id=o.item_id group by i.name order by count(i.item_id) desc;", cn);
        SqlDataReader dr6 = cmd6.ExecuteReader();
        while (dr6.Read())
        {
            LinkButton6.Text = dr6[0].ToString();
        }
        dr6.Close();

        SqlCommand cmd7 = new SqlCommand("select count(customer_id) from customer where is_using_credit_card=1;", cn);
        cmd7.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
        LinkButton7.Text = cmd7.ExecuteScalar().ToString();


        SqlCommand cmd8 = new SqlCommand("select top 1 c.first_name,c.last_name,c.customer_id, count(o.order_id) from customer c join orders o on c.customer_id=o.customer_id group by c.customer_id,c.first_name,c.last_name order by count(o.order_id) desc;", cn);
        SqlDataReader dr8 = cmd8.ExecuteReader();
        while (dr8.Read())
        {
            LinkButton8.Text = dr8[0].ToString() + " " + dr8[1].ToString();
        }
        dr8.Close();

        SqlCommand cmd9 = new SqlCommand("select count(item_id) from inventory;", cn);
        LinkButton9.Text = cmd9.ExecuteScalar().ToString();

        cn.Close();

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("users.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("external.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("payment.aspx");
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("dispatch.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("recentshipment.aspx");
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("mostselling.aspx?name="+LinkButton6.Text);
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("creditcardusers.aspx");
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("maximumpurchase.aspx?name="+LinkButton8.Text);
    }

    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("inventorycount.aspx");
    }
}