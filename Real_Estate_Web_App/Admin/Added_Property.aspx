<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Added_Property.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Added_Property" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-75 mt-4 mb-4" id="editTextContainer" visible="false" runat="server" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Update Property</h1>
            </div>
            <div class="col-md-12" runat="server" visible="false">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyId" runat="server" class="form-control" placeholder=" Property Id"></asp:TextBox>
                    <label for="txtPropertyId">Property Id</label>
                </div>
                <br />
            </div>

            <div class="col-md-6">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyName" runat="server" class="form-control" placeholder="Enter Property Name" TabIndex="1"></asp:TextBox>
                    <label for="txtPropertyName">Property Name</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyname" ValidationGroup="a" ControlToValidate="txtPropertyName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:DropDownList ID="PropertyFeatureDDL" runat="server" CssClass="form-control" TabIndex="3">
                        <asp:ListItem>Select Property Featured</asp:ListItem>
                      
                    </asp:DropDownList>
                    <label for="PropertyFeatureDDL">Property Featured </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyfeature" ValidationGroup="a" ControlToValidate="PropertyFeatureDDL" Display="Dynamic" ErrorMessage=" Select Property Featured" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Property Featured" />
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyAmount" runat="server" class="form-control" placeholder="Enter Property Amount" TabIndex="5"></asp:TextBox>
                    <label for="txtPropertyAmount">Property Amount</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyamount" ValidationGroup="a" ControlToValidate="txtPropertyAmount" Display="Dynamic" ErrorMessage="Amount is required" ForeColor="Red" SetFocusOnError="True" />
                </div>
                <br />



            </div>
            <div class="col-md-6">

                <div class="form-floating">
                    <asp:DropDownList ID="PropertyTypeDDL" runat="server" CssClass="form-control" TabIndex="2">
                        
                    </asp:DropDownList>
                    <label for="PropertyTypeDDL">Property Type </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertytype" ValidationGroup="a" ControlToValidate="PropertyTypeDDL" Display="Dynamic" ErrorMessage="Property Type is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Property Type" />
                </div>
                <br />


                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyBedroom" runat="server" class="form-control" placeholder="Enter Property Bedroom" TabIndex="4"></asp:TextBox>
                    <label for="txtPropertyBedroom">Property Bedroom</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertybedroom" ValidationGroup="a" ControlToValidate="txtPropertyBedroom" Display="Dynamic" ErrorMessage="Bedroom is required" ForeColor="Red" SetFocusOnError="True" />

                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtPropertyBathroom" runat="server" class="form-control" placeholder="Enter  Property Bathroom " TabIndex="6"></asp:TextBox>
                    <label for="txtPropertyBathroom">Property Bathroom </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertybathroom" ValidationGroup="a" ControlToValidate="txtPropertyBathroom" Display="Dynamic" ErrorMessage="Bathroom is required" ForeColor="Red" SetFocusOnError="True" />

                </div>
                <br />
         
            </div>
            <div class="col-md-2">

                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:Image ID="imageProperty" runat="server" Width="120px" Height="120px" />

                </div>
                <br />
            </div>
            <div class="col-md-5 ">
                <div class="form-floating mb-2 mb-md-0 ">
                    <asp:FileUpload ID="PropertyImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload Property Image" TabIndex="8" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="PropertyImage">Upload Property Image</label>

                </div>
                <br />
                <div style="margin-left: 40%;">
                    <asp:Button ID="btnUpdateProperty" runat="server" Text="Update Property" CssClass="btn btn-primary btn-block mb-4" OnClick="btnUpdateProperty_Click" TabIndex="10" ValidationGroup="a" />

                </div>
                <br />

            </div>
            <div class="col-md-5">
                <div class="form-floating">
                    <asp:TextBox ID="txtPropertyArea" runat="server" class="form-control" placeholder="Enter  Property Area " TabIndex="9"></asp:TextBox>
                    <label for="txtPropertyArea">Property Length </label>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="a" ID="requiredpropertylength" ControlToValidate="txtPropertyArea" Display="Dynamic" ErrorMessage="Area is required" ForeColor="Red" SetFocusOnError="True" />

                </div>
                <br />
                <div>
                    <asp:Button ID="btnCancleProperty" runat="server" Width="50%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleProperty_Click" TabIndex="11" />

                </div>
                <br />
            </div>

        </div>

    </div>


    <div class="row ms-2 me-2 mt-4 mb-3" id="detailContainer" runat="server">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-white text-center">Property Details</h1>
        </div>
        <div class="row mb-3">

            <div class="col-md-6 mb-2" style="margin-right:350px;">
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
                <asp:Button  runat="server" ID="AddProperty" class="btn btn-outline-primary active" data-bs-toggle="pill" Text="Add Property" OnClick="AddProperty_Click" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblNoRecordFound" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <br />

        <asp:GridView ID="AddedGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-dark" AllowPaging="true" AutoGenerateColumns="False" OnRowUpdating="AddedGridView_RowUpdating" OnRowDeleting="AddedGridView_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="PROPERTY ID" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Bind("in_property_id") %>'></asp:Label>
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
                        <asp:Label ID="ltype" runat="server" Text='<%# Bind("nvc_property_type_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPERTY FEATURED">
                    <ItemTemplate>
                        <asp:Label ID="lfeature" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
<%--                 <asp:TemplateField HeaderText="PROPERTY LOCATION">
                    <ItemTemplate>
                        <asp:Label ID="llocation" runat="server" Text='<%# Bind("nvc_property_location") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="PROPERTY AREA">
                    <ItemTemplate>
                        <asp:Label ID="larea" runat="server" Text='<%# Bind("nvc_property_area") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPERTY AMOUNT">
                    <ItemTemplate>
                        <asp:Label ID="lamount" runat="server" Text='<%# Bind("nvc_property_amount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPERTY BEDROOM">
                    <ItemTemplate>
                        <asp:Label ID="lbedroom" runat="server" Text='<%# Bind("nvc_property_bedroom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPERTY BATHROOM">
                    <ItemTemplate>
                        <asp:Label ID="lbathroom" runat="server" Text='<%# Bind("nvc_property_bathroom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PROPERTY IMAGE">
                    <ItemTemplate>
                        <asp:Image ID="limage" runat="server" ImageUrl='<%# Bind("nvc_property_image") %>' Width="100px" Height="100px" />
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
