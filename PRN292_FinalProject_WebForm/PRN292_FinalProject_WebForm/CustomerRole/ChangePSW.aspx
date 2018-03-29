<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePSW.aspx.cs" Inherits="PRN292_FinalProject_WebForm.ChangePSW" %>

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

            <h2 class="colorBlue">Change Password</h2>
            <br />
            <table class="table">
                <tr>
                    <td class="colorBlue">Account: </td>
                    <td>
                        <asp:Label ID="lblAccName" runat="server" Width="230px"></asp:Label>
                        <label id="lbAccount"></label>

                    </td>
                </tr>
                <tr>
                    <td class="colorBlue">Old Password: </td>
                    <td>
                        <input name="txtOldPSW" type="password" width="225px" placeholder="Enter Old Password" />
                    </td>
                </tr>
                <tr>
                    <td class="colorBlue">New Password: </td>
                    <td>
                        <%--<asp:TextBox ID="txtNewPSW" runat="server" Width="223px"></asp:TextBox>--%>
                        <input name="txtNewPSW" type="password" width="225px" placeholder="Enter new password" />
                    </td>
                </tr>
                <tr>
                    <td class="colorBlue">Re enter Password: </td>
                    <td>
                        <%--                        <asp:TextBox ID="txtRePSW" runat="server" Width="222px"></asp:TextBox>--%>
                        <input name="txtRePSW" type="password" width="225px" placeholder="Enter re new password" />
                    </td>
                </tr>
            </table>
            <br />
            <button class="buttonSubmit" type="submit">Confirm</button>
            <br />
            <br />
            <asp:TextBox CssClass="activeNotify" ID="warning" runat="server" ReadOnly="True" Width="348px" Visible="False"></asp:TextBox>
            <asp:TextBox CssClass="activeSuccess" ID="successfully" runat="server" ReadOnly="True" Width="346px" Visible="False"></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>
