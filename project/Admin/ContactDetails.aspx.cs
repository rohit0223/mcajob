using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace project.Admin
{
    public partial class ContactDetails : System.Web.UI.Page
    {
        SqlConnection con;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
            //}
            fillgrid();
        }

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }
        public void fillgrid()
        {
            startcon();
            GridView1.DataSource = cs.select_contact();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                startcon();
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                cs.dlt_contact(Convert.ToInt32( ViewState["id"]));
                con.Close();
            }
        }
    }
}