<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="project.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList ID="dlprofile" Width="100%" runat="server" OnItemCommand="dlprofile_ItemCommand">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="align-items-left text-center">
                                        <img src="assets/img/blog/author.png" alt="UserPic" class="rounded-circle" width="150" />
                                        <div class="mt-3">
                                            <asp:Label ID="Label1" class="text-capitalize" runat="server" Text='<%# Eval("Name") %>'></asp:Label>

                                            <p class="text-secondary">@
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                            </p>
                                            <p>
                                                <i class="fas fa-map-marker-alt"></i>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary ">
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Mobile</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Resume</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Resume") == DBNull.Value ? "Not Uploaded" : "Uploaded" %>'></asp:Label>   
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnEdt1" runat="server" Text="Edit" CssClass="button button-contactForm boxed btn"   CommandArgument='<%# Eval("UserId") %>' CommandName="cmd_edt" />
                                            <%--<asp:LinkButton ID="btnEdt" CssClass="button button-contactForm boxed btn" Text="Edit" runat="server"></asp:LinkButton>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
   
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle">
                </div>
                <div class="preloader-img pere-text">
                    <img src="../assets//img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparrent">
            <div class="headder-top header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-2">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="Default.aspx">
                                    <img src="../assets//img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="menu-wrapper">
                                <!-- Main-menu -->
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <ul id="navigation">
                                            <li><a href="Default.aspx">Home</a></li>
                                            <li><a href="JobListing.aspx">Find a Jobs </a></li>
                                            <li><a href="About.aspx">About</a></li>
                                            <li><a href="#">Page</a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-blog.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Elements</a></li>
                                                    <li><a href="JobDetails.aspx">job Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="Contact.aspx">Contact</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header-btn -->
                                <div class="header-btn d-none f-right d-lg-block">
                                    <%-- <a href="Register.aspx" class="btn head-btn1">Register</a> 
                                                <a href="Login.aspx" class="btn head-btn2">Login</a>--%>
                                    <asp:LinkButton ID="btn1" runat="server" CssClass="btn head-btn1" CausesValidation="false" Text="Register" OnClick="btn1_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="btn2" runat="server" CssClass="btn head-btn2" CausesValidation="false" Text="Login" OnClick="btn2_Click"></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
</asp:Content>


