using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_FinalProject_WebForm
{
    public partial class ChangePSW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = (int)Session["userID"];
                LoginModel acc = DAO.getAccountByID(id);
                lblAccName.Text = acc.Uname;
            }
            else
            {
                int id = (int)Session["userID"];
                LoginModel acc = DAO.getAccountByID(id);
                string oldPass = Page.Request.Form["txtOldPSW"].ToString();
                string newPass = Page.Request.Form["txtNewPSW"].ToString();
                string reNew = Page.Request.Form["txtRePSW"].ToString();
                successfully.Visible = false;
                warning.Visible = false;
                if (acc.Psw.Equals(oldPass) == false)
                {
                    warning.Visible = true;
                    warning.Text = "Old password is wrong !";
                }
                else if (newPass.ToString().Trim().Length < 6)
                {
                    warning.Visible = true;
                    warning.Text = "New password must has at least 6 charactor !";
                }
                else if (newPass.Equals(reNew) == false)
                {
                    warning.Visible = true;
                    warning.Text = "New password and Re new password must match !";
                }
                else if (oldPass.Equals(newPass))
                {
                    warning.Visible = true;
                    warning.Text = "New password has been used before !";
                }
                else
                {
                    if (DAO.updatePassWord(id, newPass) > 0)
                    {
                        successfully.Visible = true;
                        warning.Visible = false;
                        successfully.Text = "Update successfully";
                    }

                }

            }
        }
    }
}