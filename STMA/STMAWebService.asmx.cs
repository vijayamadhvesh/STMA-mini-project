using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace STMA
{
    /// <summary>
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class STMAWebService : System.Web.Services.WebService
    {
        public class UserInfo
        {
            public int UserID { get; set; }
            public string UserName { get; set; }
            public string dob { get; set; }
            public string gender { get; set; }
            public string age { get; set; }
            public string address { get; set; }
            public string mobile { get; set; }
        }
        public class ServiceInfo
        {
            public int ServiceID { get; set; }
            public string ServiceName { get; set; }
        }

        public class ServiceTokenInfo
        {
            public string ServiceName { get; set; }
            public int ServiceTokenID { get; set; }
            public int QueueNo { get; set; }
            public string BayArea { get; set; }
            public string Rooms { get; set; }
            public string ExpectedWaitingTime { get; set; }
            public string CurrentStatus { get; set; }
            public string UserName { get; set; }
            public string dob { get; set; }
            public string gender { get; set; }
            public string age { get; set; }
            public string address { get; set; }
           // public string mobile { get; set; }

        }

        public class DashboardInfo
        {
            public string RoomNo { get; set; }
            public string ServiceName { get; set; }
            public string QueueNo { get; set; }
            
        }

        [WebMethod]
        public List<ServiceInfo> LoadServices()
        {
            ServiceInfo ci = new ServiceInfo();
            List<ServiceInfo> ServiceInformation = new List<ServiceInfo>();
            DataSet ds;
            //"Data Source=localhost;DataBase=STMA_DB; Integrated Security=SSPI;"
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ServiceTB", con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                ServiceInformation.Add(new ServiceInfo()
                                {
                                    ServiceID = Convert.ToInt32(dr["ServiceID"]),
                                    ServiceName = dr["ServiceName"].ToString()
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ServiceInformation;
        }
        [WebMethod]
        public List<UserInfo> LoadUsers(string Mobile)
        {
            UserInfo ci = new UserInfo();
            List<UserInfo> UserInformation = new List<UserInfo>();
            DataSet ds;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("select [PatientID],[PatientName],[Mobile],CONVERT(VARCHAR(11),[DOB],106) AS DOB, [dbo].[FN_GetAgeFromDOB] (dob) AS Age,[Gender],[Address] from PatientTB where Mobile = " + Convert.ToInt64(Mobile), con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                UserInformation.Add(new UserInfo()
                                {
                                    UserID = Convert.ToInt32(dr["PatientID"]),
                                    UserName = dr["PatientName"].ToString(),
                                    dob = dr["DOB"].ToString(),
                                    age = dr["Age"].ToString(),
                                    gender = dr["Gender"].ToString(),
                                    address = dr["Address"].ToString(),
                                    mobile = dr["Mobile"].ToString()
                                });
                            }
                        }

                        else
                        {
                            UserInformation.Add(new UserInfo()
                            {
                                UserID = 0,
                                UserName = "",
                                dob = "",
                                age = "",
                                gender = "",
                                address = "",
                                mobile = ""
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return UserInformation;
        }

        [WebMethod]
        public List<UserInfo> LoadUsersWithID(string UserID)
        {
            UserInfo ci = new UserInfo();
            List<UserInfo> UserInformation = new List<UserInfo>();
            DataSet ds;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("select [PatientID],[PatientName],[Mobile],CONVERT(VARCHAR(11),[DOB],106) AS DOB, [dbo].[FN_GetAgeFromDOB] (dob) AS Age,[Gender],[Address] from PatientTB where PatientID = " + Convert.ToInt64(UserID), con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                UserInformation.Add(new UserInfo()
                                {
                                    UserID = Convert.ToInt32(dr["PatientID"]),
                                    UserName = dr["PatientName"].ToString(),
                                    dob = dr["DOB"].ToString(),
                                    age = dr["Age"].ToString(),
                                    gender = dr["Gender"].ToString(),
                                    address = dr["Address"].ToString(),
                                    mobile = dr["Mobile"].ToString()
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return UserInformation;
        }

        [WebMethod]
        public List<ServiceTokenInfo> GenerateServiceToken(string ServiceID, string PatientID, string UserID)
        {
           ServiceTokenInfo ci = new ServiceTokenInfo();
            List<ServiceTokenInfo> ServiceTokenInformation = new List<ServiceTokenInfo>();
            DataSet ds;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenGenerate", con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = Convert.ToInt32(ServiceID);
                    cmd.Parameters.Add("@PatientId", SqlDbType.Int).Value = Convert.ToInt32(PatientID);
                    cmd.Parameters.Add("@empId", SqlDbType.Int).Value = Convert.ToInt32(UserID);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                ServiceTokenInformation.Add(new ServiceTokenInfo()
                                {
                                     
                                    ServiceName = dr["ServiceName"].ToString(),
                                    ServiceTokenID = Convert.ToInt32(dr["ServiceTokenID"]),
                                    QueueNo = Convert.ToInt32(dr["ServiceTokenQueueNo"]),
                                    BayArea = dr["BayAreasAlloted"].ToString(),
                                    Rooms = dr["RoomNosAlloted"].ToString(),
                                    ExpectedWaitingTime = dr["ExpectedWaitingTime"].ToString() + " min"
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ServiceTokenInformation;
        }

        [WebMethod]
        public List<ServiceTokenInfo> LoadServiceTokenWithID(string TokenOrQNo,string ServiceID)
        {
            ServiceTokenInfo ci = new ServiceTokenInfo();
            List<ServiceTokenInfo> ServiceTokenInformation = new List<ServiceTokenInfo>();
            DataSet ds;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SP_ServiceTokenGetDetails", con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = Convert.ToInt32(ServiceID);
                    cmd.Parameters.Add("@TokenOrQNo", SqlDbType.Int).Value = Convert.ToInt32(TokenOrQNo);
                    cmd.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now.ToString();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                ServiceTokenInformation.Add(new ServiceTokenInfo()
                                {

                                    ServiceName = dr["ServiceName"].ToString(),
                                    ServiceTokenID = Convert.ToInt32(dr["ServiceTokenID"]),
                                    QueueNo = Convert.ToInt32(dr["ServiceTokenQueueNo"]),
                                    BayArea = dr["BayArea"].ToString(),
                                    Rooms = dr["RoomNo"].ToString(),
                                    ExpectedWaitingTime = dr["ExpectedWaitingTime"].ToString() + " min",
                                    CurrentStatus = dr["StatusText"].ToString(),
                                    UserName = dr["PatientName"].ToString(),
                                    gender = dr["Gender"].ToString(),
                                    age = dr["Age"].ToString(),
                                    address = dr["Address"].ToString()
                                    //mobile = "10 min"

                                 });
                            }
                        }
                        else
                        {
                            ServiceTokenInformation.Add(new ServiceTokenInfo()
                            {

                                ServiceTokenID = 0
                                
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ServiceTokenInformation;
        }

        [WebMethod]
        public List<DashboardInfo> LoadDashboard(string bayid)
        {
            DashboardInfo ci = new DashboardInfo();
            List<DashboardInfo> DashboardInformation = new List<DashboardInfo>();
            DataSet ds;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SP_DashboardDisplay", con))
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@BayID", SqlDbType.Int).Value = Convert.ToInt32(bayid);
                    
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                }
            }
            try
            {
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                DashboardInformation.Add(new DashboardInfo()
                                {

                                    ServiceName = dr["ServiceName"].ToString(),
                                    RoomNo = dr["RoomNo"].ToString(),
                                    QueueNo = dr["QueueNo"].ToString()
                                    
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return DashboardInformation;
        }

        [WebMethod]
        public bool UpdatePatient(string pID,string UserName,string dob,string gender,string address,string mobile, string UserID)
        {
           
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SP_PatientUpdate", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                    cmd.Parameters.Add("@pid", SqlDbType.VarChar).Value = Convert.ToInt32(pID);
                    cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = UserName;
                    cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = DateTime.Parse(dob);
                    cmd.Parameters.Add("@gender", SqlDbType.Char).Value = gender;
                    cmd.Parameters.Add("@addr", SqlDbType.VarChar).Value = address;
                    cmd.Parameters.Add("@mobile", SqlDbType.BigInt).Value = Int64.Parse(mobile);
                    cmd.Parameters.Add("@userId", SqlDbType.BigInt).Value = Convert.ToInt32(UserID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
           
        }

        [WebMethod]
        public bool AddPatient(string pName, string dob, string gender, string address, string mobile, string UserID)
        {
           
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("SP_PatientAdd", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //@pname varchar(100),@dob datetime, @gender char(1), @addr varchar(50), @mobile numeric(10,0)
                   // cmd.Parameters.Add("@pid", SqlDbType.VarChar).Value = UserID;
                    cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = pName;
                    cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = DateTime.Parse(dob);
                    cmd.Parameters.Add("@gender", SqlDbType.Char).Value = gender;
                    cmd.Parameters.Add("@addr", SqlDbType.VarChar).Value = address;
                    cmd.Parameters.Add("@mobile", SqlDbType.BigInt).Value = Int64.Parse(mobile);
                    cmd.Parameters.Add("@userId", SqlDbType.BigInt).Value = Convert.ToInt32(UserID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }

        }
    }


}