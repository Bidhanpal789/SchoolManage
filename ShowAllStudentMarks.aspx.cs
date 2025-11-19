using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class ShowAllStudentMarks : System.Web.UI.Page
{
    SqlConnection conn= new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
            BindMarks(txtSearch.Text.Trim());
        
    }

    private void BindMarks(string search=null)
    {
        string query = @"SELECT s.rollNo, s.name, s.class, cs.subject, m.obTerm1, m.obTerm2, m.obTerm3, m.obAnnual
                         FROM StudentTbl s
                         LEFT JOIN 
                                MarksTbl m ON s.rollNo = m.rollNo
                         LEFT JOIN
                                classSubject cs ON cs.subjectCode = m.subjectCode";


        if (string.IsNullOrEmpty(search))
        {
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();

            sda.Fill(dt);


            rptMarks.DataSource = dt;
            rptMarks.DataBind();
        }
        else
        {
            query += " WHERE s.name LIKE @search OR s.rollNo LIKE @search OR s.class LIKE @search";
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            if (!string.IsNullOrEmpty(search))
                sda.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");
            DataTable dt = new DataTable();

            sda.Fill(dt);


            rptMarks.DataSource = dt;
            rptMarks.DataBind();
        }

    }
}
