using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm.AdminRole
{
    public partial class extraDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int roomID = Convert.ToInt32(Request.QueryString["roomID"].ToString());
            List<ExtraTBL> exList = DAO.getExtras(roomID, DateTime.Today);
            gvExtras.DataSource = exList;
            gvExtras.DataBind();
        }
    }
}