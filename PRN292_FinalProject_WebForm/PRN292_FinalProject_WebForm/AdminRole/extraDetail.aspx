<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="extraDetail.aspx.cs" Inherits="PRN292_FinalProject_WebForm.AdminRole.extraDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="/CSS_Style/Home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 706px">
         <h1>Welcome to Boarding House</h1>
        <asp:HyperLink NavigateUrl="roomManage.aspx" ID="hplRoomManage" runat="server">Room Manage</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="customersManage.aspx" ID="hplCustomerManage" runat="server">Customers Manage</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="roomType.aspx" ID="hplRoomType" runat="server">Room Type</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="createNoti.aspx" ID="hplCreateNotification" runat="server">Create Notification</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="../login.aspx" ID="hplLogout" runat="server">Log out</asp:HyperLink>
        <br />
        <br />

        <asp:GridView ID="gvExtras" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
