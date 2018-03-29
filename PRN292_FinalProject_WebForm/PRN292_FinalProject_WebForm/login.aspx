<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PRN292_FinalProject_WebForm.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="/CSS_Style/Home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h1>Welcome to Boarding House</h1>
        <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="5">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUname" runat="server" Text="Username:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPsw" runat="server" Text="Password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPsw" TextMode="Password" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button CssClass="buttonSubmit" ID="btnLogin" runat="server" Text="Button" OnClick="btnLogin_Click"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
