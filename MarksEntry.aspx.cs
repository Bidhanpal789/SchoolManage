using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

public partial class MarksEntry : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        ddlTerm.Visible = false;

    }
    protected void btnFetch_Click(object sender, EventArgs e)
    {
        if (ConnectionState.Closed == conn.State)
        {
            conn.Open();
        }
        try
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from StudentTbl where rollNo=@rollNo and class=@class", conn);
            //sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
            sda.SelectCommand.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblStudentName.Text = dt.Rows[0]["name"].ToString();
                //lblClass.Text = dt.Rows[0]["class"].ToString();
                imgStudent.Src = dt.Rows[0]["photo"].ToString();
                ddlTerm.Visible = true;

            }
            else
            {
                Response.Write("<script>alert('No student found with this roll number');</script>");
                imgStudent.Src = "assets/file/avatar.png";
                lblStudentName.Text = "";
                //lblClass.Text = "";
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            conn.Close();
        }
    }
    protected void ddlTerm_SelectedIndexChanged(object sender, EventArgs e)
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




        if(ddlTerm.SelectedItem.Text != "--Select Term--")
        {
            string qry = $"SELECT subjectCode, subject, {termColumn} AS FullMarks FROM ClassSubject WHERE class = @class";
            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@term", selectedTerm.ToString());
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                //lblTermShow.Text = ddlTerm.SelectedValue;
                grdSubjects.FindFieldTemplate(termColumn);
                grdSubjects.DataSource = dt1;
                grdSubjects.DataBind();

                ddlTerm.Visible = true;

            }
            else
            {
                Response.Write("<script>alert('No subjects found for this class');</script>");
            }
        }
        else
        {
            grdSubjects.DataSource = null;
            grdSubjects.DataBind();
            ddlTerm.Visible = true;
            Response.Write("<script>alert('Please select a valid term');</script>");
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string selectedTerm = ddlTerm.SelectedValue; // e.g., "1", "2", "3", "Annual"
        string termColumn = "";

        switch (selectedTerm)
        {
            case "1": termColumn = "obTerm1"; break;
            case "2": termColumn = "obTerm2"; break;
            case "3": termColumn = "obTerm3"; break;
            case "Annual": termColumn = "Annual"; break;
        }

        if (conn.State == ConnectionState.Closed)
            conn.Open();

        try
        {
            bool hasDuplicates = false;

            foreach (GridViewRow row in grdSubjects.Rows)
            {
                string subjectCode = grdSubjects.DataKeys[row.RowIndex].Value.ToString();
                TextBox txtMarks = (TextBox)row.FindControl("txtMarks");

                // 1. Check if this subject already has marks for the selected term
                SqlCommand checkCmd = new SqlCommand($@"
                SELECT {termColumn} 
                FROM MarksTbl 
                WHERE rollNo = @rollNo 
                  AND subjectCode = @subjectCode", conn);

                checkCmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
                checkCmd.Parameters.AddWithValue("@subjectCode", subjectCode);

                object existingValue = checkCmd.ExecuteScalar();

                if (existingValue != DBNull.Value && !string.IsNullOrEmpty(existingValue?.ToString()))
                {
                    // Already has marks for this term → don’t insert/update
                    hasDuplicates = true;
                }
                else
                {
                    // 2. If record exists but term is blank → update
                    if (existingValue != null)
                    {
                        SqlCommand updateCmd = new SqlCommand($@"
                        UPDATE MarksTbl 
                        SET {termColumn} = @term 
                        WHERE rollNo = @rollNo 
                          AND subjectCode = @subjectCode", conn);

                        updateCmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
                        updateCmd.Parameters.AddWithValue("@subjectCode", subjectCode);
                        updateCmd.Parameters.AddWithValue("@term", txtMarks.Text);

                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        // 3. If no record at all → insert
                        SqlCommand insertCmd = new SqlCommand($@"
                        INSERT INTO MarksTbl (rollNo, subjectCode, {termColumn})
                        VALUES (@rollNo, @subjectCode, @term)", conn);

                        insertCmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
                        insertCmd.Parameters.AddWithValue("@subjectCode", subjectCode);
                        insertCmd.Parameters.AddWithValue("@term", txtMarks.Text);

                        insertCmd.ExecuteNonQuery();
                    }
                }
            }

            // ✅ Show only one alert after loop finishes
            if (hasDuplicates)
            {
                Response.Write("<script>alert('Some marks already existed and were skipped! Others saved successfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Marks saved successfully!');</script>");
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