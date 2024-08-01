<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Real_Estate_Web_App.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">About Us</h1> 
                        <nav aria-label="breadcrumb animated fadeIn">
                        <ol class="breadcrumb text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-body active" aria-current="page">About</li>
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
                    <asp:Button runat="server" ID="btnSearch" class="btn btn-dark border-0 w-100 py-3" Text="Search" />
                </div>
            </div>
            </div>
        </div>
        <!-- Search End -->


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
                                    <h1 class="mb-3">Contact With Our Certified Agent</h1>
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
                <div class="row g-4">
                    <asp:Repeater ID="TeamRepeter" runat="server">
                    <ItemTemplate>

                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="team-item rounded overflow-hidden">
                                <div class="position-relative">
                                    <asp:Image ID="Image1" class="img-fluid" Style="height: 250px; width: 100%;" runat="server" ImageUrl='<%# Bind("nvc_agent_image") %>' Visible="true" AlternateText="Not Found Image" />
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a class="btn btn-square mx-1" runat="server" id="facebook" href='<%# Bind("nvc_agent_facebook_account")%>'><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-square mx-1" runat="server" id="twitter" href='<%# Bind("nvc_agent_twitter_account")%>'><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-square mx-1" runat="server" id="instagram" href='<%# Bind("nvc_agent_instagram_account")%>'><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("nvc_agent_name") %>'></asp:Label>
                                    </h5>
                                    <small>
                                        <asp:Label ID="lblDesig" runat="server" Text='<%# Bind("nvc_agent_designation") %>'></asp:Label>
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
</asp:Content>
