<%@ Page Title="" Language="C#" MasterPageFile="~/Adminn/admin.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="project.Adminn.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="main-content flex-grow-1">

        <header class="header shadow-sm">
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="sidebar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <h1 class="header-title" id="header-title">Settings</h1>
            <div class="admin-info d-none d-md-block">Welcome, SuperAdmin</div>
        </header>

        <main class="content p-4 container-fluid">

            <h2>Settings</h2>
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title"><i class="fa-solid fa-user-edit"></i>Admin Profile</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="admin-name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="admin-name" value="SuperAdmin">
                                </div>
                                <div class="mb-3">
                                    <label for="admin-email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="admin-email"
                                        value="admin@jobportal.com">
                                </div>
                                <button type="submit" class="btn btn-primary btn-save">Save Profile</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title"><i class="fa-solid fa-key"></i>Change Password</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="current-password" class="form-label">Current Password</label>
                                    <input type="password" class="form-control" id="current-password">
                                </div>
                                <div class="mb-3">
                                    <label for="new-password" class="form-label">New Password</label>
                                    <input type="password" class="form-control" id="new-password">
                                </div>
                                <div class="mb-3">
                                    <label for="confirm-password" class="form-label">
                                        Confirm New
                                        Password</label>
                                    <input type="password" class="form-control" id="confirm-password">
                                </div>
                                <button type="submit" class="btn btn-primary btn-save">Update Password</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title"><i class="fa-solid fa-globe"></i>General Site Settings</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="site-name" class="form-label">Site Name</label>
                                    <input type="text" class="form-control" id="site-name"
                                        value="My Job Portal">
                                </div>
                                <div class="mb-3">
                                    <label for="site-email" class="form-label">Public Contact
                                        Email</label>
                                    <input type="email" class="form-control" id="site-email"
                                        value="contact@myjobportal.com">
                                </div>
                                <button type="submit" class="btn btn-primary btn-save">Save Settings</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
