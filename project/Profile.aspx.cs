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
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string userid;
        void getcon()
        {
            string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\JobPortal_db.mdf;Integrated Security=True";
            con = new SqlConnection(s);
            con.Open();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
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

            if (Session["user"] != null)
            {
                getcon();
                userid = Session["userid"].ToString();
                if (!Page.IsPostBack)
                {
                    showUserProfile();
                }
            }
        }

        public DataSet showUserProfile()
        {
            //  User_Id,UserName,Name,Address,Mobile,Emial,Conty,Resume
            getcon();
            da = new SqlDataAdapter("select * from User_tbl where UserId='" + userid + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            dlprofile.DataSource = ds;
            dlprofile.DataBind();
            return ds;
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

        protected void dlprofile_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                Response.Redirect("Resume.aspx?id=" + e.CommandArgument);
            }
        }



    }
}