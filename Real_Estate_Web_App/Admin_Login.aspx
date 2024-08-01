<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Real_Estate_Web_App.Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container-fluid header bg-white row p-0 g-0 mb-0  align-items-center" style="background-image: url(../img/about.jpg); height:700px; background-repeat: no-repeat; background-size:cover;">

        <div class="col-md-4 mx-auto my-5 text-center card shadow-lg border-0 rounded-lg mt-5 " style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 5px;">
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

</asp:Content>
