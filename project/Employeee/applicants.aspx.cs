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
    public partial class applicants : System.Web.UI.Page
    {
        private readonly string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Protect page - only employer should access
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

                // optional job filter: ?jobId=123
                int jobId = 0;
                if (!string.IsNullOrEmpty(Request.QueryString["jobId"]))
                    Int32.TryParse(Request.QueryString["jobId"], out jobId);

                LoadApplicants(empId, jobId);
            }
        }

        private void LoadApplicants(int empId, int jobId = 0)
        {
            DataTable dt = new DataTable();

            // Select applicant rows for jobs that belong to this employer.
            // Adjust column names if your DB differs.
            string sql = @"
SELECT 
    A.AppliedJobId,
    A.JobId,
    A.UserId,
    A.AppliedAt,
    ISNULL(A.Status, 'Pending') AS Status,
    U.Name,
    U.Email,
    U.Mobile,
    J.Title
FROM AppliedJob A
INNER JOIN Job_tbl J ON A.JobId = J.Id
INNER JOIN User_tbl U ON A.UserId = U.UserId
WHERE J.EmployerId = @empId
";

            if (jobId > 0)
            {
                sql += " AND J.Id = @jobId ";
            }

            sql += " ORDER BY A.AppliedAt DESC";

            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.Add("@empId", SqlDbType.Int).Value = empId;
                if (jobId > 0) cmd.Parameters.Add("@jobId", SqlDbType.Int).Value = jobId;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            if (dt.Rows.Count > 0)
            {
                // add a small helper column for avatar color (optional)
                if (!dt.Columns.Contains("AvatarColor"))
                    dt.Columns.Add("AvatarColor", typeof(string));

                foreach (DataRow r in dt.Rows)
                {
                    // simple deterministic color by hashing name - optional
                    r["AvatarColor"] = PickColorForName(r["Name"]?.ToString());
                }

                rptApplicants.DataSource = dt;
                rptApplicants.DataBind();
                litApplicantsEmpty.Text = string.Empty;
            }
            else
            {
                rptApplicants.DataSource = null;
                rptApplicants.DataBind();
                litApplicantsEmpty.Text = "<div style='padding:16px'>No applicants found.</div>";
            }
        }

        // Repeater command handler for View Profile / Message
        protected void rptApplicants_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")
            {
                // CommandArgument is UserId
                string userId = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(userId))
                {
                    Response.Redirect($"~/Employeee/applicant_detail.aspx?uid={userId}");
                }
            }
            else if (e.CommandName == "Message")
            {
                string userId = e.CommandArgument?.ToString();
                if (!string.IsNullOrEmpty(userId))
                {
                    // open your messaging page or conversation UI
                    Response.Redirect($"~/Employeee/message.aspx?uid={userId}");
                }
            }
        }

        // Helper: Generate initials (used by Eval in markup)
        public string GetInitials(object nameObj)
        {
            string name = (nameObj ?? "").ToString().Trim();
            if (string.IsNullOrEmpty(name)) return "U";
            var parts = name.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 1) return parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
            return (parts[0].Substring(0, 1) + parts[parts.Length - 1].Substring(0, 1)).ToUpper();
        }

        // Optional: deterministic color picker for avatar (returns CSS color)
        private string PickColorForName(string name)
        {
            if (string.IsNullOrEmpty(name)) return "#005A9C";
            // simple hash -> pick from a list
            string[] colors = new[] { "#005A9C", "#27AE60", "#F2994A", "#C92A2A", "#6F42C1", "#0B7285" };
            int h = 0;
            foreach (char c in name) h = (h * 31 + c) % 100000;
            return colors[Math.Abs(h) % colors.Length];
        }
    }
}