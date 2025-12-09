<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="emp_home.aspx.cs" Inherits="mca.Employeee.emp_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <header class="main-header">
                <h1>Welcome Back, Recruiter!</h1>
                <p>Here's what's happening with your job postings today.</p>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon blue">
                        <svg width="24" height="24">
                            <use href="#icon-briefcase"></use></svg>
                    </div>
                    <div class="stat-info">
                        <h3>Active Jobs</h3>
                        <asp:Label ID="lblActiveJobs" runat="server" CssClass="stat-number">0</asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon green">
                        <svg width="24" height="24">
                            <use href="#icon-users"></use></svg>
                    </div>
                    <div class="stat-info">
                        <h3>New Applicants</h3>
                        <asp:Label ID="lblNewApplicants" runat="server" CssClass="stat-number">0</asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon orange">
                        <svg width="24" height="24">
                            <use href="#icon-pending"></use></svg>
                    </div>
                    <div class="stat-info">
                        <h3>Pending Reviews</h3>
                        <asp:Label ID="lblPendingReviews" runat="server" CssClass="stat-number">0</asp:Label>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon red">
                        <svg width="24" height="24">
                            <use href="#icon-hired"></use></svg>
                    </div>
                    <div class="stat-info">
                        <h3>Hired This Month</h3>
                        <asp:Label ID="lblHiredThisMonth" runat="server" CssClass="stat-number">0</asp:Label>
                    </div>
                </div>
            </section>

            <section class="content-card">
                <div class="content-card-header">
                    <h3>Recent Applicants</h3>
                    <asp:HyperLink ID="lnkViewAll" runat="server" NavigateUrl="~/Employeee/applicants.aspx" CssClass="" Text="View All" />
                </div>

                <div class="table-wrapper">
                    <!-- Using Repeater to render rows dynamically -->
                    <asp:Repeater ID="rptRecentApplicants" runat="server" OnItemCommand="rptRecentApplicants_ItemCommand">
                        <HeaderTemplate>
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Applying For</th>
                                        <th>Date Applied</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Title") %></td>
                                <td><%# Eval("AppliedAt", "{0:yyyy-MM-dd}") %></td>
                                <td><span class="status <%# Eval("Status") %>"><%# Eval("Status") %></span></td>
                                <td class="action-buttons">
                                    <!-- Use JobId|UserId so we are not dependent on a specific PK column name -->
                                    <asp:LinkButton ID="lnkView" runat="server" CommandName="View"
                                        CommandArgument='<%# Eval("JobId") + "|" + Eval("UserId") %>'>View</asp:LinkButton>
                                    &nbsp;
        <asp:LinkButton ID="lnkMessage" runat="server" CommandName="Message"
            CommandArgument='<%# Eval("UserId") %>'>Message</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
    </table>
                        </FooterTemplate>
                    </asp:Repeater>


                    <asp:Literal ID="litNoRecords" runat="server" EnableViewState="false" />
                </div>
            </section>
        </div>
    </main>
</asp:Content>


