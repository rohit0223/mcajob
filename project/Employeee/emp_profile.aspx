<%@ Page Title="" Language="C#" MasterPageFile="~/Employeee/emp.Master" AutoEventWireup="true" CodeBehind="emp_profile.aspx.cs" Inherits="project.Employeee.emp_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-card { max-width:900px; margin:20px auto; background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 6px rgba(0,0,0,.05); }
        .profile-grid { display:grid; grid-template-columns: 200px 1fr; gap:20px; align-items:start; }
        .company-img { width:160px; height:160px; border-radius:8px; object-fit:cover; border:1px solid #eee; }
        .form-row { margin-bottom:12px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="profile-card">
        <h2>Company Profile</h2>
        <asp:Literal ID="litMessage" runat="server" />
        <div class="profile-grid">
            <div>
                <asp:Image ID="imgCompany" runat="server" CssClass="company-img" />
                <br /><br />
                <asp:FileUpload ID="fuCompanyImage" runat="server" />
            </div>

            <div>
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="form-row">
                        <asp:Label runat="server" Text="Company Name" AssociatedControlID="txtCompanyName" />
                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="txt" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Full Name (Contact Person)" AssociatedControlID="txtFullName" />
                        <asp:TextBox ID="txtFullName" runat="server" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Email" AssociatedControlID="txtEmail" />
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Mobile" AssociatedControlID="txtMobile" />
                        <asp:TextBox ID="txtMobile" runat="server" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Address" AssociatedControlID="txtAddress" />
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Country" AssociatedControlID="txtCountry" />
                        <asp:TextBox ID="txtCountry" runat="server" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Username (readonly)" AssociatedControlID="txtUserName" />
                        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true" />
                    </div>

                    <div class="form-row">
                        <asp:Label runat="server" Text="Change Password (leave blank to keep)" AssociatedControlID="txtPassword" />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                    </div>

                    <div class="form-row">
                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

