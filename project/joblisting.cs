using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public class joblisting
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public DataSet showJob()
        {
            getcon();
            da = new SqlDataAdapter("select * from Job_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds; ;
        }
    }
}