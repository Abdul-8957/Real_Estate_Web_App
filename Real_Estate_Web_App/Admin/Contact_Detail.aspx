<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Contact_Detail.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Contact_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row ms-2 me-2 mt-4 mb-3" id="detailContainer" runat="server">
            <div class="col-md-12">
                <h1 class="jumbotron bg-dark text-white text-center">CONTACT DETAILS</h1>
            </div>
             <div class="row mb-3">

            <div class="col-md-6">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Property"></asp:TextBox>
                    <div class="input-group-append">
                        <button id="btnSearch" class="btn btn-secondary" runat="server" type="button" onserverclick="btnSearch_ServerClick">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>

            </div>
        
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblNoRecordFound" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <br />
        <asp:GridView ID="ContactGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark " OnRowDeleting="ContactGridView_RowDeleting" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Bind("in_contact_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NAME">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("nvc_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROFESSION">
                    <ItemTemplate>
                        <asp:Label ID="lblProfession" runat="server" Text='<%# Bind("nvc_profession") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EMAIL">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("nvc_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SUBJECT">
                    <ItemTemplate>
                        <asp:Label ID="lblSubject" runat="server" Text='<%# Bind("nvc_subject") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MESSAGE">
                    <ItemTemplate>
                        <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("nvc_message") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="DATE & TIME">
                    <ItemTemplate>
                        <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("dt_created_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick=" return confirm('Are you Sure To Delete Data')"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-danger text-white" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <br />

</asp:Content>
