<%@ Page Title="" Language="C#" MasterPageFile="~/Adminn/admin.Master" AutoEventWireup="true" CodeBehind="admin_home.aspx.cs" Inherits="mca.Adminn.admin_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="main-content flex-grow-1">

        <header class="header shadow-sm">
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="sidebar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <h1 class="header-title" id="header-title">Dashboard</h1>
            <div class="admin-info d-none d-md-block">Welcome, SuperAdmin</div>
        </header>

        <main class="content p-4 container-fluid">

            <div class="row g-4 mb-4">
                <div class="col-md-6 col-xl-3">
                    <div class="stat-card card h-100">
                        <div class="card-body d-flex align-items-center">
                            <div class="stat-icon users"><i class="fa-solid fa-users"></i></div>
                            <div class="stat-info ms-3">
                                <h3>Total Users</h3>
                                <p><asp:Label ID="lblTotalUsers" runat="server" CssClass="stat-count-label"></asp:Label> </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="stat-card card h-100">
                        <div class="card-body d-flex align-items-center">
                            <div class="stat-icon recruiters"><i class="fa-solid fa-briefcase"></i></div>
                            <div class="stat-info ms-3">
                                <h3>Recruiters</h3>
                                <p><asp:Label ID="lblTotalRecruiters" runat="server" CssClass="stat-count-label"></asp:Label></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="stat-card card h-100">
                        <div class="card-body d-flex align-items-center">
                            <div class="stat-icon jobs"><i class="fa-solid fa-file-alt"></i></div>
                            <div class="stat-info ms-3">
                                <h3>Jobs Posted</h3>
                                <p><asp:Label ID="lblTotalJobs" runat="server" CssClass="stat-count-label"></asp:Label> </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="stat-card card h-100">
                        <div class="card-body d-flex align-items-center">
                            <div class="stat-icon admins"><i class="fa-solid fa-user-shield"></i></div>
                            <div class="stat-info ms-3">
                                <h3>Admins</h3>
                                <p><asp:Label ID="lblTotalAdmins" runat="server" CssClass="stat-count-label"></asp:Label></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card chart-container">
                <div class="card-body">
                    <h2 class="card-title">Jobs Posted This Week</h2>
                    <div class="chart-bars">
                        <div class="bar" style="height: 60%;">
                            <span class="bar-value">120</span>
                            <span class="bar-label">Mon</span>
                        </div>
                        <div class="bar" style="height: 80%;">
                            <span class="bar-value">150</span>
                            <span class="bar-label">Tue</span>
                        </div>
                        <div class="bar" style="height: 70%;">
                            <span class="bar-value">135</span>
                            <span class="bar-label">Wed</span>
                        </div>
                        <div class="bar" style="height: 90%;">
                            <span class="bar-value">170</span>
                            <span class="bar-label">Thu</span>
                        </div>
                        <div class="bar" style="height: 75%;">
                            <span class="bar-value">140</span>
                            <span class="bar-label">Fri</span>
                        </div>
                        <div class="bar" style="height: 40%;">
                            <span class="bar-value">80</span>
                            <span class="bar-label">Sat</span>
                        </div>
                        <div class="bar" style="height: 30%;">
                            <span class="bar-value">55</span>
                            <span class="bar-label">Sun</span>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</asp:Content>


