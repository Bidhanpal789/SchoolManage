<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="MarksEntry.aspx.cs" Inherits="MarksEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Marks Entry | SchoolNest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow">
        <div class="card-body p-3">
            <h4 class="text-center mb-4">Marks <span class="text-warning">Entry</span></h4>

            <!-- Student Info Section -->
            <div class="row mb-3">
                <!-- Roll No + Class -->
                <div class="col-md-4 d-flex flex-column">
                    <label for="txtRollNo" class="form-label">Roll No <span class="text-danger">*</span></label>
                    <div class="input-group mb-2">
                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <label for="ddlClass" class="form-label">Class <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-select">
                        <asp:ListItem Text="--Select Class--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                    </asp:DropDownList>
                </div>

                <!-- Student Image + Name -->
                <div class="col-md-4 d-flex justify-content-center">
                    <div class="text-center">
                        <img src="assets/file/avatar.png" id="imgStudent" runat="server"
                            class="border rounded shadow-sm" style="height: 7rem; width: 6rem" />
                        <asp:Label Text="Student Name" ID="lblStudentName" CssClass="fw-bold d-block mt-2" runat="server" />

                        <asp:Button Text="Fetch" ID="btnFetch" runat="server" CssClass="btn btn-info shadow-sm" OnClick="btnFetch_Click" />

                    </div>
                </div>
            </div>

            <!-- Term -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="ddlTerm" class="form-label">Term <span class="text-danger">*</span></label>
                    <asp:DropDownList ID="ddlTerm" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlTerm_SelectedIndexChanged" >
                        <asp:ListItem Text="--Select Term--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="Annual" />
                    </asp:DropDownList>
                </div>
            </div>

            <hr class="my-3" />

            <!-- Marks Entry Section -->
            <div class="row">
                <div class="col-12">
                    <h6 class="bg-info-subtle p-2 mb-3 border">Marks Entry</h6>

                    <asp:GridView ID="grdSubjects" runat="server" AutoGenerateColumns="false"
                        CssClass="table shadow d-print-grid w-100" DataKeyNames="subjectCode"
                        EmptyDataText="No Data Found!">
                        <Columns>
                            <asp:BoundField DataField="subjectCode" HeaderText="Subject Code"
                                ItemStyle-CssClass="text-center" HeaderStyle-CssClass="bg-secondary-subtle p-2 text-center" />
                            <asp:BoundField DataField="subject" HeaderText="Subject Name"
                                ItemStyle-CssClass="text-uppercase p-2" HeaderStyle-CssClass="bg-secondary-subtle" />
                            <asp:BoundField DataField="FullMarks" HeaderText="Full Marks"
                                ItemStyle-CssClass="text-uppercase p-2" HeaderStyle-CssClass="bg-secondary-subtle" />
                            <asp:TemplateField HeaderText="Marks Obtain" HeaderStyle-CssClass="bg-secondary-subtle">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>

                <!-- Submit -->
                <div class="col-12 text-end mt-3">
                    <asp:Button Text="Submit" ID="btnSubmit" runat="server" CssClass="btn btn-success px-4 shadow-sm" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
