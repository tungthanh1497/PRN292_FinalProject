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

        public int RoomNumber
        {
            get
            {
                return roomNumber;
            }

            set
            {
                roomNumber = value;
            }
        }

        public int RoomTypeID
        {
            get
            {
                return roomTypeID;
            }

            set
            {
                roomTypeID = value;
            }
        }

        public int NumPerson
        {
            get
            {
                return numPerson;
            }

            set
            {
                numPerson = value;
            }
        }

        public bool Available
        {
            get
            {
                return available;
            }

            set
            {
                available = value;
            }
        }

        public RoomInfoTBL(int roomNumber, int roomTypeID, int numPerson, bool available)
        {
            this.RoomNumber = roomNumber;
            this.RoomTypeID = roomTypeID;
            this.NumPerson = numPerson;
            this.Available = available;
        }
    }
}