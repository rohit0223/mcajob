<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Resume.aspx.cs" Inherits="project.Resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <section>
        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12" pb="20">
                    <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title text-center">Build Resume</h2>
                </div>
                <div class="col-lg-12 ">
                    <div class="form-contact contact_form">
                        <div class="row">

                            <div class="col-12">
                                <h6>Personal Information</h6>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required="required"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Must Be In Character"
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Mobile"></asp:Label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile" required="required"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mobile No Must be 10 Digits."
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Country"></asp:Label>
                                    <asp:DropDownList ID="ddlContry" runat="server" CssClass="form-control   w-100">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                        <asp:ListItem>UK</asp:ListItem>
                                        <asp:ListItem>Pakistan</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>

                            <div class="col-12">
                                <h6>Education Information</h6>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="10th percentage/Grade"></asp:Label>
                                    <asp:TextBox ID="txt10th" runat="server" CssClass="form-control" placeholder="Ex. 90%" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="12th percentage/Grade"></asp:Label>
                                    <asp:TextBox ID="txt12th" runat="server" CssClass="form-control" placeholder="Ex. 90%" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Graduation with percentage/Grade"></asp:Label>
                                    <asp:TextBox ID="txtgrad" runat="server" CssClass="form-control" placeholder="Ex. BCA With 9.10" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Labe20" runat="server" Text="Post Graduation with percentage/Grade"></asp:Label>
                                    <asp:TextBox ID="txtpostgrad" runat="server" CssClass="form-control" placeholder="Ex. MCA with 7.20" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="PHD with percentage/Grade"></asp:Label>
                                    <asp:TextBox ID="txtphd" runat="server" CssClass="form-control" placeholder="Ex. 8.12 Grade" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label14" runat="server" Text="Job profile/work On"></asp:Label>
                                    <asp:TextBox ID="txtwork" runat="server" CssClass="form-control" placeholder="EX. ASP.NET" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label15" runat="server" Text="Work experience"></asp:Label>
                                    <asp:TextBox ID="txtex" runat="server" CssClass="form-control" placeholder="EX. Fresher " required="required"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Resume Upload -->
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="Label16" runat="server" Text="Resume (pdf/doc)"></asp:Label>
                                    <asp:FileUpload ID="resume" runat="server" CssClass="form-control pt-2" />
                                </div>
                            </div>

                            <!-- Photo Upload -->
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="LabelPhoto" runat="server" Text="Photo (jpg/png)"></asp:Label>
                                    <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control pt-2" />
                                    <br />
                                    <asp:Image ID="imgPreview" runat="server" Width="120px" Height="120px" Visible="false" />
                                </div>
                            </div>

                        </div>
                        <div class="form-group mt-3">
                            <asp:Button ID="btnRegister" runat="server" Text="Save" CssClass="button-contactForm boxed-btn" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                                                <asp:LinkButton ID="btn1" runat="server" CssClass="btn head-btn1" CausesValidation="false"  Text="Register" OnClick="btn1_Click" ></asp:LinkButton>
                                                <asp:LinkButton ID="btn2" runat="server" CssClass="btn head-btn2" CausesValidation="false"  Text="Login" OnClick="btn2_Click"></asp:LinkButton>
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


