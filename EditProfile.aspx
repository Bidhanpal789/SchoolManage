<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Edit Profile | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow border-0 rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Edit <span class="text-warning">Profile</span></h3>

                        <!-- Profile Picture -->
                        <div class="text-center mb-4">
                            <img src="../assets/file/avatar.png" id="imgProfile" class="rounded-circle shadow" style="width: 120px; height: 120px; object-fit: contain;" runat="server" />
                            <div class="mt-2">
                                <asp:FileUpload ID="fuProfile" runat="server" CssClass="form-control d-inline-block w-50" />
                                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary ms-2" OnClick="btnUpload_Click" />
                            </div>
                        </div>

                        <!-- Profile Form -->
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" TextMode="Email" CssClass="form-control bg-secondary-subtle" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" />
                            </div>
                            <div class="col-12 d-flex justify-content-end mt-3">
                                <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-warning" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
