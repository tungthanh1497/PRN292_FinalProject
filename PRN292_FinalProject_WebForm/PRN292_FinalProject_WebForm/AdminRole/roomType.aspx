<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomType.aspx.cs" Inherits="PRN292_FinalProject_WebForm.roomType" %>

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
        <asp:GridView ID="gvRoomType" runat="server" Height="654px" Width="1143px" AutoGenerateColumns="false" >
            <Columns>
                <asp:BoundField HeaderText ="Room Type"  DataField="RoomTypeID" />
                <asp:BoundField HeaderText ="Price" DataField="Price" />                
                <asp:CheckBoxField ShowHeader="true" HeaderText ="Optional" DataField="Optional"  ReadOnly="True" />
                <asp:CheckBoxField ShowHeader="true" HeaderText ="Closed" DataField="Closed"  ReadOnly="True" />
                <asp:HyperLinkField DataNavigateUrlFields="RoomTypeID" DataNavigateUrlFormatString="editRoomType.aspx?roomTypeID={0}" Text="Edit Price" />         
            </Columns>
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
