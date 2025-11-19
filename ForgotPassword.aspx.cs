using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Xml.Linq;

public partial class ForgotPassword : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSenOTP_Click(object sender, EventArgs e)
    {
        try
        {
            if (ConnectionState.Closed == conn.State)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM UserMaster WHERE email=@email", conn);
            cmd.Parameters.AddWithValue("@email", txtUsername.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string name = dt.Rows[0]["name"].ToString();
            if (dt.Rows.Count > 0)
            {
                var status = dt.Rows[0]["isActive"].ToString();
                if (status == "Active")
                {
                    Random random = new Random();
                    int otp = random.Next(100000, 999999); // Generate a 6-digit OTP
                    string passChange_Otp = otp.ToString();
                    Session["passChange_Otp"] = passChange_Otp;
                    MailMessage mail = new MailMessage();
                    mail.To.Add(txtUsername.Text);
                    mail.From = new MailAddress("no.reply.schoolnest@gmail.com");
                    mail.Subject = "SchoolNest Password Reset OTP";

                    string emailBody = "";
                    emailBody += "Dear " + name + ",<br/><br/>";
                    emailBody += "We received a request to reset your password. Please use the following One-Time Password (OTP) to proceed with resetting your password: <br/><h2>" + passChange_Otp + "</h2><br/><br/>";
                    emailBody += "If you did not request a password reset, please ignore this email.<br/><br/>";
                    emailBody += "Best regards,<br/>";
                    emailBody += "SchoolNest Team";
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
                    Response.Write("<script>alert('OTP has been sent to your email address. Please check your inbox.');</script>");
                    txtValidOtp.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your account is inactive. Please contact the administrator.');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Email address not found. Please enter a valid email.');</script>");
            }
        }

        catch
        {
            Response.Write("<script>alert('Error in sending OTP. Please try again later.');</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void btnChangePass_click(object sender, EventArgs e)
    {
        try
        {
            // Ensure OTP exists in session
            if (Session["passChange_Otp"] == null)
            {
                Response.Write("<script>alert('OTP expired. Please request a new one.');</script>");
                return;
            }

            // Compare entered OTP with stored OTP
            string storedOtp = Session["passChange_Otp"].ToString();
            if (txtValidOtp.Text.Trim() == storedOtp)
            {
                if (txtPassword.Text.Trim() == txtCnfPass.Text.Trim())
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE UserMaster SET password=@password WHERE email=@email", conn);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtUsername.Text.Trim());
                    cmd.ExecuteNonQuery();

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


                    Response.Write("<script>alert('Password changed successfully. You can now log in.');</script>");

                    // Clear OTP after use
                    Session["passChange_Otp"] = null;


                }
                else
                {
                    Response.Write("<script>alert('Password and Confirm Password do not match. Please try again.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP. Please try again.');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error in changing password: " + ex.Message + "');</script>");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            txtCnfPass.Text = "";
            txtPassword.Text = "";
            txtValidOtp.Visible = false;
            txtValidOtp.Text = "";
            txtUsername.Text = "";

            btnBacktoLogin.Visible = true;
        }
    }
    protected void btnBacktoLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

}