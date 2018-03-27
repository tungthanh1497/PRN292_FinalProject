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

        public bool Optional
        {
            get
            {
                return optional;
            }

            set
            {
                optional = value;
            }
        }

        public bool Closed
        {
            get
            {
                return closed;
            }

            set
            {
                closed = value;
            }
        }

        public int Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public string Note
        {
            get
            {
                return note;
            }

            set
            {
                note = value;
            }
        }

        public RoomTypeTBL(int roomTypeID, bool optional, bool closed, int price, string note)
        {
            this.RoomTypeID = roomTypeID;
            this.Optional = optional;
            this.Closed = closed;
            this.Price = price;
            this.Note = note;
        }
    }
}