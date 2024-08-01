<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Real_Estate_Web_App.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Start -->
    <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
            <div class="col-md-6 p-5 mt-lg-5">
                <h1 class="display-5 animated fadeIn mb-4">Find A <span class="text-primary">Perfect Home</span> To Live With Your Family</h1>
                <p class="animated fadeIn mb-4 pb-2">
                    Vero elitr justo clita lorem. Ipsum dolor at sed stet
                        sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea elitr.
                </p>
                <a href="property-list.aspx" class="btn btn-primary py-3 px-5 me-3 animated fadeIn">Get Started</a>
            </div>
            <div class="col-md-6 animated fadeIn">
                <div class="owl-carousel header-carousel" >
                    <% foreach (System.Data.DataRow row in dtImageSlider.Rows)
                        {%>
                    <div class="owl-carousel-item" >
                        <img class="img-fluid" style="height:600px;  " src="<%=row.ItemArray[0]%>" alt="">
                    </div>
                    <%} %>
                    <%--<div class="owl-carousel-item">
                        <img class="img-fluid" src="img/carousel-2.jpg" alt="">
                    </div>
                    <div class="owl-carousel-item">
                        <img class="img-fluid"  src="img/about.jpg" alt="">
                    </div>--%>
                </div>
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
                    <asp:Button runat="server" ID="btnSearch" class="btn btn-dark border-0 w-100 py-3" Text="Search" />
                </div>
            </div>
        </div>
    </div>
    <!-- Search End -->

    <!-- Category Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">Property Types</h1>
                <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <img class="img-fluid"   src="img/icon-apartment.png" alt="Icon">
                            </div>
                            <h6>Apartment</h6>
                            <span>
                                <asp:Label ID="lblApartment" runat="server"></asp:Label>
                                Properties</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <img class="img-fluid" src="img/icon-villa.png" alt="Icon">
                            </div>
                            <h6>Villa</h6>
                            <span>
                                <asp:Label ID="lblVilla" runat="server"></asp:Label>
                                Properties</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <img class="img-fluid" src="img/icon-house.png" alt="Icon">
                            </div>
                            <h6>Home</h6>
                            <span>
                                <asp:Label ID="lblHome" runat="server"></asp:Label>
                                Propertie's</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <img class="img-fluid" src="img/icon-housing.png" alt="Icon">
                            </div>
                            <h6>Office</h6>
                            <span>
                                <asp:Label ID="lblOffice" runat="server"></asp:Label>
                                Properties</span>
                        </div>
                    </a>
                </div>
            </div>
            <br />
            <div class="col-12 text-center">
                <a class="btn btn-primary py-3 px-5" href="property-type.aspx">View More Type</a>
            </div>
        </div>
    </div>
    <!-- Category End -->


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img position-relative overflow-hidden p-5 pe-0">
                        <img class="img-fluid w-100" src="img/about.jpg">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="mb-4">#1 Place To Find The Perfect Property</h1>
                    <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                    <p><i class="fa fa-check text-primary me-3"></i>Tempor erat elitr rebum at clita</p>
                    <p><i class="fa fa-check text-primary me-3"></i>Aliqu diam amet diam et eos</p>
                    <p><i class="fa fa-check text-primary me-3"></i>Clita duo justo magna dolore erat amet</p>
                    <a class="btn btn-primary py-3 px-5 mt-3" href="property-list.aspx">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Property List Start -->

    <div class="container-xxl py-5" id="list">
        <div class="container" id="ForSell">
            <div class="row g-0 gx-5 align-items-end" id="ForRent">
                <div class="col-lg-6">
                    <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                        <h1 class="mb-3">Property Listing</h1>
                        <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit diam justo sed rebum.</p>
                    </div>
                </div>
             <%--   <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
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
                </div>--%>
            </div>
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row ">
                    <asp:Repeater ID="PropertyRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-4 wow fadeInUp mt-3 mb-3 " data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="">

                                            <asp:Image ID="Image1" class="img-fluid" Style="height: 250px; width: 100%;" runat="server" ImageUrl='<%# Bind("nvc_property_image") %>' Visible="true" AlternateText="Not Found Ima" />
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                        </div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("nvc_property_type_name") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">$ 
                                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("nvc_property_amount") %>'></asp:Label>
                                        </h5>
                                        <a class="d-block h5 mb-2" href="">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nvc_property_name")%>'></asp:Label>
                                        </a>
                                        <p>
                                            <i class="fa fa-map-marker-alt text-primary me-2"></i>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nvc_property_location")%>'></asp:Label>
                                        </p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("$"+"nvc_property_area")%>'></asp:Label>
                                            Sqrt
                                        </small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("nvc_property_bedroom")%>'></asp:Label>
                                            Bed
                                        </small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("nvc_property_bathroom")%>'></asp:Label>
                                            Bath
                                        </small>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="col-12 text-center">
                        <a class="btn btn-primary py-3 px-5" href="property-list.aspx">Browse More Property</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Property List End -->


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
                                   
                                <p>Eirmod sed ipsum dolor sit rebum magna erat. Tempor lorem kasd vero ipsum sit sit diam justo sed vero dolor duo.</p>
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


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">Property Agents</h1>
                <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
            </div>
            <div class="row g-4 ">
                <asp:Repeater ID="TeamRepeter" runat="server">
                    <ItemTemplate>

                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="team-item rounded overflow-hidden">
                                <div class="position-relative">
                                    <asp:Image ID="Image1" class="img-fluid" Style="height: 261px; width: 261px;" runat="server" ImageUrl='<%# Bind("nvc_agent_image")%>' Visible="true" AlternateText="Not Found Image" />
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a class="btn btn-square mx-1" runat="server" id="facebook" href='<%# Bind("nvc_agent_facebook_account")%>'><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-square mx-1" runat="server" id="twitter" href='<%# Bind("nvc_agent_twitter_account")%>'><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-square mx-1" runat="server" id="instagram" href='<%# Bind("nvc_agent_instagram_account")%>'><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("nvc_agent_name")%>'></asp:Label>
                                    </h5>
                                    <small>
                                        <asp:Label ID="lblDesig" runat="server" Text='<%# Bind("nvc_agent_designation")%>'></asp:Label>
                                    </small>
                                </div>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-12 text-center">
                    <a class="btn btn-primary py-3 px-5" href="property-agent.aspx">View More Agent</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">Our Clients Say!</h1>
                <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item bg-light rounded p-3">
                    <% foreach (System.Data.DataRow row in dtOurClientsSay.Rows)
                        {%>
                    <div class="bg-white border rounded p-4">
                        <p><%=row.ItemArray[8]%></p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="<%=row.ItemArray[0]%>" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1"><%=row.ItemArray[2]%></h6>
                                <small><%=row.ItemArray[5]%></small>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>

            </div>
        </div>
    </div>
    <!-- Testimonial End -->
</asp:Content>
