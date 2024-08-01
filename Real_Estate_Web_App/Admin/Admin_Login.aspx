<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.1/dist/sweetalert2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.1/dist/sweetalert2.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <style>
        .bs {
            box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76);
            -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76);
            -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76);
            border-radius: 5px;
        }
    </style>
</head>
<body style="background-image: url(../img/about.jpg); background-repeat: no-repeat; background-size: cover;">
    <form id="form1" runat="server">
        <a href="../Default.aspx" class="btn  ps-3 pe-3 mt-2 ms-2" style="background-color: green; color: white;">Back</a>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mx-auto my-5 bs text-center card shadow-lg border-0 rounded-lg mt-5 ">
                    <div class="jumbotron text-center text-white bg-primary my-2 mt-3 mb-3">
                        <h2>Admin Login</h2>
                    </div>
                    <br />
                    <br />
                    <div class="form-floating mb-3">

                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                        <label for="txtEmail">Email address</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-floating mb-3">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <label for="txtPassword">Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Please Enter Password" ControlToValidate="txtPassword" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Strong Password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$"></asp:RegularExpressionValidator>--%>

                    </div>
                    <br />
                    <asp:Button ID="btnLogin" class="btn mb-4 " BackColor="Green" ForeColor="white" runat="server" Text="LogIn" OnClick="btnLogin_Click" />
               
                </div>
            </div>
        </div>
  
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
