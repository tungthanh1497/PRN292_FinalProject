<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CutomerNotification.aspx.cs" Inherits="PRN292_FinalProject_WebForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1 {
            font-family: Kunstler Script;
            font-size: 50px;
            color: #0000ff;
        }

        #backGround {
            background-color: #e3f2fd;
        }
        .background{
            background-color: #e3f2fd;
            width: 436px;
        }

        .colorGreen {
            color: forestgreen;
        }

        .colorBlue {
            color: blue;
        }

        .table {
            white-space: 5px;
        }

        #notification {
            width: 500px;
            height: auto;
            border-style: solid;
            border-color: red;
            color: red;
        }

        .buttonSubmit {
            background: #64b5f6;
            border-radius: 12px;
            width: 80px;
            height: 30px;
        }
         .nonoBorder{
            border: none;
        }

        .activeNotify {
            border: solid;
            color: white;
            background-color: red;
            border-color: red;
            border-radius: 12px;
        }

        .activeSuccess {
            border: solid;
            color: blue;
            background-color: aquamarine;
            border-color: aquamarine;
            border-radius: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="backGround">

            <h1>Welcome to Boarding House</h1>
            <u><a class="colorGreen" href="/Customer/customerInfo.aspx">Information</a></a></u> &nbsp
         <u><a class="colorGreen" href="">View Bill</a></a></u>&nbsp
         <u><a class="colorGreen" href="/Customer/CutomerNotification.aspx">Notification</a></a></u>&nbsp
         <u><a class="colorGreen" href="/Customer/ChangePSW.aspx">Change Password</a></a></u>&nbsp
         <u><a class="colorGreen" href>Sign out</a></a></u>&nbsp
            <h2 class="colorBlue">Notification </h2>
            <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#E3F2FD" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="0px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" ShowHeader="False" Width="425px">
                <Columns>
                    <asp:BoundField DataField="sdfDate" />
                    <asp:HyperLinkField DataNavigateUrlFields="notificationID" DataTextField="title" DataNavigateUrlFormatString="/Customer/CutomerNotification.aspx?ID={0}" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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
