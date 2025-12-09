using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mca.Employeee
{
    public partial class emp_home : System.Web.UI.Page
    {
        private readonly string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["emp_id"] == null || (string)Session["role"] != "employer")
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                int empId;
                if (!Int32.TryParse(Session["emp_id"].ToString(), out empId))
                {
                    Session.Abandon();
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                LoadDashboardCounts(empId);
                LoadRecentApplicants(empId);
            }
        }
        private void LoadDashboardCounts(int empId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();

                    // 1) Active Jobs
                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT COUNT(*) FROM Job_tbl WHERE EmployerId = @empId", con))
                    {
                        // NOTE: If you have a status column, replace the WHERE clause above with: "EmployerId = @empId AND status = 'Active'"
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                        int activeJobs = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);
                        lblActiveJobs.Text = activeJobs.ToString();
                    }

                    // 2) New Applicants (last 7 days) - join via Job_tbl.JobId => AppliedJob.JobId
                    using (SqlCommand cmd = new SqlCommand(
                        @"SELECT COUNT(*) 
                          FROM AppliedJob A
                          INNER JOIN Job_tbl J ON A.JobId = J.Id
                          WHERE J.EmployerId = @empId AND A.AppliedAt >= DATEADD(day, -7, GETDATE())", con))
                    {
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                        int newApplicants = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);
                        lblNewApplicants.Text = newApplicants.ToString();
                    }

                    // 3) Pending Reviews
                    using (SqlCommand cmd = new SqlCommand(
                        @"SELECT COUNT(*) 
                          FROM AppliedJob A
                          INNER JOIN Job_tbl J ON A.JobId = J.Id
                          WHERE J.EmployerId = @empId AND A.Status = 'Pending'", con))
                    {
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                        int pending = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);
                        lblPendingReviews.Text = pending.ToString();
                    }

                    // 4) Hired This Month
                    using (SqlCommand cmd = new SqlCommand(
                        @"SELECT COUNT(*) 
                          FROM AppliedJob A
                          INNER JOIN Job_tbl J ON A.JobId = J.Id
                          WHERE J.EmployerId = @empId 
                            AND A.Status = 'Hired'
                            AND MONTH(A.AppliedAt) = MONTH(GETDATE())
                            AND YEAR(A.AppliedAt) = YEAR(GETDATE())", con))
                    {
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                        int hired = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);
                        lblHiredThisMonth.Text = hired.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // optionally log ex
                // show friendly defaults if error
                lblActiveJobs.Text = "0";
                lblNewApplicants.Text = "0";
                lblPendingReviews.Text = "0";
                lblHiredThisMonth.Text = "0";
                Console.WriteLine(ex.Message);  
            }
        }

        private void LoadRecentApplicants(int empId)
        {
            try
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(connString))
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT TOP 5 
                  A.JobId,
                  A.UserId,
                  A.AppliedAt,
                  ISNULL(A.Status,'Pending') AS Status,
                  U.Name,
                  J.Title
              FROM AppliedJob A
              INNER JOIN Job_tbl J ON A.JobId = J.Id
              INNER JOIN User_tbl U ON A.UserId = U.UserId
              WHERE J.EmployerId = @empId
              ORDER BY A.AppliedAt DESC", con))
                {
                    cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    rptRecentApplicants.DataSource = dt;
                    rptRecentApplicants.DataBind();
                    litNoRecords.Text = string.Empty;
                }
                else
                {
                    rptRecentApplicants.DataSource = null;
                    rptRecentApplicants.DataBind();
                    litNoRecords.Text = "<div style='padding:16px'>No recent applicants.</div>";
                }
            }
            catch (Exception ex)
            {
                // log the error to Output (View > Output window in VS) for debugging
                System.Diagnostics.Debug.WriteLine("LoadRecentApplicants error: " + ex.ToString());

                rptRecentApplicants.DataSource = null;
                rptRecentApplicants.DataBind();
                litNoRecords.Text = "<div style='padding:16px'>Unable to load applicants.</div>";
            }
        }


        // Example: handle Repeater actions (View / Message)
        protected void rptRecentApplicants_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                string arg = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(arg))
                {
                    var parts = arg.Split('|');
                    if (parts.Length == 2)
                    {
                        string jobId = parts[0];
                        string userId = parts[1];
                        // Redirect to details page with both ids
                        Response.Redirect($"~/Employeee/applicant_detail.aspx?jobId={jobId}&userId={userId}");
                    }
                    else
                    {
                        // fallback: if only JobId present
                        Response.Redirect($"~/Employeee/applicant_detail.aspx?jobId={arg}");
                    }
                }
            }
            else if (e.CommandName == "Message")
            {
                string userId = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(userId))
                {
                    Response.Redirect($"~/Employeee/message.aspx?uid={userId}");
                }
            }
        }

    }
}
 