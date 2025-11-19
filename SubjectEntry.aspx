<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SubjectEntry.aspx.cs" Inherits="SubjectEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Subject Entry | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow">
        <div class="card-body py-3">
            <h3 class="text-center pb-0 mb-5">Subject <span class="text-warning">Entry</span>
            </h3>

            <div class="row g-3">
                <!-- Class -->
                <div class="col-md-6">
                    <label class="form-label">Class <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-select">
                        <asp:ListItem Text="--Select Class--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                    </asp:DropDownList>
                </div>

                <!-- Subject Name -->
                <div class="col-md-6">
                    <label class="form-label">Subject Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtSubject" CssClass="form-control text-uppercase" runat="server" />
                </div>

                <!-- Subject Code -->
                <div class="col-md-6">
                    <label class="form-label">Subject Code <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtSubjectCode" CssClass="form-control" runat="server" />
                </div>

                <!-- Subject Type -->
                <div class="col-md-6">
                    <label class="form-label">Subject Type <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlSubject" CssClass="form-select">
                        <asp:ListItem Text="--Select--" />
                        <asp:ListItem Text="Main" />
                        <asp:ListItem Text="Optional" />
                    </asp:DropDownList>
                </div>

                <!-- Save Button -->
                <div class="col-12 d-flex justify-content-end py-3">
                    <asp:Button Text="Save Subject" ID="btnSave" CssClass="btn btn-success" runat="server" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

