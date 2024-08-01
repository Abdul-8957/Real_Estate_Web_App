<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Add_Agent.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Add_Agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function allowCharacter() {
            if (System.Text.RegularExpressions.Regex.IsMatch(txtName.Text, "^[a-zA-Z]+$")) {

            }
            else {
                txtName.Text = txtName.Text.Remove(txtName.Text.Length - 1);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container w-75 mt-4 mb-4" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Add Agent</h1>
              
            </div>
            <div class="col-md-4 mb-4">
                <div class="form-floating mb-2 mb-md-0">
                    
                    <asp:TextBox ID="txtName" runat="server" class="form-control" TabIndex="1" placeholder="Enter your Name" onKeypress="allowCharacter()"></asp:TextBox>
                    <label for="txtName">Name</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredName" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
            </div>
             <div class="col-md-4">
                <div class="form-floating">
                    <asp:DropDownList ID="GenderDDL" runat="server" CssClass="form-control" TabIndex="2">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <label for="GenderDDL">Gender </label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredGender"  ControlToValidate="GenderDDL"  Display="Dynamic" ErrorMessage="Gender is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Gender"  ValidationGroup="a"  />

                </div>
            </div>
             <div class="col-md-4">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtMobileNo" runat="server" class="form-control" TabIndex="3" MaxLength="10" placeholder="Enter Mobile No."></asp:TextBox>
                    <label for="txtMobileNo">Mobile No.</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Mobile No. is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
            </div>
            <div class="col-md-6">
               

                 <div class="form-floating">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="name@example.com" TabIndex="4"></asp:TextBox>
                    <label for="txtEmail">Email address</label>
                    <asp:RequiredFieldValidator ID="RequiredEmail"  ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularEmail" ValidationGroup="a"  Display="Dynamic" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                </div>
                
                <br />
                <div class="form-floating mb-2 mb-md-0">
                     
                    <asp:TextBox ID="txtInstagramAccount" runat="server" class="form-control" TabIndex="6" placeholder="Enter  Instagram Account"></asp:TextBox>
                    <label for="txtInstagramAccount">Instagram Account</label>
                    <asp:RequiredFieldValidator ID="RequiredInstagramAccount" ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Instagram Account " ControlToValidate="txtInstagramAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">

                    <asp:TextBox ID="txtTwitterAccount" runat="server" class="form-control" TabIndex="8" placeholder="Enter Twitter Account"></asp:TextBox>
                    <label for="txtTwitterAccount">Twitter Account</label>
                    <asp:RequiredFieldValidator ID="RequiredTwitterAccount" ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Twitter Account " ControlToValidate="txtTwitterAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />

            </div>
            <div class="col-md-6">

               

                <div class="form-floating">
                    <asp:TextBox ID="txtDesignation" runat="server" class="form-control" placeholder="Enter Designation" TabIndex="5"></asp:TextBox>
                    <label for="txtDesignation">Designations</label>
                    <asp:RequiredFieldValidator ID="RequiredDesignation" runat="server" ValidationGroup="a"  Display="Dynamic" ErrorMessage="Please Enter Designation " ControlToValidate="txtDesignation" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtFacebookAccount" runat="server" class="form-control" placeholder="Enter Facebook Account" TabIndex="7"></asp:TextBox>
                    <label for="txtFacebookAccount">Facebook Account</label>
                    <asp:RequiredFieldValidator ID="RequiredFacebookAccount" runat="server" ValidationGroup="a"  Display="Dynamic" ErrorMessage="Please Enter Facebook Account " ControlToValidate="txtFacebookAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />

                <div class="form-floating">
                    <asp:FileUpload ID="AgentImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload Agent Image" TabIndex="9" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="AgentImage">Upload Agent Image</label>
                </div>
                <br />
            </div>
            <div class="col-md-12">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter Full Address" TabIndex="10"></asp:TextBox>
                    <label for="txtAddress">Full Address</label>
                    <asp:RequiredFieldValidator ID="RequiredAddress" ValidationGroup="a"  runat="server" Display="Dynamic" ErrorMessage="Please Enter Full Address" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

        </div>
        <div class="row justify-content-center ">
            <div class="col-md-4 justify-content-center">
                <asp:Button ID="btnAddAgent" runat="server" Width="75%" Text="Add Agent" CssClass="btn btn-primary btn-block mb-4" OnClick="btnAddAgent_Click"  ValidationGroup="a" TabIndex="11"   />

            </div>
            <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnResetAgent" runat="server" Width="75%" Text="Reset" CssClass="btn btn-primary btn-block mb-4" OnClick="btnResetAgent_Click" TabIndex="12" />

            </div>
             <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnCancleProperty" runat="server" Width="75%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleProperty_Click" TabIndex="13" />

            </div>
           
        </div>

    </div>
</asp:Content>
