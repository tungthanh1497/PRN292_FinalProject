using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class RoomContent
    {
        int roomNum;
        string cusName;
        string identityCard;
        string phoneNum;
        string parentPhoneNum;
        DateTime dateJoin;
        int numPerson;
        int roomType;
        int price;
        int optional;
        int closed;
        string note;

        public int RoomNum
        {
            get
            {
                return roomNum;
            }

            set
            {
                roomNum = value;
            }
        }

        public string CusName
        {
            get
            {
                return cusName;
            }

            set
            {
                cusName = value;
            }
        }

        public string IdentityCard
        {
            get
            {
                return identityCard;
            }

            set
            {
                identityCard = value;
            }
        }

        public string PhoneNum
        {
            get
            {
                return phoneNum;
            }

            set
            {
                phoneNum = value;
            }
        }

        public string ParentPhoneNum
        {
            get
            {
                return parentPhoneNum;
            }

            set
            {
                parentPhoneNum = value;
            }
        }

        public DateTime DateJoin
        {
            get
            {
                return dateJoin;
            }

            set
            {
                dateJoin = value;
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

        public int RoomType
        {
            get
            {
                return roomType;
            }

            set
            {
                roomType = value;
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

        public int Optional
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

        public int Closed
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

        public RoomContent(int roomNum, string cusName, string identityCard, string phoneNum, string parentPhoneNum, DateTime dateJoin, int numPerson, int roomType, int price, int optional, int closed, string note)
        {
            this.RoomNum = roomNum;
            this.CusName = cusName;
            this.IdentityCard = identityCard;
            this.PhoneNum = phoneNum;
            this.ParentPhoneNum = parentPhoneNum;
            this.DateJoin = dateJoin;
            this.NumPerson = numPerson;
            this.RoomType = roomType;
            this.Price = price;
            this.Optional = optional;
            this.Closed = closed;
            this.Note = note;
        }
    }
}