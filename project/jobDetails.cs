using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public class jobDetails
    {
        SqlConnection con;
        SqlCommand cmd;
        //SqlDataAdapter da;
        //DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert_appliedjob(int jobid,int userid)
        {
            getcon();
            cmd = new SqlCommand("insert into AppliedJob values ('"+jobid+"','"+userid+"')", con);
            cmd.ExecuteNonQuery();
        }

    }
}