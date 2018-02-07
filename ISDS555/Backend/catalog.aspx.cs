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
using System.IO;
using System.Data.OleDb;
using System.Configuration;

public partial class Backend_catalog : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select c.first_name,c.last_name,c.customer_id,c.address from catalogs c;", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();

        SqlCommand cmd = new SqlCommand("insert into Catalogs(customer_id,first_name,last_name,address) select customer_id,first_name,last_name,address from customer cu where not exists (select customer_id from catalogs c where c.customer_id=cu.customer_id);",cn);
        cmd.ExecuteNonQuery();

        cn.Close();

        Session["insert"] = "inserted";
        Response.Redirect("catalog.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string csvPath = Server.MapPath("~/Backend/Files/") + FileUpload1.PostedFile.FileName.ToString();
        FileUpload1.SaveAs(csvPath);

        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[4] {
            new DataColumn("first_name", typeof(string)),
            new DataColumn("last_name",typeof(string)),
            new DataColumn("address", typeof(string)),
            new DataColumn("customer_id", typeof(long))});


        string csvData = File.ReadAllText(csvPath);
        foreach (string row in csvData.Split('\n'))
        {
            if (!string.IsNullOrEmpty(row))
            {
                cn.Open();

                SqlCommand cmd8 = new SqlCommand("select count(1) from catalogs where first_name=@fname and last_name=@lname and address=@address;",cn);
                cmd8.Parameters.Add(new SqlParameter("@fname",row.Split(',')[0].ToString().Trim()));
                cmd8.Parameters.Add(new SqlParameter("@lname", row.Split(',')[1].ToString().Trim()));
                cmd8.Parameters.Add(new SqlParameter("@address", row.Split(',')[2].ToString().Trim()));
                int count = Convert.ToInt32(cmd8.ExecuteScalar());

                cn.Close();
                if (count == 0)
                {
                    dt.Rows.Add();
                    int i = 0;
                    foreach (string cell in row.Split(','))
                    {
                        dt.Rows[dt.Rows.Count - 1][i] = cell.Trim();
                        dt.Rows[dt.Rows.Count - 1]["customer_id"] = 0;
                        i++;
                    }
                }
            }
        }


        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(cn))
        {
            //Set the database table name
            sqlBulkCopy.DestinationTableName = "dbo.Catalogs";
            sqlBulkCopy.ColumnMappings.Add("first_name", "First_Name");
            sqlBulkCopy.ColumnMappings.Add("last_name", "Last_Name");
            sqlBulkCopy.ColumnMappings.Add("address", "Address");
            sqlBulkCopy.ColumnMappings.Add("customer_id", "Customer_ID");
            cn.Open();
            sqlBulkCopy.WriteToServer(dt);
            cn.Close();
        }

        Session["insert"] = "inserted";
        Response.Redirect("catalog.aspx");
    }
}