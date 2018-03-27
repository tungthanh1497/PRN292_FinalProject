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
        public RoomContent(int roomNum, string cusName, string identityCard, string phoneNum, string parentPhoneNum, DateTime dateJoin, int numPerson, int roomType, int price, int optional, int closed, string note)
        {
            this.roomNum = roomNum;
            this.cusName = cusName;
            this.identityCard = identityCard;
            this.phoneNum = phoneNum;
            this.parentPhoneNum = parentPhoneNum;
            this.dateJoin = dateJoin;
            this.numPerson = numPerson;
            this.roomType = roomType;
            this.price = price;
            this.optional = optional;
            this.closed = closed;
            this.note = note;
        }

        public int getRoomNum()
        {
            return roomNum;
        }

        public void setRoomNum(int roomNum)
        {
            this.roomNum = roomNum;
        }

        public string getCusName()
        {
            return cusName;
        }

        public void setCusName(string cusName)
        {
            this.cusName = cusName;
        }

        public string getIdentityCard()
        {
            return identityCard;
        }

        public void setIdentityCard(string identityCard)
        {
            this.identityCard = identityCard;
        }

        public string getPhoneNum()
        {
            return phoneNum;
        }

        public void setPhoneNum(string phoneNum)
        {
            this.phoneNum = phoneNum;
        }

        public string getParentPhoneNum()
        {
            return parentPhoneNum;
        }

        public void setParentPhoneNum(string parentPhoneNum)
        {
            this.parentPhoneNum = parentPhoneNum;
        }

        public DateTime getDateJoin()
        {
            return dateJoin;
        }

        public void setDateJoin(DateTime dateJoin)
        {
            this.dateJoin = dateJoin;
        }

        public int getNumPerson()
        {
            return numPerson;
        }

        public void setNumPerson(int numPerson)
        {
            this.numPerson = numPerson;
        }

        public int getRoomType()
        {
            return roomType;
        }

        public void setRoomType(int roomType)
        {
            this.roomType = roomType;
        }

        public int getPrice()
        {
            return price;
        }

        public void setPrice(int price)
        {
            this.price = price;
        }

        public int getOptional()
        {
            return optional;
        }

        public void setOptional(int optional)
        {
            this.optional = optional;
        }

        public int getClosed()
        {
            return closed;
        }

        public void setClosed(int closed)
        {
            this.closed = closed;
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