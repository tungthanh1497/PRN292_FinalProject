using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PRN292_FinalProject_WebForm
{
    public class DAO
    {

        public static SqlConnection getConnection()
        {
            SqlConnection myConnect = new SqlConnection(ConfigurationManager.ConnectionStrings["BHouseCS"].ToString());
            return myConnect;
        }
        public static DataTable getDataBySQL(String sql)
        {
            SqlCommand command = new SqlCommand(sql, getConnection());
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        /*
         * login function
         * -1: login fail
         * others: return customer id
        */
        public static int checkLogin(LoginModel lm)
        {
            try
            {
                string sqlSelect = @"SELECT * 
                                FROM [BHouseDB].[dbo].[LoginTBL] 
                                WHERE [uname]='" + lm.Uname + "'";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["psw"].ToString().Equals(lm.Psw))
                    {
                        return Convert.ToInt32(dr["customerID"].ToString());
                    }
                    break;
                }
                return -1;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }
}