using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        Class1 cs;
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
        }
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }
        protected void btbSend_Click(object sender, EventArgs e)
        {

            //con = new SqlConnection(s);
            //con.Open();
            //cmd = new SqlCommand("insert into Contact_tbl (Name,Email,Subject,Message) values ('" + txtnm.Text + "','" + txteml.Text + "','" + txtsub.Text + "','" + message.Value + "') ", con);
            //cmd.ExecuteNonQuery();

            startcon();
            cs.insert_contact(txtnm.Text,txteml.Text,txtsub.Text,message.Value);
        }
        private void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtsub.Text = "";
            message.Value = string.Empty;
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