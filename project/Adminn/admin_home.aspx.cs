using project.Adminn;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mca.Adminn
{
    public partial class admin_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCounts();
            }
        }

        private void LoadDashboardCounts()
        {
            try
            {
                int totalUsers = data.GetTotalCount("User_tbl");
                int totalRecruiters = data.GetTotalCount("Employers_tbl");
                int totalJobs = data.GetTotalCount("Job_tbl");
                int totalAdmins = data.GetTotalCount("User_tbl");

                lblTotalUsers.Text = totalUsers.ToString("N0");
                lblTotalRecruiters.Text = totalRecruiters.ToString("N0");
                lblTotalJobs.Text = totalJobs.ToString("N0");
                lblTotalAdmins.Text = totalAdmins.ToString("N0");
            }
            catch (Exception)
            {
                lblTotalUsers.Text = lblTotalRecruiters.Text = lblTotalJobs.Text = lblTotalAdmins.Text = "Error";
            }
        }
    }
}