<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ShowAll.aspx.cs" Inherits="ShowAll" %>

<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="Server">
    Show All | SchoolNest
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="Server">

    <div class="table-container">

        <!-- Optional Search / Filter -->
        <div class=" no-print mb-3 d-flex justify-content-between">
            <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" CssClass="form-control w-auto no-print rounded-pill" placeholder="Search..." />
            <%--<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary ms-2"  />--%>
        </div>

        <!-- Data Table -->
        <table class="table table-bordered table-striped">
            <thead class="table-primary ">
                <tr>
                    <th class="align-content-center">Class</th>
                    <th class="align-content-center">Roll No</th>
                    <th class="align-content-center">Student Name</th>
                    <th class="align-content-center">Father's Name</th>
                    <th class="align-content-center">DOB</th>
                    <th class="align-content-center">Email</th>
                    <th class="align-content-center">Phone</th>
                    <th class="align-content-center">Address</th>
                    <th class="align-content-center">Photo</th>
                    <th class="align-content-center d-none">Govt'Id</th>
                    <th class="align-content-center d-none">Gov't Id No</th>
                    <th class="align-content-center d-none">Status</th>

                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptShowAll" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("class") %></td>
                            <td><%# Eval("rollNo") %></td>
                            <td>
                                <a href='<%# "IndividualSudent.aspx?rollNo=" + Eval("rollNo") %>'>
                                    <%# Eval("name") %>
                                </a>
                            </td>
                            <%--<td>
                                <asp:Button Text="" runat="server" /></td>--%>
                            <td><%# Eval("fatherName") %></td>
                            <td><%# Eval("dob", "{0:dd-MM-yyyy}") %></td>
                            <td class="text-wrap" style="width: 1.5rem"><%# Eval("email") %></td>
                            <td><%# Eval("phone") %></td>
                            <td><%# Eval("address") %></td>
                            <td>
                                <img src="<%#Eval("photo") %>" alt="<%#Eval("photo") %>" width="100rem" /></td>
                            <td class="d-none"><%# Eval("govtId") %></td>
                            <td class="d-none"><%# Eval("govtIdNo") %></td>
                            <td class="d-none"><%# Eval("status") %></td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>

            </tbody>

        </table>

        <emptydatatemplate id="edtNoRecord" runat="server" visible="false">
            <div class="alert alert-warning text-center m-2" role="alert">
                No records found.
            </div>
        </emptydatatemplate>

        <!-- Print Button -->
        <div class="no-print text-end mt-3">
            <button type="button" class="btn btn-success" onclick="window.print()">Print</button>
        </div>
    </div>

</asp:Content>
