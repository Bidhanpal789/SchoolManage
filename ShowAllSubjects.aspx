<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ShowAllSubjects.aspx.cs" Inherits="ShowAllSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    All Subjects | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="mb-3 text-center no-print">
        <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" CssClass="form-control rounded-pill me-auto w-auto" placeholder="Search..." />
    </div>

    <asp:Repeater ID="rptSubjects" runat="server">
        <HeaderTemplate>
            <table class="table table-bordered table-striped text-center">
                <thead class="table-primary">
                    <tr>
                        <th>Class</th>
                        <th>Subject Code</th>
                        <th>Subject</th>
                        <th>Subject Type</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("class") %></td>
                <td><%# Eval("subjectCode") %></td>
                <td><%# Eval("subject") %></td>
                <td><%# Eval("subjectType") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
        </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>

