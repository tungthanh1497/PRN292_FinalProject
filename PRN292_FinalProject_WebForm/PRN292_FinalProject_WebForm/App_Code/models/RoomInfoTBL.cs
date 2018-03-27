using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class RoomInfoTBL
    {
        private int roomNumber;
        private int roomTypeID;
        private int numPerson;
        private bool available;

        public RoomInfoTBL(int roomNumber, int roomTypeID, int numPerson, bool available)
        {
            this.roomNumber = roomNumber;
            this.roomTypeID = roomTypeID;
            this.numPerson = numPerson;
            this.available = available;
        }

        public int getRoomNumber()
        {
            return roomNumber;
        }

        public void setRoomNumber(int roomNumber)
        {
            this.roomNumber = roomNumber;
        }

        public int getRoomTypeID()
        {
            return roomTypeID;
        }

        public void setRoomTypeID(int roomTypeID)
        {
            this.roomTypeID = roomTypeID;
        }

        public int getNumPerson()
        {
            return numPerson;
        }

        public void setNumPerson(int numPerson)
        {
            this.numPerson = numPerson;
        }

        public bool isAvailable()
        {
            return available;
        }

        public void setAvailable(bool available)
        {
            this.available = available;
        }
    }
}