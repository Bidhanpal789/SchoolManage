<%@ Page Title="Print Marksheet" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="PrintMarksheet.aspx.cs" Inherits="PrintMarksheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Print Marksheet | SchoolNest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .marksheet-container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            border: 2px solid #000;
            background: #fff;
        }

        .marksheet-header {
            text-align: center;
            border-bottom: 2px solid #000;
            margin-bottom: 20px;
        }

        .student-info {
            margin-bottom: 20px;
        }

            .student-info td {
                padding: 5px 10px;
            }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .print-btn {
            margin-top: 20px;
            text-align: right;
        }

        @media print {
            .no-print {
                display: none;
            }

            body {
                background: #fff;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">

    <!-- Search Form -->
    <div class=" mb-4 d-flex gap-2 justify-content-center align-content-center text-center overflow-hidden no-print">
        <div class="row no-print">
            <div class="col-lg-4 col-sm-10 mb-2">
                <div class="px-3 d-flex flex-column">
                    <p class="p-0 text-start m-0">Roll No:</p>
                    <asp:TextBox ID="txtRollNo" runat="server" placeholder="Enter Roll No" CssClass="form-control d-inline w-auto" />
                </div>
            </div>
            <div class="col-lg-4 col-sm-10">
                <div class="d-flex px-3 flex-column">
                    <p class="p-0 text-start m-0">Class: </p>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-select d-inline w-auto">
                        <asp:ListItem Text="--Select Class--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="align-content-center pt-4">
                    <asp:Button ID="btnFetch" runat="server" Text="Fetch Marksheet" CssClass="btn btn-primary ms-2 align-content-center" OnClick="btnFetch_Click" />

                </div>
            </div>
        </div>


    </div>
    <!-- Marksheet -->
    <div id="marksheet" class="marksheet-container" runat="server" style="display: none;">
        <!-- Header -->
        <div class="marksheet-header">
            <div class="d-flex justify-content-center mb-2">
                <img src="assets/images/logo.png" alt="Alternate Text" class="w-5" />
                <h2 class="align-content-center ps-3">School<span class="text-warning">Nest</span></h2>
            </div>
            <h4>Academic Marksheet</h4>
        </div>

        <!-- Student Info -->
        <table class="student-info w-100">
            <tr>
                <td><b>Roll No:</b>
                    <asp:Label ID="lblRollNo" runat="server" /></td>
                <td><b>Name:</b>
                    <asp:Label ID="lblStudentName" runat="server" /></td>
                <td><b>Class:</b>
                    <asp:Label ID="lblClass" runat="server" /></td>
                <td rowspan="2" class="text-center">
                    <asp:Image ID="imgStudent" runat="server" ImageUrl="assets/file/avatar.png"
                        CssClass="border" Width="70px" Height="80px" />
                </td>
            </tr>
            <tr>
                <td colspan="3"><b>Session:</b>
                    <asp:Label ID="lblSession" runat="server" /></td>
            </tr>
        </table>

        <!-- Marks Table -->
        <asp:Table ID="tblMarks" runat="server" CssClass="table table-bordered text-center">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Subject</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term1 Full</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term1 Obtained</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term2 Full</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term2 Obtained</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term3 Full</asp:TableHeaderCell>
                <asp:TableHeaderCell>Term3 Obtained</asp:TableHeaderCell>
                <asp:TableHeaderCell>Annual Full</asp:TableHeaderCell>
                <asp:TableHeaderCell>Annual Obtained</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>




        <!-- Totals -->
        <div class="mt-3 text-end">
            <span>Full Marks: </span>
            <asp:Label ID="lblTotalMarks" runat="server" CssClass="fw-bold me-3"></asp:Label>
            <span >Total Marks: </span>
            <asp:Label ID="lblFinalMarks" runat="server" CssClass="fw-bold text-success"></asp:Label>
        </div>

        <!-- Print Button -->
        <div class="print-btn no-print text-end mt-3">
            <button type="button" class="btn btn-success" onclick="window.print()">Print Marksheet</button>
        </div>
    </div>


</asp:Content>
