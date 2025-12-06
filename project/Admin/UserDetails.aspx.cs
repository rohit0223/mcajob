using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project.Admin
{
    public partial class UserDetails : System.Web.UI.Page
    {
        SqlConnection con;
        DataSet ds;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        public void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }

        public void fillgrid()
        {
            startcon();
            GridView1.DataSource = cs.user();
            GridView1.DataBind();
        }


        public void filltext()
        {
            ds = new DataSet();
            ds = cs.fill_user(Convert.ToInt32(ViewState["id"]));

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                cs.dlt_user(Convert.ToInt32(ViewState["id"]));
                con.Close();
            }
            con.Close();
        }
    }
}