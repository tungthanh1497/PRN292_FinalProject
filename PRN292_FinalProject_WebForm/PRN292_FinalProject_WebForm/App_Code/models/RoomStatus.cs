using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class RoomStatus
    {

/* Unmerged change from project 'PRN292_FinalProject_WebForm'
Before:
        public int roomNumber;
        public bool optional;
        public bool closed;
        public int numPerson;
        public int price;
        public bool available;
After:
        private int roomNumber;
        private bool optional;
        private bool closed;
        private int numPerson;
        private int price;
        private bool available;
*/
        private int roomNumber;
        private bool optional;
        private bool closed;
        private int numPerson;
        private int price;
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

        public RoomStatus(int roomNumber, bool optional, bool closed, int numPerson, int price, bool available)
        {
            this.RoomNumber = roomNumber;
            this.Optional = optional;
            this.Closed = closed;
            this.NumPerson = numPerson;
            this.Price = price;
            this.Available = available;
        }
    }
}