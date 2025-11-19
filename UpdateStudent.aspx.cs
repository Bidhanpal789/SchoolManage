using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateStudent : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM StudentTbl WHERE rollNo=@rollNo AND class=@class", conn);
            //sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
            sda.SelectCommand.Parameters.AddWithValue("@class", ddlClassFetch.SelectedItem.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtFName.Text = dt.Rows[0]["fatherName"].ToString();
                txtName.Text = dt.Rows[0]["name"].ToString();
                ddlGovtId.SelectedItem.Text = dt.Rows[0]["govtId"].ToString();
                txtGovtIdNo.Text = dt.Rows[0]["govtIdNo"].ToString();
                txtAddress.Text = dt.Rows[0]["address"].ToString();
                txtPhone.Text = dt.Rows[0]["phone"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
                imgStudent.Src = dt.Rows[0]["photo"].ToString();
                ddlStatus.SelectedItem.Text = dt.Rows[0]["status"].ToString();
                ddlClass.SelectedItem.Text = dt.Rows[0]["class"].ToString();
                if (dt.Rows[0]["dob"] != DBNull.Value)
                {
                    txtDOB.Text = Convert.ToDateTime(dt.Rows[0]["dob"]).ToString("yyyy-MM-dd");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Roll Number');</script>");

            }
        }
        catch
        {
            Response.Write("<script>alert('Something went wrong');</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void btnChangePic_Click(object sender, EventArgs e)
    {
        if (ConnectionState.Closed == conn.State)
        {
            conn.Open();
        }
        try
        {
            if (studentImg.HasFile)
            {
                // get student name (example: from textbox)
                string studentName = txtRollNo.Text.Trim()+"X"+ddlClass.SelectedItem.Text;

                // get file extension (.jpg, .png, etc.)
                string fileExt = System.IO.Path.GetExtension(studentImg.PostedFile.FileName);

                // create new file name with student name
                string fileName = studentName.Replace(" ", "_") + fileExt;

                // save file
                string savePath = Server.MapPath("assets/file/") + fileName;
                studentImg.PostedFile.SaveAs(savePath);

                // set image path for display
                var studentImagePath = "assets/file/" + fileName;
                imgStudent.Src = studentImagePath;
            }

        }
        catch
        {
            Response.Write("<script>alert('Something went wrong');</script>");
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
            SqlDataAdapter sda = new SqlDataAdapter("UpdateStudent", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@rollNo", txtRollNo.Text);
            sda.SelectCommand.Parameters.AddWithValue("@fatherName", txtFName.Text);
            sda.SelectCommand.Parameters.AddWithValue("@name", txtName.Text);
            sda.SelectCommand.Parameters.AddWithValue("@dob", txtDOB.Text);
            sda.SelectCommand.Parameters.AddWithValue("@govtId", ddlGovtId.SelectedItem.Text);
            sda.SelectCommand.Parameters.AddWithValue("@govtIdNo", txtGovtIdNo.Text);
            sda.SelectCommand.Parameters.AddWithValue("@address", txtAddress.Text);
            sda.SelectCommand.Parameters.AddWithValue("@phone", txtPhone.Text);
            sda.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text);
            sda.SelectCommand.Parameters.AddWithValue("@photo", imgStudent.Src);
            sda.SelectCommand.Parameters.AddWithValue("@status", ddlStatus.SelectedItem.Text);
            sda.SelectCommand.Parameters.AddWithValue("@class", ddlClass.SelectedItem.Text);

            sda.SelectCommand.ExecuteNonQuery();
            Response.Write("<script>alert('Data Updated Successfully');</script>");
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
            Response.Write("<script>alert('Something went wrong');</script>");
        }
        finally
        {
            conn.Close();
            txtDOB.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtFName.Text = "";
            txtGovtIdNo.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtRollNo.Text = "";
            imgStudent.Src = "assets/file/avtar.png";
            ddlGovtId.SelectedIndex = 0;

        }
    }
}