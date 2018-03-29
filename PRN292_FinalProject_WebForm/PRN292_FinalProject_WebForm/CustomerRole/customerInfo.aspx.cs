using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm.Customer
{
    public partial class customerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userID = (int)Session["userID"];


            CustomerModel cm = DAO.getCustomerByID(userID);
            lblCustomerName.Text = cm.CustomerName;
            lblIdentifyCard.Text = cm.IdentityCard;
            lblPhoneNumber.Text = cm.PhoneNumber;
            lblParentsPhone.Text = cm.ParentsPhoneNumber;
            lblJoinDate.Text = cm.DateJoin.ToString();
            lblRoomNumber.Text = cm.RoomNumber + "";
            lblNumRoomates.Text = (DAO.getNumberPersonsInRoom(cm.RoomNumber) - 1) + "";

            hplViewBill.NavigateUrl = "viewBill.aspx?roomID=" + cm.RoomNumber;
        }
    }
}