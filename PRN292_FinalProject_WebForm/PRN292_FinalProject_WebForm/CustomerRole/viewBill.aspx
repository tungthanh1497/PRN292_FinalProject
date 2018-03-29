<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewBill.aspx.cs" Inherits="PRN292_FinalProject_WebForm.viewBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS_Style/Home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="backGround">

            <h1>Welcome to Boarding House</h1>
            <u><a class="colorGreen" href="customerInfo.aspx">Information</a></a></u> &nbsp
         <u><a class="colorGreen" href="">View Bill</a></a></u>&nbsp
         <u><a class="colorGreen" href="CutomerNotification.aspx">Notification</a></a></u>&nbsp
         <u><a class="colorGreen" href>Change Password</a></a></u>&nbsp
         <u><a class="colorGreen" href>Sign out</a></a></u>&nbsp
            <h2 class="colorBlue">View Bill</h2>
            <br />
            <asp:GridView ID="gvBills" runat="server"></asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
