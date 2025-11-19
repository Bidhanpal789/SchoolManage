<%@ Page Title="Show All Student Marks" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ShowAllStudentMarks.aspx.cs" Inherits="ShowAllStudentMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Show All | SchoolNest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="table-container">
        <div class="search-box d-flex justify-content-center">
                <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" CssClass="form-control no-print w-auto mb-3 me-auto rounded-pill me-2" placeholder="Search..." />
            <%--<asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />--%>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center">
                <thead class="table-primary">
                    <tr>
                        <th class="text-dark">Roll No</th>
                        <th class="text-dark">Student Name</th>
                        <th class="text-dark">Class</th>
                        <th class="text-dark">Subject</th>
                        <th class="text-dark">Term1</th>
                        <th class="text-dark">Term2</th>
                        <th class="text-dark">Term3</th>
                        <th class="text-dark">Annual</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptMarks" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("rollNo") %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("class") %></td>
                                <td><%# Eval("subject") %></td>
                                <td><%# Eval("obTerm1") %></td>
                                <td><%# Eval("obTerm2") %></td>
                                <td><%# Eval("obTerm3") %></td>
                                <td><%# Eval("obAnnual") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <!-- Print Button -->
            <div class="no-print text-end mt-3">
                <button type="button" class="btn btn-success" onclick="window.print()">Print</button>
            </div>
        </div>
    </div>
</asp:Content>
