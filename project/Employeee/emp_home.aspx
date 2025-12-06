<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="emp_home.aspx.cs" Inherits="mca.Employeee.emp_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <main class="main-content">
    <div class="container">
        <header class="main-header">
            <h1>Welcome Back, Recruiter!</h1>
            <p>
                Here's what's happening with your job postings today.</p>
        </header>
        <section class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon blue">
                    <svg width="24" height="24">
                        <use href="#icon-briefcase">
                        </use>
                    </svg>
                </div>
                <div class="stat-info">
                    <h3>Active Jobs</h3>
                    <span class="stat-number">12</span>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon green">
                    <svg width="24" height="24">
                        <use href="#icon-users">
                        </use>
                    </svg>
                </div>
                <div class="stat-info">
                    <h3>New Applicants</h3>
                    <span class="stat-number">64</span>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon orange">
                    <svg width="24" height="24">
                        <use href="#icon-pending">
                        </use>
                    </svg>
                </div>
                <div class="stat-info">
                    <h3>Pending Reviews</h3>
                    <span class="stat-number">8</span>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon red">
                    <svg width="24" height="24">
                        <use href="#icon-hired">
                        </use>
                    </svg>
                </div>
                <div class="stat-info">
                    <h3>Hired This Month</h3>
                    <span class="stat-number">3</span>
                </div>
            </div>
        </section>
        <section class="content-card">
            <div class="content-card-header">
                <h3>Recent Applicants</h3>
                <a href="#" style="text-decoration: none; font-weight: 500;">View All</a>
            </div>
            <div class="table-wrapper">
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
                        <tr>
                            <td>Alex Johnson</td>
                            <td>Senior Frontend Developer</td>
                            <td>2025-11-03</td>
                            <td><span class="status pending">Pending</span></td>
                            <td class="action-buttons">
                                <button>
                                    View
                                </button>
                                <button>
                                    Message
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>Maria Garcia</td>
                            <td>UX/UI Designer</td>
                            <td>2025-11-02</td>
                            <td><span class="status interview">Interview</span></td>
                            <td class="action-buttons">
                                <button>
                                    View
                                </button>
                                <button>
                                    Message
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>David Kim</td>
                            <td>Full-Stack Engineer</td>
                            <td>2025-11-01</td>
                            <td><span class="status hired">Hired</span></td>
                            <td class="action-buttons">
                                <button>
                                    View
                                </button>
                                <button>
                                    Message
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>Sarah Chen</td>
                            <td>Product Manager</td>
                            <td>2025-11-01</td>
                            <td><span class="status interview">Interview</span></td>
                            <td class="action-buttons">
                                <button>
                                    View
                                </button>
                                <button>
                                    Message
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    </main>
</asp:Content>


