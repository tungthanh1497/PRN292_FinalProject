<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editRoomType.aspx.cs" Inherits="PRN292_FinalProject_WebForm.editRoomType" %>

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

        <asp:Table ID="Table1" runat="server" Height="395px" Width="650px">
            
            <asp:TableRow>
                <asp:TableCell>Room Type ID</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbID" runat="server"></asp:TextBox> 
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
                <asp:TableCell>Note</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbNote" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Price</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        <br />
        &nbsp;<br />
        <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click" />
    </div>
    </form>
</body>
</html>
