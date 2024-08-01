<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="About_Detail.aspx.cs" Inherits="Real_Estate_Web_App.Admin.About_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container w-75 mt-4 mb-4" runat="server" id="insertData" visible="true" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <asp:HiddenField ID="hfLocationId" runat="server" />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center " runat="server" id="heading">Add About</h1>
            </div>
            <div class="col-md-12" runat="server" visible="false">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtAboutId" runat="server" class="form-control" placeholder="About Id"></asp:TextBox>
                    <label for="txtAboutId">About Id</label>
                </div>
                <br />
            </div>
            <div class="col-md-5" >
                <div class="form-floating">
                    <asp:TextBox ID="txtAboutName" runat="server" class="form-control" placeholder="Enter Name" TabIndex="1"></asp:TextBox>
                    <label for="txtAboutName">About Title</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredName" ValidationGroup="a" ControlToValidate="txtAboutName" Display="Dynamic" ErrorMessage="Name required" ForeColor="Red" SetFocusOnError="True" />
                </div>
                <br />
              

                <div class="form-floating">
                    <asp:FileUpload ID="AboutImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload About Image" TabIndex="3" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="AboutImage">Upload About Image</label>
                </div>
                <br />
                  <div class="form-floating mb-3" >
                    <asp:Image ID="imageAbout" runat="server" Width="120px" Height="90px" Visible="false" />

                </div>
                <br />

            </div>
         
            <div class="col-md-7">
                <div class="form-floating">
                    <asp:TextBox ID="txtAboutDescription" runat="server" class="form-control" TextMode="MultiLine" Height="140px" placeholder="Enter Description" TabIndex="2"></asp:TextBox>
                    <label for="txtAboutDescription">Description</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredDescription" ValidationGroup="a" ControlToValidate="txtAboutDescription" Display="Dynamic" ErrorMessage="Description required" ForeColor="Red" SetFocusOnError="True" />
                </div>
                <br />
            </div>
        </div>
        <div class="row justify-content-center ">
            <div class="col-md-5 justify-content-center" style="margin-left: 20px;">
                <asp:Button ID="btnAddAbout" runat="server" Width="75%" Text="Add About" CssClass="btn btn-primary btn-block mb-4" OnClick="btnAddAbout_Click" ValidationGroup="a" TabIndex="4"  />

            </div>
            <div class="col-md-5 justify-content-center ">
                <asp:Button ID="btnResetAbout" runat="server" Width="75%" Text="Reset" CssClass="btn btn-primary btn-block mb-4" OnClick="btnResetAbout_Click" TabIndex="5" />

            </div>

        </div>


    </div>
    <div class="row ms-2 me-2 mt-4 mb-4" id="detailContainer" runat="server">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-white text-center">About Details</h1>
        </div>

        <div class="row mb-3">

            <div class="col-md-6">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Property"></asp:TextBox>
                    <div class="input-group-append">
                        <button id="btnSearch" class="btn btn-secondary" runat="server" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>

            </div>
            <%--  <div class="col-md-2 justify-content-end " style="margin-left:350px;">
                <asp:Button  runat="server" ID="AddProperty" class="btn btn-outline-primary active" data-bs-toggle="pill" Text="Add Property" OnClick="AddProperty_Click" />
            </div>--%>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblNoRecordFound" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <br />


        <asp:GridView ID="AboutGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark" AllowPaging="true" AutoGenerateColumns="False" OnRowUpdating="AboutGridView_RowUpdating" OnRowDeleting="AboutGridView_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="CLIENT ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Bind("in_about_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" NAME">
                    <ItemTemplate>
                        <asp:Label ID="lname" runat="server" Text='<%# Bind("nvc_about_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESCRIPTION">
                    <ItemTemplate>
                        <asp:Label ID="lmessage" runat="server" Text='<%# Bind("nvc_about_description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="IMAGE">
                    <ItemTemplate>
                        <asp:Image ID="limage" runat="server" ImageUrl='<%# Bind("nvc_about_image") %>' Width="100px" Height="100px" />
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
