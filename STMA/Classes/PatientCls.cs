using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;

namespace STMA
{
    public class PatientCls
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
            catch(Exception e)
            {
                throw new Exception("Connection method : "+e.Message) ;
            }
        }
        public void register(string pname, string dob, string gender, string addr, string mobile)
        {
            
            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_PatientAdd", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                        cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = pname;
                        cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = DateTime.Parse(dob);
                        cmd.Parameters.Add("@gender", SqlDbType.Char).Value = gender;
                        cmd.Parameters.Add("@addr", SqlDbType.VarChar).Value = addr;
                        cmd.Parameters.Add("@mobile", SqlDbType.BigInt).Value = Int64.Parse(mobile);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

            }
            catch(Exception e)
            {
                throw new Exception("Patient Registration :" + e.Message);
            }
        }
    }
}