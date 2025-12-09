using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace project
{
    public partial class Login : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }

        void clear()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text != null && txtPassword.Text != null)
            {
                //con = new SqlConnection(s);
                //con.Open();
                //cmd = new SqlCommand("select * from User_tbl where UserName='" + txtUserName.Text + "' and Password='" + txtPassword.Text + "'", con);
                ////cs.select_user(txtUserName.Text, txtPassword.Text);
                //dr = cmd.ExecuteReader();
                //if (dr.Read())
                //{
                //    Session["user"] = dr["Username"].ToString();
                //    Session["userid"] = dr["UserId"].ToString();
                //    Response.Redirect("Default.aspx");
                //}
                //else
                //{
                //    Response.Redirect("Enter valid details...");
                //}
                //con.Close();
                if (txtUserName.Text == "admin" && txtPassword.Text == "admin")
                {
                    Session["user"] = "admin";
                    Response.Redirect("/Adminn/admin_home.aspx");
                }
                else
                {

                    startcon();
                    string username = txtUserName.Text.Trim();
                    string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
                    {
                Response.Write("Please enter username and password.");
                return;
            }

            try
            {
                // 1) Check Admin_tbl
                using (SqlConnection con = new SqlConnection(connString))
                using (SqlCommand cmd = new SqlCommand("SELECT AdminId FROM Admin_tbl WHERE Username = @u AND Password = @p", con))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);
                    con.Open();
                    object adminIdObj = cmd.ExecuteScalar();
                    if (adminIdObj != null)
                        {
                            Session["user"] = username;
                        Session["userid"] = adminIdObj.ToString();
                        Response.Redirect("~/Adminn/admin_home.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                        return;
                    }
                        }

                // 2) Check Employers_tbl (recruiter)
                using (SqlConnection con = new SqlConnection(connString))
                using (SqlCommand cmd = new SqlCommand("SELECT EmployerId FROM Employers_tbl WHERE UserName = @u AND Password = @p", con))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);
                    con.Open();
                    object empIdObj = cmd.ExecuteScalar();
                    if (empIdObj != null)
                        {
                        Session["user"] = username;
                        Session["userid"] = empIdObj.ToString();
                        // redirect recruiter (change path if you have a different page)
                        Response.Redirect("~/Employeee/emp_home.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                        return;
                        }
                    }

                // 3) Check User_tbl (normal user)
                using (SqlConnection con = new SqlConnection(connString))
                using (SqlCommand cmd = new SqlCommand("SELECT UserId FROM User_tbl WHERE UserName = @u AND Password = @p", con))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);
                    con.Open();
                    object userIdObj = cmd.ExecuteScalar();
                    if (userIdObj != null)
                    {
                        Session["user"] = username;
                        Session["userid"] = userIdObj.ToString();
                        Response.Redirect("~/Default.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                        return;
                    }
                }

                // If nothing matched
                Response.Write("Invalid username or password. Please try again or register.");
            }
            catch (Exception ex)
            {
                // Keep it simple: show friendly message (log ex on server if you want)
                Response.Write("An error occurred. Please try again later.");
            }

        }
    }
}