using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class BillTBL
    {
        int roomPrice;
        private int roomNumber;
        private int defaultFee;
        private int electricity;
        private int extraFee;
        private DateTime monthBill;

        public int RoomPrice
        {
            get
            {
                return roomPrice;
            }

            set
            {
                roomPrice = value;
            }
        }
        

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

        public int DefaultFee
        {
            get
            {
                return defaultFee;
            }

            set
            {
                defaultFee = value;
            }
        }

        public int Electricity
        {
            get
            {
                return electricity;
            }

            set
            {
                electricity = value;
            }
        }

        public int ExtraFee
        {
            get
            {
                return extraFee;
            }

            set
            {
                extraFee = value;
            }
        }

        public DateTime MonthBill
        {
            get
            {
                return monthBill;
            }

            set
            {
                monthBill = value;
            }
        }

        public BillTBL(int roomPrice, int roomNumber, int defaultFee, int electricity, int extraFee, DateTime monthBill)
        {
            this.RoomPrice = roomPrice;
            this.RoomNumber = roomNumber;
            this.DefaultFee = defaultFee;
            this.Electricity = electricity;
            this.ExtraFee = extraFee;
            this.MonthBill = monthBill;
        }
    }
}