using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class roomDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
            RoomDetailModel room = DAO.getRoomDetailById(roomID);
        }
    }
}