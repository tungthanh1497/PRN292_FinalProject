using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class RoomTypeTBL
    {
        private int roomTypeID;
        private bool optional;
        private bool closed;
        private int price;
        private string note;

        public RoomTypeTBL(int roomTypeID, bool optional, bool closed, int price, string note)
        {
            this.roomTypeID = roomTypeID;
            this.optional = optional;
            this.closed = closed;
            this.price = price;
            this.note = note;
        }

        public int getRoomTypeID()
        {
            return roomTypeID;
        }

        public void setRoomTypeID(int roomTypeID)
        {
            this.roomTypeID = roomTypeID;
        }

        public bool isOptional()
        {
            return optional;
        }

        public void setOptional(bool optional)
        {
            this.optional = optional;
        }

        public bool isClosed()
        {
            return closed;
        }

        public void setClosed(bool closed)
        {
            this.closed = closed;
        }

        public int getPrice()
        {
            return price;
        }

        public void setPrice(int price)
        {
            this.price = price;
        }

        public string getNote()
        {
            return note;
        }

        public void setNote(string note)
        {
            this.note = note;
        }

    }
}