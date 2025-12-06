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

    public partial class JobDetails : System.Web.UI.Page
    {
        SqlConnection con;
        Class1 cs;

        protected void Page_Load(object sender, EventArgs e)
        {

            int jobid = Convert.ToInt32(Request.QueryString["id"]);
            int userid = Convert.ToInt32(Session["userid"]);
            cs = new Class1();


            if (cs.appliedJob(jobid, userid) != "0")
            {
                ApplyJob.Text = "Applied";
                ApplyJob.Enabled = false;
            }
            else
            {
                ApplyJob.Text = "Apply Now";
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

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }

        protected void ApplyJob_Click(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                startcon();
                int jobid = Convert.ToInt32(Request.QueryString["id"]);
                int userid = Convert.ToInt32(Session["userid"]);
                cs.insert_appliedjob(jobid, userid);
                lblmsg.Visible = true;
                ApplyJob.Enabled = false;
            }
            else
            {
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