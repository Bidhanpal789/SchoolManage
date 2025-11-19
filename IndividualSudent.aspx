<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="IndividualSudent.aspx.cs" Inherits="IndividualSudent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Student Profile
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Card style */
        .profile-card {
            max-width: 900px;
            margin: 2rem auto;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-left: 4px solid #ffc107; /* Accent line */
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

            .profile-header h3 {
                margin: 0;
            }

        .profile-details {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem 2rem;
        }

            .profile-details div {
                flex: 1 1 45%;
            }

            .profile-details label {
                font-weight: 600;
            }

            .profile-details span {
                margin-left: 0.5rem;
            }

        .photo-container img {
            border-radius: 6px;
            width: 100px;
            height: 100px;
            object-fit: cover;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }

        /* Print styles */
        @media print {
            .no-print {
                display: none !important;
            }

            body {
                -webkit-print-color-adjust: exact;
            }

            .profile-card {
                box-shadow: none;
                border-left: 0;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="profile-card">
        <!-- Header -->
        <div class="profile-header">
            <h3>Student <span style="color: #ffc107;">Profile</span></h3>
            <div class="photo-container">
                <asp:Image ID="imgStudent" runat="server" ImageUrl="assets/file/avatar.png" />
            </div>
        </div>

        <!-- Top info -->
        <div class="profile-details">
            <div>
                <label>Class:</label>
                <span>
                    <asp:Label ID="lblClass" runat="server" /></span>
            </div>
            <div>
                <label>Student Roll:</label>
                <span>
                    <asp:Label ID="lblRoll" runat="server" /></span>
            </div>
        </div>

        <hr />

        <!-- Remaining info -->
        <div class="profile-details">
            <div>
                <label>Name:</label>
                <span>
                    <asp:Label ID="lblName" runat="server" /></span>
            </div>
            <div>
                <label>Father's Name:</label>
                <span>
                    <asp:Label ID="lblFName" runat="server" /></span>
            </div>
            <div>
                <label>Date Of Birth:</label>
                <span>
                    <asp:Label ID="lblDob" runat="server" /></span>
            </div>
            <div>
                <label>Gov't Id Type:</label>
                <span>
                    <asp:Label ID="lblGvtId" runat="server" /></span>
            </div>
            <div>
                <label>Gov't Id No.:</label>
                <span>
                    <asp:Label ID="lblGvtNo" runat="server" /></span>
            </div>
            <div>
                <label>Email ID (Optional):</label>
                <span>
                    <asp:Label ID="lblEmail" runat="server" /></span>
            </div>
            <div>
                <label>Phone No:</label>
                <span>
                    <asp:Label ID="lblPhone" runat="server" /></span>
            </div>
            <div>
                <label>Address:</label>
                <span>
                    <asp:Label ID="lblAddress" runat="server" /></span>
            </div>
            <div>
                <label>Status:</label>
                <span>
                    <asp:Label ID="lblStatus" runat="server" /></span>
            </div>
        </div>

        <!-- Print button -->
        <div class="text-end mt-3 no-print">
            <button type="button" class="btn btn-success" onclick="window.print()">Print</button>
        </div>
    </div>
</asp:Content>

