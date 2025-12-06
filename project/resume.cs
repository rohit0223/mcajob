using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace project
{
    public class resume
    {
        
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        public SqlConnection getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            con = new SqlConnection(s);
            con.Open();
            return con;
        }


        public DataSet showUserInfo(int id)
        {
            getcon();
            da = new SqlDataAdapter("select * from User_tbl where UserId='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public void update_resume(int id, string unm, string nm , string add , string mbl ,string eml , string cnt,
            string ten, string twe, string grad, string post, string phd, string work, string ex, string resume)
        {
            getcon();
            cmd = new SqlCommand("update User_tbl set UserName = '"+unm+ "', Name = '" + nm + "', Address = '" + add + "' ,Mobile = '" + mbl + "' ,Email  = '" + eml + "',Country = '" + cnt + "', Tenth = '" + ten + "' ,Twelveth = '" + twe + "', Graduation = '" + grad + "', PostGraduation = '" + post + "' , Phd = '" + phd + "', workOn = '" + work + "' , Experience = '" + ex + "' , Resume = '" + resume + "'where UserId='"+id+"' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

}