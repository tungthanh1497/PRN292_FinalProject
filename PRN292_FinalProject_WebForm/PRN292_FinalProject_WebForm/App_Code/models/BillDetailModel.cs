using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class BillDetailModel
    {
        int roomPrice;
        int defaultFee;
        int electricity;
        int extraFee;

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

        public BillDetailModel(int roomPrice, int defaultFee, int electricity, int extraFee)
        {
            this.RoomPrice = roomPrice;
            this.DefaultFee = defaultFee;
            this.Electricity = electricity;
            this.ExtraFee = extraFee;
        }
    }
}