using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using STMA.Classes;

namespace STMA
{
    public partial class ReceptionistHome : System.Web.UI.Page
    {
        private void EndSession()
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtMobile.Text = "";
            CompanyConfig cc = new CompanyConfig();

            DataTable dtc = cc.getCompanyInfo();
            if (dtc.Rows.Count > 0)
            {
               // lblCompanyName.Text = ""; // dtc.Rows[0]["Configvalue"].ToString();
            }

            if (Session["EmpID"] == null)
            {
               
                EndSession();

            }
            else
            {
                EmployeeCls ecls = new EmployeeCls();
                DataTable dt = ecls.getEmployeeInfo(Session["EmpID"].ToString());
                if (dt.Rows.Count > 0)
                {
                   
                    lblUserName.Text = "Hi welcome " + dt.Rows[0]["EmpName"].ToString() + "-" + dt.Rows[0]["EmpRoleName"].ToString();
                }
            }
        }

       

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            EndSession();
        }
    }
}