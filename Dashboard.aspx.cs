using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected string chartLabels;
    protected string chartData;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter sda1 = new SqlDataAdapter("SELECT COUNT(*) FROM StudentTbl", conn);
        SqlDataAdapter sda2 = new SqlDataAdapter("SELECT COUNT(*) AS TotalSubjects FROM (SELECT subject FROM classSubject GROUP BY subject) AS t; ", conn);
        SqlDataAdapter sda3 = new SqlDataAdapter("SELECT COUNT(*) AS TotalClasses FROM (SELECT class FROM classSubject GROUP BY class) AS t; ", conn);
        SqlDataAdapter sda4 = new SqlDataAdapter("SELECT COUNT(*) AS TotalReports FROM (SELECT rollNo FROM MarksTbl GROUP BY rollNo) AS t; ", conn);
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        sda1.Fill(dt1);
        StudentCountLbl.Text = dt1.Rows[0][0].ToString();
        sda2.Fill(dt2);
        lblSubject.Text = dt2.Rows[0][0].ToString();
        sda3.Fill(dt3);
        lblClass.Text = dt3.Rows[0][0].ToString();
        sda4.Fill(dt4);
        lblClass.Text = dt4.Rows[0][0].ToString();
        lblReport.Text = dt4.Rows[0][0].ToString();

        if (!IsPostBack)
        {
            GetPerformanceData();

        }



    }

    private void GetPerformanceData()
    {
        SqlDataAdapter sda = new SqlDataAdapter(@"
                SELECT 
                    AVG(obTerm1) AS Term1, 
                    AVG(obTerm2) AS Term2, 
                    AVG(obTerm3) AS Term3,
                    AVG(obAnnual) AS Annual 
                FROM MarksTbl", conn);

        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            // Prepare labels
            string[] terms = { "Term 1", "Term 2", "Term 3", "Annual" };

            // Convert DB values to int (rounding as needed)
            int[] scores = {
                    Convert.ToInt32(dt.Rows[0]["Term1"]),
                    Convert.ToInt32(dt.Rows[0]["Term2"]),
                    Convert.ToInt32(dt.Rows[0]["Term3"]),
                    Convert.ToInt32(dt.Rows[0]["Annual"])
                };

            // Serialize to JSON for JavaScript
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            chartLabels = serializer.Serialize(terms);  // ["Term 1","Term 2","Term 3","Annual"]
            chartData = serializer.Serialize(scores);  // e.g., [65,75,82,90]
        }
    }
}