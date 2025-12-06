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
    public partial class JobList : System.Web.UI.Page
    {
        SqlConnection con;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void fillgrid()
        {
            startcon();
            GridView1.DataSource = cs.select_job();
            GridView1.DataBind();

        }

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            cs.getcon();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "cmd_edt")
            {
                Response.Redirect("NewJob.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}