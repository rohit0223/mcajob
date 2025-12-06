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
    public partial class Profile : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["cs"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // header text
                if (Session["user"] != null) { btn1.Text = "Profile"; btn2.Text = "LogOut"; }
                else { btn1.Text = "Register"; btn2.Text = "Login"; }

                // show profile if logged-in
                if (Session["userid"] != null) ShowUserProfile();
            }
        }

        protected void btn1_Click(object sender, EventArgs e) => Response.Redirect(btn1.Text == "Profile" ? "Profile.aspx" : "Register.aspx");

        protected void btn2_Click(object sender, EventArgs e)
        {
            if (btn2.Text == "Login") Response.Redirect("Login.aspx");
            else { Session.Abandon(); Response.Redirect("Login.aspx"); }
        }

        // Bind DataList with single user row and convert stored virtual paths to usable URLs
        private void ShowUserProfile()
        {
            if (string.IsNullOrEmpty(connStr)) return;

            var userId = Session["userid"]?.ToString();
            if (string.IsNullOrEmpty(userId)) return;

            string sql = "SELECT UserId, UserName, Name, Address, Mobile, Email, Country, Resume, Photo FROM User_tbl WHERE UserId = @id";

            var dt = new DataTable();
            using (var con = new SqlConnection(connStr))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@id", userId);
                using (var da = new SqlDataAdapter(cmd)) da.Fill(dt);
            }

            // convert virtual paths like "~/uploads/..." to app urls that browser can request
            foreach (DataRow r in dt.Rows)
            {
                if (r.Table.Columns.Contains("Resume") && r["Resume"] != DBNull.Value && !string.IsNullOrEmpty(r["Resume"].ToString()))
                {
                    try { r["Resume"] = ResolveUrl(r["Resume"].ToString()); } catch { }
                }
                if (r.Table.Columns.Contains("Photo") && r["Photo"] != DBNull.Value && !string.IsNullOrEmpty(r["Photo"].ToString()))
                {
                    try { r["Photo"] = ResolveUrl(r["Photo"].ToString()); } catch { }
                }
            }

            dlprofile.DataSource = dt;
            dlprofile.DataBind();
        }

        // ItemDataBound: set client-side handlers to open file picker when image is clicked
        protected void dlprofile_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var img = e.Item.FindControl("imgUserPhoto") as Image;
                var fu = e.Item.FindControl("fuChangePhoto") as FileUpload;
                var hiddenBtn = e.Item.FindControl("btnHiddenUpload") as Button;

                if (img != null && fu != null && hiddenBtn != null)
                {
                    // clicking image => click file input
                    img.Attributes["onclick"] = $"document.getElementById('{fu.ClientID}').click();";
                    // when file selected, trigger the hidden button click so postback happens and file is posted
                    fu.Attributes["onchange"] = $"document.getElementById('{hiddenBtn.ClientID}').click();";
                }
            }
        }

        // ItemCommand: handle Edit and ChangePhoto commands
        protected void dlprofile_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                // EDIT -> go to Resume.aspx?id=...
                if (e.CommandName == "cmd_edt")
                {
                    Response.Redirect("Resume.aspx?id=" + e.CommandArgument);
                    return;
                }

                // CHANGE PHOTO -> save uploaded file located inside this DataList item
                if (e.CommandName == "cmd_changephoto")
                {
                    // basic guards
                    if (string.IsNullOrEmpty(connStr))
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Database not configured.";
                        lblmsg.CssClass = "alert alert-danger";
                        return;
                    }

                    // find the FileUpload control inside the clicked item
                    var fu = e.Item.FindControl("fuChangePhoto") as FileUpload;
                    if (fu == null || !fu.HasFile)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Please select an image first.";
                        lblmsg.CssClass = "alert alert-warning";
                        return;
                    }

                    // validate extension
                    string ext = System.IO.Path.GetExtension(fu.FileName).ToLower();
                    string[] allowed = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (Array.IndexOf(allowed, ext) < 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Only JPG / PNG / GIF allowed.";
                        lblmsg.CssClass = "alert alert-warning";
                        return;
                    }

                    // prepare unique virtual path and physical folder
                    string folderVirtual = "~/uploads/photos/";
                    string fileName = System.IO.Path.GetFileNameWithoutExtension(fu.FileName)
                                      + "_" + DateTime.Now.Ticks + ext;
                    string vpath = folderVirtual + fileName;
                    string physical = Server.MapPath(vpath);

                    // ensure folder exists and save file
                    System.IO.Directory.CreateDirectory(System.IO.Path.GetDirectoryName(physical));
                    fu.SaveAs(physical);

                    // update DB (store virtual path with ~ so ShowUserProfile can ResolveUrl)
                    string userId = Convert.ToString(e.CommandArgument ?? "");
                    if (string.IsNullOrEmpty(userId))
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "User id missing.";
                        lblmsg.CssClass = "alert alert-danger";
                        return;
                    }

                    string sql = "UPDATE User_tbl SET Photo = @photo WHERE UserId = @id";
                    using (var con = new SqlConnection(connStr))
                    using (var cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@photo", vpath);
                        cmd.Parameters.AddWithValue("@id", userId);
                        con.Open();
                        int rows = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rows > 0)
                        {
                            lblmsg.Visible = true;
                            lblmsg.Text = "Photo updated successfully.";
                            lblmsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblmsg.Visible = true;
                            lblmsg.Text = "Photo saved but DB update failed.";
                            lblmsg.CssClass = "alert alert-warning";
                        }
                    }

                    // refresh UI so new photo appears
                    ShowUserProfile();
                }
            }
            catch (Exception ex)
            {
                // simple error handling: show message (you can log ex.Message)
                lblmsg.Visible = true;
                lblmsg.Text = "Error: " + ex.Message;
                lblmsg.CssClass = "alert alert-danger";
            }
        }



    }
}