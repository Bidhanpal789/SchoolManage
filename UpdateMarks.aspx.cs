using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateMarks : System.Web.UI.Page
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
        if (string.IsNullOrEmpty(ddlTerm.SelectedValue))
        {
            grdSubjects.DataSource = null;
            grdSubjects.DataBind();
            Response.Write("<script>alert('Please select a valid term');</script>");
            return;
        }

        string selectedTerm = ddlTerm.SelectedValue; // "1", "2", "3", "Annual"

        string termColumnFull = "";  // From ClassSubject
        string termColumnObt = "";   // From MarksTbl

        switch (selectedTerm)
        {
            case "1": termColumnFull = "term1"; termColumnObt = "obTerm1"; break;
            case "2": termColumnFull = "term2"; termColumnObt = "obTerm2"; break;
            case "3": termColumnFull = "term3"; termColumnObt = "obTerm3"; break;
            case "Annual": termColumnFull = "Annual"; termColumnObt = "Annual"; break;
        }


        string qry = $@"
        SELECT 
            cs.subjectCode, 
            cs.subject, 
            cs.{termColumnFull} AS FullMarks,
            ISNULL(m.{termColumnObt}, '') AS ObtainedMarks
        FROM ClassSubject cs
        LEFT JOIN MarksTbl m
            ON cs.subjectCode = m.subjectCode 
           AND m.rollNo = @rollNo
        WHERE cs.class = @class";

        SqlCommand cmd = new SqlCommand(qry, conn);
        cmd.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        grdSubjects.DataSource = dt;
        grdSubjects.DataBind();
        ddlTerm.Visible = true;
    }




    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string selectedTerm = ddlTerm.SelectedValue;

        string termColumnObt = "";  // Only from MarksTbl

        switch (selectedTerm)
        {
            case "1": termColumnObt = "obTerm1"; break;
            case "2": termColumnObt = "obTerm2"; break;
            case "3": termColumnObt = "obTerm3"; break;
            case "Annual": termColumnObt = "Annual"; break;
        }


        conn.Open();

        foreach (GridViewRow row in grdSubjects.Rows)
        {
            string subjectCode = grdSubjects.DataKeys[row.RowIndex].Value.ToString();
            TextBox txtMarks = (TextBox)row.FindControl("txtMarks");

            SqlCommand cmd = new SqlCommand($@"
                IF EXISTS (SELECT 1 FROM MarksTbl WHERE rollNo=@rollNo AND subjectCode=@subjectCode)
                    UPDATE MarksTbl SET {termColumnObt}=@marks 
                    WHERE rollNo=@rollNo AND subjectCode=@subjectCode
                ELSE
                    INSERT INTO MarksTbl (rollNo, subjectCode, {termColumnObt})
                    VALUES (@rollNo, @subjectCode, @marks)", conn);

            cmd.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@subjectCode", subjectCode);
            cmd.Parameters.AddWithValue("@marks", txtMarks.Text);

            cmd.ExecuteNonQuery();
        }

        conn.Close();
        Response.Write("<script>alert('Marks saved/updated successfully!');</script>");
        ddlTerm.Visible = true;
    }





}