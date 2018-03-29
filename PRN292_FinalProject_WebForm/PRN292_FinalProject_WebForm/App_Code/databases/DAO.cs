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

        #region TungTT

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


        public static CustomerModel getCustomerByID(int customerID)
        {
            try
            {
                string sqlSelect = @"select * from CustomerTBL where customerID=" + customerID;
                DataTable dt = getDataBySQL(sqlSelect);
                CustomerModel cm = null;
                foreach (DataRow dr in dt.Rows)
                {
                    cm = new CustomerModel(Convert.ToInt32(dr["customerID"].ToString())
                                        , Convert.ToInt32(dr["roomNumber"].ToString())
                                        , dr["customerName"].ToString()
                                        , dr["identityCard"].ToString()
                                        , dr["phoneNumber"].ToString()
                                        , dr["parentsPhoneNumber"].ToString()
                                        , Convert.ToDateTime(dr["dateJoin"].ToString())
                                        );
                }
                return cm;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static int getNumberPersonsInRoom(int roomNumber)
        {
            try
            {
                int number = 0;
                string sqlSelect = @"select COUNT(*) as numberPerson  
                                    from CustomerTBL C  
                                    where C.roomNumber=" + roomNumber;
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    number = Convert.ToInt32(dr["numberPerson"].ToString());
                    break;
                }
                return number;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static bool billIsExist(int roomNumber, string date)
        {
            try
            {
                int num = 0;
                string sqlSelect = @"select COUNT(*) as num from BillTBL 
                                    where roomNumber="+roomNumber+" and monthBill='" + date + "'";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    num = Convert.ToInt32(dr["num"].ToString());
                    break;
                }
                if (num == 0)
                {
                    return false;
                }
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static RoomInfoTBL getRoomInfoById(int id)
        {
            try
            {
                string sqlSelect = @"select * from RoomInfoTBL where roomNumber=" + id;
                DataTable dt = getDataBySQL(sqlSelect);
                RoomInfoTBL ri = null;
                foreach (DataRow dr in dt.Rows)
                {
                    ri = new RoomInfoTBL(Convert.ToInt32(dr["roomNumber"].ToString())
                                        , Convert.ToInt32(dr["roomTypeID"].ToString())
                                        , Convert.ToInt32(dr["numPerson"].ToString())
                                        , Convert.ToBoolean(dr["available"].ToString()));
                }
                return ri;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public static void createNewBill(int roomNumber, string date)
        {
            RoomInfoTBL ri = getRoomInfoById(roomNumber);
            string sql = @"  insert into BillTBL(roomNumber, defaultFee, electricity,extraFee,monthBill) 
                            values(@roomNumber,@defaultFee,0,0,'"+date+"')";
            SqlParameter roomNumberParam = new SqlParameter("@roomNumber", SqlDbType.Int);
            roomNumberParam.Value = roomNumber;
            SqlParameter defaultFeeParam = new SqlParameter("@defaultFee", SqlDbType.Int);
            defaultFeeParam.Value = ri.NumPerson*100000;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(roomNumberParam);
            command.Parameters.Add(defaultFeeParam);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }
        public static int getTotalBill(int roomNumber, string date)
        {
            if(!billIsExist(roomNumber, date))
            {
                createNewBill(roomNumber,date);
            }
            try
            {
                string sqlSelect = @"SELECT ((Select price
		                                    from RoomTypeTBL
		                                    where roomTypeID=(select roomTypeID 
						                                    from RoomInfoTBL 
						                                    where roomNumber="+ roomNumber + @")
		                                    )+extraFee+defaultFee+electricity)as showup
                                    FROM BillTBL
                                    where roomNumber=" + roomNumber + " and monthBill='"+date+"'";
                DataTable dt = getDataBySQL(sqlSelect);
                int price=0;
                foreach (DataRow dr in dt.Rows)
                {

                    price = Convert.ToInt32(dr["showup"].ToString());
                }
                return price;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public static int getRoomPriceByRoomNumber(int roomNumber)
        {
            try
            {
                int price = 0;
                string sqlSelect = @"Select price 
                                    from RoomTypeTBL 
                                    where roomTypeID=(select roomTypeID 
				                                    from RoomInfoTBL 
				                                    where roomNumber="+roomNumber+")";
                DataTable dt = getDataBySQL(sqlSelect);
                foreach (DataRow dr in dt.Rows)
                {
                    price = Convert.ToInt32(dr["price"].ToString());
                    break;
                }
                return price;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static BillDetailModel getBillDetail(int roomNumber, string date)
        {
            try
            {
                string sqlSelect = @"SELECT extraFee,defaultFee,electricity
                                    FROM BillTBL
                                    where roomNumber=" + roomNumber + " and monthBill='" + date + "'";
                DataTable dt = getDataBySQL(sqlSelect);
                BillDetailModel btm = null;

                foreach (DataRow dr in dt.Rows)
                {
                    btm = new BillDetailModel(getRoomPriceByRoomNumber(roomNumber)
                                        , Convert.ToInt32(dr["defaultFee"].ToString())
                                        , Convert.ToInt32(dr["electricity"].ToString())
                                        , Convert.ToInt32(dr["extraFee"].ToString()));
                }
                return btm;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public static List<ExtraTBL> getExtras(int roomNumber, DateTime date)
        {
            try
            {
                string currentMonth = date.Year + "-" + date.Month + "-01";
                string nextMonth = date.Year + "-" + (date.Month+1) + "-01"; ;
                if (date.Month == 12)
                {
                    nextMonth = (date.Year+1) + "-01-01";
                }
                string sqlSelect = @"select * from ExtraTBL where roomNumber="+roomNumber 
                                    + @"and extraDate>='"+ currentMonth + @"' 
                                    and extraDate<'" + nextMonth + "'";
                DataTable dt = getDataBySQL(sqlSelect);
                List<ExtraTBL> exList = new List<ExtraTBL>();
                foreach (DataRow dr in dt.Rows)
                {
                    exList.Add(new ExtraTBL(Convert.ToInt32(dr["extraID"].ToString())
                                        , Convert.ToInt32(dr["roomNumber"].ToString())
                                        , dr["productName"].ToString()
                                        , Convert.ToInt32(dr["quantity"].ToString())
                                        , Convert.ToInt32(dr["pricePerProduct"].ToString())
                                        , dr["detail"].ToString()
                                        , Convert.ToDateTime(dr["extraDate"].ToString())));
                }
                return exList;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public static void createNewExtra(ExtraTBL extraTBL)
        {
            DateTime td = DateTime.Today;
            string sql = @"  insert into ExtraTBL(roomNumber, productName, quantity,pricePerProduct,detail,extraDate) 
                            values(@roomNumber,@productName,@quantity,@pricePerProduct,@detail,'" + td.Year + "-" + td.Month + "-" + td.Day + "')";
            SqlParameter roomNumberParam = new SqlParameter("@roomNumber", SqlDbType.Int);
            roomNumberParam.Value = extraTBL.RoomNumber;
            SqlParameter productNameParam = new SqlParameter("@productName", SqlDbType.NVarChar);
            productNameParam.Value = extraTBL.ExtraName;
            SqlParameter quantityParam = new SqlParameter("@quantity", SqlDbType.Int);
            quantityParam.Value = extraTBL.ExtraNumber;
            SqlParameter pricePerProductParam = new SqlParameter("@pricePerProduct", SqlDbType.Int);
            pricePerProductParam.Value = extraTBL.Price;
            SqlParameter detailParam = new SqlParameter("@detail", SqlDbType.NVarChar);
            detailParam.Value = extraTBL.Detail;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(roomNumberParam);
            command.Parameters.Add(productNameParam);
            command.Parameters.Add(quantityParam);
            command.Parameters.Add(pricePerProductParam);
            command.Parameters.Add(detailParam);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }


        public static void updateExtraBill(ExtraTBL extraTBL)
        {
            string date = extraTBL.ExtraDate.Year + "-" + extraTBL.ExtraDate.Month + "-01";
            if (!billIsExist(extraTBL.RoomNumber, date))
            {
                createNewBill(extraTBL.RoomNumber, date);
            }
            DateTime dt = extraTBL.ExtraDate;
            string currentMonth = dt.Year + "-" + dt.Month + "-01";
            string nextMonth = dt.Year + "-" + (dt.Month + 1) + "-01"; ;
            if (dt.Month == 12)
            {
                nextMonth = (dt.Year + 1) + "-01-01";
            }
            string sql = @" UPDATE BillTBL
                            SET extraFee = (SELECT SUM(pricePerProduct*quantity) as result
				                            FROM ExtraTBL
				                            where roomNumber=1 and extraDate>='"+currentMonth+ @"' and extraDate<'" + nextMonth + @"')
                            where roomNumber=" + extraTBL.RoomNumber + " and monthBill='" + currentMonth + "'";
            
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static List<BillTBL> getListBillbyRoomID(int roomID)
        {

            try
            {
                string sqlSelect = @"SELECT *
                                    FROM BillTBL
                                    where roomNumber=" + roomID;
                DataTable dt = getDataBySQL(sqlSelect);
                List<BillTBL> billList = new List<BillTBL>();

                foreach (DataRow dr in dt.Rows)
                {
                    billList.Add(new BillTBL(getRoomPriceByRoomNumber(roomID)
                                        ,roomID
                                        , Convert.ToInt32(dr["defaultFee"].ToString())
                                        , Convert.ToInt32(dr["electricity"].ToString())
                                        , Convert.ToInt32(dr["extraFee"].ToString())
                                        , Convert.ToDateTime(dr["monthBill"].ToString())));
                }
                return billList;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        #endregion
        #region ThoanNV
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
        public static RoomDetailModel getRoomDetailById(int id)
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

                        optional = Convert.ToBoolean(dr2["optional"]);
                        closed = Convert.ToBoolean(dr2["closed"]);
                    }

                    List<int> idMembers = new List<int>();
                    sqlSelect = "select * from CustomerTBL where roomNumber=" + roomNumber;
                    DataTable dt3 = getDataBySQL(sqlSelect);
                    foreach (DataRow dr3 in dt3.Rows)
                    {
                        idMembers.Add(Convert.ToInt32(dr3["customerID"]));
                    }
                    DateTime td = DateTime.Today;
                    int bill = getTotalBill(roomNumber, td.Year + "-" + td.Month + "-01");
                    roomDetailModel = new RoomDetailModel(roomNumber, optional, closed, bill, idMembers, available);


                    //        NOTE bill = 0


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

        public static void createNoti(string title, string content, DateTime date)
        {
            string sql = @"insert into Notification Values (@tt, @ct, @date)";
            SqlParameter param1 = new SqlParameter("@tt", SqlDbType.VarChar);
            param1.Value = title;
            SqlParameter param2 = new SqlParameter("@ct", SqlDbType.VarChar);
            param2.Value = content;
            SqlParameter param3 = new SqlParameter("@date", SqlDbType.Date);
            param3.Value = date;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Parameters.Add(param3);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }


        public static void updateTypeRoom(int RoomID, int price)
        {
            string sql = @"update RoomTypeTBL set price = @price  where roomTypeID = @roomID";
            SqlParameter param1 = new SqlParameter("@price", SqlDbType.Int);
            param1.Value = price;
            SqlParameter param2 = new SqlParameter("@roomID", SqlDbType.Int);
            param2.Value = RoomID;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static List<int> getRoomNumberAvailable()
        {
            List<int> arr = new List<int>();
            try
            {
                string query = "select roomNumber from RoomInfoTBL where available = 1";
                DataTable dt = getDataBySQL(query);
                foreach (DataRow dr in dt.Rows)
                {
                    arr.Add(Convert.ToInt32(dr["roomNumber"].ToString()));
                }

            }
            catch (Exception e)
            {
                throw e;
            }

            return arr;
        }


        public static bool getAvailableRoom(int roomNumber)
        {
            bool available = false;
            try
            {
                string query = query = "select available from RoomInfoTBL where roomNumber =" + roomNumber;
                DataTable dt = getDataBySQL(query);
                foreach (DataRow dr in dt.Rows)
                {
                    available = Convert.ToBoolean(dr["available"].ToString());
                }

            }
            catch (Exception e)
            {
                throw e;
            }

            return available;
        }

        public static void updateCustomer(int id, string name, string card, string phone, string parent, int roomNumber, string date)
        {

            string sql = @"update CustomerTBL set roomNumber = @roomNumber,
                customerName = @cusName,
                identityCard = @card,
                phoneNumber = @phoneNumber,
                parentsPhoneNumber = @parentPhoneNumber,
                dateJoin = @dateJoin where customerID = @cusID";
            SqlParameter param1 = new SqlParameter("@roomNumber", SqlDbType.Int);
            param1.Value = roomNumber;
            SqlParameter param2 = new SqlParameter("@cusName", SqlDbType.NVarChar);
            param2.Value = name;
            SqlParameter param3 = new SqlParameter("@card", SqlDbType.VarChar);
            param3.Value = card;
            SqlParameter param4 = new SqlParameter("@phoneNumber", SqlDbType.VarChar);
            param4.Value = phone;
            SqlParameter param5 = new SqlParameter("@parentPhoneNumber", SqlDbType.VarChar);
            param5.Value = parent;
            SqlParameter param6 = new SqlParameter("@dateJoin", SqlDbType.Date);
            param6.Value = date;
            SqlParameter param7 = new SqlParameter("@cusID", SqlDbType.Int);
            param7.Value = id;

            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Parameters.Add(param3);
            command.Parameters.Add(param4);
            command.Parameters.Add(param5);
            command.Parameters.Add(param6);
            command.Parameters.Add(param7);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();

        }

        public static void changeNumpersonRoom(int roomNumber, int value)
        {
            string sql = @"update RoomInfoTBL set numPerson = numPerson + @value where roomNumber = @roomNumber";
            SqlParameter param1 = new SqlParameter("@value", SqlDbType.Int);
            param1.Value = value;
            SqlParameter param2 = new SqlParameter("@roomNumber", SqlDbType.Int);
            param2.Value = roomNumber;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static void changeAvailble(int roomNumber, int status)
        {
            string sql = @"update RoomInfoTBL set available = @status where roomNumber = @roomNumber";
            SqlParameter param1 = new SqlParameter("@status", SqlDbType.Int);
            param1.Value = status;
            SqlParameter param2 = new SqlParameter("@roomNumber", SqlDbType.Int);
            param2.Value = roomNumber;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();
        }

        public static int getNumPersoninRoom(int roomNumber)
        {
            int numPerson = 0;
            try
            {
                string query = "select numPerson from RoomInfoTBL where roomNumber =" + roomNumber;
                DataTable dt = getDataBySQL(query);
                foreach (DataRow dr in dt.Rows)
                {
                    numPerson = Convert.ToInt32(dr["numPerson"]);
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return numPerson;
        }
        public static string getNameByUserId(int userID)
        {
            string name = "";
            try
            {
                string query = "select * from CustomerTBL where customerID=" + userID;
                DataTable dt = getDataBySQL(query);
                foreach (DataRow dr in dt.Rows)
                {
                    name = dr["customerName"].ToString();
                }

            }
            catch (Exception e)
            {
                throw e;
            }

            return name;
        }

        public static void updateRoomInFo(int RoomNumber, int RoomTypeID)
        {
            string sql = @"update RoomInfoTBL set roomTypeID = @roomTypeID where roomNumber = @roomNumber";
            SqlParameter param1 = new SqlParameter("@roomTypeID", SqlDbType.Int);
            param1.Value = RoomTypeID;
            SqlParameter param2 = new SqlParameter("@roomNumber", SqlDbType.Int);
            param2.Value = RoomNumber;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();

        }

        public static int getRoomNumber(int customerID)
        {
            int roomNumber = 0;
            try
            {
                string query = "select roomNumber from CustomerTBL where customerID =" + customerID;
                DataTable dt = getDataBySQL(query);
                foreach (DataRow dr in dt.Rows)
                {
                    roomNumber = Convert.ToInt32(dr["roomNumber"]);
                }

            }
            catch (Exception e)
            {
                throw e;
            }

            return roomNumber;
        }

        public static void changeNumperson(int roomNumber, int value)
        {
            string sql = @"update RoomInfoTBL set numPerson = numPerson + @value where roomNumber = @roomNumber";
            SqlParameter param1 = new SqlParameter("@value", SqlDbType.Int);
            param1.Value = value;
            SqlParameter param2 = new SqlParameter("@roomNumber", SqlDbType.Int);
            param2.Value = roomNumber;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();

        }

        public static void removeCustomer(int customerID)
        {
            string sql = @"delete from CustomerTBL where customerID = @cusID";
            SqlParameter param1 = new SqlParameter("@cusID", SqlDbType.Int);
            param1.Value = customerID;
            SqlCommand command = new SqlCommand(sql, getConnection());
            command.Parameters.Add(param1);
            command.Connection.Open();
            int i = command.ExecuteNonQuery();
            command.Connection.Close();

            sql = @"delete from LoginTBL where customerID = @cusID";
            SqlParameter param2 = new SqlParameter("@cusID", SqlDbType.Int);
            param2.Value = customerID;
            SqlCommand command2 = new SqlCommand(sql, getConnection());
            command2.Parameters.Add(param2);
            command2.Connection.Open();
            int i2 = command2.ExecuteNonQuery();
            command2.Connection.Close();
        }
        #endregion

        //get account by user id (contain id name password)
        public static LoginModel getAccountByID(int id)
        {
            List<RoomTypeTBL> arr = new List<RoomTypeTBL>();
            LoginModel lg = null;
            try
            {
                string sqlSelect = @"select * from LoginTBL where LoginTBL.customerID = @ID";
                SqlCommand myCommand = new SqlCommand(sqlSelect, getConnection());
                myCommand.Connection.Open();
                myCommand.Parameters.Add("@ID", SqlDbType.Int);
                myCommand.Parameters["@ID"].Value = id;
                SqlDataReader myReader = myCommand.ExecuteReader();
                if (myReader.HasRows)
                {
                    while (myReader.Read())
                    {
                        lg = new LoginModel(Convert.ToInt32(myReader["customerID"].ToString()),
                            myReader["uname"].ToString(), myReader["psw"].ToString());
                    }
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return lg;
        }

        //function order detail to edit update(quantity by orderID and productID)
        public static int updatePassWord(int id, string psw)
        {
            int insertSuccessRecord = 0;
            try
            {
                string squeryInsert = @"update LoginTBL set psw =@passWord  where customerID =@ID";
                SqlCommand myCommand = new SqlCommand(squeryInsert, getConnection());
                myCommand.Connection.Open();
                myCommand.Parameters.Add("@ID", SqlDbType.Int);
                myCommand.Parameters["@ID"].Value = id;
                myCommand.Parameters.Add("@passWord", SqlDbType.VarChar);
                myCommand.Parameters["@passWord"].Value = psw;
                insertSuccessRecord += myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new System.Exception(ex.Message);
            }
            return insertSuccessRecord;
        }
        //get list notification 
        public static List<NotificationTBL> getListNotification()
        {
            List<NotificationTBL> arr = new List<NotificationTBL>();
            NotificationTBL lg = null;
            try
            {
                string sqlSelect = @"select * from Notification";
                SqlCommand myCommand = new SqlCommand(sqlSelect, getConnection());
                myCommand.Connection.Open();
                SqlDataReader myReader = myCommand.ExecuteReader();
                if (myReader.HasRows)
                {
                    while (myReader.Read())
                    {
                        DateTime d = Convert.ToDateTime(myReader["DateCreated"].ToString());
                        lg = new NotificationTBL(Convert.ToInt32(myReader["NotificationID"].ToString()), myReader["Title"].ToString()
                            , myReader["Detail"].ToString(), d);
                        arr.Add(lg);
                    }
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return arr;
        }
        //get notification by ID 
        public static NotificationTBL getNotificationByID(int id)
        {
            NotificationTBL lg = null;
            try
            {
                string sqlSelect = @"select * from Notification no where no.NotificationID = @ID";
                SqlCommand myCommand = new SqlCommand(sqlSelect, getConnection());
                myCommand.Connection.Open();
                myCommand.Parameters.Add("@ID", SqlDbType.Int);
                myCommand.Parameters["@ID"].Value = id;
                SqlDataReader myReader = myCommand.ExecuteReader();
                if (myReader.HasRows)
                {
                    while (myReader.Read())
                    {
                        DateTime d = Convert.ToDateTime(myReader["DateCreated"].ToString());
                        lg = new NotificationTBL(Convert.ToInt32(myReader["NotificationID"].ToString()), myReader["Title"].ToString()
                            , myReader["Detail"].ToString(), d);
                    }
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            return lg;
        }
    }
}









