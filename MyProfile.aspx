<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    My Profile | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow border-0 rounded">
                    <div class="card-body text-center">
                        <!-- Profile Picture -->
                        <%--<img src="../assets/file/avatar.png" alt="Profile Picture" id="imgUser" runat="server" class="rounded-circle mb-3" style="width: 120px; height: 120px; object-fit: cover;" />--%>
                        <asp:Image ImageUrl="../assets/file/avatar.png" ID="imgUser" runat="server" class="rounded-circle border shadow mb-3" style="width: 120px; height: 120px; object-fit:contain; position:center" />

                        <!-- Name -->
                        <div>
                            <asp:Label ID="lblName" CssClass="fw-bold fs-3" Text="Admin" runat="server" /></div>

                        <!-- Role / Username -->
                        <p class="text-muted mb-1">Administrator</p>

                        <!-- Email -->
                        <%--<p class="text-primary mb-3">john.doe@example.com</p>--%>
                        <div>
                            <asp:Label ID="lblEmail" CssClass="text-primary mb-3" Text="Admin@mail.com" runat="server" /></div>
                        <!-- Divider -->
                        <hr class="thick">

                        <!-- Profile Details -->
                        <div class="text-start px-4">
                            <%--<p><strong>Phone:</strong> +91 9876543210</p>
                            <p><strong>Address:</strong> 123 School Street, City, State</p>
                            <p><strong>Joined:</strong> 01-Jan-2023</p>--%>
                            <p>
                                <strong>Phone:</strong>
                                <asp:Label ID="lblPhone" CssClass="" Text="+91 9876543210" runat="server" />
                            </p>
                            <p>
                                <strong>Address:</strong>
                                <asp:Label ID="lblAddress" CssClass="" Text="123 School Street, City, State" runat="server" />
                            </p>
                            <p>
                                <strong>Joined:</strong>
                                <asp:Label ID="lblJoinDate" CssClass="" Text="01-Jan-2023" runat="server" />
                            </p>
                        </div>

                        <!-- Action Buttons -->
                        <div class="d-flex justify-content-around mt-3">
                            <a href="EditProfile.aspx" Class="btn btn-warning">Edit Profile</a>
                            <a href="Settings.aspx" Class="btn btn-primary">Change Password</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
