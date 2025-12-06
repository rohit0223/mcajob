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
        SqlConnection con;
        //SqlCommand cmd;
        //SqlDataReader dr;
        Class1 cs;
        //string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HP\source\repos\project\project\App_Data\JobPortal_db.mdf;Integrated Security=True";
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

                    DataSet user = cs.select_user(username);
                    if (user.Tables[0].Rows.Count > 0)
                    {
                        string dbpass = user.Tables[0].Rows[0]["Password"].ToString();
                        string userid = user.Tables[0].Rows[0][0].ToString();
                        if (password == dbpass)
                        {
                            Session["user"] = username;
                            Session["userid"] = userid;
                            Response.Redirect("Default.aspx");
                            clear();
                        }
                        else
                        {
                            Response.Write("Incorrect Password or Username.Please try again.");
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Employeee/emp_home.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Enter valid details...");
            }
        }
    }
}