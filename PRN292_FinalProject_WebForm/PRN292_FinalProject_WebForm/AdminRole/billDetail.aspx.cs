using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm.Admin
{
    public partial class billDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
                DateTime td = DateTime.Today;
                BillDetailModel btm = DAO.getBillDetail(roomID, td.Year+"-"+td.Month+"-01");
                lblDefaultFee.Text = btm.DefaultFee + "";
                lblElectricity.Text = btm.Electricity + "";
                lblRoomPrice.Text = btm.RoomPrice + "";

                hplExtraFee.Text = btm.ExtraFee + "";
                hplExtraFee.NavigateUrl = "extraDetail.aspx?roomID=" + roomID;

            }
        }
    }
}