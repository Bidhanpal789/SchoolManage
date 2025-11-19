using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Runtime.Remoting.Messaging;

public partial class PrintMarksheet : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);

    protected void btnFetch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtRollNo.Text) || ddlClass.SelectedValue == "--Select Class--")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter Roll No and select Class');", true);
            return;
        }

        try
        {
            conn.Open();
            string qry = @"
            SELECT 
                s.name,
                s.rollNo,
                s.class,
	            s.photo,
                cs.subject,
                cs.subjectType,
                cs.term1,
	            m.obTerm1,
                cs.term2 ,
	            m.obTerm2,
                cs.term3 ,
	            m.obTerm3,
                cs.Annual,
            	m.obAnnual
             FROM StudentTbl s
             LEFT JOIN MarksTbl m ON s.rollNo = m.rollNo 
             LEFT JOIN classSubject cs ON m.subjectCode = cs.subjectCode AND s.class = cs.class
             WHERE s.rollNo = @rollNo AND s.class = @class";

            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                tblMarks.Rows.Clear(); // Clear existing rows

                imgStudent.ImageUrl = dt.Rows[0]["photo"].ToString();
                lblRollNo.Text = dt.Rows[0]["rollNo"].ToString();
                lblSession.Text = "2023-2024"; // Static session value
                lblClass.Text = dt.Rows[0]["class"].ToString();
                lblStudentName.Text = dt.Rows[0]["name"].ToString();
                lblFinalMarks.Text = "0"; // Static final marks value
                lblTotalMarks.Text = "0"; // Static total marks value

                // Create header row
                TableHeaderRow header = new TableHeaderRow();

                string[] columns = { "Subject", "Term1 Full", "Term1 Obtained", "Term2 Full", "Term2 Obtained", "Term3 Full", "Term3 Obtained", "Annual Full", "Annual Obtained" };

                foreach (var col in columns)
                {
                    TableHeaderCell th = new TableHeaderCell();
                    th.Text = col;
                    th.CssClass = "bg-primary text-white"; // optional styling
                    header.Cells.Add(th);
                }

                tblMarks.Rows.Add(header);

                // Add data rows
                foreach (DataRow dr in dt.Rows)
                {
                    TableRow row = new TableRow();

                    row.Cells.Add(new TableCell { Text = dr["subject"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["term1"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["obTerm1"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["term2"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["obTerm2"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["term3"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["obTerm3"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["Annual"].ToString() });
                    row.Cells.Add(new TableCell { Text = dr["obAnnual"].ToString() });

                    tblMarks.Rows.Add(row);
                    lblTotalMarks.Text = (Convert.ToInt32(lblTotalMarks.Text) + Convert.ToInt32(dr["Annual"])).ToString();
                    lblFinalMarks.Text = (Convert.ToInt32(lblFinalMarks.Text) + Convert.ToInt32(dr["obAnnual"])).ToString();
                }

                marksheet.Style["display"] = "block";
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found');", true);
                Response.Write("<script>alert('Record Not Found');</script>");
            }
        }
        catch (Exception ex)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{ex.Message}');", true);
            Response.Write(ex.Message);
        }
        finally
        {
            conn.Close();
        }
    }


}
