using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Settings : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtConfirmPass_Changed(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (txtNewPass.Text == txtConfirmPass.Text)
            {
                btnSave.Enabled = true;
            }
            else
            {
                btnSave.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New password and Confirm Password mismatched!');", true);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string username = Session["Username"].ToString();

        try
        {
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("FetchUser", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@username", username);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SqlDataAdapter Update = new SqlDataAdapter("FetchUser", conn);
                Update.SelectCommand.CommandType = CommandType.StoredProcedure;
                Update.SelectCommand.Parameters.AddWithValue("@username", username);
                DataTable dtPass = new DataTable();
                sda.Fill(dtPass);
                if (dtPass.Rows[0]["password"].ToString() == txtPass.Text)
                {

                    sda.SelectCommand.Parameters.AddWithValue("@password", txtNewPass.Text.Trim());
                    if (chkEmailNotif.Checked)
                    {
                        MailMessage mail = new MailMessage();
                        mail.To.Add(dt.Rows[0]["email"].ToString());
                        mail.From = new MailAddress("no.reply.schoolnest@gmail.com", "SchoolNest");

                        mail.Subject = "Password Changed Successfully";

                        string emailBody = $@"
                            <html>
                              <body style='font-family: Arial, sans-serif; color: #333;'>
                                <p>Dear {dt.Rows[0]["name"]},</p>
                                <p>
                                  We would like to inform you that your password has been 
                                  <strong>changed successfully</strong>.
                                </p>
                                <p>
                                  If you did not authorize this change, please contact our support team immediately.
                                </p>
                                <p style='margin:20px 0;'>
                                  <a href='https://schoolnest.runasp.net/Login.aspx' 
                                     style='font-size:1rem'>
                                     Login to Your Account
                                  </a>
                                </p>
                                <p>
                                  Thank you for using <b>SchoolNest</b>. We are committed to keeping your account safe.
                                </p>
                                <p>
                                  Best regards,<br/>
                                  <b>SchoolNest Team</b>
                                </p>
                              </body>
                            </html>";


                        mail.Body = emailBody;
                        mail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Port = 587; //SMTP port number
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Host = "smtp.gmail.com"; //SMTP server address
                        smtp.Credentials = new NetworkCredential(
                            ConfigurationManager.AppSettings["EmailUser"],
                            ConfigurationManager.AppSettings["EmailPass"]
                        );

                        smtp.Send(mail);

                    }
                    Response.Write("<script>alert('Password updated successfully.');</script>");

                }
                else
                {
                    if (txtPass.Text == "")
                    {
                        Response.Write("<script>alert('Please enter your current password.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Current password is incorrect.');</script>");
                    }

                }
            }
            else
            {
                //lblMessage.Text = "No user found with the provided username.";
                Response.Write("<script>alert('No user found with the provided username.');</script>");
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error: " + ex.Message;
            Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        }
        finally
        {
            conn.Close();
        }
    }
}