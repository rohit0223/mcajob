<%@ Page Title="Manage Admins" Language="C#" MasterPageFile="~/Adminn/admin.Master" AutoEventWireup="true" CodeBehind="ManageAdmins.aspx.cs" Inherits="project.Adminn.ManageAdmins" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="main-content flex-grow-1">

        <header class="header shadow-sm">
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="sidebar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <h1 class="header-title" id="header-title">Manage Admins</h1>
            <div class="admin-info d-none d-md-block">Welcome, SuperAdmin</div>
        </header>

        <main class="content p-4 container-fluid">

            <h2>Manage Admin Accounts</h2>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Admin ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>ADM_001</td>
                                    <td>SuperAdmin</td>
                                    <td>admin@jobportal.com</td>
                                    <td><span class="status status-super">Super Admin</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-warning text-dark" title="Edit">
                                            <i class="fa-solid fa-pencil"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ADM_002</td>
                                    <td>Content Moderator</td>
                                    <td>moderator@jobportal.com</td>
                                    <td><span class="status status-moderator">Moderator</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-warning text-dark" title="Edit">
                                            <i class="fa-solid fa-pencil"></i>
                                        </button>
                                        <button class="btn btn-sm btn-danger" title="Delete">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>
    </div>
</asp:Content>
