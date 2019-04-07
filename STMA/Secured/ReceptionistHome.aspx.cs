using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STMA.Secured
{
    public partial class ReceptionistHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptInclude(GetType(), "STMAAjaxScript", "~/Scripts/STMAAjaxScript.js");
        }
       
    }
}