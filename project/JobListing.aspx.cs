using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public partial class JobListing : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        int pageSize = 5; // 5 jobs per page

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // If sort provided in querystring, set dropdown
                string qsSort = Request.QueryString["sort"];
                if (!string.IsNullOrEmpty(qsSort) && ddlSort.Items.FindByValue(qsSort) != null)
                    ddlSort.SelectedValue = qsSort;
                else
                    ddlSort.SelectedValue = "none";

                ListJob();
            }

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

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            // go to page 1 and keep sort in querystring
            Response.Redirect("JobListing.aspx?page=1&sort=" + ddlSort.SelectedValue);
        }

        void ListJob()
        {
            int page = 1;
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                int.TryParse(Request.QueryString["page"], out page);
                if (page < 1) page = 1;
            }

            // determine sort (prefer querystring so pager links keep sort)
            string sort = Request.QueryString["sort"];
            if (string.IsNullOrEmpty(sort))
                sort = ddlSort.SelectedValue ?? "none";
            else
            {
                if (ddlSort.Items.FindByValue(sort) != null)
                    ddlSort.SelectedValue = sort;
        }

            // choose ORDER BY clause
            // NOTE: TRY_CAST requires SQL Server 2012+. If not supported, change to "Salary" only.
            string orderBy = "CreatedAt DESC"; // default newest
            if (sort == "salary_desc") orderBy = "TRY_CAST(Salary AS FLOAT) DESC";
            if (sort == "salary_asc") orderBy = "TRY_CAST(Salary AS FLOAT) ASC";
            if (sort == "newest") orderBy = "CreatedAt DESC";
            if (sort == "none") orderBy = "CreatedAt DESC";

            // total count
            int totalRecords = 0;
            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmdCount = new SqlCommand("SELECT COUNT(*) FROM Job_tbl", con))
        {
            con = new SqlConnection();
            job = new joblisting();
            job.getcon();
            con.Open();
                totalRecords = Convert.ToInt32(cmdCount.ExecuteScalar());
        }

            int totalPages = (int)Math.Ceiling((double)totalRecords / pageSize);
            if (totalPages == 0) totalPages = 1;
            if (page > totalPages) page = totalPages;

            int offset = (page - 1) * pageSize;

            // offset-fetch query (SQL Server 2012+)
            string q = $"SELECT * FROM Job_tbl ORDER BY {orderBy} OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY";

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand(q, con))
        {
                cmd.Parameters.AddWithValue("@Offset", offset);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            dlJob.DataSource = dt;
            dlJob.DataBind();

            lblCount.Text = totalRecords + " Jobs found";

            RenderPager(page, totalPages, sort);
        }

        void RenderPager(int currentPage, int totalPages, string sort)
        {
            StringBuilder sb = new StringBuilder();

            if (totalPages <= 1)
            {
                ltPager.Text = "";
                return;
            }

            // Prev
            if (currentPage > 1)
            {
                sb.Append($"<a class='page-link' href='JobListing.aspx?page={currentPage - 1}&sort={sort}'>Prev</a>&nbsp;");
            }

            // pages
            for (int i = 1; i <= totalPages; i++)
            {
                if (i == currentPage)
                {
                    sb.Append($"<span class='page-link active'>{i}</span>&nbsp;");
                }
                else
                {
                    sb.Append($"<a class='page-link' href='JobListing.aspx?page={i}&sort={sort}'>{i}</a>&nbsp;");
                }
            }

            // Next
            if (currentPage < totalPages)
            {
                sb.Append($"<a class='page-link' href='JobListing.aspx?page={currentPage + 1}&sort={sort}'>Next</a>");
            }

            ltPager.Text = sb.ToString();
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            if (btn2.Text == "Login")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (btn1.Text == "Profile")
            {
                Response.Redirect("Profile.aspx");
            }
            else
            {
                Response.Redirect("Register.aspx");
            }
        }
    }
}