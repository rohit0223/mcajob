using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["user"] != null)
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