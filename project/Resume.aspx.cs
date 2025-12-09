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
using System.Data.SqlClient;
using System.Data;
using System.IO;

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

            if (Session["user"] != null)
            {
                username = Session["user"].ToString();
                if (Request.QueryString["id"] != null)
                {
                    fileUpload();
                    filltext();
                }
            }
        }

        {
        }

        {
            {
            {
            }
        }
        }

        {
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }

        {
            // Resume
            if (resume.HasFile)
            {
                {
            }
        }

        {
            {
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "User Not Found";
            }

        {
            {
            }
            {
                lblmsg.Visible = true;
        }
    }
}