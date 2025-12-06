using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Register : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clear()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtFullName.Text = "";
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            ddlContry.SelectedIndex = 0;
        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                string q = @"INSERT INTO User_tbl 
                            (UserName,Password,Name,Address,Mobile,Email,Country)
                            VALUES (@u,@p,@n,@a,@m,@e,@c)";

                using (SqlCommand cmd = new SqlCommand(q, con))
                {
                    cmd.Parameters.AddWithValue("@u", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@n", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@a", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@m", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@c", ddlContry.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblmsg.Visible = true;
            lblmsg.Text = "User registration successful!";
            clear();
        }

        protected void BtnRecuiter_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                string q = @"INSERT INTO Employers_tbl 
                            (UserName,Password,FullName,Address,Mobile,Email,Country)
                            VALUES (@u,@p,@n,@a,@m,@e,@c)";

                using (SqlCommand cmd = new SqlCommand(q, con))
                {
                    cmd.Parameters.AddWithValue("@u", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@n", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@a", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@m", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@c", ddlContry.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblmsg.Visible = true;
            lblmsg.Text = "Recruiter registration successful!";
            clear();
        }
    }
}