using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBoxTitle.Visible = false;
                TextBoxDate.Visible = false;
                TextBoxArea.Visible = false;
                int id = -1;
                try
                {
                    id = Convert.ToInt32(Request.QueryString["ID"].ToString());                 
                }
                catch (Exception ex)
                {
                    id = -1;
                }
                if(id == -1)
                {
                    List<NotificationTBL> ls = new List<NotificationTBL>();
                    ls = DAO.getListNotification();
                    GridView1.DataSource = ls;
                    GridView1.DataBind();
                }else
                {
                    NotificationTBL noti = DAO.getNotificationByID(id);
                    TextBoxTitle.Visible = true;
                    TextBoxDate.Visible = true;
                    TextBoxArea.Visible = true;
                    TextBoxTitle.Text = noti.title;
                    TextBoxDate.Text = noti.sdfDate;
                    TextBoxArea.Text = noti.detail;
                }
              
            }
               
        }
    }
}