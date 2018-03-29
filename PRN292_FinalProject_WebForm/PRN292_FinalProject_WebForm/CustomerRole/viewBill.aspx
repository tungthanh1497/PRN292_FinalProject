<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewBill.aspx.cs" Inherits="PRN292_FinalProject_WebForm.viewBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS_Style/Home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="backGround">

            <h1>Welcome to Boarding House</h1>
            <asp:HyperLink CssClass="colorGreen" NavigateUrl="customerInfo.aspx" ID="hplRoomInfo" runat="server">Information</asp:HyperLink>
            &nbsp;&nbsp;<asp:HyperLink CssClass="colorGreen" NavigateUrl="#" ID="hplViewBill" runat="server">View Bill</asp:HyperLink>
            &nbsp;&nbsp;
        <asp:HyperLink CssClass="colorGreen" NavigateUrl="CutomerNotification.aspx" ID="hplRoomType" runat="server">Notification</asp:HyperLink>
            &nbsp;&nbsp;
        <asp:HyperLink CssClass="colorGreen" NavigateUrl="ChangePSW.aspx" ID="hplCreateNotification" runat="server">Change Password</asp:HyperLink>
            &nbsp;&nbsp;
        <asp:HyperLink CssClass="colorGreen" NavigateUrl="../login.aspx" ID="hplLogout" runat="server">Log out</asp:HyperLink>
            <br />
            <br />

            <h2 class="colorBlue">View Bill</h2>
            <br />
            <asp:GridView ID="gvBills" runat="server"></asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
