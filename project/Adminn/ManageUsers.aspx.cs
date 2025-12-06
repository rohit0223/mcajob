using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project.Adminn
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobsRepeater();
            }
        }

        private void BindJobsRepeater()
        {
            DataTable dtJobs = data.GetUsers();

            JobRepeater.DataSource = dtJobs;
            JobRepeater.DataBind();

            if (dtJobs.Rows.Count == 0)
            {
                Control footer = JobRepeater.Controls.Count > 0 ? JobRepeater.Controls[JobRepeater.Controls.Count - 1] : null;
                if (footer != null)
                {
                    Label lblNoData = footer.FindControl("lblNoData") as Label;
                    if (lblNoData != null)
                    {
                        lblNoData.Visible = true;
                    }
                }
            }
        }
    }
}