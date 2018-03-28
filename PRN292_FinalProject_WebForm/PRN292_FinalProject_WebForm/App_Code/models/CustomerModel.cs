using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class CustomerModel
    {
        private int customerID;
        private int roomNumber;
        private string customerName;
        private string identityCard;
        private string phoneNumber;
        private string parentsPhoneNumber;
        private DateTime dateJoin;

        public CustomerModel(int customerID, int roomNumber, string customerName, string identityCard, string phoneNumber, string parentsPhoneNumber, DateTime dateJoin)
        {
            this.customerID = customerID;
            this.roomNumber = roomNumber;
            this.customerName = customerName;
            this.identityCard = identityCard;
            this.phoneNumber = phoneNumber;
            this.parentsPhoneNumber = parentsPhoneNumber;
            this.dateJoin = dateJoin;
        }

        public int CustomerID
        {
            get
            {
                return customerID;
            }

            set
            {
                customerID = value;
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

        public string CustomerName
        {
            get
            {
                return customerName;
            }

            set
            {
                customerName = value;
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

        public string PhoneNumber
        {
            get
            {
                return phoneNumber;
            }

            set
            {
                phoneNumber = value;
            }
        }

        public string ParentsPhoneNumber
        {
            get
            {
                return parentsPhoneNumber;
            }

            set
            {
                parentsPhoneNumber = value;
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

    }
}