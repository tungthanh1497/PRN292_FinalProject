<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createNoti.aspx.cs" Inherits="PRN292_FinalProject_WebForm.createNoti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 706px">
        
        <asp:HyperLink NavigateUrl="~/Admin.aspx" ID="hplRoomManage" runat="server">Room Manage</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="~/customersManage.aspx" ID="hplCustomerManage" runat="server">Customers Manage</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="~/roomType.aspx" ID="hplRoomType" runat="server">Room Type</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="~/createNoti.aspx" ID="hplCreateNotification" runat="server">Create Notification</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink NavigateUrl="~/Admin.aspx" ID="hplLogout" runat="server">Log out</asp:HyperLink>
        <br />
        <br />

        <asp:Table ID="Table1" runat="server" Height="463px" Width="650px">
            
            <asp:TableRow>
                <asp:TableCell>Notification Title</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

             <asp:TableRow>
                <asp:TableCell>Notification Content</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Date Created</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tbDate" runat="server"></asp:TextBox> 
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        <br />
        <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create" />
        
    </div>
    </form>
</body>
</html>
