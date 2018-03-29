﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomDetail.aspx.cs" Inherits="PRN292_FinalProject_WebForm.roomDetail" %>

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
        <asp:HyperLink NavigateUrl="Admin.aspx" ID="hplLogout" runat="server">Log out</asp:HyperLink>
        <br />
        <br />

        <asp:Table ID="Table1" runat="server" Height="395px" Width="650px">
            
            <asp:TableRow>
                <asp:TableCell>Room Number</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbRoomNumber" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Member(s):</asp:TableCell>
                <asp:TableCell>
                    <asp:HyperLink ID="customer1" runat="server"></asp:HyperLink><br />
                    <asp:HyperLink ID="customer2" runat="server"></asp:HyperLink><br />
                    <asp:HyperLink ID="customer3" runat="server"></asp:HyperLink><br />
                </asp:TableCell>
            </asp:TableRow>

             <asp:TableRow>
                <asp:TableCell>Optional</asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="cbOption" runat="server" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Closed</asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="cbClosed" runat="server" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Available</asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="cbAvailable" runat="server" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Bills in month</asp:TableCell>
                <asp:TableCell>
                    <asp:HyperLink ID="hplBillInMonth" runat="server"></asp:HyperLink>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        <br />
        &nbsp;<br />
        <asp:Button ID="btnSave" runat="server"  Text="Save Change" OnClick="btnSave_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
