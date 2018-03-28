<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editCustomer.aspx.cs" Inherits="PRN292_FinalProject_WebForm.editCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 706px" id="displayDiv">
        
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

        <asp:Table ID="Table1" runat="server" Height="395px" Width="650px">
            
            <asp:TableRow>
                <asp:TableCell>Current room</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbCurrenRoom" runat="server" ReadOnly="True"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

             <asp:TableRow>
                <asp:TableCell>Customer ID</asp:TableCell>
                <asp:TableCell>
                   <asp:TextBox ID="tbCID" runat="server"  ReadOnly="True"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Customer Name</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbCName" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Indentify Card</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbCard" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Phone Number</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbPhoneNumber" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Date Join</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbDate" runat="server"  ReadOnly="True"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Parents's Phone Number</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbParentPhone" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Room Number</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="dlRoomAvailble" runat="server"></asp:DropDownList> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>    </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnDeleteCus" runat="server" Text="Remove Customer" OnClick="btnDeleteCus_Click"/>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>
        <asp:Panel ID="Panel1" runat="server" Height="119px" style="margin-top: 0px" Visible="False">
            <asp:Label ID="Label2" runat="server" Text="Do you want to remove this Customer?"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnNo" runat="server" Text="No" Width="40px" OnClick="btnNo_Click" />
        </asp:Panel>
        
        <br />
        &nbsp;<br />
        <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click" />
    </div>
        
    </form>
</body>
</html>
