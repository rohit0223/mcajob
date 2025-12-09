<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="project.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section>

        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12" pb="20">
                    <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title text-center">Sign Up</h2>
                </div>
                <div class="col-lg-6 mx-auto">
                    <div class="form-contact contact_form">
                        <div class="row">

                            <div class="col-12">
                                <h6>Login Information</h6>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password" required="required"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password And Confirm Password Should be same."
                                        ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"> </asp:CompareValidator>
                                </div>
                            </div>

                      
                            <div class="col-12">
                                <h6>Personal Information</h6>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required="required"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Must Be In Character"
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Mobile"></asp:Label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile" required="required"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mobile No Must be 10 Digits."
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required="required"></asp:TextBox>
                                </div>
                            </div>
                           <%-- <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Contry"></asp:Label>
                                    <asp:DropDownList ID="ddlContry" runat="server" DataSourceID="SqlDataSource1" CssClass="from-control w-100"
                                        AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Contry Is Required"
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0"
                                        ControlToValidate="ddlContry"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CountryName] FROM [Country_tbl]"></asp:SqlDataSource>
                                </div>
                            </div>--%>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Contry"></asp:Label>
                                    <asp:DropDownList ID="ddlContry" runat="server" CssClass="form-control   w-100">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                        <asp:ListItem>UK</asp:ListItem>
                                        <asp:ListItem>Pakistan</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>

                        </div>
                        <div class="form-group mt-3">
                            <asp:Button ID="BtnUser" runat="server" Text="User" CssClass="button-contactForm boxed-btn" OnClick="BtnUser_Click"   />
                            <asp:Button ID="BtnRecuiter" runat="server" Text="Recuiter" CssClass="button-contactForm boxed-btn" OnClick="BtnRecuiter_Click"   />
                            <span class="clickLink"><a href="../Login.aspx" style="color: blue">Alredy Register? Click Here.. </a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    <%-- <div id="preloader-active">
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
    --%>
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
                                <a href="Register.aspx">
                                    <img src="../assets//img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="menu-wrapper">
                                <!-- Main-menu -->
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <%-- <ul id="navigation">
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
                                </div>
                                    <a href="Register.aspx" class="btn head-btn1">Register</a> <a href="Login.aspx" class="btn head-btn2">Login</a>
                                </div>
                            </div>
                        </div>
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

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <%-- <footer>
                    <!-- Footer Start-->
                    <div class="footer-area footer-bg footer-padding">
                        <div class="container">
                            <div class="row d-flex justify-content-between">
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                                    <div class="single-footer-caption mb-50">
                                        <div class="single-footer-caption mb-30">
                                            <div class="footer-tittle">
                                                <h4>About Us</h4>
                                                <div class="footer-pera">
                                                    <p>
                                                        Heaven frucvitful doesn't cover lesser dvsays appear creeping seasons so behold.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <div class="single-footer-caption mb-50">
                                        <div class="footer-tittle">
                                            <h4>Contact Info</h4>
                                            <ul>
                                                <li>
                                                    <p>
                                                        Address :Your address goes
                                        here, your demo address.
                                                    </p>
                                                </li>
                                                <li><a href="#">Phone : +8880 44338899</a></li>
                                                <li><a href="#">Email : info@colorlib.com</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <div class="single-footer-caption mb-50">
                                        <div class="footer-tittle">
                                            <h4>Important Link</h4>
                                            <ul>
                                                <li><a href="#">View Project</a></li>
                                                <li><a href="#">Contact Us</a></li>
                                                <li><a href="#">Testimonial</a></li>
                                                <li><a href="#">Proparties</a></li>
                                                <li><a href="#">Support</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <div class="single-footer-caption mb-50">
                                        <div class="footer-tittle">
                                            <h4>Newsletter</h4>
                                            <div class="footer-pera footer-pera2">
                                                <p>
                                                    Heaven fruitful doesn't over lesser in days. Appear creeping.</p>
                                            </div>
                                            <!-- Form -->
                                            <div class="footer-form">
                                                <div id="mc_embed_signup">
                                                    <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                                        method="get" class="subscribe_form relative mail_part">
                                                        <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                                            class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                                            onblur="this.placeholder = ' Email Address '">
                                                        <div class="form-icon">
                                                            <button type="submit" name="submit" id="newsletter-submit"
                                                                class="email_icon newsletter-submit button-contactForm">
                                                                <img src="../assets//img/icon/form.png" alt="">
                                                            </button>
                                                        </div>
                                                        <div class="mt-10 info">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  -->
                            <div class="row footer-wejed justify-content-between">
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                                    <!-- logo -->
                                    <div class="footer-logo mb-20">
                                        <a href="index.html">
                                        <img src="../assets//img/logo/logo2_footer.png" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <div class="footer-tittle-bottom">
                                        <span>5000+</span>
                                        <p>
                                            Talented Hunter</p>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <div class="footer-tittle-bottom">
                                        <span>451</span>
                                        <p>
                                            Talented Hunter</p>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                                    <!-- Footer Bottom Tittle -->
                                    <div class="footer-tittle-bottom">
                                        <span>568</span>
                                        <p>
                                            Talented Hunter</p>
                                    </div>
                                </div>
                            </div>
                        </div>
        </div>
                    <!-- footer-bottom area -->
                    <div class="footer-bottom-area footer-bg">
                        <div class="container">
                            <div class="footer-border">
                                <div class="row d-flex justify-content-between align-items-center">
                                    <div class="col-xl-10 col-lg-10 ">
                                        <div class="footer-copy-right">
                                            <p>
                                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                                All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 col-lg-2">
                                        <div class="footer-social f-right">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fas fa-globe"></i></a><a href="#"><i class="fab fa-behance"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
        </div>
                    <!-- Footer End-->
                </footer>

                <!-- JS here -->

                <!-- All JS Custom Plugins Link Here here -->
                <script src="./../assets//js/vendor/modernizr-3.5.0.min.js"></script>
                <!-- Jquery, Popper, Bootstrap -->
                <script src="./../assets//js/vendor/jquery-1.12.4.min.js"></script>
                <script src="./../assets//js/popper.min.js"></script>
                <script src="./../assets//js/bootstrap.min.js"></script>
                <!-- Jquery Mobile Menu -->
                <script src="./../assets//js/jquery.slicknav.min.js"></script>

                <!-- Jquery Slick , Owl-Carousel Plugins -->
                <script src="./../assets//js/owl.carousel.min.js"></script>
                <script src="./../assets//js/slick.min.js"></script>
                <script src="./../assets//js/price_rangs.js"></script>

                <!-- One Page, Animated-HeadLin -->
                <script src="./../assets//js/wow.min.js"></script>
                <script src="./../assets//js/animated.headline.js"></script>
                <script src="./../assets//js/jquery.magnific-popup.js"></script>

                <!-- Scrollup, nice-select, sticky -->
                <script src="./../assets//js/jquery.scrollUp.min.js"></script>
                <script src="./../assets//js/jquery.nice-select.min.js"></script>
                <script src="./../assets//js/jquery.sticky.js"></script>

                <!-- contact js -->
                <script src="./../assets//js/contact.js"></script>
                <script src="./../assets//js/jquery.form.js"></script>
                <script src="./../assets//js/jquery.validate.min.js"></script>
                <script src="./../assets//js/mail-script.js"></script>
                <script src="./../assets//js/jquery.ajaxchimp.min.js"></script>

                <!-- Jquery Plugins, main Jquery -->
                <script src="./../assets//js/plugins.js"></script>
                <script src="./../assets//js/main.js"></script>--%>
</asp:Content>


 <%--<div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList ID="dlprofile" Width="100%" runat="server">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-cloumn align-items-center text-center">
                                        <img src="assets/img/blog/author.png" alt="UserPic" class="rounded-circle" width="150"/>
                                        <div class="mt-3">
                                            <h4 class="text-capitalize"><%# Eval("Name") %></h4>
                                            <p class="text-secondary mb-1"><%# Eval("UserName") %></p>
                                            <p class="text-muted font-size-sm text-capitalize">
                                                <i class="fas fa-map-marler-alt"></i>Conty</p>
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
                                            UserName
                                        </div>
                                    </div>

                                    <hr />

                                     <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            UserName
                                        </div>
                                    </div>

                                    <hr />

                                     <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            Email
                                        </div>
                                    </div>

                                    <hr />

                                     <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Resume</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            Resume
                                        </div>
                                    </div>

                                    <hr />

                                     <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnEdt" runat="server" Text="Edit" CssClass="button button-contactForm boxed btn" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>--%>