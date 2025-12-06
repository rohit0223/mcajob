using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Resume : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["cs"]?.ConnectionString;

        // keep current virtual paths so we don't overwrite DB values if user doesn't upload new files
        private string resumePath;
        private string photoPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    btn1.Text = "Profile";
                    btn2.Text = "LogOut";

                    if (Request.QueryString["id"] != null)
                        LoadUser(Convert.ToInt32(Request.QueryString["id"]));
                }
                else
                {
                    btn1.Text = "Register";
                    btn2.Text = "Login";
                }
            }
        }

        protected void btn1_Click(object sender, EventArgs e) => Response.Redirect(btn1.Text == "Profile" ? "Profile.aspx" : "Register.aspx");
        protected void btn2_Click(object sender, EventArgs e)
        {
            if (btn2.Text == "Login") Response.Redirect("Login.aspx");
            else { Session.Abandon(); Response.Redirect("Login.aspx"); }
        }

        // ----- Load DB values into controls -----
        private void LoadUser(int id)
        {
            if (string.IsNullOrEmpty(connStr)) { ShowMsg("Missing DB connection string.", true); return; }

            string sql = "SELECT * FROM User_tbl WHERE UserId = @id";
            using (var con = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                var dt = new DataTable();
                using (var da = new SqlDataAdapter(cmd)) da.Fill(dt);

                if (dt.Rows.Count == 0) { ShowMsg("User not found.", true); return; }

                var r = dt.Rows[0];
                txtUserName.Text = r["UserName"]?.ToString();
                txtFullName.Text = r["Name"]?.ToString();
                txtAddress.Text = r["Address"]?.ToString();
                txtMobile.Text = r["Mobile"]?.ToString();
                txtEmail.Text = r["Email"]?.ToString();
                ddlContry.SelectedValue = r.Table.Columns.Contains("Country") ? (r["Country"]?.ToString() ?? "0") : "0";
                txt10th.Text = r.Table.Columns.Contains("Tenth") ? r["Tenth"]?.ToString() : "";
                txt12th.Text = r.Table.Columns.Contains("Twelveth") ? r["Twelveth"]?.ToString() : "";
                txtgrad.Text = r.Table.Columns.Contains("Graduation") ? r["Graduation"]?.ToString() : "";
                txtpostgrad.Text = r.Table.Columns.Contains("PostGraduation") ? r["PostGraduation"]?.ToString() : "";
                txtphd.Text = r.Table.Columns.Contains("Phd") ? r["Phd"]?.ToString() : "";
                txtwork.Text = r.Table.Columns.Contains("WorkOn") ? r["WorkOn"]?.ToString() : "";
                txtex.Text = r.Table.Columns.Contains("Experience") ? r["Experience"]?.ToString() : "";

                // store existing paths so we keep them unless new files are uploaded
                resumePath = r.Table.Columns.Contains("Resume") && r["Resume"] != DBNull.Value ? r["Resume"].ToString() : null;
                photoPath = r.Table.Columns.Contains("Photo") && r["Photo"] != DBNull.Value ? r["Photo"].ToString() : null;

                if (!string.IsNullOrEmpty(photoPath))
                {
                    imgPreview.Visible = true;
                    imgPreview.ImageUrl = ResolveUrl(photoPath);
                }
            }
        }

        // ----- Save button -----
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) { ShowMsg("No user id provided.", true); return; }
            int id = Convert.ToInt32(Request.QueryString["id"]);

            // keep existing values (LoadUser usually ran on first load)
            // attempt to upload new files (if provided) and update the virtual paths
            TryUploadFiles();

            bool ok = UpdateUser(
                id,
                txtUserName.Text.Trim(),
                txtFullName.Text.Trim(),
                txtAddress.Text.Trim(),
                txtMobile.Text.Trim(),
                txtEmail.Text.Trim(),
                ddlContry.SelectedValue,
                txt10th.Text.Trim(),
                txt12th.Text.Trim(),
                txtgrad.Text.Trim(),
                txtpostgrad.Text.Trim(),
                txtphd.Text.Trim(),
                txtwork.Text.Trim(),
                txtex.Text.Trim(),
                resumePath,
                photoPath
            );

            ShowMsg(ok ? "Record saved successfully." : "Error saving record.", !ok);
        }

        // ----- Upload helpers (very small checks only) -----
        private void TryUploadFiles()
        {
            // Resume
            if (resume.HasFile)
            {
                string ext = Path.GetExtension(resume.FileName).ToLower();
                string[] okExt = { ".pdf", ".doc", ".docx", ".txt" };
                if (Array.IndexOf(okExt, ext) >= 0)
                {
                    string folder = "~/uploads/resumes/";
                    string name = Path.GetFileNameWithoutExtension(resume.FileName) + "_" + DateTime.Now.Ticks + ext;
                    string vpath = folder + name;
                    string p = Server.MapPath(vpath);
                    Directory.CreateDirectory(Path.GetDirectoryName(p));
                    resume.SaveAs(p);
                    resumePath = vpath;
                }
            }

            // Photo
            if (fuPhoto.HasFile)
            {
                string ext = Path.GetExtension(fuPhoto.FileName).ToLower();
                string[] okImg = { ".jpg", ".jpeg", ".png", ".gif" };
                if (Array.IndexOf(okImg, ext) >= 0)
                {
                    string folder = "~/uploads/photos/";
                    string name = Path.GetFileNameWithoutExtension(fuPhoto.FileName) + "_" + DateTime.Now.Ticks + ext;
                    string vpath = folder + name;
                    string p = Server.MapPath(vpath);
                    Directory.CreateDirectory(Path.GetDirectoryName(p));
                    fuPhoto.SaveAs(p);
                    photoPath = vpath;
                    imgPreview.Visible = true;
                    imgPreview.ImageUrl = ResolveUrl(photoPath);
                }
            }
        }

        // ----- DB update (simple) -----
        private bool UpdateUser(int id, string username, string name, string address, string mobile, string email,
            string country, string tenth, string twelveth, string graduation, string postGraduation, string phd,
            string workOn, string experience, string resumeVPath, string photoVPath)
        {
            if (string.IsNullOrEmpty(connStr)) return false;

            string sql = @"
                UPDATE User_tbl SET
                    UserName = @UserName,
                    Name = @Name,
                    Address = @Address,
                    Mobile = @Mobile,
                    Email = @Email,
                    Country = @Country,
                    Tenth = @Tenth,
                    Twelveth = @Twelveth,
                    Graduation = @Graduation,
                    PostGraduation = @PostGraduation,
                    Phd = @Phd,
                    WorkOn = @WorkOn,
                    Experience = @Experience,
                    Resume = @Resume,
                    Photo = @Photo
                WHERE UserId = @UserId
            ";

            using (var con = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@UserId", id);
                cmd.Parameters.AddWithValue("@UserName", (object)username ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Name", (object)name ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Address", (object)address ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Mobile", (object)mobile ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Email", (object)email ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Country", (object)country ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Tenth", (object)tenth ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Twelveth", (object)twelveth ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Graduation", (object)graduation ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@PostGraduation", (object)postGraduation ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Phd", (object)phd ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@WorkOn", (object)workOn ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Experience", (object)experience ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Resume", (object)resumeVPath ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Photo", (object)photoVPath ?? DBNull.Value);

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                return rows > 0;
            }
        }

        // ----- small UI helper -----
        private void ShowMsg(string text, bool isError)
        {
            lblmsg.Visible = true;
            lblmsg.Text = text;
            lblmsg.CssClass = isError ? "alert alert-danger" : "alert alert-success";
        }
    }
}