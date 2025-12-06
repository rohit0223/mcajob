using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace project.Adminn
{
    public class data
    {
        private static readonly string ConnectionStringName = "cs";

        public static int GetTotalCount(string tableName)
        {
            int count = 0;
            string connString = ConfigurationManager.ConnectionStrings[ConnectionStringName].ConnectionString;
            string sqlQuery = $"SELECT COUNT(*) FROM {tableName}";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                {
                    try
                    {
                        conn.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            count = Convert.ToInt32(result);
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);
                        count = 0;
                    }
                }
            }
            return count;
        }

        public static DataTable GetJobPostings()
        {
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings[ConnectionStringName].ConnectionString;

            string sqlQuery = "SELECT ID, Title, Post, CompanyName, LastDate FROM Job_tbl ORDER BY LastDate DESC";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Database Error fetching jobs: " + ex.Message);
                    }
                }
            }
            return dt;
        }

        public static DataTable GetUsers()
        {
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings[ConnectionStringName].ConnectionString;

            string sqlQuery = "SELECT UserId, Name, Email, Mobile FROM User_tbl ORDER BY UserId ASC";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Database Error fetching Users: " + ex.Message);
                    }
                }
            }
            return dt;
        }
    }
}