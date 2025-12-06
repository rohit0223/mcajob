using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mca.Employeee
{
    public partial class jobpost : System.Web.UI.Page
    {


        // Ensure this Connection String name matches the one in your Web.config
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: You can set the default date to today if the user doesn't pick one.
            if (!IsPostBack && string.IsNullOrEmpty(txtLastDate.Text))
            {
                // Set a default value (optional, adjust as needed)
                // txtLastDate.Text = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
            }
        }

        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Collect Data from Form Controls
                string title = txtTitle.Text;
                string post = txtRole.Text; // Mapped to the [Post] column
                string description = txtDescription.Text;
                string qulification = txtQualification.Text; // Mapped to the [Qulification] column
                string experience = txtExperience.Text;
                string lastDate = txtLastDate.Text; // Stored as NVARCHAR(MAX) per your table definition
                string salary = txtSalary.Text;
                string jobType = ddlJobType.SelectedValue;
                string companyName = txtCompanyName.Text;
                string website = txtWebsite.Text;
                string email = txtEmail.Text;
                string address = txtAddress.Text;
                string country = ddlCountry.SelectedValue;
                string state = ddlState.SelectedValue;

                // Simple handling for Company Image upload (saves file and stores path)
                string imagePath = string.Empty;
                if (fileCompanyImage.HasFile)
                {
                    string folderPath = Server.MapPath("~/Employeee/assets/img/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    // Use a unique file name to avoid conflicts
                    string fileName = Path.GetFileNameWithoutExtension(fileCompanyImage.FileName)
                                    + "_" + Guid.NewGuid().ToString().Substring(0, 8)
                                    + Path.GetExtension(fileCompanyImage.FileName);

                    imagePath = Path.Combine(folderPath, fileName);
                    fileCompanyImage.SaveAs(imagePath);

                    // Store the relative path in the database
                    imagePath = "~/Employeee/assets/img/" + fileName;
                }
                else
                {
                    // Handle case where no image is uploaded (e.g., store a default image path)
                    imagePath = "~/Employeee/assets/img/default.png";
                }


                // 2. Define the SQL INSERT Command
                // NOTE: The query now includes ONLY the columns defined in your Job_tbl.
                string query = @"
                    INSERT INTO Job_tbl (
                        Title, Post, Description, Qulification, Experience, LastDate, Salary, JobType,
                        CompanyName, CompanyImage, Website, Email, Address, Country, State
                    ) VALUES (
                        @Title, @Post, @Description, @Qulification, @Experience, @LastDate, @Salary, @JobType,
                        @CompanyName, @CompanyImage, @Website, @Email, @Address, @Country, @State
                    )";

                // 3. Execute the Query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters, ensuring the names match the query placeholders (@...)
                        command.Parameters.AddWithValue("@Title", title);
                        command.Parameters.AddWithValue("@Post", post);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@Qulification", qulification);
                        command.Parameters.AddWithValue("@Experience", experience);
                        command.Parameters.AddWithValue("@LastDate", lastDate);
                        command.Parameters.AddWithValue("@Salary", salary);
                        command.Parameters.AddWithValue("@JobType", jobType);
                        command.Parameters.AddWithValue("@CompanyName", companyName);
                        command.Parameters.AddWithValue("@CompanyImage", imagePath);
                        command.Parameters.AddWithValue("@Website", website);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@Country", country);
                        command.Parameters.AddWithValue("@State", state);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Success: Job posted successfully
                            Response.Redirect("jobs.aspx?success=jobposted");
                        }
                        else
                        {
                            // Failure: No rows inserted
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Job posting failed to save. Please try again.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Error Handling: Display the error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Database Error: {ex.Message.Replace("'", "")}');", true);
            }
        }

        // You would add a similar event handler for btnSaveDraft here if needed
    }
}
 