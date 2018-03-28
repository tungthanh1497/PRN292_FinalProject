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
            for (int i = 0; i < list.Count; i++)
            {
                if (list.ElementAt(i).RoomTypeID == roomTypeID)
                {
                    tbID.Text = roomTypeID.ToString();
                    tbID.ReadOnly = true;
                    tbNote.Text = list.ElementAt(i).Note.ToString();
                    tbNote.ReadOnly = true;
                    tbPrice.Text = list.ElementAt(i).Price.ToString();
                    tbNote.ReadOnly = true;
                    if (list.ElementAt(i).Optional == true)
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
            if(!IsPostBack)
            {

                loadInfo();
            }

        }
  
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int price = Convert.ToInt32(tbPrice.Text.ToString());
            int room = Convert.ToInt32(tbID.Text.ToString());
            DAO.updateTypeRoom(room, price);
            Response.Redirect("roomType.aspx");
        }
    }
}