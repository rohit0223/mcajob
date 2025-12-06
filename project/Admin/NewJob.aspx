<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="project.Admin.NewJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0px;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            width: 50%;
            align-content: center;
        }

        .form-part {
            width: 48%; /* Adjust as needed */
        }

        .form-row {
            margin-bottom: 15px;
        }

            .form-row label {
                display: block;
                margin-bottom: 5px;
            }

            .form-row input, .form-row select {
                width: 100%;
                padding: 5px;
            }

        input[type="submit"] {
            width: 50%;
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
    </style>
    <br />
    <center>
        <asp:Label ID="Label1" runat="server" Font-Size="20" Text="Add New Job" Visible="true"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Size="20" Text="Edit Job" Visible="false"></asp:Label>
        <br />
        <br />
        <br />
        <div>
            <div class="form-container">
                <div class="form-part">
                    <div class="form-row">
                        <label for="title">Title:</label>
                        <%--<input type="text" id="title" runat="server" required />--%>
                        <asp:TextBox ID="txttitle" runat="server" placeholder="Ex.Web Developer"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="description">Description:</label>
                        <%--<input type="text" id="description" runat="server" required />--%>
                        <asp:TextBox ID="txtdes" runat="server" placeholder="description"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="experience">Experience:</label>
                        <%--<input type="text" id="experience" runat="server" required />--%>
                        <asp:TextBox ID="txtex" runat="server" placeholder="Enter Year Or Month"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="salary">Salary:</label>
                        <%--<input type="text" id="salary" runat="server" required />--%>
                        <asp:TextBox ID="txtsalary" runat="server" placeholder="Enter Salary"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="companyName">Company Name:</label>
                        <%--<input type="text" id="companyName" runat="server" required />--%>
                        <asp:TextBox ID="txtcnm" runat="server" placeholder="Enter Name"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="website">Website :</label>
                        <%--<input type="text" id="companyName" runat="server" required />--%>
                        <asp:TextBox ID="txtweb" runat="server" placeholder="Ex. rku.ac.in"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="Address">Address:</label>
                        <%--<input type="text" id="companyName" runat="server" required />--%>
                        <asp:TextBox ID="txtadd" runat="server" placeholder="Enter Address"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <label for="State">State:</label>
                        <%--<input type="text" id="companyName" runat="server" required />--%>
                        <asp:TextBox ID="txtstat" runat="server" placeholder="Enter State"></asp:TextBox>
                    </div>

                </div>

                <div class="form-part">

                    <div class="form-row">
                        <label for="post">Number Of Post:</label>
                        <%--<input type="text" id="post" runat="server" required />--%>
                        <asp:TextBox ID="txtpost" runat="server" placeholder="Ex.2 or 3"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <label for="qualification">Qualification:</label>
                        <%--<input type="text" id="qualification" runat="server" required />--%>
                        <asp:TextBox ID="txtqul" runat="server" placeholder="Ex. BCA MCA"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <label for="lastDate">Last Date:</label>
                        <%--<input type="text" id="lastDate" runat="server" required />--%>
                        <asp:TextBox ID="txtdate" runat="server" placeholder="Enter Date"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <label for="jobType">Job Type:</label>
                        <%--<input type="text" id="jobType" runat="server" required />--%>
                        <asp:DropDownList ID="txttype" runat="server">
                            <asp:ListItem>Select Type</asp:ListItem>
                            <asp:ListItem>Full Time</asp:ListItem>
                            <asp:ListItem>Part Time</asp:ListItem>
                            <asp:ListItem>Remote</asp:ListItem>
                            <asp:ListItem>Freelance</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:TextBox ID="txttype" runat="server" placeholder="Ex. Full Time"></asp:TextBox>--%>
                    </div>

                    <div class="form-row">
                        <label for="companyImage">Company Image:</label>
                        <%--<input type="text" id="companyImage" runat="server" required />--%>
                        <asp:FileUpload ID="fldimg" runat="server" />
                    </div>


                    <div class="form-row">
                        <label for="email">Email:</label>
                        <%--<input type="text" id="lastDate" runat="server" required />--%>
                        <asp:TextBox ID="txteml" runat="server" placeholder="Enter Email"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <label for="Country">Country:</label>
                        <%--<input type="text" id="lastDate" runat="server" required />--%>
                        <%--<asp:TextBox ID="txtcnt" runat="server" placeholder="Enter Country"></asp:TextBox>--%>
                        <asp:DropDownList ID="txtcnt" runat="server">
                            <asp:ListItem>Select Country</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                            <asp:ListItem>UK</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <%--<input type="submit" value="Submit" runat="server" />--%>
            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
        </div>
        <asp:Label ID="lblmsg" runat="server" Visible="False"></asp:Label>
    </center>
</asp:Content>

