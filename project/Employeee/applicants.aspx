<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="applicants.aspx.cs" Inherits="mca.Employeee.applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .app-btn-primary {
            background: var(--primary-color);
            color: #fff;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
        }

            .app-btn-primary:hover {
                background: #004578;
            }

        .app-btn-outline {
            background: transparent;
            color: var(--primary-color);
            border: 1px solid var(--border-color);
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
        }

            .app-btn-outline:hover {
                background: var(--bg-color);
            }

        .applicant-actions {
            display: flex;
            gap: 12px;
            margin-top: 15px;
        }

        .status-badge {
            padding: 6px 10px;
            border-radius: 16px;
            font-weight: 700;
            font-size: .78rem;
            text-transform: capitalize;
        }

            .status-badge.pending {
                background: #fff5eb;
                color: #f2994a;
            }

            .status-badge.hired {
                background: #eaf9f2;
                color: #27ae60;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <header class="main-header">
                <h1>All Applicants</h1>
                <p>Review, rate, and manage all candidates in your pipeline.</p>
            </header>

            <asp:Repeater ID="rptApplicants" runat="server" OnItemCommand="rptApplicants_ItemCommand">
                <ItemTemplate>
                    <div class="applicant-card">
                        <div class="applicant-header">
                            <!-- avatar color from DB -->
                            <div class="applicant-avatar" style='background-color: <%# Eval("AvatarColor") %>;'>
                                <%# GetInitials(Eval("Name")) %>
                            </div>

                            <div class="applicant-info">
                                <h3 class="applicant-name"><%# Eval("Name") %></h3>
                                <p class="applicant-role">Applying for: <strong><%# Eval("Title") %></strong></p>

                                <div class="applicant-meta">
                                    <span class="applied-email">Email: <%# Eval("Email") %></span><br />
                                    <span class="applied-date">Applied: <%# Eval("AppliedAt", "{0:yyyy-MM-dd}") %>                                    </span>
                                </div>
                            </div>

                            <!-- right-aligned status badge (lowercased for CSS matching) -->
                            <div class="applicant-status-wrap">
                                <span class='status-badge <%# DataBinder.Eval(Container.DataItem, "Status").ToString().ToLower() %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </div>
                        </div>

                        <div class="applicant-actions">
                            <asp:LinkButton ID="lnkViewProfile" runat="server" CommandName="ViewProfile"
                                CommandArgument='<%# Eval("UserId") %>' CssClass="app-btn-outline">View Profile</asp:LinkButton>

                            <asp:LinkButton ID="lnkMessage" runat="server" CommandName="Message"
                                CommandArgument='<%# Eval("UserId") %>' CssClass="app-btn-primary">Message</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Literal ID="litApplicantsEmpty" runat="server" EnableViewState="false" />

        </div>
    </main>
</asp:Content>

