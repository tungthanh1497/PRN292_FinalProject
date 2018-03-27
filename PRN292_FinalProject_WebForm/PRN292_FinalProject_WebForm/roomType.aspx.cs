using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class roomType : System.Web.UI.Page
    {
        public void loadRoomType()
        {
            List<RoomTypeTBL> list = DAO.getDataRoomType();
            gvRoomType.DataSource = list;
            gvRoomType.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loadRoomType();
        }
    }
}