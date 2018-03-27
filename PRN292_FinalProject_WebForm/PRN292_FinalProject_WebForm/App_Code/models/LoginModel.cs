using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class LoginModel
    {
        private int customerID;
        private string uname;
        private string psw;

        public int CustomerID
        {
            get
            {
                return customerID;
            }

            set
            {
                customerID = value;
            }
        }

        public string Uname
        {
            get
            {
                return uname;
            }

            set
            {
                uname = value;
            }
        }

        public string Psw
        {
            get
            {
                return psw;
            }

            set
            {
                psw = value;
            }
        }

        public LoginModel(int customerID, string uname, string psw)
        {
            this.CustomerID = customerID;
            this.Uname = uname;
            this.Psw = psw;
        }

        public LoginModel(string uname, string psw)
        {
            this.uname = uname;
            this.psw = psw;
        }
    }
}