using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class ExtraTBL
    {
        private int extraID;
        private int roomNumber;
        private String extraName;
        private int extraNumber;
        private int price;
        private String detail;
        private DateTime extraDate;

        public int ExtraID
        {
            get
            {
                return extraID;
            }

            set
            {
                extraID = value;
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

        public string ExtraName
        {
            get
            {
                return extraName;
            }

            set
            {
                extraName = value;
            }
        }

        public int ExtraNumber
        {
            get
            {
                return extraNumber;
            }

            set
            {
                extraNumber = value;
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

        public string Detail
        {
            get
            {
                return detail;
            }

            set
            {
                detail = value;
            }
        }

        public DateTime ExtraDate
        {
            get
            {
                return extraDate;
            }

            set
            {
                extraDate = value;
            }
        }

        public ExtraTBL(int extraID, int roomNumber, string extraName, int extraNumber, int price, string detail, DateTime extraDate)
        {
            this.ExtraID = extraID;
            this.RoomNumber = roomNumber;
            this.ExtraName = extraName;
            this.ExtraNumber = extraNumber;
            this.Price = price;
            this.Detail = detail;
            this.ExtraDate = extraDate;
        }

        public ExtraTBL(int roomNumber, string extraName, int extraNumber, int price, string detail, DateTime extraDate)
        {
            this.RoomNumber = roomNumber;
            this.ExtraName = extraName;
            this.ExtraNumber = extraNumber;
            this.Price = price;
            this.Detail = detail;
            this.ExtraDate = extraDate;
        }
    }
}