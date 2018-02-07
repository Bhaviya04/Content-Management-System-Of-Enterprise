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

public partial class Backend_shipment : System.Web.UI.Page
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
                    showitem();

                    if (Session["insert"] == "inserted")
                    {
                        Session["insert"] = "";
                        Response.Write("<script language='javascript'>window.alert('Your information added.');</script>");

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
        SqlDataAdapter da = new SqlDataAdapter("select i.name,b.* from shipment_received b join inventory i on i.item_id=b.item_id;", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
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
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into shipment_received values(@iid,@quantity,@date);", cn);
            cmd.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
            cmd.Parameters.Add(new SqlParameter("@quantity", Convert.ToInt64(txtquantity.Text)));
            cmd.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
            cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("select available_count from inventory where item_id=@iid;",cn);
        cmd2.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
        int i = Convert.ToInt32(cmd2.ExecuteScalar());

        int j = i + Convert.ToInt32(txtquantity.Text);

        SqlCommand cmd1 = new SqlCommand("update inventory set available_count=@count, modified_date=@date where item_id=@iid;",cn);
        cmd1.Parameters.Add(new SqlParameter("@iid", Convert.ToInt64(ddlitem.SelectedValue)));
        cmd1.Parameters.Add(new SqlParameter("@count", j));
        cmd1.Parameters.Add(new SqlParameter("@date", System.DateTime.Now));
        cmd1.ExecuteNonQuery();

        cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("shipment.aspx");
    }
}