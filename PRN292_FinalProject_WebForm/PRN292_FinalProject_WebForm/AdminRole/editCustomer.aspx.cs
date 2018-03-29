﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class editCustomer : System.Web.UI.Page
    {
        static int oldRoom = -1;
        static int newRoom = -1;
        public void loadInfo()
        {
            int customerID = Convert.ToInt32(Request.QueryString["customerID"].ToString());
            List<CustomerTBL> listCus = DAO.getDataCustomer();
            List<int> listRoomAvailable = DAO.getRoomNumberAvailable();
            dlRoomAvailble.DataSource = listRoomAvailable;
            dlRoomAvailble.DataBind();
            for (int i = 0; i < listCus.Count; i++)
            {
                if (listCus.ElementAt(i).CustomerID == customerID)
                {
                    oldRoom = listCus.ElementAt(i).RoomNumber;
                    tbCurrenRoom.Text = listCus.ElementAt(i).RoomNumber.ToString();
                    tbCID.Text = listCus.ElementAt(i).CustomerID.ToString();
                    tbCName.Text = listCus.ElementAt(i).CustomerName.ToString();
                    tbCard.Text = listCus.ElementAt(i).IdentityCard.ToString();
                    tbDate.Text = listCus.ElementAt(i).DateJoin.ToString();
                    tbPhoneNumber.Text = listCus.ElementAt(i).PhoneNumber.ToString();
                    tbParentPhone.Text = listCus.ElementAt(i).ParentsPhoneNumber.ToString();
                    break;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadInfo();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int customerID = Convert.ToInt32(tbCID.Text.ToString());
            int oldRoomNumber = Convert.ToInt32(tbCurrenRoom.Text.ToString());
            string phoneNumber = tbPhoneNumber.Text.ToString();
            string parentPhone = tbParentPhone.Text.ToString();
            string dateJoin = tbDate.Text.ToString();
            string cusName = tbCName.Text.ToString();
            string card = tbCard.Text.ToString();
            int newRoomNumber = Convert.ToInt32(dlRoomAvailble.SelectedValue.ToString());

            if (DAO.getAvailableRoom(newRoomNumber) == true)
            {
                DAO.updateCustomer(customerID, cusName, card, phoneNumber, parentPhone, newRoomNumber, dateJoin);
                DAO.changeNumpersonRoom(newRoomNumber, 1);
                DAO.changeNumpersonRoom(oldRoomNumber, -1);
                if (DAO.getNumPersoninRoom(newRoomNumber) == 3)
                {
                    DAO.changeAvailble(newRoomNumber, 0);
                }
                DAO.changeAvailble(oldRoomNumber, 1);
            }

            DAO.updateDefaultFee(oldRoomNumber, DateTime.Today);
            DAO.updateDefaultFee(newRoomNumber, DateTime.Today);

            Response.Redirect("roomManage.aspx");
        }

        protected void btnDeleteCus_Click(object sender, EventArgs e)
        {

            Panel1.Visible = true;

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int customerID = Convert.ToInt32(Request.QueryString["customerID"].ToString());
            int roomNumber = DAO.getRoomNumber(customerID);
            DAO.changeNumperson(roomNumber, -1);
            DAO.removeCustomer(customerID);
            if (DAO.getNumberPersonsInRoom(roomNumber) < 3)
            {
                DAO.changeAvailble(roomNumber, 1);
            }
            //NOTE UPDATE DEFAULT FEE
            DAO.updateDefaultFee(oldRoom, DateTime.Today);
            Response.Redirect("customersManage.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

            Panel1.Visible = false;
        }
    }
}