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

        public static List<RoomInfoTBL> getDataRoomInfo()
        {
            List<RoomInfoTBL> arr = new List<RoomInfoTBL>();
            try
            {
                string sqlSelect = @"select * from RoomInfoTBL";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    arr.Add(new RoomInfoTBL(Convert.ToInt32(dr["roomNumber"]), Convert.ToInt32(dr["roomTypeID"]), Convert.ToInt32(dr["numPerson"]), Convert.ToBoolean(dr["available"])));
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return arr;
        }
        public static List<RoomTypeTBL> getDataRoomType()
        {
            List<RoomTypeTBL> arr = new List<RoomTypeTBL>();
            try
            {
                string sqlSelect = @"select * from RoomTypeTBL";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    arr.Add(new RoomTypeTBL(Convert.ToInt32(dr["roomTypeID"]), Convert.ToBoolean(dr["optional"]), Convert.ToBoolean(dr["closed"]), Convert.ToInt32(dr["price"]), dr["note"].ToString()));
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return arr;
        }
        public RoomDetailModel getRoomDetailById(int id)
        {
            RoomDetailModel roomDetailModel = null;
            try
            {
                string sqlSelect = "select * from RoomInfoTBL where roomNumber=" + id;
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    int roomNumber = Convert.ToInt32(dr["roomNumber"]);
                    bool available = Convert.ToBoolean(dr["available"]);
                    int roomTypeId = Convert.ToInt32(dr["roomTypeID"]);
                    bool optional = false;
                    bool closed = false;
                    sqlSelect = "select * from RoomTypeTBL where roomTypeID=" + roomTypeId;
                    DataTable dt2 = getDataBySQL(sqlSelect);
                    foreach (DataRow dr2 in dt2.Rows)
                    {

                        optional = Convert.ToBoolean(dr["optional"]);
                        closed = Convert.ToBoolean(dr["closed"]);
                    }

                    List<int> idMembers = new List<int>();
                    sqlSelect = "select * from CustomerTBL where roomNumber=" + roomNumber;
                    DataTable dt3 = getDataBySQL(sqlSelect);
                    foreach (DataRow dr3 in dt3.Rows)
                    {
                        idMembers.Add(Convert.ToInt32(dr["customerID"]));
                    }


                    //        select roomTypeID from RoomInfoTBL where roomNumber=


                    //    while (rs.next())
                    //    {
                    //        int roomNumber = rs.getInt(1);
                    //        boolean available = rs.getBoolean(4);
                    //        int roomTypeId = rs.getInt(2);
                    //        rs.close();
                    //        ps.close();
                    //        sqlSelect = "select * from RoomTypeTBL where roomTypeID=" + roomTypeId;
                    //        ps = conn.prepareStatement(sqlSelect);
                    //        rs = ps.executeQuery();
                    //        boolean optional = false;
                    //        boolean closed = false;
                    //        while (rs.next())
                    //        {
                    //            optional = rs.getBoolean(2);
                    //            closed = rs.getBoolean(3);
                    //            break;
                    //        }
                    //        rs.close();
                    //        ps.close();
                    //        ArrayList<Integer> idMembers = new ArrayList<Integer>();
                    //        sqlSelect = "select * from CustomerTBL where roomNumber=" + roomNumber;
                    //        ps = conn.prepareStatement(sqlSelect);
                    //        rs = ps.executeQuery();
                    //        while (rs.next())
                    //        {
                    //            idMembers.add(rs.getInt(1));
                    //        }
                    //        rs.close();
                    //        ps.close();
                    //        conn.close();
                    //        java.util.Date utilDate = new java.util.Date();
                    //        Date sqlDate = new Date(utilDate.getTime());
                    //        int billThisMonth = getTotalBill(roomNumber, sqlDate);
                    //        roomDetailModel = new RoomDetailModel(roomNumber, optional, closed, billThisMonth, idMembers);
                    //        roomDetailModel.setAvailable(available);
                    //        break;
                    //    }
                }

            }
            catch (Exception ex)
            {
            }
            return roomDetailModel;
        }

        public static List<CustomerTBL> getDataCustomer()
        {
            List<CustomerTBL> arr = new List<CustomerTBL>();
            try
            {
                string sqlSelect = @"select * from CustomerTBL";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    arr.Add(new CustomerTBL(Convert.ToInt32(dr["customerID"]), Convert.ToInt32(dr["roomNumber"]), dr["customerName"].ToString(), dr["identityCard"].ToString(), dr["phoneNumber"].ToString(), dr["parentsPhoneNumber"].ToString(), Convert.ToDateTime(dr["dateJoin"])));
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return arr;
        }

 
    }
}









