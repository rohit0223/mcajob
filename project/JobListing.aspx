<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="project.JobListing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* make left menu sticky and keep its visual width */
        .sticky-sidebar {
            position: -webkit-sticky;
            position: sticky;
            top: 120px; /* adjust if your header is larger/smaller */
            z-index: 5;
        }

        /* pager styling to match your theme */
        .custom-pager {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .custom-pager .pagination {
            margin: 0;
        }

        .custom-pager .page-item .page-link {
            min-width: 36px;
            text-align: center;
            margin: 0 4px;
            padding: 6px 10px;
            border-radius: 4px;
            border: 1px solid #e6e6e6;
            color: #333;
            text-decoration: none;
            display: inline-block;
        }

        .custom-pager .page-item.active .page-link {
            background: #ff2d55; /* pink accent like your register button */
            color: white;
            border-color: #ff2d55;
        }

        .custom-pager .page-item .page-link:hover {
            background: #f5f5f5;
            color: #000;
        }
    </style>
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
                                <h2>Get your job</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->

        <!-- Job List Area Start -->
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content (wrapped with sticky-sidebar class) -->
                    <div class="col-xl-3 col-lg-3 col-md-4">
                        <div class="sticky-sidebar">
                            <div class="row">
                                <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                        <div class="ion">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="12px">
                                                <path fill-rule="evenodd" fill="rgb(27, 207, 107)"
                                                    d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z" />
                                            </svg>
                                        </div>
                                        <h4>Filter Jobs</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- Job Category Listing start -->
                            <div class="job-category-listing mb-50">
                                <!-- single one -->
                                <div class="single-listing">
                                    <div class="small-section-tittle2">
                                        <h4>Job Category</h4>
                                    </div>
                                    <!-- Select job items start -->
                                    <div class="select-job-items2">
                                        <select name="select">
                                            <option value="">All Category</option>
                                            <option value="">Category 1</option>
                                            <option value="">Category 2</option>
                                            <option value="">Category 3</option>
                                            <option value="">Category 4</option>
                                        </select>
                                    </div>
                                    <!--  Select job items End-->
                                    <!-- select-Categories start -->
                                    <div class="select-Categories pt-80 pb-50">
                                        <div class="small-section-tittle2">
                                            <h4>Job Type</h4>
                                        </div>
                                        <label class="container">Full Time <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Part Time <input type="checkbox" checked="checked active"><span class="checkmark"></span></label>
                                        <label class="container">Remote <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Freelance <input type="checkbox"><span class="checkmark"></span></label>
                                    </div>
                                    <!-- select-Categories End -->
                                </div>
                                <!-- single two -->
                                <div class="single-listing">
                                    <div class="small-section-tittle2">
                                        <h4>Job Location</h4>
                                    </div>
                                    <!-- Select job items start -->
                                    <div class="select-job-items2">
                                        <select name="select">
                                            <option value="">Anywhere</option>
                                            <option value="">Category 1</option>
                                            <option value="">Category 2</option>
                                            <option value="">Category 3</option>
                                            <option value="">Category 4</option>
                                        </select>
                                    </div>
                                    <!--  Select job items End-->
                                    <!-- select-Categories start -->
                                    <div class="select-Categories pt-80 pb-50">
                                        <div class="small-section-tittle2">
                                            <h4>Experience</h4>
                                        </div>
                                        <label class="container">1-2 Years <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">2-3 Years <input type="checkbox" checked="checked active"><span class="checkmark"></span></label>
                                        <label class="container">3-6 Years <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">6-more.. <input type="checkbox"><span class="checkmark"></span></label>
                                    </div>
                                    <!-- select-Categories End -->
                                </div>
                                <!-- single three -->
                                <div class="single-listing">
                                    <div class="select-Categories pb-50">
                                        <div class="small-section-tittle2">
                                            <h4>Posted Within</h4>
                                        </div>
                                        <label class="container">Any <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Today <input type="checkbox" checked="checked active"><span class="checkmark"></span></label>
                                        <label class="container">Last 2 days <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Last 3 days <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Last 5 days <input type="checkbox"><span class="checkmark"></span></label>
                                        <label class="container">Last 10 days <input type="checkbox"><span class="checkmark"></span></label>
                                    </div>
                                </div>
                            </div>
                            <!-- Job Category Listing End -->
                        </div> <!-- sticky-sidebar end -->
                    </div>

                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- Count of Job list Start -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <span><asp:Label ID="lblCount" runat="server" Text=""></asp:Label></span>

                                            <!-- Sort dropdown -->
                                            <div class="select-job-items">
                                                <span>Sort by</span>
                                                <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" CssClass="form-control">
                                                    <asp:ListItem Value="none">None</asp:ListItem>
                                                    <asp:ListItem Value="newest">Newest</asp:ListItem>
                                                    <asp:ListItem Value="salary_desc">Salary High → Low</asp:ListItem>
                                                    <asp:ListItem Value="salary_asc">Salary Low → High</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <!--  Select job items End-->
                                        </div>
                                    </div>
                                </div>
                                <!-- Count of Job list End -->

                                <asp:DataList ID="dlJob" runat="server">
                                    <ItemTemplate>
                                        <!-- single-job-content -->
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                                                <div class="company-img">
                                                    <a href='JobDetails.aspx?id=<%# Eval("Id") %>'>
                                                        <asp:Image ID="Image1" class="img-thumbnail" Height="100px" Width="100px" ImageUrl='<%# Eval("CompanyImage") %>' runat="server" />
                                                    </a>
                                                </div>
                                                <div class="job-tittle job-tittle2">
                                                    <a href='JobDetails.aspx?id=<%# Eval("Id") %>'>
                                                        <h4><asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label></h4>
                                                    </a>
                                                    <ul>
                                                        <li><asp:Label ID="Label2" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label></li>
                                                        <li><i class="fas fa-map-marker-alt"></i><asp:Label ID="Label3" runat="server" Text='<%# Eval("Country") %>'></asp:Label></li>
                                                        <li><asp:Label ID="Label4" runat="server" Text='<%# Eval("Salary") %>'></asp:Label></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="items-link items-link2 f-right">
                                                <a href='JobDetails.aspx?id=<%# Eval("Id") %>'>Full Time</a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>

                                <!-- Pager container (server populates ltPager) -->
                                <div class="custom-pager">
                                    <asp:Literal ID="ltPager" runat="server"></asp:Literal>
                                </div>

                            </div>
                        </section>
                        <!-- Featured_job_end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Job List Area End -->
    </main>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../assets//img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- header unchanged -->
    <header>
        <!-- Header Start (kept original) -->
        <div class="header-area header-transparrent">
            <div class="headder-top header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-2">
                            <div class="logo">
                                <a href="Default.aspx"><img src="../assets//img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="menu-wrapper">
                                <div class="main-menu">
                                    <nav class="d-none d-lg-block">
                                        <ul id="navigation">
                                            <li><a href="Default.aspx">Home</a></li>
                                            <li><a href="JobListing.aspx">Find a Jobs </a></li>
                                            <li><a href="About.aspx">About</a></li>
                                            <li><a href="BlogDetails.aspx">Blog</a></li>
                                            <li><a href="Contact.aspx">Contact</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="header-btn d-none f-right d-lg-block">
                                    <asp:LinkButton ID="btn1" runat="server" CssClass="btn head-btn1" CausesValidation="false" Text="Register" OnClick="btn1_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="btn2" runat="server" CssClass="btn head-btn2" CausesValidation="false" Text="Login" OnClick="btn2_Click"></asp:LinkButton>
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
</asp:Content>
