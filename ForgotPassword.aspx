<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Forgot Password | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavbarLIst" runat="Server">
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-4">
        <li class="nav-item">
            <a class="nav-link " aria-current="page" href="Default.aspx">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " href="About.aspx">About</a>
        </li>

        <li class="nav-item">
            <a class="nav-link " href="Contact.aspx">Contact</a>
        </li>
        <li>
            <a href="Login.aspx" class="btn btn-light">Login</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="container-fluid bg-features" style="height: 100vh">
        <div class="container pt-5 d-flex justify-content-center">
            <div class="card w-75 shadow">
                <div class="card-body py-3">
                    <h4 class="text-center">Chnage Your Password</h4>
                    <div class="d-flex justify-content-center">
                        <div class="border border-warning w-25 mb-3"></div>
                    </div>
                    <div class="row px-5">
                        <div class="col-lg-6 mb-3">
                            <p class="p-0 m-0">Username:</p>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                        </div>
                        <div class="col-lg-6 mb-3 align-content-center">
                            <p></p>
                            <asp:Button ID="btnSendOTP" CssClass="btn btn-primary" Text="Sent OTP" runat="server" OnClick="btnSenOTP_Click" />
                        </div>
                        <div class="col-lg-6 mb-3">
                            <p class="p-0 m-0 visually-hidden">Enter OTP:</p>
                            <asp:TextBox ID="txtValidOtp" runat="server" CssClass="form-control" Visible="false" placeholder="Enter OTP"></asp:TextBox>
                        </div>
                        <div class="col-lg-6 mb-3"></div>
                        <div class="col-lg-6 mb-3">
                            <p class="p-0 m-0">New Password:</p>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your new password"></asp:TextBox>
                        </div>
                        <div class="col-lg-6">
                            <p class="p-0 m-0">Confirm Password:</p>
                            <asp:TextBox ID="txtCnfPass" runat="server" CssClass="form-control" placeholder="Enter your new password"></asp:TextBox>
                            <asp:Label ID="lblCheck" Text="" runat="server" />
                        </div>
                        <div class="col-lg-12 d-flex justify-content-between">
                            <div>
                                <strong>Password Must Contain:</strong>
                                <ul>
                                    <li>Atleast one capital letter (A-Z).</li>
                                    <li>Atleast one small letter (a-z).</li>
                                    <li>Atleast one Special Character (!,@,#,$).</li>
                                    <li>Atleast one number.</li>
                                </ul>
                            </div>
                            <div class=" align-content-lg-end">
                                <asp:Button ID="btnChangePass" runat="server" Text="Change Password" CssClass="btn btn-warning my-3" OnClick="btnChangePass_click" />
                            </div>

                        </div>
                        <div class="d-flex justify-content-center">
                            <asp:Button Text="Back to Login" ID="btnBacktoLogin" runat="server" Visible="false" CssClass="btn btn-outline-primary" OnClick="btnBacktoLogin_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

