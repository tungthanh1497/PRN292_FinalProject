using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class editRoomType : System.Web.UI.Page
    {
        public void loadInfo()
        {
            int roomTypeID = Convert.ToInt32(Request.QueryString["roomTypeID"].ToString());
            List<RoomTypeTBL> list = DAO.getDataRoomType();
            for(int i = 0; i < list.Count; i++)
            {
                if(list.ElementAt(i).RoomTypeID == roomTypeID)
                {
                    tbID.Text = roomTypeID.ToString();
                    tbID.ReadOnly = true;
                    tbNote.Text = list.ElementAt(i).Note.ToString();
                    tbNote.ReadOnly = true;
                    tbPrice.Text = list.ElementAt(i).Price.ToString();
                    tbNote.ReadOnly = true;
                    if(list.ElementAt(i).Optional==true)
                    {
                        cbOption.Checked = true;
                    }
                    else
                    {
                        cbOption.Checked = false;
                    }

                    if (list.ElementAt(i).Closed == true)
                    {
                        cbClosed.Checked = true;
                    }
                    else
                    {
                        cbClosed.Checked = false;
                    }
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loadInfo();
        }
        public static string xprice="";
        protected void tbPrice_TextChanged(object sender, System.EventArgs e)
        {
           
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                int roomID = Convert.ToInt32(tbID.Text.ToString());
                int price = Convert.ToInt32(tbPrice.Text.ToString());

                Label1.Text = roomID + " // " + price;
            }
            else
            {
                Label1.Text = "Asdsdasdd";
            }
            
            //DAO.updateTypeRoom(roomID, price);
            //Response.Redirect("roomType.aspx");
        }

        protected void tbPrice_TextChanged1(object sender, EventArgs e)
        {
            xprice = tbPrice.Text.ToString() ;
        }
    }
}