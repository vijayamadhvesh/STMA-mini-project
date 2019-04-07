using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace STMA.Classes
{
    public class CompanyConfig
    {

        private string connStr;
        private SqlConnection getObjConn()
        {
            SqlConnection sqlConnObj;
            try
            {
                connStr = ConfigurationManager.ConnectionStrings["connstr"].ToString();
                sqlConnObj = new SqlConnection(connStr);
                return sqlConnObj;
            }
            catch (Exception e)
            {
                throw new Exception("Connection method : " + e.Message);
            }
        }

        public DataTable getCompanyInfo()
        {
            DataTable dt;

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_CompanyInfo", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        // dr.Read();
                        dt = new DataTable();
                        dt.Load(dr);
                        return dt;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("Company Info :" + e.Message);
            }
        } 
    }
}