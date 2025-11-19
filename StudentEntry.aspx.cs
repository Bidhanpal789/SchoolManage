using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentEntry : System.Web.UI.Page
{
    private readonly SqlConnection conn = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GenerateRollNo();
        }
    }

    // Auto-generate next roll number
    private void GenerateRollNo()
    {
        SqlDataAdapter rollCount = new SqlDataAdapter("SELECT COUNT(*) FROM StudentTbl", conn);
        DataTable dt = new DataTable();
        rollCount.Fill(dt);

        int rollNo = Convert.ToInt32(dt.Rows[0][0]) + 1;
        lblRoll.Text = "SN0" + rollNo.ToString();
    }

    // Upload student image
    protected void bntUpload_Click(object sender, EventArgs e)
    {
        if (studentImg.HasFile)
        {
            // Get extension (.jpg, .png etc.)
            string extension = Path.GetExtension(studentImg.PostedFile.FileName);

            // Create new filename: rollNo_class.extension
            string newFileName = txtRoll.Text + "X" + ddlClass.SelectedItem.Text + extension;

            // Save path
            string savePath = Server.MapPath("~/assets/file/") + newFileName;

            // Save file
            studentImg.PostedFile.SaveAs(savePath);

            // Assign to image control
            imgStudent.Src = "assets/file/" + newFileName;
            imgStudent.Visible = true;




        }

    }

    // Add student manually
    protected void btnAddStudent_Click(object sender, EventArgs e)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        try
        {
            SqlDataAdapter stuCheck = new SqlDataAdapter(
                "SELECT * FROM StudentTbl WHERE class = @class AND rollNo = @rollNo", conn);

            stuCheck.SelectCommand.Parameters.AddWithValue("@rollNo", txtRoll.Text);
            stuCheck.SelectCommand.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);

            DataTable dat = new DataTable();
            stuCheck.Fill(dat);

            if (dat.Rows.Count > 0)
            {
                Response.Write("<script>alert('Student Already Exist!!!');</script>");
            }
            else
            {
                SqlDataAdapter sda = new SqlDataAdapter("InsertStudent", conn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;

                sda.SelectCommand.Parameters.AddWithValue("@rollNo", txtRoll.Text);
                sda.SelectCommand.Parameters.AddWithValue("@fatherName", txtFName.Text);
                sda.SelectCommand.Parameters.AddWithValue("@name", txtName.Text);
                sda.SelectCommand.Parameters.AddWithValue("@dob", txtDOB.Text);
                sda.SelectCommand.Parameters.AddWithValue("@govtId", ddlGovtId.SelectedItem.Text);
                sda.SelectCommand.Parameters.AddWithValue("@govtIdNo", txtGovtIdNo.Text);
                sda.SelectCommand.Parameters.AddWithValue("@address", txtAddress.Text);
                sda.SelectCommand.Parameters.AddWithValue("@phone", txtPhone.Text);
                sda.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text);
                sda.SelectCommand.Parameters.AddWithValue("@photo", imgStudent.Src);
                sda.SelectCommand.Parameters.AddWithValue("@status", "Active");
                sda.SelectCommand.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);

                sda.SelectCommand.ExecuteNonQuery();

                Response.Redirect("StudentAddSuccess.aspx");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Something went wrong')</script>");
        }
        finally
        {
            conn.Close();
        }
    }

    // Upload Excel & preview in GridView
    protected void btnUploadExcel_Click(object sender, EventArgs e)
    {
        if (fileExcel.PostedFile != null && fileExcel.PostedFile.ContentLength > 0)
        {
            string fileName = Path.GetFileName(fileExcel.PostedFile.FileName);
            string filePath = Server.MapPath("~/Uploads/") + fileName;

            fileExcel.PostedFile.SaveAs(filePath);

            if (!File.Exists(filePath))
            {
                throw new Exception("File not saved correctly: " + filePath);
            }

            using (OleDbConnection oleConn = new OleDbConnection(
                string.Format(ConfigurationManager.ConnectionStrings["ExcelCon"].ConnectionString, filePath)))
            {
                oleConn.Open();

                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", oleConn);
                OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Show preview
                gvPreview.DataSource = dt;
                gvPreview.DataBind();

                using (SqlConnection sqlConn = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString))
                {
                    sqlConn.Open();

                    foreach (DataRow dr in dt.Rows)
                    {
                        using (SqlCommand cmd2 = new SqlCommand("InsertStudent", sqlConn))
                        {
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@rollNo", dr["rollNo"].ToString());
                            cmd2.Parameters.AddWithValue("@fatherName", dr["fatherName"].ToString());
                            cmd2.Parameters.AddWithValue("@name", dr["name"].ToString());

                            // Handle DOB safely
                            DateTime dob;
                            if (DateTime.TryParse(dr["dob"].ToString(), out dob))
                                cmd2.Parameters.AddWithValue("@dob", dob);
                            else
                                cmd2.Parameters.AddWithValue("@dob", DBNull.Value);

                            cmd2.Parameters.AddWithValue("@govtId", dr["govtId"].ToString());
                            cmd2.Parameters.AddWithValue("@govtIdNo", dr["govtIdNo"].ToString());
                            cmd2.Parameters.AddWithValue("@address", dr["address"].ToString());
                            cmd2.Parameters.AddWithValue("@phone", dr["phone"].ToString());
                            cmd2.Parameters.AddWithValue("@email", dr["email"].ToString());
                            cmd2.Parameters.AddWithValue("@photo", dr["photo"].ToString());
                            cmd2.Parameters.AddWithValue("@status", "Active");
                            cmd2.Parameters.AddWithValue("@class", dr["class"].ToString());

                            // Execute insert
                            cmd2.ExecuteNonQuery();
                        }
                    }
                }
            }

            Response.Write("<script>alert('Excel data uploaded successfully!');</script>");
        }
    }

}
