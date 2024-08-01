<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Add_Client.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Add_Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <div class="container w-75 mt-4 mb-4" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Add Client</h1>
            </div>
            <div class="col-md-6">
                <div class="form-floating mb-2 mb-md-0"> 
                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter your Name" TabIndex="1"></asp:TextBox>
                    <label for="txtName">Name</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredName" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:DropDownList ID="GenderDDL" runat="server" CssClass="form-control " TabIndex="3">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <label for="GenderDDL">Gender </label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredGender" ControlToValidate="GenderDDL" Display="Dynamic" ErrorMessage="Gender is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Gender"  ValidationGroup="a"  />

                </div>
                <br />
                 <div class="form-floating mb-2 mb-md-0"> 
                      <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter Address" TabIndex="6"></asp:TextBox>
                    <label for="txtAddress">Address</label>
                    <asp:RequiredFieldValidator ID="RequiredAddress" ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Address" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               
                     </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                     <asp:FileUpload ID="ClientImage" runat="server" class="form-control pb-2 ps-5" TabIndex="5" placeholder="Upload Client Image" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="ClientImage">Upload Client Image</label>
              
                   
                </div>
                <br />

            </div>
            <div class="col-md-6">

                <div class="form-floating">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="name@example.com" TabIndex="2"></asp:TextBox>
                    <label for="txtEmail">Email address</label>
                    <asp:RequiredFieldValidator ID="RequiredEmail"  ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularEmail" ValidationGroup="a"  Display="Dynamic" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtProfession" runat="server" class="form-control" placeholder="Enter Profession" TabIndex="4"></asp:TextBox>
                    <label for="txtProfession">Profession</label>
                    <asp:RequiredFieldValidator ID="RequiredProfession" runat="server" ValidationGroup="a"  Display="Dynamic" ErrorMessage="Please Enter Profession " ControlToValidate="txtProfession" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" Height="140px" placeholder="Enter Message" TabIndex="7"></asp:TextBox>
                    <label for="txtMessage">Message</label>
                    <asp:RequiredFieldValidator ID="RequiredMessage" ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Message" ControlToValidate="txtMessage" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />

            </div>
          

        </div>
        <div class="row justify-content-center ">
            <div class="col-md-4 justify-content-center">
                <asp:Button ID="btnAddClient" runat="server" Width="75%" Text="Add Client" CssClass="btn btn-primary btn-block mb-4" OnClick="btnAddClient_Click" ValidationGroup="a"    TabIndex="8"/>

            </div>
            <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnResetClient" runat="server" Width="75%" Text="Reset" CssClass="btn btn-primary btn-block mb-4" OnClick="btnResetClient_Click" TabIndex="9"  />

            </div>
             <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnCancleProperty" runat="server" Width="75%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleProperty_Click" TabIndex="10" />

            </div>
        </div>

    </div>
</asp:Content>
