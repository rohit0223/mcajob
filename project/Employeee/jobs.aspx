<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="mca.Employeee.jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <header class="main-header">
                <h1>Manage Your Jobs</h1>
                <p>Edit, pause, or view applicants for your active job postings.</p>
            </header>

            <section class="content-card">
                <div class="content-card-header">
                    <h3>All Job Postings</h3>
                    <a href="#" style="text-decoration: none; font-weight: 500;">View Archived Jobs</a>
                </div>
                <div class="table-wrapper">
                    <!-- Replace the <table class="data-table">...</table> with this Repeater block -->
                    <asp:Repeater ID="rptJobs" runat="server" OnItemCommand="rptJobs_ItemCommand">
                        <HeaderTemplate>
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Job Title</th>
                                        <th>Status</th>
                                        <th>Date Posted</th>
                                        <th>Applicants</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Title") %></td>
                                <td>
                                    <span class="status <%# Eval("Status").ToString().ToLower() %>">
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td><%# Eval("CreatedAt", "{0:yyyy-MM-dd}") %></td>
                                <td>
                                    <%# Eval("Applicants") %>
                                    <%# (Convert.ToInt32(Eval("NewApplicants")) > 0 ? " (" + Eval("NewApplicants") + " new)" : "") %>
                                </td>
                                <td class="action-buttons">
                                    <asp:LinkButton ID="lnkViewApplicants" runat="server" CommandName="ViewApplicants"
                                        CommandArgument='<%# Eval("JobId") %>'>View Applicants</asp:LinkButton>
                                    &nbsp;
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit"
                    CommandArgument='<%# Eval("JobId") %>'>Edit</asp:LinkButton>
                                    &nbsp;
                <asp:LinkButton ID="lnkToggle" runat="server" CommandName="ToggleStatus"
                    CommandArgument='<%# Eval("JobId") + "|" + Eval("Status") %>'>
                    <%# (Eval("Status").ToString().ToLower() == "active" ? "Pause" : (Eval("Status").ToString().ToLower()=="paused" ? "Activate" : "Post Job")) %>
                </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
        </table>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Literal ID="litJobsEmpty" runat="server" EnableViewState="false" />

                </div>
            </section>
        </div>
    </main>
</asp:Content>

