using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class Admin : System.Web.UI.Page
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
                roomNumber = roomInfo.ElementAt(i).getRoomNumber();
                numPerson = roomInfo.ElementAt(i).getNumPerson();
                available = roomInfo.ElementAt(i).isAvailable();

                for (int u = 0; u < roomType.Count(); u++)
                {
                    if (roomInfo.ElementAt(u).getRoomTypeID() == roomType.ElementAt(u).getRoomTypeID())
                    {
                        optional = roomType.ElementAt(u).isOptional();
                        closed = roomType.ElementAt(u).isClosed();
                        price = roomType.ElementAt(u).getPrice();
                    }
                }
                roomStatus.Add(new RoomStatus(roomNumber, optional, closed, numPerson, price, available));
            }
            gvAdmin.DataSource = roomStatus;            
            gvAdmin.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loadRoomStatus();
        }
    }
}