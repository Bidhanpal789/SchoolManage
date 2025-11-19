using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndividualSudent : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get rollNo from query string
            string rollNo = Request.QueryString["rollNo"];
            if (!string.IsNullOrEmpty(rollNo))
            {
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM StudentTbl WHERE rollNo=@rollNo", conn);
                sda.SelectCommand.Parameters.AddWithValue("@rollNo", rollNo);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    lblRoll.Text = dt.Rows[0]["rollNo"].ToString();
                    lblName.Text = dt.Rows[0]["name"].ToString();
                    lblClass.Text = dt.Rows[0]["class"].ToString();
                    lblFName.Text = dt.Rows[0]["fatherName"].ToString();
                    lblDob.Text = Convert.ToDateTime(dt.Rows[0]["dob"]).ToString("dd/MM/yyyy");
                    lblGvtId.Text = dt.Rows[0]["govtId"].ToString();
                    lblGvtNo.Text = dt.Rows[0]["govtIdNo"].ToString();
                    lblEmail.Text = dt.Rows[0]["email"].ToString();
                    lblPhone.Text = dt.Rows[0]["phone"].ToString();
                    lblAddress.Text = dt.Rows[0]["address"].ToString();
                    imgStudent.ImageUrl = dt.Rows[0]["photo"].ToString();
                    lblStatus.Text = dt.Rows[0]["status"].ToString();
                }
                else
                {
                    Response.Redirect("ShowAll.aspx");
                }
            }
            else
            {
                Response.Redirect("ShowAll.aspx");
            }
        }
    }
}