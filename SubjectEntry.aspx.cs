using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubjectEntry : System.Web.UI.Page
{
    SqlConnection conn =new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (ConnectionState.Closed == conn.State)
            {
                conn.Open();
            }
           
            SqlDataAdapter sdaC = new SqlDataAdapter("SELECT * FROM ClassSubject WHERE subjectCode ='"+txtSubjectCode.Text+"' ",conn);
            DataTable dtC = new DataTable();
            sdaC.Fill(dtC);
            if (dtC.Rows.Count > 0)
            {
                Response.Write("<script>alert('Subject: '+'" + dtC.Rows[0]["subject"].ToString() +"'+' Already Exists');</script>");
            }
            else
            {
                SqlDataAdapter sda = new SqlDataAdapter("SubjectEntry", conn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sda.SelectCommand.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);
                sda.SelectCommand.Parameters.AddWithValue("@subject", txtSubject.Text);
                sda.SelectCommand.Parameters.AddWithValue("@subjectCode", txtSubjectCode.Text);
                sda.SelectCommand.Parameters.AddWithValue("@subjectType", ddlSubject.SelectedItem.Text);
                sda.SelectCommand.ExecuteNonQuery();
                Response.Write("<script>alert('Subject Saved Successfully');</script>");
            }

        }
        catch
        {
            Response.Write("<script>alert('Error Occurred');</script>");
        }
        finally
        {
            conn.Close();
        }

    }
}