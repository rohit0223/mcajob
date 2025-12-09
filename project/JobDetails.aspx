<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="project.JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Job Details</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:Label ID="lblmsg" runat="server" Text="Job Applied Successfully...." Font-Bold="true" ForeColor="Green" Font-Size="15" Visible="false"></asp:Label>

                <%--   <asp:DataList ID="DataList1" runat="server" >
                    <ItemTemplate>--%>

                <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#">
                                        <asp:Image ID="imgCompany" runat="server" CssClass="img-responsive" AlternateText="Company Image" Height="70" Width="70" />
                                    </a>
                                </div>
                                <div class="job-tittle">
                                    <a href="#" id="lnkTitle">
                                        <h4><asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label></h4>
                                    </a>
                                    <ul>
                                        <li><asp:Label ID="lblCompanyName" runat="server" Text="Company"></asp:Label></li>
                                        <li><i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label></li>
                                        <li><asp:Label ID="lblSalary" runat="server" Text="$0 - $0"></asp:Label></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- job single End -->

                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Job Description</h4>
                                </div>
                                <asp:Literal ID="litDescription" runat="server" />
                            </div>

                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Required Knowledge, Skills, and Abilities</h4>
                                </div>
                                <asp:Literal ID="litQualification" runat="server" />
                            </div>

                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Education + Experience</h4>
                                </div>
                                <asp:Literal ID="litExperience" runat="server" />
                            </div>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Job Overview</h4>
                            </div>
                            <ul>
                                <li>Posted date : <span><asp:Label ID="lblCreatedAt" runat="server" Text="-"></asp:Label></span></li>
                                <li>Location : <span><asp:Label ID="lblAddress" runat="server" Text="-"></asp:Label></span></li>
                                <li>Job type : <span><asp:Label ID="lblJobType" runat="server" Text="-"></asp:Label></span></li>
                                <li>Salary :  <span><asp:Label ID="lblSalaryOverview" runat="server" Text="-"></asp:Label></span></li>
                                <li>Last apply date : <span><asp:Label ID="lblLastDate" runat="server" Text="-"></asp:Label></span></li>
                            </ul>
                            <div class="apply-btn2">
                                <asp:LinkButton ID="ApplyJob" runat="server" CssClass="btn" Text="Apply Now" OnClick="ApplyJob_Click" />
                            </div>
                        </div>

                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Company Information</h4>
                            </div>
                            <span><asp:Label ID="lblCompanySpan" runat="server" Text="Company"></asp:Label></span>
                            <asp:Literal ID="litCompanyInfo" runat="server" />
                            <ul>
                                <li>Name: <span><asp:Label ID="lblCompanyName2" runat="server" Text="-"></asp:Label> </span></li>
                                <li>Web : <span><asp:HyperLink ID="hlWebsite" runat="server" Target="_blank" ForeColor="Black">[hlWebsite]</asp:HyperLink></span></li>
                                <li>Email: <span><asp:Label ID="lblEmail" runat="server" Text="-"></asp:Label></span></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <%--  </ItemTemplate>
                </asp:DataList>--%>
            </div>
        </div>
        <!-- job post company End -->

    </main>
</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
                                            <li><a href="BlogDetails.aspx">Blog</a>
                                                <%--<ul class="submenu">
                                                                <li><a href="blog.html">Blog</a></li>
                                                                <li><a href="single-blog.html">Blog Details</a></li>
                                                                <li><a href="elements.html">Elements</a></li>
                                                                <li><a href="JobDetails.aspx">job Details</a></li>
                                                            </ul>--%>
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


