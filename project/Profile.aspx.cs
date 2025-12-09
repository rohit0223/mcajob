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
        private readonly string connStr = ConfigurationManager.ConnectionStrings["cs"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

                // show profile if logged-in
                if (Session["userid"] != null) ShowUserProfile();
        }
        }

        {
            {
            }
            {
            }
                if (r.Table.Columns.Contains("Photo") && r["Photo"] != DBNull.Value && !string.IsNullOrEmpty(r["Photo"].ToString()))
                {
                    try { r["Photo"] = ResolveUrl(r["Photo"].ToString()); } catch { }
                }
            }

            {
                {
                }
            }
        }

        {
        }

        {
            {
            }
            {
            }

                    // prepare unique virtual path and physical folder
                    string folderVirtual = "~/uploads/photos/";
                    string fileName = System.IO.Path.GetFileNameWithoutExtension(fu.FileName)
                                      + "_" + DateTime.Now.Ticks + ext;
                    string vpath = folderVirtual + fileName;
                    string physical = Server.MapPath(vpath);

                    // ensure folder exists and save file
                    System.IO.Directory.CreateDirectory(System.IO.Path.GetDirectoryName(physical));
                    fu.SaveAs(physical);

                    // update DB (store virtual path with ~ so ShowUserProfile can ResolveUrl)
                    string userId = Convert.ToString(e.CommandArgument ?? "");
                    if (string.IsNullOrEmpty(userId))
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "User id missing.";
                        lblmsg.CssClass = "alert alert-danger";
                        return;
        }

        {
            {
            }
            else
            {
            }
        }

            {
            }
        }



    }
}