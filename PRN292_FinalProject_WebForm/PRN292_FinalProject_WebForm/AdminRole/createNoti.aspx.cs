using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class createNoti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbDate.Text = Convert.ToString(DateTime.Today);
            tbDate.ReadOnly = true;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string title = tbTitle.Text.Trim();
            string content = tbContent.Text.Trim();
            DateTime date = Convert.ToDateTime(tbDate.Text.Trim());
            DAO.createNoti(title, content, date);
            Response.Redirect("Admin.aspx");
        }
    }
}