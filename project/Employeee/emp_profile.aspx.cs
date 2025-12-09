using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project.Employeee
{
    public partial class emp_profile : System.Web.UI.Page
    {

        private readonly string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // protect page
            if (Session["emp_id"] == null || Session["role"]?.ToString() != "employer")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int empId = Convert.ToInt32(Session["emp_id"]);
                LoadProfile(empId);
            }
        }

        private void LoadProfile(int empId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand("SELECT EmployerId, UserName, FullName, Address, Mobile, Email, Country, CompanyName, CompanyImage FROM Employers_tbl WHERE EmployerId = @id", con))
            {
                cmd.Parameters.AddWithValue("@id", empId);
                con.Open();
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    if (rd.Read())
                    {
                        txtCompanyName.Text = rd["CompanyName"]?.ToString();
                        txtFullName.Text = rd["FullName"]?.ToString();
                        txtEmail.Text = rd["Email"]?.ToString();
                        txtMobile.Text = rd["Mobile"]?.ToString();
                        txtAddress.Text = rd["Address"]?.ToString();
                        txtCountry.Text = rd["Country"]?.ToString();
                        txtUserName.Text = rd["UserName"]?.ToString();

                        string imgPath = rd["CompanyImage"]?.ToString();
                        if (!string.IsNullOrEmpty(imgPath))
                        {
                            // if you store path relative to project
                            imgCompany.ImageUrl = imgPath;
                        }
                        else
                        {
                            imgCompany.ImageUrl = "~/assets/default-company.png"; // fallback
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int empId = Convert.ToInt32(Session["emp_id"]);
            string companyName = txtCompanyName.Text.Trim();
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string address = txtAddress.Text.Trim();
            string country = txtCountry.Text.Trim();
            string newPassword = txtPassword.Text.Trim();

            string savedImagePath = null;
            if (fuCompanyImage.HasFile)
            {
                // Save uploaded file under /uploads/company/
                string folder = Server.MapPath("~/uploads/company/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                string ext = Path.GetExtension(fuCompanyImage.FileName);
                string fileName = $"company_{empId}_{DateTime.Now.Ticks}{ext}";
                string fullPath = Path.Combine(folder, fileName);
                fuCompanyImage.SaveAs(fullPath);

                // store virtual path in DB
                savedImagePath = "~/uploads/company/" + fileName;
            }

            using (SqlConnection con = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand("", con))
            {
                // build update query
                var sb = new System.Text.StringBuilder();
                sb.Append("UPDATE Employers_tbl SET CompanyName=@CompanyName, FullName=@FullName, Email=@Email, Mobile=@Mobile, Address=@Address, Country=@Country");

                if (!string.IsNullOrEmpty(newPassword))
                {
                    // TODO: ideally store hashed passwords. For now keep same style
                    sb.Append(", Password=@Password");
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                }

                if (!string.IsNullOrEmpty(savedImagePath))
                {
                    sb.Append(", CompanyImage=@CompanyImage");
                    cmd.Parameters.AddWithValue("@CompanyImage", savedImagePath);
                }

                sb.Append(" WHERE EmployerId=@EmployerId");

                cmd.CommandText = sb.ToString();
                cmd.Parameters.AddWithValue("@CompanyName", companyName);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Country", country);
                cmd.Parameters.AddWithValue("@EmployerId", empId);

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    litMessage.Text = "<div style='color:green;padding:10px'>Profile updated successfully.</div>";
                    LoadProfile(empId); // refresh
                }
                else
                {
                    litMessage.Text = "<div style='color:red;padding:10px'>No changes saved.</div>";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // reload profile to discard changes
            int empId = Convert.ToInt32(Session["emp_id"]);
            LoadProfile(empId);
        }
    }
}

