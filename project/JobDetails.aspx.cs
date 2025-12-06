using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{

    public partial class JobDetails : System.Web.UI.Page
    {

        string conStr = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHeaderButtons();

                int jobid = Convert.ToInt32(Request.QueryString["id"]);
                LoadJobDetails(jobid);

                if (Session["userid"] != null)
                {
                    CheckAlreadyApplied(jobid, Convert.ToInt32(Session["userid"]));
                }
            }
        }

        // ---------------------------- HEADER BUTTONS ----------------------------
        void LoadHeaderButtons()
        {
            if (Session["user"] != null)
            {
                btn1.Text = "Profile";
                btn2.Text = "LogOut";
            }
            else
            {
                btn1.Text = "Register";
                btn2.Text = "Login";
            }
        }

        // ---------------------------- LOAD JOB DETAILS ----------------------------
        void LoadJobDetails(int id)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT * FROM Job_tbl WHERE Id=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTitle.Text = dr["Title"].ToString();
                    lblCompanyName.Text = dr["CompanyName"].ToString();
                    lblCompanyName2.Text = dr["CompanyName"].ToString();
                    lblCompanySpan.Text = dr["CompanyName"].ToString();

                    // IMAGE
                    imgCompany.ImageUrl = dr["CompanyImage"].ToString();

                    // LOCATION
                    lblLocation.Text = dr["Address"].ToString();
                    lblAddress.Text = dr["Address"].ToString();

                    // SALARY
                    lblSalary.Text = dr["Salary"].ToString();
                    lblSalaryOverview.Text = dr["Salary"].ToString();

                    // DESCRIPTION
                    litDescription.Text = "<p>" + dr["Description"].ToString() + "</p>";

                    // QUALIFICATION LIST
                    litQualification.Text = ConvertToList(dr["Qulification"].ToString());

                    // EXPERIENCE LIST
                    litExperience.Text = ConvertToList(dr["Experience"].ToString());

                    // DATES
                    lblCreatedAt.Text = Convert.ToDateTime(dr["CreatedAt"]).ToString("dd MMM yyyy");
                    lblLastDate.Text = Convert.ToDateTime(dr["LastDate"]).ToString("dd MMM yyyy");

                    // JOB TYPE
                    lblJobType.Text = dr["JobType"].ToString();

                    // WEBSITE + EMAIL
                    hlWebsite.Text = dr["Website"].ToString();
                    hlWebsite.NavigateUrl = "http://" + dr["Website"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                }
                con.Close();
            }
        }

        // ---------------------------- FORMAT AS UL LIST ----------------------------
        string ConvertToList(string text)
        {
            if (string.IsNullOrEmpty(text)) return "<p>-</p>";

            string[] items = text.Split('\n');
            string html = "<ul>";

            foreach (string item in items)
            {
                if (!string.IsNullOrWhiteSpace(item))
                {
                    html += "<li>" + item.Trim() + "</li>";
                }
            }

            html += "</ul>";
            return html;
        }

        // ---------------------------- CHECK IF ALREADY APPLIED ----------------------------
        void CheckAlreadyApplied(int jobid, int userid)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT COUNT(*) FROM AppliedJob WHERE JobId=@jid AND UserId=@uid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@jid", jobid);
                cmd.Parameters.AddWithValue("@uid", userid);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                if (count > 0)
                {
                    ApplyJob.Text = "Applied";
                    ApplyJob.Enabled = false;
                }
            }
        }

        // ---------------------------- APPLY BUTTON ----------------------------
        protected void ApplyJob_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int jobid = Convert.ToInt32(Request.QueryString["id"]);
            int userid = Convert.ToInt32(Session["userid"]);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"INSERT INTO AppliedJob (JobId, UserId, AppliedAt)
                                 VALUES (@jid, @uid, @dt)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@jid", jobid);
                cmd.Parameters.AddWithValue("@uid", userid);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblmsg.Visible = true;
            ApplyJob.Text = "Applied";
            ApplyJob.Enabled = false;
        }

        // ---------------------------- HEADER BUTTON EVENTS ----------------------------
        protected void btn1_Click(object sender, EventArgs e)
        {
            if (btn1.Text == "Profile")
                Response.Redirect("Profile.aspx");
            else
                Response.Redirect("Register.aspx");
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            if (btn2.Text == "Login")
                Response.Redirect("Login.aspx");
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
    }
}
