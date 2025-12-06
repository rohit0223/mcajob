using System;
using System.Collections.Generic;
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
        string username, fnm;
        SqlConnection con;
        DataSet ds;
        resume rs;
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
                username = Session["user"].ToString();
                if (Request.QueryString["id"] != null)
                {
                    fileUpload();
                    filltext();
                }
            }
        }

        public void startcon()
        {
            con = new SqlConnection();
            rs = new resume();
            rs.getcon();
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

        public void fileUpload()
        {
            if (resume.HasFile)
            {
                fnm = "resume/" + resume.FileName;
                string type = Path.GetExtension(fnm);
                if (type == ".jpeg" || type == ".png" || type == ".jpg")
                {
                    resume.SaveAs(Server.MapPath(fnm));
                }
            }
        }

        public void filltext()
        {
            startcon();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            ds = new DataSet();
            //if (ds.Tables["User_tbl"].Rows.Count > 0)
            if (Session["user"] != null)
            {
                ds = rs.showUserInfo(id);
                txtUserName.Text = ds.Tables[0].Rows[0][1].ToString();
                txtFullName.Text = ds.Tables[0].Rows[0][3].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0][6].ToString();
                txtMobile.Text = ds.Tables[0].Rows[0][5].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0][4].ToString();
                txt10th.Text = ds.Tables[0].Rows[0][8].ToString();
                txt12th.Text = ds.Tables[0].Rows[0][9].ToString();
                txtgrad.Text = ds.Tables[0].Rows[0][10].ToString();
                txtpostgrad.Text = ds.Tables[0].Rows[0][11].ToString();
                txtphd.Text = ds.Tables[0].Rows[0][12].ToString();
                txtwork.Text = ds.Tables[0].Rows[0][13].ToString();
                txtex.Text = ds.Tables[0].Rows[0][14].ToString();
                ddlContry.SelectedValue = ds.Tables[0].Rows[0][7].ToString();
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "User Not Found";
            }

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (btnRegister.Text == "Save")
            {
                startcon();
                rs.update_resume(Convert.ToInt32(Request.QueryString["id"]), txtUserName.Text, txtFullName.Text, txtAddress.Text, txtMobile.Text, txtEmail.Text,
                    ddlContry.SelectedValue, txt10th.Text, txt12th.Text, txtgrad.Text, txtpostgrad.Text, txtphd.Text,
                    txtwork.Text, txtex.Text, fnm);
                con.Close();
                lblmsg.Visible = true;
                lblmsg.Text = "Recored Saved Successfully...";
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "User Not Found";
                lblmsg.CssClass = "alert alert-danger";
            }
        }
    }
}