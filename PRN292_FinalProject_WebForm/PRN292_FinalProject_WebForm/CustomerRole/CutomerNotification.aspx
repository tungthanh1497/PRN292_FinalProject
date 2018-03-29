<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CutomerNotification.aspx.cs" Inherits="PRN292_FinalProject_WebForm.WebForm1" %>

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
         <u><a class="colorGreen" href="ChangePSW.aspx">Change Password</a></a></u>&nbsp
         <u><a class="colorGreen" href>Sign out</a></a></u>&nbsp
            <h2 class="colorBlue">Notification </h2>
            <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#E3F2FD" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="0px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" ShowHeader="False" Width="425px" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="sdfDate" />
                    <asp:HyperLinkField DataNavigateUrlFields="notificationID" DataTextField="title" DataNavigateUrlFormatString="CutomerNotification.aspx?ID={0}" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#e3f2fd" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:TextBox CssClass="nonoBorder" ID="TextBoxTitle" runat="server" BackColor="#E3F2FD" Width="259px" Visible="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox CssClass="nonoBorder" ID="TextBoxDate" runat="server" BackColor="#E3F2FD" style="margin-bottom: 0px" Width="258px" Visible="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox CssClass="nonoBorder" ID="TextBoxArea" runat="server" BackColor="#E3F2FD" Height="79px" Visible="False" Width="432px" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <br />
            
            <br />
            <br />
        </div>
    </form>
</body>
</html>
