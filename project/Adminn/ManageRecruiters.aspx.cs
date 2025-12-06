using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project.Adminn
{
    public partial class ManageRecruiters : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRecruiterData();
            }
        }

        private void BindRecruiterData()
        {
            // SQL query to select all necessary fields from the Employers table
            string query = "SELECT EmployerId, CompanyName, Email FROM Employers_tbl ORDER BY CreatedAt DESC";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Bind the DataTable to the GridView
                        gvRecruiters.DataSource = dt;
                        gvRecruiters.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or display the error (e.g., in a Label control)
                // For demonstration, we'll use a simple alert
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Error loading recruiter data: {ex.Message}');", true);
            }
        }

        // --- GridView Paging Handler (Optional but recommended) ---
        protected void gvRecruiters_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRecruiters.PageIndex = e.NewPageIndex;
            BindRecruiterData(); // Rebind the data for the new page
        }

        // --- Optional: Handling Deletion (Add an OnRowCommand handler) ---
        // Note: You must add 'OnRowCommand="gvRecruiters_RowCommand"' to your GridView in the ASPX file
        protected void gvRecruiters_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecruiter")
            {
                int employerId = Convert.ToInt32(e.CommandArgument);
                DeleteRecruiter(employerId);
            }
        }

        private void DeleteRecruiter(int employerId)
        {
            string query = "DELETE FROM Employers_tbl WHERE EmployerId = @EmployerId";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmployerId", employerId);
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Success message and rebind the grid
                            ScriptManager.RegisterStartupScript(this, GetType(), "success",
                                "alert('Recruiter deleted successfully.');", true);
                            BindRecruiterData();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "fail",
                                "alert('Recruiter not found.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error deleting recruiter: {ex.Message}');", true);
            }
        }

    }
}   