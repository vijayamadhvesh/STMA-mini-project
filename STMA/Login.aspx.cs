using STMA.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace STMA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            redirectToHome();



        }
        private void redirectToHome()
        {
            if (HttpContext.Current.Session["EmpType"] != null)
            {
                if (HttpContext.Current.Session["EmpType"].ToString() == "1")
                {
                    Response.Redirect("~/Secured/AdminHome.aspx");
                }
                if (HttpContext.Current.Session["EmpType"].ToString() == "2")
                {
                    Response.Redirect("~/ReceptionistHome.aspx");
                }
                if (HttpContext.Current.Session["EmpType"].ToString() == "3")
                {
                    Response.Redirect("~/Secured/ServiceHome.aspx");
                }
            }
         
            }
        protected void btnSignin_Click(object sender, EventArgs e)
        {
            EmployeeCls ecls;
            string empId = null;
            string empType = null;
            try
            {
                ecls = new EmployeeCls();
                DataTable edt = ecls.EmployeeLogin(txtLoginid.Text, txtPassword.Text);
                if (edt.Rows.Count > 0) { 
                    foreach (DataRow dr in edt.Rows)
                    {
                        empId = dr["EmpID"].ToString();
                        empType = dr["EmpType"].ToString();
                    }
                }
                else
                {
                    lblLogin.Text = "<font color='red'>Invalid LoginID or Password</font>";
                }
                if (!String.IsNullOrEmpty(empId))
                {
                    Session["EmpID"] = empId;
                    Session["EmpType"] = empType;
                    //Response.Redirect("Secured/UserHome.aspx");
                    //Response.Write("Emp Type is" + HttpContext.Current.Session["EmpType"].ToString());
                    //FormsAuthentication.SetAuthCookie(empId, false);

                    //FormsAuthenticationTicket ticket1 =
                    //   new FormsAuthenticationTicket(
                    //        1,                                   // version
                    //        empId,   // get username  from the form
                    //        DateTime.Now,                        // issue time is now
                    //        DateTime.Now.AddMinutes(10),         // expires in 10 minutes
                    //        false,      // cookie is not persistent
                    //        empType                              // role assignment is stored
                    //                                             // in userData
                    //        );
                    //HttpCookie cookie1 = new HttpCookie(
                    //  FormsAuthentication.FormsCookieName,
                    //  FormsAuthentication.Encrypt(ticket1));
                    //Response.Cookies.Add(cookie1);

                    //// 4. Do the redirect. 
                    //String returnUrl1;
                    //// the login is successful
                    //if (Request.QueryString["ReturnUrl"] == null)
                    //{
                    //    returnUrl1 = "Secured/UserHome.aspx";
                    //}

                    ////login not unsuccessful 
                    //else
                    //{
                    //    returnUrl1 = Request.QueryString["ReturnUrl"];
                    //}
                    //Response.Redirect(returnUrl1);
                    redirectToHome();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}