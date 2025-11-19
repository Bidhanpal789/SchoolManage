<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contact | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavbarLIst" runat="Server">
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-4">
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="Default.aspx">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="About.aspx">About</a>
        </li>

        <li class="nav-item">
            <a class="nav-link active" href="Contact.aspx">Contact</a>
            <div class="border border-light"></div>
        </li>
        <li>
            <a href="Login.aspx" class="btn btn-outline-light">Login</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="container" style="height:100vh">
        <div class="row d-flex justify-content-center py-5">
            <div class="col-lg-6">
                <div class="card rounded shadow">
                    <div class="card-body rounded bg-contact">
                        <img src="assets/images/logo.png" class="w-70 " alt="Alternate Text" />
                    </div>
                </div>
            </div>
            <div class="col-lg-6 align-content-center px-3">
                <p class="fs-4 fw-bold p-0 m-0 text-primary">Contact Details:</p>
                <div class="border border-warning w-25 mb-3"></div>
                <div class="d-block">
                    <p class="m-0 p-0"><i class="bi bi-geo-alt-fill text-primary p-2"></i>123 Main St, City, Country</p>
                </div>
                <div class="d-block">
                    <a class="m-0  text-decoration-none text-dark" href="tel:+123 456 7890" ><i class="bi bi-telephone-fill text-primary p-2"></i>+123 456 7890</a>
                </div>
                <div class="d-block">
                    <a class="m-0 p-0 text-decoration-none text-dark" href="mailto:demomail@mail.com" ><i class="bi bi-envelope-fill text-primary p-2"></i>demomail@mail.com</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

