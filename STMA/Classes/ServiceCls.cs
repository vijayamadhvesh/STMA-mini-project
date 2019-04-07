using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STMA
{
    public class ServiceCls
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
        public string getServices()
        {
            DataTable dt;
            DataSet ds;
            try
            {
                ds = new DataSet();
                dt = new DataTable();
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServicesSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = 0;

                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            //Create a new DataSet.
                            //DataSet dsCustomers = new DataSet();

                            //Load DataReader into the DataTable.
                            ds.Tables[0].Load(sdr);
                        }
                        con.Close();
                    }
                }
                return ds.GetXml();

            }
            catch (Exception e)
            {
                throw new Exception("Get Services :" + e.Message);
            }
        }

        public DataTable getServices(string sid)
        {
            DataTable dt;
          //  DataSet ds;
            try
            {
               // ds = new DataSet();
                dt = new DataTable();
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServicesSelect", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = Convert.ToInt32(sid);

                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            //Create a new DataSet.
                            //DataSet dsCustomers = new DataSet();

                            //Load DataReader into the DataTable.
                            dt.Load(sdr);
                        }
                        con.Close();
                    }
                }
                return dt;

            }
            catch (Exception e)
            {
                throw new Exception("Get Services :" + e.Message);
            }
        }

        public DataTable getTokenStatistics(string sid,string date)
        {
            DataTable dt;
            //  DataSet ds;
            try
            {
                // ds = new DataSet();
                dt = new DataTable();
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenStatistics", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = Convert.ToInt32(sid);
                        cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = DateTime.Parse(date);

                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            //Create a new DataSet.
                            //DataSet dsCustomers = new DataSet();

                            //Load DataReader into the DataTable.
                            dt.Load(sdr);
                        }
                        con.Close();
                    }
                }
                return dt;

            }
            catch (Exception e)
            {
                throw new Exception("Get Services :" + e.Message);
            }
        }

        public DataTable getServiceTokenInfo(string serviceid,string emptid)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenGetAggDetails", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                      
                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = DBNull.Value;
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = Convert.ToInt32(emptid);
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = DBNull.Value;
                        DataTable dt = new DataTable();
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
                throw new Exception("getServiceTokenInfo :" + e.Message);
            }
        }

        public DataTable getServiceTokenInfoByDate(string serviceid,string sdate)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenGetByService", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceid;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = DateTime.Parse(sdate); 
                        DataTable dt = new DataTable();
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
                throw new Exception("getServiceTokenInfo :" + e.Message);
            }
        }

        public DataSet getServiceAnomalies(string serviceid,string sdate)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenAnomalies", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceid;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = DateTime.Parse(sdate);
                        DataTable dt = new DataTable();
                        con.Open();
                       // SqlDataReader dr = cmd.ExecuteReader();
                        // dr.Read();
                        DataSet ds = new DataSet();
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        adapter.SelectCommand = cmd;
                        adapter.Fill(ds);
                        adapter.Dispose();
                        
                       // ds.Load(dr);
                        return ds;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("getServiceAnomalies :" + e.Message);
            }
        }

        public DataTable getDashboardDisplay(string bayid)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_DashboardDisplay", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@BayID", SqlDbType.Int).Value = Convert.ToInt32(bayid);
                       
                        DataTable dt = new DataTable();
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
                throw new Exception("getDashboardDisplay :" + e.Message);
            }
        }

        public bool updateServiceTokenStatus(string servicetokenid, string emptid, string statusid, string currentstatusid)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenUpdateStatus", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@ServiceTokenId", SqlDbType.Int).Value = Convert.ToInt32(servicetokenid);
                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = Convert.ToInt32(emptid);
                        cmd.Parameters.Add("@StatusId", SqlDbType.Int).Value = Convert.ToInt32(statusid);
                        cmd.Parameters.Add("@CurrentStatusId", SqlDbType.Int).Value = Convert.ToInt32(currentstatusid);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        return true;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("updateServiceTokenStatus :" + e.Message);
            }
        }

        public bool allotNextServiceToken(string emptid)
        {

            try
            {
                using (SqlConnection con = getObjConn())
                {
                    using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenAllotNext", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@empId", SqlDbType.Int).Value = Convert.ToInt32(emptid);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        return true;
                    }
                }

            }
            catch (Exception e)
            {
                throw new Exception("allotNextServiceToken :" + e.Message);
            }
        }
    }
}