<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="project.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Contact us</h2>
                        </div>
                    </div>
                </div>
            </div>qw
        </div>
    </div>
    </div>
    <!-- Hero Area End -->

    <!-- ================ contact section start ================= -->
    <section class="contact-section">

        <!-- ===== working Google-Maps iframe (Ahmedabad) - no API key required ===== -->
        <div class="map-responsive" style="height:480px; width:100%; margin-bottom:40px;">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3683.199349607624!2d72.57136207507744!3d23.03379977916824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e84f3470f7e2b%3A0x62dafb74d50f3021!2sAhmedabad%2C%20Gujarat!5e0!3m2!1sen!2sin!4v1708341234567!5m2!1sen!2sin"
                width="100%"
                height="480"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
        <!-- ================= end map iframe ================= -->

        <div class="container">
            <div class="row">
                <div class="col-12" style="padding-bottom:20px;">
                    <!-- server-side message label -->
                    <asp:Label ID="lblmsg" runat="server" Visible="false" />
                </div>

                <div class="col-12">
                    <h2 class="contact-title">Get in Touch</h2>
                </div>

                <div class="col-lg-8">
                    <%--<form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">--%>
                    <div class="form-contact contact_form" id="contactForm" novalidate="novalidate">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <!-- textarea as server control (message.Value used in code-behind) -->
                                    <textarea class="form-control w-100" runat="server" name="message" id="message" cols="30" rows="9"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"
                                        placeholder=" Enter Message" required></textarea>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtnm" runat="server" CssClass="form-control valid" placeholder="Enter your name" />
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txteml" runat="server" CssClass="form-control valid" placeholder="Email" />
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtsub" runat="server" CssClass="form-control" placeholder="Enter Subject" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group mt-3">
                            <asp:Button ID="btbSend" runat="server" CssClass="button button-contactForm boxed-btn" Text="Send" OnClick="btbSend_Click" />
                        </div>
                        <%--</form>--%>
                    </div>
                </div>

                <div class="col-lg-3 offset-lg-1">
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-home"></i></span>
                        <div class="media-body">
                            <h3>Buttonwood, California.</h3>
                            <p>Rosemead, CA 91770</p>
                        </div>
                    </div>

                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <h3>+1 253 565 2365</h3>
                            <p>Mon to Fri 9am to 6pm</p>
                        </div>
                    </div>

                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <h3>support@colorlib.com</h3>
                            <p>Send us your query anytime!</p>
                        </div>
                    </div>
                </div>
            </div> <!-- .row -->
        </div> <!-- .container -->
    </section>
    <!-- ================ contact section end ================= -->
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../assets/img/logo/logo.png" alt="" />
                </div>
            </div>
        </div>
    </div>

    <!-- Header Start -->
                <header>
                    <!-- Header Start -->
                    <div class="header-area header-transparrent">
                        <div class="headder-top header-sticky">
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col-lg-3 col-md-2">
                                        <!-- Logo -->
                                        <div class="logo">
                                <a href="Default.aspx"><img src="../assets/img/logo/logo.png" alt="" /></a>
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
                                                    <li><a href="JobDetails.aspx">Job Details</a></li>
                                                            </ul>
                                                        </li>
                                                        <li><a href="Contact.aspx">Contact</a></li>
                                                    </ul>
                                                </nav>
                                            </div>

                                            <div class="header-btn d-none f-right d-lg-block">
                                    <asp:LinkButton ID="btn1" runat="server" CssClass="btn head-btn1" CausesValidation="false" Text="Register" OnClick="btn1_Click" />
                                    <asp:LinkButton ID="btn2" runat="server" CssClass="btn head-btn2" CausesValidation="false" Text="Login" OnClick="btn2_Click" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </header>
                    <!-- Header End -->
                </header>
</asp:Content>



