using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Contact : System.Web.UI.Page
    {

        // Use connection string name used elsewhere (change if your name is different)
        private readonly string connStr = ConfigurationManager.ConnectionStrings["cs"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // header buttons
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

            // hide message on first load
            if (!IsPostBack)
            {
                lblmsg.Visible = false;
        }
        }

        protected void btbSend_Click(object sender, EventArgs e)
        {
            lblmsg.Visible = false;
            lblmsg.Text = "";
            lblmsg.ForeColor = System.Drawing.Color.Green;

            // simple validation
            string name = txtnm.Text.Trim();
            string email = txteml.Text.Trim();
            string subject = txtsub.Text.Trim();
            string msg = message.Value.Trim();

            if (string.IsNullOrEmpty(name))
            {
                ShowError("Please enter your name.");
                return;
            }
            if (string.IsNullOrEmpty(email))
            {
                ShowError("Please enter your email.");
                return;
            }
            if (string.IsNullOrEmpty(subject))
            {
                ShowError("Please enter a subject.");
                return;
            }
            if (string.IsNullOrEmpty(msg))
            {
                ShowError("Please enter your message.");
                return;
            }

            if (string.IsNullOrEmpty(connStr))
            {
                ShowError("Database connection is not configured. Please update web.config.");
                return;
        }

            try
            {
                using (var con = new SqlConnection(connStr))
                {
                    const string sql = @"
                        INSERT INTO Contact_tbl (Name, Email, Subject, Message, CreatedAt)
                        VALUES (@Name, @Email, @Subject, @Message, @CreatedAt)";
                    using (var cmd = new SqlCommand(sql, con))
        {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Subject", subject);
                        cmd.Parameters.AddWithValue("@Message", msg);
                        cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // success
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Text = "Thank you! Your message has been sent.";
                lblmsg.Visible = true;

                ClearForm();
            }
            catch (Exception ex)
            {
                // log exception in real app. For now show friendly error.
                ShowError("An error occurred while sending your message. Please try again later.");
            }
        }

        private void ShowError(string text)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = text;
            lblmsg.Visible = true;
        }

        private void ClearForm()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtsub.Text = "";
            message.Value = "";
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
    }
}