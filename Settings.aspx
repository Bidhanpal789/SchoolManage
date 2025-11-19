<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Settings | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card shadow border-0 rounded">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Account <span class="text-warning">Settings</span></h3>

                        <div class="row g-3">

                            <!-- Change Password -->
                            <div class="col-12">
                                <h5 class="fw-bold mb-2">Change Password</h5>
                            </div>

                            <!-- Current Password -->
                            <div class="col-md-12">
                                <label class="form-label">Current Password <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-secondary-subtle toggle-password" style="cursor:pointer">
                                        <i class="bi bi-eye-slash"></i>
                                    </span>
                                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Current Password" />
                                </div>
                            </div>

                            <!-- New Password -->
                            <div class="col-md-6">
                                <label class="form-label">New Password <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-secondary-subtle toggle-password" style="cursor:pointer">
                                        <i class="bi bi-eye-slash"></i>
                                    </span>
                                    <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter New Password" />
                                </div>
                            </div>

                            <!-- Confirm New Password -->
                            <div class="col-md-6">
                                <label class="form-label">Confirm Password <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-secondary-subtle toggle-password" style="cursor:pointer">
                                        <i class="bi bi-eye-slash"></i>
                                    </span>
                                    <asp:TextBox ID="txtConfirmPass" runat="server" OnTextChanged="txtConfirmPass_Changed" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" />
                                </div>
                            </div>

                            <!-- Notifications -->
                            <div class="col-12 mt-3">
                                <h5 class="fw-bold mb-2">Notifications</h5>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkEmailNotif" runat="server" CssClass="form-check-input" />
                                    <label class="form-check-label ms-2">Email Notifications</label>
                                </div>
                            </div>

                            <!-- Save Button -->
                            <div class="col-12 d-flex justify-content-end mt-3">
                                <asp:Button ID="btnSave" runat="server" Text="Save Settings" CssClass="btn btn-warning" OnClick="btnSave_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Password Toggle Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toggles = document.querySelectorAll(".toggle-password");

            toggles.forEach((toggle) => {
                toggle.addEventListener("click", function () {
                    const input = this.nextElementSibling; // gets the associated TextBox
                    const type = input.getAttribute("type") === "password" ? "text" : "password";
                    input.setAttribute("type", type);

                    const icon = this.querySelector("i");
                    icon.classList.toggle("bi-eye-slash");
                    icon.classList.toggle("bi-eye");
                });
            });
        });
    </script>
</asp:Content>

