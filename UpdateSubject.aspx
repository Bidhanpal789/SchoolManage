<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="UpdateSubject.aspx.cs" Inherits="UpdateSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Edit Subject | SchoolNest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow">
        <div class="card-body py-4 px-4">
            <h3 class="text-center p-0 mb-4">Edit <span class="text-warning">Subject</span>
            </h3>

            <div class="row g-3">
                <!-- Subject Code -->
                <div class="col-md-6">
                    <label for="txtSubCode" class="form-label">Subject Code <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtSubCode" runat="server" CssClass="form-control" />
                </div>

                <!-- Fetch Button -->
                <div class="col-md-6 d-flex align-items-end">
                    <asp:Button Text="Fetch Subject" ID="btnFetch" runat="server" CssClass="btn btn-outline-success" OnClick="btnFetch_Click" />
                </div>

                <div class="col-12">
                    <hr />
                </div>

                <!-- Class -->
                <div class="col-md-6">
                    <label for="txtClass" class="form-label">Class <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control bg-secondary-subtle" ReadOnly="true" />
                </div>

                <!-- Subject -->
                <div class="col-md-6">
                    <label for="txtSubject" class="form-label">Subject <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control text-uppercase" />
                </div>

                <!-- Subject Type -->
                <div class="col-md-6">
                    <label for="ddlSubType" class="form-label">Subject Type <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlSubType" CssClass="form-select">
                        <asp:ListItem Text="--Select Subject Type--" />
                        <asp:ListItem Text="Main" />
                        <asp:ListItem Text="Optional" />
                    </asp:DropDownList>
                </div>

                <!-- Save Button -->
                <div class="col-12 d-flex justify-content-end mt-3">
                    <asp:Button Text="Save Changes" ID="btnSaveChange" runat="server" CssClass="btn btn-success" OnClick="btnSaveChange_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
