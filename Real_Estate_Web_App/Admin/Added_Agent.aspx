<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Added_Agent.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Added_Agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-75 mt-4 mb-4" id="editTextContainer" visible="false" runat="server" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Update Agent</h1>
            </div>
            <div class="col-md-12" runat="server" visible="false">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtAgentId" runat="server" class="form-control" placeholder=" Agent Id"></asp:TextBox>
                    <label for="txtAgentId">Agent Id</label>
                </div>
                <br />
            </div>
            <div class="col-md-4 mb-4">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter your Name" TabIndex="1"></asp:TextBox>
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
                    <asp:RequiredFieldValidator runat="server" ID="RequiredGender" ControlToValidate="GenderDDL" Display="Dynamic" ErrorMessage="Gender is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Gender" ValidationGroup="a" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtMobileNo" runat="server" class="form-control" TabIndex="3" placeholder="Enter Mobile No."></asp:TextBox>
                    <label for="txtMobileNo">Mobile No.</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Mobile No. is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-floating">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="name@example.com" TabIndex="4"></asp:TextBox>
                    <label for="txtEmail">Email address</label>
                    <asp:RequiredFieldValidator ID="RequiredEmail" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" Display="Dynamic" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtInstagramAccount" runat="server" class="form-control" placeholder="Enter  Instagram Account" TabIndex="6"></asp:TextBox>
                    <label for="txtInstagramAccount">Instagram Account</label>
                    <asp:RequiredFieldValidator ID="RequiredInstagramAccount" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Instagram Account " ControlToValidate="txtInstagramAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <br />

            </div>
            <div class="col-md-6">




                <div class="form-floating mb-2 mb-md-0">

                    <asp:TextBox ID="txtTwitterAccount" runat="server" class="form-control" placeholder="Enter Twitter Account" TabIndex="5"></asp:TextBox>
                    <label for="txtTwitterAccount">Twitter Account</label>
                    <asp:RequiredFieldValidator ID="RequiredTwitterAccount" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Twitter Account " ControlToValidate="txtTwitterAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtFacebookAccount" runat="server" class="form-control" placeholder="Enter Facebook Account" TabIndex="7"></asp:TextBox>
                    <label for="txtFacebookAccount">Facebook Account</label>
                    <asp:RequiredFieldValidator ID="RequiredFacebookAccount" runat="server" ValidationGroup="a" Display="Dynamic" ErrorMessage="Please Enter Facebook Account " ControlToValidate="txtFacebookAccount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />
            </div>
            <div class="col-md-12">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter Full Address" TabIndex="8"></asp:TextBox>
                    <label for="txtAddress">Full Address</label>
                    <asp:RequiredFieldValidator ID="RequiredAddress" ValidationGroup="a" runat="server" Display="Dynamic" ErrorMessage="Please Enter Full Address" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />
            </div>
            <div class="col-md-2">

                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:Image ID="imageAgent" runat="server" Width="120px" Height="120px" />

                </div>
                <br />
            </div>
            <div class="col-md-5 ">
                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:FileUpload ID="AgentImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload Agent Image" TabIndex="9" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="AgentImage">Upload Agent Image</label>

                </div>
                <br />
                <div style="margin-left: 40%;">
                    <asp:Button ID="btnUpdateAgent" runat="server" Text="Update Agent" CssClass="btn btn-primary btn-block mb-4" OnClick="btnUpdateAgent_Click" ValidationGroup="a" TabIndex="11" />

                </div>
                <br />

            </div>
            <div class="col-md-5">
                <div class="form-floating">
                    <asp:TextBox ID="txtDesignation" runat="server" class="form-control" placeholder="Enter Designation" TabIndex="10"></asp:TextBox>
                    <label for="txtDesignation">Designations</label>
                    <asp:RequiredFieldValidator ID="RequiredDesignation" runat="server" ValidationGroup="a" Display="Dynamic" ErrorMessage="Please Enter Designation " ControlToValidate="txtDesignation" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
                <br />
                <div>
                    <asp:Button ID="btnCancleAgent" runat="server" Width="50%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleAgent_Click" TabIndex="12" />

                </div>
                <br />
            </div>

        </div>

    </div>

    <div class="row ms-2 me-2 mt-4 mb-4" id="detailContainer" runat="server">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-white text-center">Agent Details</h1>
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

        <asp:GridView ID="AddedAgentGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark " AllowPaging="true" AutoGenerateColumns="False" OnRowDeleting="AddedAgentGridView_RowDeleting" OnRowUpdating="AddedAgentGridView_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="AGENT ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Bind("in_agent_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ADMIN EMAIL" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="laemail" runat="server" Text='<%# Bind("nvc_admin_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" NAME">
                    <ItemTemplate>
                        <asp:Label ID="lname" runat="server" Text='<%# Bind("nvc_agent_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GENDER">
                    <ItemTemplate>
                        <asp:Label ID="lgender" runat="server" Text='<%# Bind("nvc_agent_gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MOBILE NO.">
                    <ItemTemplate>
                        <asp:Label ID="lmobileno" runat="server" Text='<%# Bind("nvc_agent_mobile_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESIGNATION">
                    <ItemTemplate>
                        <asp:Label ID="ldesignation" runat="server" Text='<%# Bind("nvc_agent_designation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EMAIL">
                    <ItemTemplate>
                        <asp:Label ID="lemail" runat="server" Text='<%# Bind("nvc_agent_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="INSTAGRAM A/C">
                    <ItemTemplate>
                        <asp:Label ID="ligacc" runat="server" Text='<%# Bind("nvc_agent_instagram_account") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FACEBOOK A/C">
                    <ItemTemplate>
                        <asp:Label ID="lfbacc" runat="server" Text='<%# Bind("nvc_agent_facebook_account") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TWITTER A/C">
                    <ItemTemplate>
                        <asp:Label ID="ltwacc" runat="server" Text='<%# Bind("nvc_agent_twitter_account") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ADDRESS">
                    <ItemTemplate>
                        <asp:Label ID="laddress" runat="server" Text='<%# Bind("nvc_agent_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="IMAGE">
                    <ItemTemplate>
                        <asp:Image ID="limage" runat="server" ImageUrl='<%# Bind("nvc_agent_image") %>' Width="100px" Height="100px" />
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
