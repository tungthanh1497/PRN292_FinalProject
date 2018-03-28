using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string uname = txtUname.Text.Trim();
            string psw = txtPsw.Text.Trim();
            if (uname.Length == 0 || psw.Length == 0)
            {
                Label1.Text = "1";
                return;
            }
            LoginModel lm = new LoginModel(uname, psw);
            try
            {
                int customerID = DAO.checkLogin(lm);
                if (customerID == -1)
                {
                    Label1.Text = "-1";
                    return;
                }
                else if (customerID == 0)
                {
                    Session["userID"] = 0;
                    Response.Redirect("Admin/Admin.aspx");
                    return;
                }
                else
                {
                    Session["userID"] = customerID;
                    Response.Redirect("Customer/customerInfo.aspx");
                    return;
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "2";
                return;
            }
        }
    }
}