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

public partial class Backend_inventoryorder : System.Web.UI.Page
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
                    itemdropdown();

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
        SqlDataAdapter da = new SqlDataAdapter("select io.relation_id,i.name,i.item_id,io.order_id,io.item_quantity,io.item_quantity_cancelled from inventory_order_relation io join inventory i on i.item_id=io.item_id", cn);
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
    protected void itemdropdown()
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

            SqlCommand cmd = new SqlCommand("update inventory_order_relation set order_id=@oid,item_id=@iid,item_quantity=@quantity,item_quantity_cancelled=@quantitycancelled where relation_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlorder.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt64(txtquantity.Text)));
            cmd.Parameters.Add(new SqlParameter("@quantitycancelled", Convert.ToInt64(txtitemcancelled.Text)));
            cmd.ExecuteNonQuery();

            SqlCommand cmd1 = new SqlCommand("select available_count,threshold_limit from inventory where item_id=@iid;",cn);
            cmd1.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            SqlDataReader dr1 = cmd1.ExecuteReader();
            int i = 0;
            int j = 0;
            while (dr1.Read())
            {
                i = Convert.ToInt32(dr1[0].ToString());
                j = Convert.ToInt32(dr1[1].ToString());

            }
            dr1.Close();

            i = i - Convert.ToInt32(txtquantity.Text);

            long threshold_flag = 0;

            if (i <= j)
            {
                threshold_flag = 1;
            }
            else
            {
                threshold_flag = 0;
            }

            SqlCommand cmd2 = new SqlCommand("update inventory set threshold_flag=@threshold_flag,available_count=@threshold_limit where item_id=@iid;", cn);
            cmd2.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd2.Parameters.Add(new SqlParameter("@threshold_flag", Convert.ToInt64(threshold_flag)));
            cmd2.Parameters.Add(new SqlParameter("@threshold_limit", Convert.ToInt64(i)));
            cmd2.ExecuteNonQuery();


            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("inventoryorder.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd3 = new SqlCommand("select price from inventory where item_id=@did;", cn);
            cmd3.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddlitem.SelectedValue)));
            long price = Convert.ToInt64(cmd3.ExecuteScalar());

            SqlCommand cmd5 = new SqlCommand("select delivery_price from delivery_type where delivery_id=(select delivery_id from orders where order_id=@did);", cn);
            cmd5.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddlorder.SelectedValue)));
            long delivery_price = Convert.ToInt64(cmd5.ExecuteScalar());

            long final_price = (Convert.ToInt64(txtquantity.Text) * price) + delivery_price;

            SqlCommand cmd4 = new SqlCommand("update orders set total_price=@price where order_id=@did;",cn);
            cmd4.Parameters.Add(new SqlParameter("@price",final_price));
            cmd4.Parameters.Add(new SqlParameter("@did", Convert.ToInt64(ddlorder.SelectedValue)));
            cmd4.ExecuteNonQuery();

            SqlCommand cmd = new SqlCommand("insert into inventory_order_relation values(@oid,@iid,@quantity,@quantitycancelled);", cn);
            cmd.Parameters.Add(new SqlParameter("@oid", Convert.ToInt64(ddlorder.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt64(txtquantity.Text)));
            cmd.Parameters.Add(new SqlParameter("@quantitycancelled", Convert.ToInt64(txtitemcancelled.Text)));
            cmd.ExecuteNonQuery();

            SqlCommand cmd1 = new SqlCommand("select available_count,threshold_limit from inventory where item_id=@iid;",cn);
            cmd1.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            SqlDataReader dr1 = cmd1.ExecuteReader();
            int i = 0;
            int j = 0;
            while(dr1.Read())
            {
                i= Convert.ToInt32(dr1[0].ToString());
                j = Convert.ToInt32(dr1[1].ToString());

            }
            dr1.Close();

            i = i - Convert.ToInt32(txtquantity.Text);

            long threshold_flag = 0;

            if(i <= j)
            {
                threshold_flag = 1;
            }
            else
            {
                threshold_flag = 0;
            }

            SqlCommand cmd2 = new SqlCommand("update inventory set threshold_flag=@threshold_flag,available_count=@threshold_limit where item_id=@iid;",cn);
            cmd2.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd2.Parameters.Add(new SqlParameter("@threshold_flag", Convert.ToInt64(threshold_flag)));
            cmd2.Parameters.Add(new SqlParameter("@threshold_limit", Convert.ToInt64(i)));
            cmd2.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("inventoryorder.aspx");
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("inventoryorder.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from inventory_order_relation where relation_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            ddlorder.SelectedValue = dr4[1].ToString();
            ddlitem.SelectedValue = dr4[2].ToString();
            txtquantity.Text = dr4[3].ToString();
            txtitemcancelled.Text = dr4[4].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}