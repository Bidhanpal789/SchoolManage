using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["LoginCookie"] != null)
            {
                txtUsername.Text = Request.Cookies["LoginCookie"]["Username"];
                txtPass.Attributes["value"] = Request.Cookies["LoginCookie"]["Password"];
                RememberMe.Checked = true;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        try
        {
            if (ConnectionState.Closed == conn.State)
            {
                conn.Open();
            }
            SqlDataAdapter sda = new SqlDataAdapter("loginUser", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@email", txtUsername.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (txtPass.Text == dt.Rows[0]["password"].ToString())
                {
                    Session["Username"] = dt.Rows[0]["email"].ToString();
                    var status = dt.Rows[0]["isActive"].ToString();
                    if (status == "Active")
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Your account is inactive. Please contact admin.');</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Password!');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Username!');</script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('Username not found');</script>");

        }
        finally
        {
            conn.Close();
        }

    }

}
