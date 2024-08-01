<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="property-list.aspx.cs" Inherits="Real_Estate_Web_App.property_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Start -->
    <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
            <div class="col-md-6 p-5 mt-lg-5">
                <h1 class="display-5 animated fadeIn mb-4">Property List</h1>
                <nav aria-label="breadcrumb animated fadeIn">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item text-body active" aria-current="page">Property List</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 animated fadeIn">
                <img class="img-fluid" src="img/header.jpg" alt="">
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Search Start -->
    <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
        <div class="container">
            <div class="row g-2">
                <div class="col-md-10">
                    <div class="row g-2">
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="search" class="form-control border-0 py-3" placeholder="Search Property Type & Feature"></asp:TextBox>
                        </div>
                        <div class="col-md-4 ">
                            <asp:DropDownList ID="PropertyNameDDL" runat="server" CssClass=" form-select border-0 py-3" OnSelectedIndexChanged="PropertyNameDDL_SelectedIndexChanged" AutoPostBack="true" >
                            </asp:DropDownList>

                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="PropertyTypeDDL" Display="Dynamic" ErrorMessage="Property Type is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Property Type" />--%>
                        </div>
                        <div class="col-md-4">

                            <asp:DropDownList ID="PropertyLocationDDL" runat="server" CssClass=" form-select border-0 py-3">
                            </asp:DropDownList>

                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="PropertyLocationDDL" Display="Dynamic" ErrorMessage="Property Location is Required" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Property Type" />--%>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <asp:Button runat="server" ID="btnSearch" class="btn btn-dark border-0 w-100 py-3" Text="Search" OnClick="btnSearch_Click" PostBackUrl="#list" />
                </div>
            </div>

        </div>
    </div>
    <!-- Search End -->

    <!-- Property List Start -->
    <div class="container-xxl py-5" id="list">
        <div class="container" >
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                        <h1 class="mb-3">Property Listing</h1>
                        <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit diam justo sed rebum.</p>
                    </div>
                </div>
                <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                        <li class="nav-item me-2">
                            <asp:Button runat="server" ID="forFeature" class="btn btn-outline-primary active" PostBackUrl="#list" data-bs-toggle="pill" Text="Feature" OnClick="forFeature_Click" />
                        </li>
                        <li class="nav-item me-2">

                            <asp:Button runat="server" ID="forSell" class="btn btn-outline-primary" PostBackUrl="#list" data-bs-toggle="pill" Text="For Sell" OnClick="forSell_Click" />

                        </li>
                        <li class="nav-item me-0">
                            <asp:Button runat="server" ID="forRent" class="btn btn-outline-primary" PostBackUrl="#list" data-bs-toggle="pill" Text="For Rent" OnClick="forRent_Click" />
                        </li>
                    </ul>
                </div>
            </div>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">

                        <div class="col-md-12">
                            <asp:Label ID="lblNoRecordFound" Font-Size="XX-Large" runat="server" Visible="false"></asp:Label>
                        </div>

                        <% foreach (System.Data.DataRow row in dtPropertyListing.Rows)
                            {%>

                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href="">

                                        <img class="img-fluid" style="height: 250px; width: 100%;" src="<%=row.ItemArray[0]%>"></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3"><%=row.ItemArray[20]%></div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%=row.ItemArray[18]%></div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">$<%=row.ItemArray[4]%></h5>
                                    <a class="d-block h5 mb-2" href=""><%=row.ItemArray[2]%></a>
                                    <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%=row.ItemArray[23]%></p>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%=row.ItemArray[6]%> Sqft</small>
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%=row.ItemArray[7]%> Bed</small>
                                    <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%=row.ItemArray[8]%> Bath</small>
                                </div>
                            </div>
                        </div>


                        <%} %>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!-- Property List End -->

    <!-- Property List Start -->

    <%--  <div class="container py-5" id="Feature">
        <div class="container" id="ForSell">
            <div class="row g-0 gx-5 align-items-end" id="ForRent">
                <div class="col-lg-6">
                    <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                        <h1 class="mb-3">Property Listing</h1>
                        <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit diam justo sed rebum.</p>
                    </div>
                </div>
                <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                        <li class="nav-item me-2">
                            <asp:Button runat="server" ID="forFeature" class="btn btn-outline-primary active" PostBackUrl="#Feature" data-bs-toggle="pill" Text="Feature" OnClick="forFeature_Click" />
                        </li>
                        <li class="nav-item me-2">

                            <asp:Button runat="server" ID="forSell" class="btn btn-outline-primary" PostBackUrl="#ForSell" data-bs-toggle="pill" Text="For Sell" OnClick="forSell_Click" />

                        </li>
                        <li class="nav-item me-0">
                            <asp:Button runat="server" ID="forRent" class="btn btn-outline-primary" PostBackUrl="#ForRent" data-bs-toggle="pill" Text="For Rent" OnClick="forRent_Click" />
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row ">
                    <asp:Repeater ID="PropertyRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-4 wow fadeInUp mt-3 mb-3 " data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                       
                                            <asp:Image ID="Image1" class="img-fluid" runat="server" Height="220px" Width="100%"  ImageUrl='<%# Bind("nvc_property_image") %>' />
                                    
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nvc_property_feature") %>'></asp:Label>
                                        </div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("nvc_property_type") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">$ 
                                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("nvc_property_amount") %>'></asp:Label>
                                        </h5>
                                        <a class="d-block h5 mb-2" href="">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nvc_property_name") %>'></asp:Label>
                                        </a>
                                        <p>
                                            <i class="fa fa-map-marker-alt text-primary me-2"></i>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nvc_property_location") %>'></asp:Label>
                                        </p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("$"+"nvc_property_area") %>'></asp:Label>
                                            Sqrt
                                        </small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("nvc_property_bedroom") %>'></asp:Label>
                                            Bed
                                        </small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("nvc_property_bathroom") %>'></asp:Label>
                                            Bath
                                        </small>
                                    </div>
                                </div>
                            </div>


                        </ItemTemplate>
                    </asp:Repeater>
                    <div style="overflow: hidden;">

                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage"
                                    Style="padding: 8px; margin: 2px; background: #ffa100; border: solid 1px #666; font: 8pt tahoma;"
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server" ForeColor="White" PostBackUrl="#list" Font-Bold="True">
    <%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- Property List End-->


    <!-- Call to Action Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="bg-light rounded p-3">
                <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                            <img class="img-fluid rounded w-100" src="img/call-to-action.jpg" alt="">
                        </div>
                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                            <div class="mb-4">
                                <h1 class="mb-3">
                                Contact With Our Certified Agent</h1>
                                <p>mod sed ipsum dolor sit rebum magna erat. Tempor lorem kasd vero ipsum sit sit diam justo sed vero dolor duo.</p>                           
                            </div>
                            <a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Make A Call</a>
                            <a href="" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Get Appoinment</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Call to Action End -->
</asp:Content>
