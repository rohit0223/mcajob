using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace project
{

    public class Class1
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

        public void insert_contact(string nm, string eml, string sub, string msg)
        {
            getcon();
            cmd = new SqlCommand("insert into Contact_tbl (Name,Email,Subject,Message) values ('" + nm + "','" + eml + "','" + sub + "','" + msg + "') ", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void insert_job(string title, string post, string des, string qul, string ex, string ldate, string salary, string type, string cname, string cimg, string web, string eml, string add, string cnt, string st)
        {
            getcon();
            cmd = new SqlCommand("insert into Job_tbl (Title,Post,Description,Qulification,Experience,LastDate,Salary,JobType,CompanyName,CompanyImage,Website,Email,Address,Country,State) values " +
                "('" + title + "','" + post + "','" + des + "','" + qul + "','" + ex + "','" + ldate + "','" + salary + "','" + type + "','" + cname + "','" + cimg + "','" + web + "','" + eml + "','" + add + "','" + cnt + "','" + st + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void insert_User(string unm, string pwd, string nm, string address, string mbl, string eml, string cnt)
        {
            getcon();
            cmd = new SqlCommand("insert into User_tbl(UserName, Password, Name, Address, Mobile, Email, Country) values" +
                    " ('" + unm + "','" + pwd + "','" + nm + "','" + address + "'," +
                    "'" + mbl + "','" + eml + "','" + cnt + "') ", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void insert_appliedjob(int jobid, int userid)
        {
            getcon();
            cmd = new SqlCommand("insert into AppliedJob values ('" + jobid + "','" + userid + "')", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet select_user(string unm)
        {
            getcon();
            da = new SqlDataAdapter("select * from User_tbl WHERE UserName ='" + unm + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet fill_user(int id)
        {
            da = new SqlDataAdapter("select * from User_tbl where UserId = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet dlt_user(int id)
        {
            da = new SqlDataAdapter("Delete from User_tbl where UserId = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet dlt_contact(int id)
        {
            ds = new DataSet();
            da = new SqlDataAdapter("delete from Contact_tbl where Contact_Id ='" + id + "'", con);
            da.Fill(ds);
            return ds;
        }

        public DataSet select_contact()
        {
            getcon();
            da = new SqlDataAdapter("select * from Contact_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet user()
        {
            getcon();
            da = new SqlDataAdapter("select * from User_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet select_job()
        {
            getcon();
            da = new SqlDataAdapter("select * from Job_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet fill_job(int id)
        {
            getcon();
            da = new SqlDataAdapter("Select * from Job_tbl where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public void Update_job(int id, string t, string post, string des, string qul, string ex, string ldate, string salary, string type, string cname, string web, string eml, string add, string cnt, string st)
        {
            getcon();
            cmd = new SqlCommand("update Job_tbl set Title='" + t + "',Post='" + post + "',Description='" + des + "',Qulification='" + qul + "',Experience='" + ex + "',LastDate='" + ldate + "',Salary='" + salary + "',JobType='" + type + "',CompanyName='" + cname + "',Website='" + web + "',Email='" + eml + "',Address='" + add + "',Country='" + cnt + "',State='" + st + "' where Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public string appliedJob(int jobid,int userid)
        {
            getcon();
            cmd = new SqlCommand("Select count(*) from AppliedJob where UserId='" + userid + "' and JobId='" + jobid + "' ", con);
            string result = cmd.ExecuteScalar().ToString();
            return result;
        }
    }
}