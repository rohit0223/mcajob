<%@ Page Title="" Language="C#" MasterPageFile="~/Adminn/admin.Master" AutoEventWireup="true" CodeBehind="ManageJobs.aspx.cs" Inherits="project.Adminn.ManageJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="main-content flex-grow-1">

        <header class="header shadow-sm">
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="sidebar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <h1 class="header-title" id="header-title">Manage Jobs</h1>
            <div class="admin-info d-none d-md-block">Welcome, SuperAdmin</div>
        </header>

        <main class="content p-4 container-fluid">

            <h2>Manage Job Listings</h2>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        
                        <asp:Repeater ID="JobRepeater" runat="server">
                            
                            <HeaderTemplate>
                                <table class="table table-striped table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Company</th>
                                            <th>Posted On</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ID") %></td> 
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("CompanyName") %></td>
                                    
                                    <td><%# Eval("LastDate", "{0:yyyy-MM-dd}") %></td>
                                    
                                    <td>
                                        <asp:LinkButton ID="btnView" runat="server" CssClass="btn btn-sm btn-info" ToolTip="View">
                                            <i class="fa-solid fa-eye"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-sm btn-warning text-dark" ToolTip="Edit">
                                            <i class="fa-solid fa-pencil"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server" 
                                            CommandName="DeleteJob" 
                                            CommandArgument='<%# Eval("ID") %>'
                                            OnClientClick="return confirm('Confirm deletion?');"
                                            CssClass="btn btn-sm btn-danger" 
                                            ToolTip="Delete">
                                            <i class="fa-solid fa-trash"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <FooterTemplate>
                                    </tbody>
                                </table>
                                <asp:Label ID="lblNoData" runat="server" Visible="false" Text="No job postings found."></asp:Label>
                            </FooterTemplate>

                        </asp:Repeater>
                        
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>