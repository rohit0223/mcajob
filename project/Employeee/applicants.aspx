<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="applicants.aspx.cs" Inherits="mca.Employeee.applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <header class="main-header">
                <h1>All Applicants</h1>
                <p>Review, rate, and manage all candidates in your pipeline.</p>
            </header>

            <div class="applicant-list-container">

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-avatar">AJ</div>
                        <div class="applicant-info">
                            <h3 class="applicant-name">Alex Johnson</h3>
                            <p class="applicant-role">Applying for: <strong>Senior Frontend Developer</strong></p>
                        </div>
                        <span class="status pending">Pending</span>
                    </div>
                    <div class="applicant-details">
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-calendar"></use>
                            </svg>
                            Applied: 2025-11-03</span>
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-mail"></use>
                            </svg>
                            alex.j@example.com</span>
                    </div>
                    <div class="applicant-actions">
                        <button>View Profile</button>
                        <button>Message</button>
                    </div>
                </div>

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-avatar" style="background-color: #c92a2a;">MG</div>
                        <div class="applicant-info">
                            <h3 class="applicant-name">Maria Garcia</h3>
                            <p class="applicant-role">Applying for: <strong>UX/UI Designer</strong></p>
                        </div>
                        <span class="status interview">Interview</span>
                    </div>
                    <div class="applicant-details">
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-calendar"></use>
                            </svg>
                            Applied: 2025-11-02</span>
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-mail"></use>
                            </svg>
                            maria.g@example.com</span>
                    </div>
                    <div class="applicant-actions">
                        <button>View Profile</button>
                        <button>Message</button>
                    </div>
                </div>

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-avatar" style="background-color: #27ae60;">DK</div>
                        <div class="applicant-info">
                            <h3 class="applicant-name">David Kim</h3>
                            <p class="applicant-role">Applying for: <strong>Full-Stack Engineer</strong></p>
                        </div>
                        <span class="status hired">Hired</span>
                    </div>
                    <div class="applicant-details">
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-calendar"></use>
                            </svg>
                            Applied: 2025-11-01</span>
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-mail"></use>
                            </svg>
                            david.kim@example.com</span>
                    </div>
                    <div class="applicant-actions">
                        <button>View Profile</button>
                        <button>Message</button>
                    </div>
                </div>

                <div class="applicant-card">
                    <div class="applicant-header">
                        <div class="applicant-avatar" style="background-color: #f2994a;">SC</div>
                        <div class="applicant-info">
                            <h3 class="applicant-name">Sarah Chen</h3>
                            <p class="applicant-role">Applying for: <strong>Product Manager</strong></p>
                        </div>
                        <span class="status interview">Interview</span>
                    </div>
                    <div class="applicant-details">
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-calendar"></use>
                            </svg>
                            Applied: 2025-11-01</span>
                        <span>
                            <svg width="16" height="16">
                                <use href="#icon-mail"></use>
                            </svg>
                            sarah.c@example.com</span>
                    </div>
                    <div class="applicant-actions">
                        <button>View Profile</button>
                        <button>Message</button>
                    </div>
                </div>

            </div>
        </div>
    </main>
</asp:Content>

