<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Added_Client.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Added_Client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container w-75 mt-4 mb-4" id="editTextContainer" visible="false" runat="server" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Update Client</h1>
            </div>
            <div class="col-md-12" runat="server" visible="false">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtClientId" runat="server" class="form-control" placeholder=" Client Id"></asp:TextBox>
                    <label for="txtClientId">Client Id</label>
                </div>
                <br />
            </div>

            <div class="col-md-6">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter your Name" TabIndex="1"></asp:TextBox>
                    <label for="txtName">Name</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredName" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:DropDownList ID="GenderDDL" runat="server" CssClass="form-control" TabIndex="3">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <label for="GenderDDL">Gender </label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredGender" ControlToValidate="GenderDDL" Display="Dynamic" ErrorMessage="Gender is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Gender" ValidationGroup="a" />
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:FileUpload ID="ClientImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload Client Image" TabIndex="5" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="ClientImage">Upload Client Image</label>
                </div>
                <br />

            </div>
            <div class="col-md-6">

                <div class="form-floating">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="name@example.com" TabIndex="2"></asp:TextBox>
                    <label for="txtEmail">Email address</label>
                    <asp:RequiredFieldValidator ID="RequiredEmail" ValidationGroup="1" runat="server" Display="Dynamic" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularEmail" ValidationGroup="a" Display="Dynamic" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <br />


                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtProfession" runat="server" class="form-control" placeholder="Enter Profession" TabIndex="4"></asp:TextBox>
                    <label for="txtProfession">Profession</label>
                    <asp:RequiredFieldValidator ID="RequiredProfession" runat="server" ValidationGroup="a" Display="Dynamic" ErrorMessage="Please Enter Profession " ControlToValidate="txtProfession" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter Address" TabIndex="6"></asp:TextBox>
                    <label for="txtAddress">Address</label>
                    <asp:RequiredFieldValidator ID="RequiredAddress" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Address" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />
            </div>

            <div class="col-md-2">

                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:Image ID="imageClient" runat="server" Width="120px" Height="120px" />

                </div>
                <br />
            </div>
            <div class="col-md-10 ">
                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" Height="120px" placeholder="Enter Message" TabIndex="7"></asp:TextBox>
                    <label for="txtMessage">Message</label>
                    <asp:RequiredFieldValidator ID="RequiredMessage" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Message" ControlToValidate="txtMessage" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />

            </div>
            <div class="row justify-content-center ">
                <div class="col-md-5 justify-content-center">
                    <asp:Button ID="btnUpdateClient" runat="server" Text="Update Client" Width="75%" CssClass="btn btn-primary btn-block mb-4 ms-xxl-5" OnClick="btnUpdateClient_Click" TabIndex="8" ValidationGroup="a" />

                </div>
                <div class="col-md-5 justify-content-center ">
                    <asp:Button ID="btnCancleClient" runat="server" Width="75%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleClient_Click" TabIndex="9" />

                </div>
            </div>
            <br />
        </div>

    </div>

    <div class="row ms-2 me-2 mt-4 mb-4" id="detailContainer" runat="server">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-white text-center">Client Details</h1>
        </div>

        <div class="row mb-3">

            <div class="col-md-6 mb-2" style="margin-right: 350px;">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Property"></asp:TextBox>
                    <div class="input-group-append">
                        <button id="btnSearch" class="btn btn-secondary" onserverclick="btnSearch_ServerClick" runat="server" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>

            </div>
            <div class="col-md-2 justify-content-end ">
                <asp:Button runat="server" ID="AddProperty" class="btn btn-outline-primary active" data-bs-toggle="pill" Text="Add Property" OnClick="AddProperty_Click" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblNoRecordFound" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <br />


        <asp:GridView ID="AddedClientGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark" AllowPaging="true" AutoGenerateColumns="False" OnRowUpdating="AddedClientGridView_RowUpdating" OnRowDeleting="AddedClientGridView_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="CLIENT ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Bind("in_client_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ADMIN EMAIL" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="laemail" runat="server" Text='<%# Bind("nvc_admin_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" NAME">
                    <ItemTemplate>
                        <asp:Label ID="lname" runat="server" Text='<%# Bind("nvc_client_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GENDER">
                    <ItemTemplate>
                        <asp:Label ID="lgender" runat="server" Text='<%# Bind("nvc_client_gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROFESSION">
                    <ItemTemplate>
                        <asp:Label ID="ldesignation" runat="server" Text='<%# Bind("nvc_client_profession") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EMAIL">
                    <ItemTemplate>
                        <asp:Label ID="lemail" runat="server" Text='<%# Bind("nvc_client_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ADDRESS">
                    <ItemTemplate>
                        <asp:Label ID="laddress" runat="server" Text='<%# Bind("nvc_client_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MESSAGE">
                    <ItemTemplate>
                        <asp:Label ID="lmessage" runat="server" Text='<%# Bind("nvc_client_message") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="IMAGE">
                    <ItemTemplate>
                        <asp:Image ID="limage" runat="server" ImageUrl='<%# Bind("nvc_client_image") %>' Width="100px" Height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick=" return confirm('Are you Sure To Delete Data')"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-danger text-white" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UPDATE" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-danger text-white" />
                </asp:TemplateField>


            </Columns>
        </asp:GridView>

    </div>
    <br />
</asp:Content>
