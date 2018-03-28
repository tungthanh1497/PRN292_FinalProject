using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class NotificationTBL
    {
        public string sdfDate { get; set; }
        public int notificationID { get; set; }
      
        public string title { get; set; }
        public string detail { get; set; }
        public DateTime dateCreate { get; set; }

        public NotificationTBL(int id, string name, string descri, DateTime date)
        {
            notificationID = id;
            title = name;
            detail = descri;
            dateCreate = date;
            sdfDate = date.ToString("dd-MM-yyyy");
        }
    }
}