using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class EditProfile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail.Text = Session["Username"].ToString();

        SqlDataAdapter sda = new SqlDataAdapter("select * from UserMaster where email=@Email", conn);
        sda.SelectCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtName.Text = dt.Rows[0]["name"].ToString();
            txtPhone.Text = dt.Rows[0]["phone"].ToString();
            txtAddress.Text = dt.Rows[0]["address"].ToString();
            if (dt.Rows[0]["image"].ToString()!= "")
            {
                imgProfile.Src = dt.Rows[0]["image"].ToString();
            }
        }


    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fuProfile.HasFile)
        {
            string fileName = Path.GetFileName(fuProfile.PostedFile.FileName);
            string filePath = Server.MapPath("~/assets/file/") + fileName;
            fuProfile.SaveAs(filePath);
            imgProfile.Src = "~/assets/file/" + fileName;
            // Optionally, save the file path to the database here
        }
        else
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a file to upload.');", true);
            Response.Write("<script>alert('Please select a file to upload.');</script>");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ConnectionState.Closed == conn.State)
        {
            conn.Open();
        }
        try
        {
            string updateProfile = "update UserMaster set name=@name, phone=@phone, address=@address, image=@image where email=@Email";
            SqlDataAdapter sda = new SqlDataAdapter("updateProfile", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text);
            sda.SelectCommand.Parameters.AddWithValue("@name", txtName.Text);
            sda.SelectCommand.Parameters.AddWithValue("@phone", txtPhone.Text);
            sda.SelectCommand.Parameters.AddWithValue("@address", txtAddress.Text);
            sda.SelectCommand.Parameters.AddWithValue("@image", imgProfile.Src);
            Response.Write("<script>alert('Profile Updated Successfully!');</script>");

        }
        catch
        {
            Response.Write("<script>alert('Error Occurred! Please try again later.');</script>");
        }
        finally
        {
            conn.Close();
        }

    }
}