<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="Add_Property.aspx.cs" Inherits="Real_Estate_Web_App.Admin.Add_Property" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container w-75 mt-4 mb-4" style="box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -webkit-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); -moz-box-shadow: -2px 3px 25px 3px rgba(0,0,0,0.76); border-radius: 8px;">
        <br />
        <div class="row">
            <div class="col-md-12 mb-2">
                <h1 class="jumbotron bg-primary text-white text-center ">Add Property</h1>
            </div>
            <div class="col-md-6">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyName" runat="server" class="form-control" placeholder="Enter Property Name" TabIndex="1"></asp:TextBox>
                    <label for="txtPropertyName">Property Name</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyname" ControlToValidate="txtPropertyName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:DropDownList ID="PropertyFeatureDDL" runat="server" CssClass="form-control" TabIndex="3">
                        <asp:ListItem>Select Property Featured</asp:ListItem>
                        <asp:ListItem>For Rent</asp:ListItem>
                        <asp:ListItem>For Sell</asp:ListItem>
                    </asp:DropDownList>
                    <label for="PropertyFeatureDDL">Property Featured </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyfeature" ControlToValidate="PropertyFeatureDDL" Display="Dynamic" ErrorMessage=" Select Property Featured" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" InitialValue="Select Property Featured" />
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyAmount" runat="server" class="form-control" TextMode="Number" placeholder="Enter Property Amount" TabIndex="5"></asp:TextBox>
                    <label for="txtPropertyAmount">Property Amount</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertyamount" ControlToValidate="txtPropertyAmount" Display="Dynamic" ErrorMessage="Amount is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:FileUpload ID="PropertyImage" runat="server" class="form-control pb-2 ps-5" placeholder="Upload Property Image" TabIndex="7" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <label for="PropertyImage">Upload Property Image</label>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredImage" ControlToValidate="PropertyImage" Display="Dynamic" ErrorMessage="Image is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />

                </div>
                <br />

            </div>
            <div class="col-md-6">

                <div class="form-floating">
                    <asp:DropDownList ID="PropertyTypeDDL" runat="server" CssClass="form-control" TabIndex="2">
                        <asp:ListItem >Select Property Type..</asp:ListItem>
                        <asp:ListItem>Apartment</asp:ListItem>
                        <asp:ListItem>Villa</asp:ListItem>
                        <asp:ListItem>Office</asp:ListItem>
                        <asp:ListItem>Home</asp:ListItem>
                        <asp:ListItem>Building</asp:ListItem>
                        <asp:ListItem>Townhouse</asp:ListItem>
                        <asp:ListItem>Shop</asp:ListItem>
                        <asp:ListItem>Garage</asp:ListItem>
                    </asp:DropDownList>
                    <label for="PropertyTypeDDL">Property Type </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertytype" ControlToValidate="PropertyTypeDDL" Display="Dynamic" ErrorMessage="Property Type is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Property Type.." ValidationGroup="a" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtPropertyArea" runat="server" class="form-control" TextMode="Number" placeholder="Enter Property Area" TabIndex="4"></asp:TextBox>
                    <label for="txtPropertyArea">Property Length</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertylength" ControlToValidate="txtPropertyArea" Display="Dynamic" ErrorMessage="Area is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyBedroom" runat="server" class="form-control" TextMode="Number" placeholder="Enter Property Bedroom" TabIndex="6"></asp:TextBox>
                    <label for="txtPropertyBedroom">Property Bedroom</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertybedroom" ControlToValidate="txtPropertyBedroom" Display="Dynamic" ErrorMessage="Bedroom is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />

                <div class="form-floating">
                    <asp:TextBox ID="txtPropertyBathroom" runat="server" class="form-control" TextMode="Number" placeholder="Enter  Property Bathroom " TabIndex="8"></asp:TextBox>
                    <label for="txtPropertyBathroom">Property Bathroom </label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertybathroom" ControlToValidate="txtPropertyBathroom" Display="Dynamic" ErrorMessage="Bathroom is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />
            </div>
         <%--   <div class="col-md-12">
                <div class="form-floating mb-2 mb-md-0">
                    <asp:TextBox ID="txtPropertyLocation" runat="server" class="form-control" placeholder="Enter Property Location" TabIndex="9"></asp:TextBox>
                    <label for="txtPropertyLocation">Property Location</label>
                    <asp:RequiredFieldValidator runat="server" ID="requiredpropertylocation" ControlToValidate="txtPropertyLocation" Display="Dynamic" ErrorMessage="Location is required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a" />
                </div>
                <br />
            </div>--%>

        </div>
        <div class="row justify-content-center ">
            <div class="col-md-4 justify-content-center">
                <asp:Button ID="btnAddProperty" runat="server" Width="75%" Text="Add Property" CssClass="btn btn-primary btn-block mb-4" OnClick="btnAddProperty_Click" ValidationGroup="a" TabIndex="10" />

            </div>
            <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnResetProperty" runat="server" Width="75%" Text="Reset" CssClass="btn btn-primary btn-block mb-4" OnClick="btnResetProperty_Click" TabIndex="11" />

            </div>
            <div class="col-md-4 justify-content-center ">
                <asp:Button ID="btnCancleProperty" runat="server" Width="75%" Text="Cancle" CssClass="btn btn-primary btn-block mb-4" OnClick="btnCancleProperty_Click" TabIndex="12" />

            </div>
        </div>

      
    </div>


</asp:Content>
