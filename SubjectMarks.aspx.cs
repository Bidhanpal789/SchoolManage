using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubjectMarks : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string classId = ddlClass.SelectedItem.Text;

            string query = "SELECT subjectCode, subject FROM ClassSubject WHERE class = @classId;";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@classId", classId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Bind subjects to GridView for entering Full Marks
            grdSubjects.DataSource = dt;
            grdSubjects.DataBind();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (conn.State == ConnectionState.Closed)
            conn.Open();

        try
        {
            string selectedTerm = ddlTerm.SelectedValue; // e.g., "1", "2", "3", "Annual"
            string termColumn = "";

            switch (selectedTerm)
            {
                case "1": termColumn = "term1"; break;
                case "2": termColumn = "term2"; break;
                case "3": termColumn = "term3"; break;
                case "Annual": termColumn = "Annual"; break;
            }

            bool hasError = false;
            List<string> invalidSubjects = new List<string>();

            foreach (GridViewRow row in grdSubjects.Rows)
            {
                string subjectCode = row.Cells[0].Text;
                string subjectName = row.Cells[1].Text; // Assuming Subject name is in 2nd column
                TextBox txtFullMarks = (TextBox)row.FindControl("txtFullMarks");

                if (!string.IsNullOrEmpty(txtFullMarks.Text))
                {
                    int fullMarks;
                    if (int.TryParse(txtFullMarks.Text, out fullMarks) && fullMarks > 0 && fullMarks <= 100)
                    {
                        string query = $@"
                        UPDATE ClassSubject 
                        SET {termColumn} = @FullMarks
                        WHERE subjectCode = @SubjectCode AND class = @ClassId";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@FullMarks", fullMarks);
                        cmd.Parameters.AddWithValue("@SubjectCode", subjectCode);
                        cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);

                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        hasError = true;
                        invalidSubjects.Add(subjectName);
                    }
                }
                else
                {
                    hasError = true;
                    invalidSubjects.Add(subjectName);
                }
            }

            if (hasError)
            {
                string subjects = string.Join(", ", invalidSubjects);
                Response.Write("<script>alert('Invalid Full Marks for: " + subjects + ". Please enter values between 1 and 100.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Full Marks saved successfully!');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
        }
        finally
        {
            conn.Close();
        }
    }





}