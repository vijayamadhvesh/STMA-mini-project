using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace STMA.Secured
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindServices();
                sDate.Text = DateTime.Now.ToShortDateString();
                Calendar1.Visible = false;
                //gvToken.Visible = false;
                pnlAnomalies.Visible = false;
                pnlTokens.Visible = false;
            }
               
            
        }

    private  void bindServices()
        {
            ServiceCls scls = new ServiceCls();

            DataTable dt = scls.getServices("0");
            ddlServices.DataSource = dt;
            //ddlServices.DataBind();
            ddlServices.DataTextField = "ServiceName";
            ddlServices.DataValueField = "ServiceID";
            ddlServices.DataBind();
            ddlServices.Items.Insert(0, new ListItem("All Sevices", "0"));
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            lblSTdelay.Text = "";
            lblSdelay.Text = "";
            lblSce.Text = "";

            gvToken.Visible = false;
            ServiceCls scls = new ServiceCls();
            string sdt = sDate.Text;
            if (Convert.ToInt32(ddlReportType.SelectedItem.Value) == 1)
            {
                pnlAnomalies.Visible = false;
                pnlTokens.Visible = true;
                Repeater1.Visible = false;
                DataTable dt = scls.getTokenStatistics(ddlServices.SelectedItem.Value.ToString(),sdt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                Repeater1.Visible = true;
              //  lblMsg.Visible = false;
            }
            else
            {
                //lblMsg.Visible = true;
                //Repeater1.Visible = false;
                //lblMsg.Text = "No records found.";
                pnlAnomalies.Visible = true;
                pnlTokens.Visible = false;
                DataSet ds = scls.getServiceAnomalies(ddlServices.SelectedItem.Value.ToString(),sdt);
                if(ds.Tables[0].Rows.Count>0)
                {
                    gvSTdelay.DataSource = ds.Tables[0];
                    gvSTdelay.DataBind();
                    gvSTdelay.Visible = true;
                }

                else
                {
                    lblSTdelay.Text = "no service token delays found.";
                    gvSTdelay.Visible = false;
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    gvSdelay.DataSource = ds.Tables[1];
                    gvSdelay.DataBind();
                    gvSdelay.Visible = true;
                }

                else
                {
                    lblSdelay.Text = "no service delays found.";
                    gvSdelay.Visible = false;
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    if (ds.Tables[2].Rows[0]["RoomNo"].ToString() != "0")
                    {
                    gvSce.DataSource = ds.Tables[2];
                    gvSce.DataBind();
                        gvSce.Visible = true;
                    }
                    else
                    {
                        lblSce.Text = "no services closed early for the selected date (or) closing times can be shown for previous dates.";
                        gvSce.Visible = false;
                    }
                }

               
            }

        }

        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            sDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void btnCalendar_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }

            else
            {
                Calendar1.Visible = true;
                Calendar1.SelectedDate = DateTime.Today;
            }
        }

        protected void btn_Command(object sender, CommandEventArgs e)
        {
            //if you need to access the button itself
            Button btn = sender as Button;

            //get the correct index from the commandargument
            //Response.Write(e.CommandArgument.ToString());

            ServiceCls scls = new ServiceCls();
            string sdate = sDate.Text.ToString();
            DataTable sdt = scls.getServiceTokenInfoByDate(e.CommandArgument.ToString(), sdate);
            if (sdt.Rows.Count > 0) {
            gvToken.DataSource = sdt;
            gvToken.DataBind();
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            TableHeaderCell cell = new TableHeaderCell();
            cell.Text = sdt.Rows[0]["ServiceName"].ToString() + " On " + sdate;
            cell.ColumnSpan = 5;
            row.Controls.Add(cell);

           // row.BackColor = "blue";
            gvToken.HeaderRow.Parent.Controls.AddAt(0, row);
            gvToken.Visible = true;
            }
            else
            {
                gvToken.Visible = false;
                lblSTMsg.Text = "No Service Tokens found.";
            }
        }
    }
}