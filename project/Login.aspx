<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <section>
        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12" pb="20">
                    <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title text-center">Sign In</h2>
                </div>
                <div class="col-lg-6 mx-auto">
                    <div class="form-contact contact_form">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button-contactForm boxed-btn" OnClick="btnLogin_Click" />
                            <span class="clickLink"><a href="../Register.aspx" style="color: blue">New User ? Click Here.. </a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <%--<div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle">
                </div>
                <div class="preloader-img pere-text">
                    <img src="../assets//img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>--%>
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
                                        <%--<ul id="navigation">
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
                                                    </ul>--%>
                                    </nav>
                                </div>
                                <!-- Header-btn -->
                                <div class="header-btn d-none f-right d-lg-block">
                                    <a href="Register.aspx" class="btn head-btn1">Register</a>
                                    <a href="Login.aspx" class="btn head-btn2">Login</a>
                                    <%--<asp:LinkButton ID="btn1" runat="server" CssClass="btn head-btn1" CausesValidation="false" OnClick="btn1_Click" ></asp:LinkButton>
                                                <asp:LinkButton ID="btn2" runat="server" CssClass="btn head-btn2" CausesValidation="false" OnClick="btn2_Click" ></asp:LinkButton>--%>
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


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
</asp:Content>



