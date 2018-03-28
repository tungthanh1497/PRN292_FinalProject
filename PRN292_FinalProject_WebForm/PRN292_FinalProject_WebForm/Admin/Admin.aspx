<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PRN292_FinalProject_WebForm.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
    <div style="height: 706px">
        
        <asp:HyperLink NavigateUrl="Admin.aspx" ID="hplRoomManage" runat="server">Room Manage</asp:HyperLink>
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
        <asp:GridView ID="gvAdmin" runat="server" Height="654px" Width="1143px" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="gvAdmin_PageIndexChanging" >
            <Columns>
                <asp:BoundField HeaderText ="Room Number"  DataField="RoomNumber" />
                <asp:BoundField HeaderText ="Number of Person" DataField="NumPerson" />
                <asp:CheckBoxField ShowHeader="true" HeaderText ="Optional" DataField="Optional"  />
                <asp:CheckBoxField ShowHeader="true" HeaderText ="Closed" DataField="Closed" />
                <asp:CheckBoxField ShowHeader="true" HeaderText ="Available" DataField="Available" />      
                <asp:HyperLinkField DataNavigateUrlFields="RoomNumber" DataNavigateUrlFormatString="roomDetail.aspx?roomID={0}" Text="Detail" />   
                <asp:HyperLinkField DataNavigateUrlFields="RoomNumber" DataNavigateUrlFormatString="createExtra.aspx?roomID={0}" Text="Add Extra" />         
            </Columns>
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
