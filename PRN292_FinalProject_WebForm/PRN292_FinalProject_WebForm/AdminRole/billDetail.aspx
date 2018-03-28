<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="billDetail.aspx.cs" Inherits="PRN292_FinalProject_WebForm.Admin.billDetail" %>

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

        <asp:Table ID="Table1" runat="server" Height="395px" Width="650px">
            
            <asp:TableRow>
                <asp:TableCell>Room Price</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRoomPrice" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Default Fee:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDefaultFee" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

             <asp:TableRow>
                <asp:TableCell>Electricity:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblElectricity" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Extra Fee</asp:TableCell>
                <asp:TableCell>
                    <asp:HyperLink ID="hplExtraFee" runat="server"></asp:HyperLink>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
