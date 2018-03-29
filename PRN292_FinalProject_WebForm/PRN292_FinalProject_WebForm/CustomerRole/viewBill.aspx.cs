using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class viewBill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
                List<BillTBL> billList = DAO.getListBillbyRoomID(roomID);
                gvBills.DataSource = billList;
                gvBills.DataBind();
            }
        }
    }
}