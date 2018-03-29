using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm.AdminRole
{
    public partial class addExtra : System.Web.UI.Page
    {
        static int roomID=-1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
                lblRoomNumber.Text = roomID + "";
                DateTime td = DateTime.Today;
                lblDate.Text = td.Year + "-" + td.Month + "-" + td.Day;

            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {


            DateTime td = DateTime.Today;
            ExtraTBL ext = new ExtraTBL(roomID
                                        , txtNameProduct.Text
                                        , Convert.ToInt32(txtQuantity.Text)
                                        , Convert.ToInt32(txtPricePerProduct.Text)
                                        , txtDetail.Text
                                        , td);
            DAO.createNewExtra(ext);
            DAO.updateExtraBill(ext);
            Response.Redirect("roomManage.aspx");
        }
    }
}