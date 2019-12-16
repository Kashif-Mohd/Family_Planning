<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Family_Planning.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Family Planning</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/style.css" />
    <link id="Link1" runat="server" rel="icon" href="~/img/icon.png" type="image/png" />

    <style type="text/css">
        html,
        body {
            height: auto!important;
            min-height: 100vh;
        }

        .auto-style1 {
            height: 45px;
        }
    </style>
</head>

<body class="background" >
    <div class="login-page">
        <div class="form">
            <form class="login-form" id="form1" runat="server">
                <asp:Panel ID="panel1" runat="server">
                    <asp:Login ID="Login1" runat="server" Width="265px" OnAuthenticate="Login1_Authenticate" FailureText="invalid user name or password">
                        <LayoutTemplate>
                            <table style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table  style="width: 265px;">
                                            <tr>
                                                <td align="center" class="auto-style1" style="color: ghostwhite">
                                                    <h2><b>FAMILY PLANNING</b></h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" Width="250px" placeholder="user name"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="250px" placeholder="password"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="LOGIN" ValidationGroup="Login1" Style="background-color: #74b9ff; height: 52px;" Width="250px" Font-Bold="true" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </asp:Panel>
            </form>
        </div>
    </div>


</body>
</html>
