using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STMA.Secured
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["EmpType"].ToString() == "1")
            {
                Response.Redirect("~/Secured/AdminHome.aspx");
            }
            if (HttpContext.Current.Session["EmpType"].ToString() == "2")
            {
                Response.Redirect("~/Secured/ReceptionistHome.aspx");
            }
            if (HttpContext.Current.Session["EmpType"].ToString() == "3")
            {
                Response.Redirect("~/Secured/ServiceHome.aspx");
            }
            
        }
    }
}