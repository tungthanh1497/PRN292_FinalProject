﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePSW.aspx.cs" Inherits="PRN292_FinalProject_WebForm.ChangePSW" %>

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
            <u><a class="colorGreen" href="customerInfo.aspx">Information</a></a></u> &nbsp
         <u><a class="colorGreen" href="">View Bill</a></a></u>&nbsp
         <u><a class="colorGreen" href="CutomerNotification.aspx">Notification</a></a></u>&nbsp
         <u><a class="colorGreen" href>Change Password</a></a></u>&nbsp
         <u><a class="colorGreen" href>Sign out</a></a></u>&nbsp
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
