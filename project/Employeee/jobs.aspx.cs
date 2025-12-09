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
    public partial class jobs : System.Web.UI.Page
    {
        private readonly string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // protect page: must be signed in as employer
            if (Session["emp_id"] == null || Session["role"]?.ToString() != "employer")
            {
                Response.Redirect("~/Login.aspx");
                return;
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

                BindJobs(empId);
            }
        }

        private void BindJobs(int empId)
        {
            DataTable dt = new DataTable();

            string sql = @"
                            SELECT 
                            J.Id AS JobId,
                            J.Title,
                            ISNULL(NULLIF(J.Status,''), 'Draft') AS Status,
                            ISNULL(J.CreatedAt, GETDATE()) AS CreatedAt,
                            (SELECT COUNT(*) FROM AppliedJob A WHERE A.JobId = J.Id) AS Applicants,
                            (SELECT COUNT(*) FROM AppliedJob A WHERE A.JobId = J.Id AND A.AppliedAt >= DATEADD(day, -7, GETDATE())) AS NewApplicants
                            FROM Job_tbl J
                            WHERE J.EmployerId = @empId
                            ORDER BY J.CreatedAt DESC;";

            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            if (dt.Rows.Count > 0)
            {
                rptJobs.DataSource = dt;
                rptJobs.DataBind();
                litJobsEmpty.Text = string.Empty;
            }
            else
            {
                rptJobs.DataSource = null;
                rptJobs.DataBind();
                litJobsEmpty.Text = "<div style='padding:16px'>You have no job postings. <a href='jobpost.aspx'>Post your first job</a>.</div>";
            }
        }

        protected void rptJobs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewApplicants")
            {
                string jobId = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(jobId))
                {
                    Response.Redirect($"~/Employeee/applicants.aspx?jobId={jobId}");
                }
            }
            else if (e.CommandName == "Edit")
            {
                string jobId = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(jobId))
                {
                    Response.Redirect($"~/Employeee/job_edit.aspx?jobId={jobId}");
                }
            }
            else if (e.CommandName == "ToggleStatus")
            {
                // CommandArgument format: "JobId|Status"
                string arg = e.CommandArgument?.ToString();
                if (string.IsNullOrEmpty(arg)) return;

                var parts = arg.Split('|');
                if (parts.Length < 1) return;

                int jobId;
                if (!Int32.TryParse(parts[0], out jobId)) return;

                string currentStatus = parts.Length > 1 ? parts[1] ?? "" : "";
                currentStatus = currentStatus.Trim();

                // Determine new status: if Active -> Paused, if Paused or Draft -> Active
                string newStatus;
                if (string.Equals(currentStatus, "Active", StringComparison.OrdinalIgnoreCase))
                    newStatus = "Paused";
                else
                    newStatus = "Active";

                // If it's Draft and user clicked Post Job, we still set to Active
                string sqlUpdate = "UPDATE Job_tbl SET Status = @status WHERE Id = @jobId";

                using (SqlConnection con = new SqlConnection(connString))
                using (SqlCommand cmd = new SqlCommand(sqlUpdate, con))
                {
                    cmd.Parameters.Add("@status", SqlDbType.VarChar, 50).Value = newStatus;
                    cmd.Parameters.Add("@jobId", SqlDbType.Int).Value = jobId;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Refresh list
                int empId = Convert.ToInt32(Session["emp_id"]);
                BindJobs(empId);
            }
        }
    }
}