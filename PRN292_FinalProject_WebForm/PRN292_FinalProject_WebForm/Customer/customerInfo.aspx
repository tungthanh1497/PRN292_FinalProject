<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerInfo.aspx.cs" Inherits="PRN292_FinalProject_WebForm.Customer.customerInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:HyperLink NavigateUrl="#" ID="hplRoomInfo" runat="server">Room Info</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="#" ID="hplCustomerManage" runat="server">Customers Manage</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="#" ID="hplRoomType" runat="server">Room Type</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="#" ID="hplCreateNotification" runat="server">Create Notification</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="#" ID="hplLogout" runat="server">Log out</asp:HyperLink>
        <br />
        <br />

        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>Customer Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Identify Card:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblIdentifyCard" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Phone Number:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblPhoneNumber" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Parents' Phone:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblParentsPhone" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Join Date :</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblJoinDate" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Room Number:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRoomNumber" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Room Price:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRoomPrice" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Room Type:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRoomType" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Number of Roomates:</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblNumRoomates" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    
    </div>
    </form>
</body>
</html>
