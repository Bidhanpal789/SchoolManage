using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateSubject : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFetch_Click(object sender, EventArgs e)
    {
        if (ConnectionState.Closed == conn.State)
        {
            conn.Open();
        }
        try
        {

            SqlDataAdapter sda = new SqlDataAdapter("subjectFetch", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@subjectCode", txtSubCode.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtClass.Text = dt.Rows[0]["class"].ToString();
                txtSubject.Text = dt.Rows[0]["subject"].ToString();
                ddlSubType.SelectedValue = dt.Rows[0]["subjectType"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Subject Not Found');</script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('Error Fetching Subject');</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void btnSaveChange_Click(object sender, EventArgs e)
    {
        if (ConnectionState.Closed == conn.State)
        {
            conn.Open();
        }
        try
        {
            SqlDataAdapter sda = new SqlDataAdapter("subjectUpdate", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@subjectCode", txtSubCode.Text);
            sda.SelectCommand.Parameters.AddWithValue("@class", txtClass.Text);
            sda.SelectCommand.Parameters.AddWithValue("@subject", txtSubject.Text);
            sda.SelectCommand.Parameters.AddWithValue("@subjectType", ddlSubType.SelectedValue);
            sda.SelectCommand.ExecuteNonQuery();
            Response.Write("<script>alert('Subject Updated Successfully');</script>");
        }
        catch
        {
            Response.Write("<script>alert('Error Updating Subject');</script>");
        }
        finally
        {
            conn.Close();
        }
    }
}