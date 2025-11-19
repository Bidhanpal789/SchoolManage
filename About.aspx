<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    About | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavbarLIst" runat="Server">
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-4">
        <li class="nav-item">
            <a class="nav-link " aria-current="page" href="Default.aspx">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="About.aspx">About</a>
            <div class="border border-light"></div>
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

    <div class="mx-5" style="height:100vh">
        <div class="row d-flex justify-content-center align-items-start text-dark mt-5">
            <div class="col-md-8 ">
                <h3 class="text-primary fw-bold m-0 p-0">About </h3>
                <div class="w-10 border-warning border m-0 p-0"></div>
                <p class=" fs-7 mb-3">Smart Management for Smarter Schools</p>
                <hr />
                <p class="text-align">SchoolNest is an all-in-one school management platform designed to simplify and enhance the way schools operate. From managing students, teachers, and parents to streamlining attendance, exams, fees, and communication—SchoolNest brings everything together under one smart system.</p>
                <p class="text-align">We believe schools should focus on teaching and learning, not paperwork. That’s why SchoolNest is built to save time, reduce workload, and keep everyone connected in one place.</p>
                <p class="text-align">With an easy-to-use interface and powerful features, SchoolNest is not just software—it’s a digital partner for modern education.</p>
            </div>
        </div>
    </div>

</asp:Content>

