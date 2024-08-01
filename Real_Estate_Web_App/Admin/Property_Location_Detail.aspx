<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Property_Location_Detail.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Property_Location_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container w-50 mt-4 mb-4" runat="server" id="insertData" visible="true" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
          <asp:HiddenField ID="hfLocationId" runat="server" />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center " runat="server" id="heading">Add Property Location</h1>
            </div>
             <div class="col-md-12" runat="server" visible="false">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyLocationId" runat="server" class="form-control" placeholder=" Property Location Id"></asp:TextBox>
                    <label for="txtPropertyLocationId">Property Location Id</label>
                </div>
                <br />
            </div>
            <div class="col-md-12">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:DropDownList ID="PropertyNameDDL" runat="server" CssClass="form-control" TabIndex="1">
                    </asp:DropDownList>
                    <label for="PropertyNameDDL">Select Property Name </label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="a" ControlToValidate="PropertyNameDDL" Display="Dynamic" ErrorMessage="Property Name is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="0" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtPropertyLocation" runat="server" class="form-control" placeholder="Enter Property Location" TabIndex="2"></asp:TextBox>
                    <label for="txtPropertyLocation">Property Location</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ValidationGroup="a" ControlToValidate="txtPropertyLocation" Display="Dynamic" ErrorMessage="Location is required" ForeColor="Red" SetFocusOnError="True" />
                </div>
                <br />
            </div>
        </div>
        <div class="row justify-content-center ">
            <div class="col-md-5 justify-content-center" style="margin-left: 20px;">
                <asp:Button ID="btnAddPropertyLocation" runat="server" Width="75%" Text="Add Location" CssClass="btn btn-primary btn-block mb-4" OnClick="btnAddPropertyLocation_Click" ValidationGroup="a" TabIndex="3" PostBackUrl="#detailContainer" />

            </div>
            <div class="col-md-5 justify-content-center ">
                <asp:Button ID="btnResetPropertyLocation" runat="server" Width="75%" Text="Reset" CssClass="btn btn-primary btn-block mb-4" OnClick="btnResetPropertyLocation_Click" TabIndex="4" />

            </div>

        </div>


    </div>
    <div class="row ms-2 me-2 mt-4 mb-3" id="detailContainer" runat="server">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-white text-center">Property Location Details</h1>
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

        <asp:GridView ID="LocationGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark " AllowPaging="true" AutoGenerateColumns="False" OnRowUpdating="AddedGridView_RowUpdating" OnRowDeleting="AddedGridView_RowDeleting">
            <Columns>
                 <asp:TemplateField HeaderText="PROPERTY ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Bind("in_property_location_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ADMIN EMAIL" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lemail" runat="server" Text='<%# Bind("nvc_admin_email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="PROPERTY NAME">
                    <ItemTemplate>
                        <asp:Label ID="lname" runat="server" Text='<%# Bind("nvc_property_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
           
                <asp:TemplateField HeaderText="PROPERTY TYPE">
                    <ItemTemplate>
                        <asp:Label ID="ltype" runat="server" Text='<%# Bind("nvc_property_location") %>'></asp:Label>
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
