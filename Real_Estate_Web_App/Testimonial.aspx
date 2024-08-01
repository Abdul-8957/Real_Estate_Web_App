<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="Real_Estate_Web_App.Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Start -->
    <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
            <div class="col-md-6 p-5 mt-lg-5">
                <h1 class="display-5 animated fadeIn mb-4">Testimonial</h1>
                <nav aria-label="breadcrumb animated fadeIn">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item text-body active" aria-current="page">Testimonial</li>
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
                    <asp:Button runat="server" ID="btnSearch" class="btn btn-dark border-0 w-100 py-3" Text="Search"  />
                </div>
            </div>
        </div>
    </div>
    <!-- Search End -->


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
