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
        SqlConnection con;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            startcon();
            cs.insert_User(txtUserName.Text, txtPassword.Text, txtFullName.Text, txtAddress.Text, txtMobile.Text, txtEmail.Text, ddlContry.SelectedValue);
            lblmsg.Visible = true;
            lblmsg.Text = "registration successfully ...";
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
            ddlContry.SelectedValue = string.Empty;
        }
    }
}