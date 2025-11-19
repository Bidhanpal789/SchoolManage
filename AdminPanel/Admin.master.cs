using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Admin : System.Web.UI.MasterPage
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        // Disable caching to prevent Back button issues
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetNoStore();


        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();
            if (Session["Username"] == null)
            {
                Session.Abandon();
                Session.Clear();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetNoStore();
                Response.Redirect("Login.aspx");

            }
            else
            {
                string FetchUser = "select * from UserMaster where email=@Email";
                SqlDataAdapter sda = new SqlDataAdapter(FetchUser, conn);
                sda.SelectCommand.Parameters.AddWithValue("@Email", Session["Username"].ToString());
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblUserName.Text = "Welcome! </t>" + dt.Rows[0]["name"].ToString();
                }
                else
                {
                    lblUserName.Text = "Welcome! </t> Guest";
                }
            }

        }



    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear the session and redirect to the login page
        Session.Clear();
        Session.Abandon();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetNoStore();
        Response.Redirect("Login.aspx");
    }
}
