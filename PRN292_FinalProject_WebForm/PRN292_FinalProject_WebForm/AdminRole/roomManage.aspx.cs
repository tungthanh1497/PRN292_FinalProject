using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class roomManage : System.Web.UI.Page
    {
         void loadRoomStatus()
        {
            int roomNumber;
            bool optional = false;
            bool closed = false;
            int price = 0;
            int numPerson;
            bool available;

            List<RoomInfoTBL> roomInfo = new List<RoomInfoTBL>();
            List<RoomTypeTBL> roomType = new List<RoomTypeTBL>();
            List<RoomStatus> roomStatus = new List<RoomStatus>();


            roomInfo = DAO.getDataRoomInfo();
            roomType = DAO.getDataRoomType();


            for (int i = 0; i < roomInfo.Count; i++)
            {
                roomNumber = roomInfo.ElementAt(i).RoomNumber;
                numPerson = roomInfo.ElementAt(i).NumPerson;
                available = roomInfo.ElementAt(i).Available;


                for (int u = 0; u < roomType.Count(); u++)
                {
                    if (roomInfo.ElementAt(i).RoomTypeID == roomType.ElementAt(u).RoomTypeID)
                    {
                        optional = roomType.ElementAt(u).Optional;
                        closed = roomType.ElementAt(u).Closed;
                        price = roomType.ElementAt(u).Price;
                        break;
                    }
                }
                DateTime td = DateTime.Today;
                int totalBill = DAO.getTotalBill(roomNumber, td.Year + "-" + td.Month + "-01");

                roomStatus.Add(new RoomStatus(roomNumber, optional, closed, numPerson, price, available, totalBill));
            }
            gvAdmin.DataSource = roomStatus;            
            gvAdmin.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loadRoomStatus();
        }

        protected void gvAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdmin.PageIndex = e.NewPageIndex;
            gvAdmin.DataBind();
        }
    }
}