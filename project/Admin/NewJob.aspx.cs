using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace project.Admin
{
    public partial class NewJob : System.Web.UI.Page
    {
        SqlConnection con;
        DataSet ds;
        Class1 cs;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            startcon();
            if (!IsPostBack)
            {
                filldata();

            }
        }

        public void filldata()
        {
            if (Request.QueryString["id"] != null)
            {
                ds = new DataSet();
                cs = new Class1();
                ds = cs.fill_job(Convert.ToInt32(Request.QueryString["id"]));
                Button1.Text = "Update";
                txttitle.Text = ds.Tables[0].Rows[0][1].ToString();
                txtpost.Text = ds.Tables[0].Rows[0][2].ToString();
                txtdes.Text = ds.Tables[0].Rows[0][3].ToString();
                txtqul.Text = ds.Tables[0].Rows[0][4].ToString();
                txtex.Text = ds.Tables[0].Rows[0][5].ToString();
                txtdate.Text = ds.Tables[0].Rows[0][6].ToString();
                txtsalary.Text = ds.Tables[0].Rows[0][7].ToString();
                txttype.SelectedValue = ds.Tables[0].Rows[0][8].ToString();
                txtcnm.Text = ds.Tables[0].Rows[0][9].ToString();
                //fnm;
                txtweb.Text = ds.Tables[0].Rows[0][11].ToString();
                txteml.Text = ds.Tables[0].Rows[0][12].ToString();
                txtadd.Text = ds.Tables[0].Rows[0][13].ToString();
                txtcnt.SelectedValue = ds.Tables[0].Rows[0][14].ToString();
                txtstat.Text = ds.Tables[0].Rows[0][15].ToString();
                Label2.Visible = true;
                Label1.Visible = false;
                con.Close();
            }

        }
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }

        public void fileupload()
        {
            if (fldimg.HasFile)
            {
                fnm = "images/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Save")
            {
                startcon();
                fileupload();
                cs.insert_job(txttitle.Text, txtpost.Text, txtdes.Text, txtqul.Text, txtex.Text, txtdate.Text, txtsalary.Text,
                    txttype.SelectedValue, txtcnm.Text, fnm, txtweb.Text, txteml.Text, txtadd.Text, txtcnt.SelectedValue, txtstat.Text);
                lblmsg.Visible = true;
                lblmsg.Text = "Inserted Successfully...";
            }
            else if (Button1.Text == "Update")
            {
                startcon();
                int id = Convert.ToInt32(Request.QueryString["id"]);
                cs.Update_job(id, txttitle.Text, txtpost.Text, txtdes.Text, txtqul.Text, txtex.Text, txtdate.Text, txtsalary.Text,
                    txttype.SelectedValue, txtcnm.Text, txtweb.Text, txteml.Text, txtadd.Text, txtcnt.SelectedValue, txtstat.Text);
                lblmsg.Visible = true;
                lblmsg.Text = "Updated Successfully...";
            }
        }
    }
}