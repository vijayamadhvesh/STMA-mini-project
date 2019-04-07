using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace STMA.Classes
{
    public class EmployeeCls
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
        public DataTable EmployeeLogin(string Loginid, string Password)
        {
            DataTable dt;

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_EmployeeLoginChk", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                        cmd.Parameters.Add("@loginid", SqlDbType.VarChar).Value = Loginid;
                        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = Password;

                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                       // dr.Read();
                         dt=new DataTable();
                        dt.Load(dr);
                        return dt;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("Employee Login :" + e.Message);
            }
        }
        public DataTable getEmployeeInfo(string empid)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_EmployeeGetInfo", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        
                        cmd.Parameters.Add("@empid", SqlDbType.Int).Value = Convert.ToInt32(empid);

                        DataTable dt=new DataTable();
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                       // dr.Read();
                        dt.Load(dr);
                        return dt;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("Employee Login :" + e.Message);
            }
        }
    }
}