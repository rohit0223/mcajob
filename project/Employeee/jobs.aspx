<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="mca.Employeee.jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
              <tr>
                <td>Senior Frontend Developer</td>
                <td><span class="status hired">Active</span></td>
                <td>2025-11-01</td>
                <td>64</td>
                <td class="action-buttons">
                  <button>View Applicants</button>
                  <button>Edit</button>
                  <button>Pause</button>
                </td>
              </tr>
              <tr>
                <td>UX/UI Designer</td>
                <td><span class="status hired">Active</span></td>
                <td>2025-10-28</td>
                <td>22</td>
                <td class="action-buttons">
                  <button>View Applicants</button>
                  <button>Edit</button>
                  <button>Pause</button>
                </td>
              </tr>
              <tr>
                <td>Full-Stack Engineer</td>
                <td><span class="status pending">Paused</span></td>
                <td>2025-10-15</td>
                <td>15 (2 new)</td>
                <td class="action-buttons">
                  <button>View Applicants</button>
                  <button>Edit</button>
                  <button>Activate</button>
                </td>
              </tr>
              <tr>
                <td>Product Manager</td>
                <td><span class="status interview">Draft</span></td>
                <td>2025-11-04</td>
                <td>0</td>
                <td class="action-buttons">
                  <button>Edit</button>
                  <button>Post Job</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </main>
</asp:Content>

