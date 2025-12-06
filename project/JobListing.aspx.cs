using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public partial class JobListing : System.Web.UI.Page
    {
        SqlConnection con;
        joblisting job;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
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

        public void startcon()
        {
            con = new SqlConnection();
            job = new joblisting();
            job.getcon();
            con.Open();
        }

        void ListJob()
        {
            job = new joblisting();
            dlJob.DataSource = job.showJob();
            dlJob.DataBind();
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