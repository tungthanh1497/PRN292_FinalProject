<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customersManage.aspx.cs" Inherits="PRN292_FinalProject_WebForm.customersManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 706px">
        
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
        <asp:GridView ID="gvCustomer" runat="server" Height="654px" Width="1143px" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="gvCustomer_PageIndexChanging" >
            <Columns>
                <asp:BoundField HeaderText ="Customer ID"  DataField="CustomerID" />
                <asp:BoundField HeaderText ="Customer Name" DataField="CustomerName" />
                <asp:BoundField HeaderText ="Identify Card" DataField="IdentityCard" />
                <asp:BoundField HeaderText ="Phone Number" DataField="PhoneNumber" />
                <asp:BoundField HeaderText ="Date Join" DataField="DateJoin" />
                <asp:BoundField HeaderText ="Parent's Phone" DataField="ParentsPhoneNumber" />
                <asp:BoundField HeaderText ="Room Number" DataField="RoomNumber" />
                <asp:HyperLinkField DataNavigateUrlFields="CustomerID" DataNavigateUrlFormatString="editCustomer.aspx?customerID={0}" Text="Edit" />         
            </Columns>
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
