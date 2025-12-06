<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="jobpost.aspx.cs" Inherits="mca.Employeee.jobpost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content> 


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-content">
        <div class="container">
            <section class="content-card">

                <div class="modal-header" style="border-bottom: 1px solid var(--border-color); padding-bottom: 15px;">
                    <h2 style="margin: 0;">Create a New Job Posting</h2>
                </div>

                <div class="modal-body">
                    <%-- IMPORTANT: The form must have runat="server" to process ASP.NET controls --%>
                    <div id="jobPostForm" runat="server"> 
                        <h3>Job Details</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="txtTitle">Job Title</label>
                                <%-- Replaced <input> with <asp:TextBox> --%>
                                <asp:TextBox ID="txtTitle" runat="server" placeholder="e.g., Senior Frontend Developer" CssClass="form-control"></asp:TextBox> 
                            </div>
                            <div class="form-group">
                                <label for="txtRole">Job Post / Role</label>
                                <%-- Replaced <input> with <asp:TextBox> (This maps to the [Post] column) --%>
                                <asp:TextBox ID="txtRole" runat="server" placeholder="e.g., Engineering" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="ddlJobType">Job Type</label>
                                <%-- Replaced <select> with <asp:DropDownList> --%>
                                <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Full-Time" Value="Full-Time"></asp:ListItem>
                                    <asp:ListItem Text="Part-Time" Value="Part-Time"></asp:ListItem>
                                    <asp:ListItem Text="Contract" Value="Contract"></asp:ListItem>
                                    <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="txtSalary">Salary Range</label>
                                <asp:TextBox ID="txtSalary" runat="server" placeholder="e.g., $80,000 - $100,000" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="txtExperience">Experience</label>
                                <asp:TextBox ID="txtExperience" runat="server" placeholder="e.g., 5+ years" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtLastDate">Last Date to Apply</label>
                                <%-- TextMode="Date" is used for HTML5 date picker --%>
                                <asp:TextBox ID="txtLastDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox> 
                            </div>
                        </div>

                        <h3>Job Description</h3>
                        <div class="form-group">
                            <label for="txtDescription">Full Description</label>
                            <%-- Replaced <textarea> with <asp:TextBox TextMode="MultiLine"> --%>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="8" placeholder="Enter job responsibilities..." CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="txtQualification">Qualification</label>
                            <%-- This maps to the [Qulification] column --%>
                            <asp:TextBox ID="txtQualification" runat="server" placeholder="e.g., Bachelor's Degree in Computer Science" CssClass="form-control"></asp:TextBox>
                        </div>

                        <h3>Company Details</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="txtCompanyName">Company Name</label>
                                <asp:TextBox ID="txtCompanyName" runat="server" placeholder="e.g., Tech Solutions Inc." CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="fileCompanyImage">Company Image/Logo</label>
                                <%-- Using FileUpload control for file handling --%>
                                <asp:FileUpload ID="fileCompanyImage" runat="server" CssClass="form-control-file" /> 
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="txtWebsite">Company Website</label>
                                <asp:TextBox ID="txtWebsite" runat="server" TextMode="Url" placeholder="https://www.example.com" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtEmail">Application Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="hr@example.com" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <h3>Location</h3>
                        <div class="form-group">
                            <label for="txtAddress">Full Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" placeholder="123 Main St..." CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="ddlCountry">Country</label>
                                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select a Country..." Value="" Selected="True" Disabled="True"></asp:ListItem>
                                    <asp:ListItem Value="USA">United States</asp:ListItem>
                                    <asp:ListItem Value="India">India</asp:ListItem>
                                    <asp:ListItem Value="UK">United Kingdom</asp:ListItem>
                                    <asp:ListItem Value="Canada">Canada</asp:ListItem>
                                    <asp:ListItem Value="Australia">Australia</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ddlState">State</label>
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select a State..." Value="" Selected="True" Disabled="True"></asp:ListItem>
                                    <asp:ListItem Value="New York">New York</asp:ListItem>
                                    <asp:ListItem Value="California">California</asp:ListItem>
                                    <asp:ListItem Value="Texas">Texas</asp:ListItem>
                                    <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                    <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer" style="border-top: 1px solid var(--border-color); margin-top: 20px;">
                    <%-- Added ASP.NET Buttons with required attributes --%>
                    <asp:Button ID="btnSaveDraft" runat="server" Text="Save as Draft" CssClass="btn-secondary" />
                    <%-- OnClick event links to the C# method in jobpost.aspx.cs --%>
                    <asp:Button ID="btnPostJob" runat="server" Text="Post Job" CssClass="btn-primary" OnClick="btnPostJob_Click" />
                </div>
            </section>
        </div>
    </main>
</asp:Content>
