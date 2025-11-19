```aspx
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    SchoolNest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NavbarLIst" runat="Server">
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-4">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="Default.aspx">Home</a>
            <div class="border border-light"></div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="About.aspx">About</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " href="Contact.aspx">Contact</a>
        </li>
        <li>
            <a href="Login.aspx" class="btn btn-outline-light">Login</a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="hero-bg">
        <div class="container">
            <div class="row d-flex justify-content-center align-items-start text-white">
                <div class="col-md-6 ">
                    <h1 class="display-4 fw-bold">Welcome to SchoolNest</h1>
                    <p class="text-center">Smart Management for Smarter Schools</p>
                    <a href="Login.aspx" class="btn btn-primary btn-lg mt-3">Get Started</a>
                </div>
            </div>
        </div>
    </div>

    <section class="bg-features py-5">
        <div class="container">
            <h2 class="pt-3 text-primary">Features</h2>
            <div class="w-10 thick mb-3"></div>
            <div class="row mb-3">

                <!-- Dynamik Subject entry -->
                <div class="col-lg-4 mb-2">
                    <div class="card border-start border-primary-subtle shadow-lg">
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <i class="bi bi-book-half text-primary fs-1"></i>
                            </div>
                            <p class="text-center text-primary fw-bold mt-3">Dynamik Subject</p>
                        </div>
                    </div>
                </div>

                <!-- Marks Manage -->
                <div class="col-lg-4 mb-2">
                    <div class="card border-start border-primary-subtle shadow-lg">
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <i class="bi bi-file-spreadsheet text-primary fs-1"></i>
                            </div>
                            <p class="text-center text-primary fw-bold mt-3">Marks Manage</p>
                        </div>
                    </div>
                </div>

                <!-- Report Manage -->
                <div class="col-lg-4 mb-2">
                    <div class="card border-start border-primary-subtle shadow-lg">
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <i class="bi bi-file-earmark-binary-fill text-primary fs-1"></i>
                            </div>
                            <p class="text-center text-primary fw-bold mt-3">Report Manage</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="bg-primary">
        <div class="d-flex justify-content-center py-5">
            <div class="row">
                <div class="col-lg-12 d-flex justify-content-center">
                    <h3 class="text-light">Know About Us!</h3>
                </div>
                <div class="col-lg-12 d-flex justify-content-center mt-0">
                    <a href="About.aspx" class="btn btn-light">Know More</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
