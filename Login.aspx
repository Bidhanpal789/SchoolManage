<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Login | SchoolNest
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
    <div style="background-color: #e6eded; height: 100vh">
        <div class="container pt-5">
            <div class="row shadow py-3 rounded d-flex justify-content-center">
                <div class="col-lg-5">
                    <div class="card d-flex rounded shadow " style="background-color: #d4d9d9">
                        <div class="card-body rounded py-5 bg-primary ">
                            <div class="d-flex justify-content-center">
                                <img src="assets/images/logo-white.png" class="w-50 " alt="Alternate Text" />

                            </div>
                            <div class="px-3 mt-2">
                                <p class="text-white text-center">In case of Login issue contact with your Developer</p>

                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-lg-7 px-0 m-0 d-flex justify-content-center">
                    <div>
                    </div>
                    <div class="d-block">
                        <div class="mb-4 text-center">
                            <h3 class="m-0 pt-3">Login</h3>
                            <div class="border border-warning mx-auto" style="width: 80px;"></div>
                        </div>

                        <div class="w-100 w-sm-75 w-md-50 mx-auto">
                            <!-- Username -->
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-secondary-subtle"><i class="bi bi-person"></i></span>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control text-lowercase" placeholder="Enter your mail id" />
                                </div>
                                <div class="form-text">We'll never share your email with anyone else.</div>
                            </div>

                            <!-- Password -->
                            <!-- Password -->
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-secondary-subtle" style="cursor: pointer">
                                        <i id="togglePassword" class="bi bi-eye"></i>
                                    </span>
                                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control"
                                        TextMode="Password" placeholder="Enter Your Password" />
                                </div>

                                <div class="d-flex justify-content-between mt-2 mb-4">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" />
                                    <a href="ForgotPassword.aspx" class="text-decoration-none">Forgot Password?</a>
                                </div>

                                <asp:Button ID="btnLogin" Text="Login" runat="server" CssClass="btn btn-warning w-100" OnClick="btnLogin_Click" />
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%--Password Toggle JS--%>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let toggle = document.getElementById("togglePassword");
            let password = document.getElementById("<%= txtPass.ClientID %>");

            toggle.addEventListener("click", function () {
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // Switch icon classes
                this.classList.toggle("bi-eye");
                this.classList.toggle("bi-eye-slash");
            });
        });
    </script>

</asp:Content>

