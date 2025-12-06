<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="analytics.aspx.cs" Inherits="mca.Employeee.analytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <header class="main-header">
                <h1>Hiring Analytics</h1>
                <p>Review your hiring performance and pipeline efficiency.</p>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon blue">
                        <svg width="24" height="24">
                            <use href="#icon-users-group"></use>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>Applicants (30d)</h3>
                        <span class="stat-number">82</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon green">
                        <svg width="24" height="24">
                            <use href="#icon-clock"></use>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>Avg. Time to Hire</h3>
                        <span class="stat-number">21 Days</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon orange">
                        <svg width="24" height="24">
                            <use href="#icon-target"></use>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>Hire Rate (30d)</h3>
                        <span class="stat-number">3.6%</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon red">
                        <svg width="24" height="24">
                            <use href="#icon-chart-pie"></use>
                        </svg>
                    </div>
                    <div class="stat-info">
                        <h3>Interviews (30d)</h3>
                        <span class="stat-number">14</span>
                    </div>
                </div>
            </section>

            <div class="analytics-grid">

                <section class="content-card">
                    <div class="content-card-header">
                        <h3>Applicant Funnel</h3>
                    </div>
                    <div class="funnel-container">
                        <div class="funnel-step">
                            <div class="funnel-step-number">82</div>
                            <div class="funnel-step-info">
                                <h4>Applied</h4>
                                <p>100% of total applicants</p>
                            </div>
                        </div>
                        <div class="funnel-step">
                            <div class="funnel-step-number">35</div>
                            <div class="funnel-step-info">
                                <h4>Screened</h4>
                                <p>42.7% of total applicants</p>
                            </div>
                        </div>
                        <div class="funnel-step">
                            <div class="funnel-step-number">14</div>
                            <div class="funnel-step-info">
                                <h4>Interviewed</h4>
                                <p>17.1% of total applicants</p>
                            </div>
                        </div>
                        <div class="funnel-step">
                            <div class="funnel-step-number">3</div>
                            <div class="funnel-step-info">
                                <h4>Hired</h4>
                                <p>3.6% of total applicants</p>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="content-card">
                    <div class="content-card-header">
                        <h3>Applicant Sources</h3>
                    </div>
                    <div class="source-list">
                        <div class="source-item">
                            <h4><span>LinkedIn</span> <span class="percent">45%</span></h4>
                            <div class="source-bar-bg">
                                <div class="source-bar" style="width: 45%; background-color: var(--primary-color);"></div>
                            </div>
                        </div>
                        <div class="source-item">
                            <h4><span>Company Site</span> <span class="percent">25%</span></h4>
                            <div class="source-bar-bg">
                                <div class="source-bar" style="width: 25%; background-color: #27ae60;"></div>
                            </div>
                        </div>
                        <div class="source-item">
                            <h4><span>Indeed</span> <span class="percent">20%</span></h4>
                            <div class="source-bar-bg">
                                <div class="source-bar" style="width: 20%; background-color: #f2994a;"></div>
                            </div>
                        </div>
                        <div class="source-item">
                            <h4><span>Referral</span> <span class="percent">10%</span></h4>
                            <div class="source-bar-bg">
                                <div class="source-bar" style="width: 10%; background-color: #eb5757;"></div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
            <section class="content-card">
                <div class="content-card-header">
                    <h3>Top Performing Jobs</h3>
                </div>
                <div class="table-wrapper">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Job Title</th>
                                <th>Views</th>
                                <th>Applicants</th>
                                <th>Conversion Rate</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Senior Frontend Developer</td>
                                <td>1,204</td>
                                <td>64</td>
                                <td>5.3%</td>
                            </tr>
                            <tr>
                                <td>UX/UI Designer</td>
                                <td>980</td>
                                <td>22</td>
                                <td>2.2%</td>
                            </tr>
                            <tr>
                                <td>Full-Stack Engineer</td>
                                <td>850</td>
                                <td>15</td>
                                <td>1.8%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </div>
    </main>
</asp:Content>

