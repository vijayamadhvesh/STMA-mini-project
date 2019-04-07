using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STMA.Secured
{
    public partial class ServiceAggDisplay : System.Web.UI.Page
    {
        public string serviceid { get; set; }
        public string emptid { get; set; }

        protected string TotalTokens;
        protected string WaitingTokens;
        protected string CurrentRunningTokenQNo;
        protected string CurrentRunningToken;
        protected string Rooms;
        protected string WaitingTime;
        protected string ServiceName;

        protected string UserName;
        protected string Age;
        protected string Gender;
        protected string Address;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Refresh", "2");

            LoadControl();



        }

        private void LoadControl()
        {


           
            ServiceCls scls = new ServiceCls();
            DataTable dt = new DataTable();
            if (Session["empid"] != null)

            {
               // Response.Write(Session["empid"].ToString());
                dt = scls.getServiceTokenInfo(serviceid, Session["empid"].ToString());
            }

            if (dt.Rows.Count > 0)
            {
                TotalTokens = dt.Rows[0]["TotalTokens"].ToString();
                WaitingTokens = dt.Rows[0]["WaitingTokens"].ToString();
                CurrentRunningTokenQNo = dt.Rows[0]["CurrentQNo"].ToString();
                CurrentRunningToken = dt.Rows[0]["CurrentToken"].ToString();
                Rooms = dt.Rows[0]["Rooms"].ToString();
                WaitingTime = dt.Rows[0]["ExpectedWaitingTime"].ToString();
                WaitingTime = WaitingTime + " min";
                ServiceName = dt.Rows[0]["ServiceName"].ToString();
                UserName = dt.Rows[0]["UserName"].ToString();
                Age = dt.Rows[0]["Age"].ToString();
                Gender = dt.Rows[0]["Gender"].ToString();
                Address = dt.Rows[0]["Address"].ToString();

                Session["CurrentRunningToken"] = CurrentRunningToken;

                if (String.IsNullOrEmpty(CurrentRunningToken))
                {
                    CurrentRunningToken = "0";
                }

                if (String.IsNullOrEmpty(WaitingTokens))
                {
                    WaitingTokens = "0";
                    WaitingTime = "0";
                }

               

            }


        }
       
    }
}