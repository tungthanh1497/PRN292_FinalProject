using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class customersManage : System.Web.UI.Page
    {
        void loadCustomer()
        {
            List<CustomerTBL> list = DAO.getDataCustomer();
            gvCustomer.DataSource = list;
            gvCustomer.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadCustomer();
        }

        protected void gvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomer.PageIndex = e.NewPageIndex;
            gvCustomer.DataBind();
        }
    }
}