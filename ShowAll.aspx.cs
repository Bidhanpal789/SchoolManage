using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowAll : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindShowAll(txtSearch.Text.Trim());

    }

    private void BindShowAll(string search = "")
    {
        string query = "SELECT * FROM StudentTbl";
        if (!string.IsNullOrEmpty(search))
        {
            query += " WHERE name LIKE @search OR rollNo LIKE @search OR class LIKE @search ";
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            if (!string.IsNullOrEmpty(search))
                sda.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                rptShowAll.DataSource = dt;
                rptShowAll.DataBind();
                edtNoRecord.Visible = false;
                
            }
            else
            {
                rptShowAll.DataSource = null;
                rptShowAll.DataBind();
                edtNoRecord.Visible = true;
            }
        }
        else
        {
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptShowAll.DataSource = dt;
            rptShowAll.DataBind();
            edtNoRecord.Visible = false;
        }


    }

   

}