using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class ShowAllSubjects : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
            BindSubjects(txtSearch.Text.Trim());
        
    }

    private void BindSubjects(string search = "")
    {
        string query = @"
            SELECT class,subjectCode, subject, subjectType 
            FROM classSubject
            WHERE (@search = '' OR subject LIKE @search OR subjectCode LIKE @search OR subjectType LIKE @search)
        ";

        DataTable dt = new DataTable();
        using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
        {
            sda.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");
            sda.Fill(dt);
        }

        rptSubjects.DataSource = dt;
        rptSubjects.DataBind();
    }

    
}
