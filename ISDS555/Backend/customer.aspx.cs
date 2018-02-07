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

public partial class Backend_customer : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select * from customer;", cn);
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

            SqlCommand cmd = new SqlCommand("update customer set first_name=@fname,last_name=@lname,address=@address,zipcode=@zipcode,mobile_number=@mobile,email_address=@email,shipping_address=@shipping,is_using_credit_card=@card where customer_id=@id;", cn);
            cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(Request.QueryString["id"])));
            cmd.Parameters.Add(new SqlParameter("@fname", txtfirstname.Text));
            cmd.Parameters.Add(new SqlParameter("@lname", txtlastname.Text));
            cmd.Parameters.Add(new SqlParameter("@address", txtaddress.Text));
            cmd.Parameters.Add(new SqlParameter("@zipcode", Convert.ToInt64(txtzipcode.Text)));
            cmd.Parameters.Add(new SqlParameter("@mobile", Convert.ToInt64(txtmobile.Text)));
            cmd.Parameters.Add(new SqlParameter("@email", txtemail.Text));
            cmd.Parameters.Add(new SqlParameter("@shipping", txtshipping.Text));
            cmd.Parameters.Add(new SqlParameter("@card", Convert.ToInt64(ddlcard.SelectedValue)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["update"] = "updated";
            Response.Redirect("customer.aspx");
        }
        else
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("insert into customer values(@fname,@lname,@address,@zipcode,@mobile,@email,@shipping,@card);", cn);
            cmd.Parameters.Add(new SqlParameter("@fname", txtfirstname.Text));
            cmd.Parameters.Add(new SqlParameter("@lname", txtlastname.Text));
            cmd.Parameters.Add(new SqlParameter("@address", txtaddress.Text));
            cmd.Parameters.Add(new SqlParameter("@zipcode", Convert.ToInt64(txtzipcode.Text)));
            cmd.Parameters.Add(new SqlParameter("@mobile", Convert.ToInt64(txtmobile.Text)));
            cmd.Parameters.Add(new SqlParameter("@email", txtemail.Text));
            cmd.Parameters.Add(new SqlParameter("@shipping", txtshipping.Text));
            cmd.Parameters.Add(new SqlParameter("@card", Convert.ToInt64(ddlcard.SelectedValue)));

            cmd.ExecuteNonQuery();

            cn.Close();

            Session["insert"] = "inserted";
            Response.Redirect("customer.aspx");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("customer.aspx?mode=Edit&id=" + e.CommandArgument);
        }
    }
    protected void getdetails()
    {
        cn.Open();

        SqlCommand cmd4 = new SqlCommand("select * from customer where customer_id=@id;", cn);
        cmd4.Parameters.Add(new SqlParameter("@id", Request.QueryString["id"]));
        SqlDataReader dr4 = cmd4.ExecuteReader();
        if (dr4.Read())
        {
            txtfirstname.Text = dr4[1].ToString();
            txtlastname.Text = dr4[2].ToString();
            txtaddress.Text = dr4[3].ToString();
            txtzipcode.Text = dr4[4].ToString();
            txtmobile.Text = dr4[5].ToString();
            txtemail.Text = dr4[6].ToString();
            txtshipping.Text = dr4[7].ToString();
            ddlcard.SelectedValue = dr4[8].ToString();
            dr4.Close();
        }
        else
        {
            dr4.Close();
        }

        cn.Close();
    }
}