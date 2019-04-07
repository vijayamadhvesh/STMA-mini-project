using System;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using STMA.Classes;
using System.Data;

namespace STMA
{
    public partial class STMAUserMaster : System.Web.UI.MasterPage
    {
        private void EndSession()
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CompanyConfig cc = new CompanyConfig();

            DataTable dtc = cc.getCompanyInfo();
            if (dtc.Rows.Count > 0)
            {
               //lblCompanyName.Text = dtc.Rows[0]["Configvalue"].ToString();
            }

            if (Session["EmpID"] == null)
            {
                // FormsAuthentication.SignOut();
                EndSession();

            }
            else
            { 
                EmployeeCls ecls = new EmployeeCls();
                DataTable dt = ecls.getEmployeeInfo(Session["EmpID"].ToString());
                if (dt.Rows.Count>0)
                {
                    //Response.Write(dt.Rows[0]["EmpID"].ToString());
                    //Response.Write(dt.Rows[0]["EmpName"].ToString());
                    //Response.Write(dt.Rows[0]["EmpRoleID"].ToString());
                    //Response.Write(dt.Rows[0]["EmpRoleName"].ToString());
                    string roomNo = dt.Rows[0]["DefaultRoomID"].ToString();
                    lblUserName.Text = "Hi welcome " + dt.Rows[0]["EmpName"].ToString() + "-" + dt.Rows[0]["EmpRoleName"].ToString();
                    if(roomNo != "0")
                    {
                        lblRoomNo.Text = "Room " + roomNo;
                    }
                    
                }
            }
        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            EndSession();
        }
    }
}