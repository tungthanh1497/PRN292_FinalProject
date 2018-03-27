using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class RoomDetailModel
    {
        int roomNumber;
        bool optional;
        bool closed;
        int billThisMonth;
        List<int> idMembers;
        bool available;

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

        public int BillThisMonth
        {
            get
            {
                return billThisMonth;
            }

            set
            {
                billThisMonth = value;
            }
        }

        public List<int> IdMembers
        {
            get
            {
                return idMembers;
            }

            set
            {
                idMembers = value;
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

        public RoomDetailModel(int roomNumber, bool optional, bool closed, int billThisMonth, List<int> idMembers, bool available)
        {
            this.RoomNumber = roomNumber;
            this.Optional = optional;
            this.Closed = closed;
            this.BillThisMonth = billThisMonth;
            this.IdMembers = idMembers;
            this.Available = available;
        }
    }
}