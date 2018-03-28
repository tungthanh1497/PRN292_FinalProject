using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class roomDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
                RoomDetailModel room = DAO.getRoomDetailById(roomID);
                List<int> listIDCus = room.IdMembers;
                tbRoomNumber.Text = room.RoomNumber.ToString();

                customer1.Text = DAO.getNameByUserId(listIDCus.ElementAt(0));
                customer1.NavigateUrl = "editCustomer.aspx?customerID=" + listIDCus.ElementAt(0);
                if (listIDCus.Count == 2)
                {
                    customer2.Text = DAO.getNameByUserId(listIDCus.ElementAt(1));
                    customer2.NavigateUrl = "editCustomer.aspx?customerID=" + listIDCus.ElementAt(1);
                }
                else if (listIDCus.Count == 3)
                {
                    customer2.Text = DAO.getNameByUserId(listIDCus.ElementAt(1));
                    customer2.NavigateUrl = "editCustomer.aspx?customerID=" + listIDCus.ElementAt(1);

                    customer3.Text = DAO.getNameByUserId(listIDCus.ElementAt(2));
                    customer3.NavigateUrl = "editCustomer.aspx?customerID=" + listIDCus.ElementAt(2);
                }

                if (room.Optional)
                {
                    cbOption.Checked = true;
                }
                else
                {
                    cbOption.Checked = false;
                }

                if (room.Closed)
                {
                    cbClosed.Checked = true;
                }
                else
                {
                    cbClosed.Checked = false;
                }

                if (room.Available)
                {
                    cbAvailable.Checked = true;
                }
                else
                {
                    cbAvailable.Checked = false;
                }


                hplBillInMonth.Text = room.BillThisMonth.ToString();
                hplBillInMonth.NavigateUrl = "billDetail.aspx?roomID=" + roomID;

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int roomNumber = Convert.ToInt32(Request.QueryString["roomID"].ToString());
            int type = 0;

            if (cbClosed.Checked && cbOption.Checked)
            {
                type = 1;
            }
            else if (cbOption.Checked && !cbClosed.Checked)
            {
                type = 2;
            }
            else if (cbClosed.Checked && !cbOption.Checked)
            {
                type = 3;
            }
            else
            {
                type = 4;
            }

            DAO.updateRoomInFo(roomNumber, type);
            Response.Redirect("Admin.aspx");
        }
    }
}