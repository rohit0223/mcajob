<%@ Page Title="" Language="C#" MasterPageFile="~/Adminn/admin.Master" AutoEventWireup="true" CodeBehind="ManageRecruiters.aspx.cs" Inherits="project.Adminn.ManageRecruiters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="main-content flex-grow-1">

        <header class="header shadow-sm">
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="sidebar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <h1 class="header-title" id="header-title">Manage Recruiters</h1>
            <div class="admin-info d-none d-md-block">Welcome, SuperAdmin</div>
        </header>

        <main class="content p-4 container-fluid">

            <h2>Manage Recruiters / Companies</h2>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">

                        <%-- REPLACE STATIC TABLE WITH GridView --%>
                        <asp:GridView
                            ID="gvRecruiters"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-striped table-hover align-middle"
                            HeaderStyle-CssClass="thead-light"
                            EmptyDataText="No recruiter records found."
                            AllowPaging="True"
                            PageSize="10"
                            OnPageIndexChanging="gvRecruiters_PageIndexChanging">

                            <Columns>
                                <asp:BoundField DataField="EmployerId" HeaderText="Recruiter ID" SortExpression="EmployerId" />
                                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                                <asp:BoundField DataField="Email" HeaderText="Contact Email" SortExpression="Email" />

                                <%-- Status and Actions use TemplateFields for custom HTML/Buttons --%>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%-- NOTE: Assuming you have a 'Status' column or logic for status --%>
                                        <span class="status status-approved">Approved</span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <button class="btn btn-sm btn-info" title="View"><i class="fa-solid fa-eye"></i></button>
                                        <button class="btn btn-sm btn-warning text-dark" title="Edit"><i class="fa-solid fa-pencil"></i></button>
                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"
                                            CssClass="btn btn-sm btn-danger"
                                            CommandName="DeleteRecruiter"
                                            CommandArgument='<%# Eval("EmployerId") %>'
                                            OnClientClick="return confirm('Are you sure you want to delete this recruiter?');"
                                            ToolTip="Delete">
                                            <i class="fa-solid fa-trash"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="p-2" />
                        </asp:GridView>

                    </div>
                </div>
            </div>

        </main>
    </div>
</asp:Content>
