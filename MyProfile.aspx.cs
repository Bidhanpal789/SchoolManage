using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mydb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string FetchUser = "select * from UserMaster where email=@email";
                SqlDataAdapter sda = new SqlDataAdapter(FetchUser, conn);
                //sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@email", Session["Username"].ToString());
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblName.Text = dt.Rows[0]["name"].ToString();
                    lblEmail.Text = dt.Rows[0]["email"].ToString();
                    lblPhone.Text = dt.Rows[0]["phone"].ToString();
                    lblAddress.Text = dt.Rows[0]["address"].ToString();
                    if (dt.Rows[0]["image"].ToString()!="")
                    {
                        imgUser.ImageUrl = dt.Rows[0]["image"].ToString();
                    }
                    
                   

                }
            }
            else
            {
                try
                {
                    Response.Write("<script>alert('Session Expired! Please Login Again');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
                finally
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

    }
}