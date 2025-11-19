<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="StudentAddSuccess.aspx.cs" Inherits="StudentAddSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="card shadow">
        <div class="card-body py-5">
            <div class="d-flex justify-content-center">
                <img src="assets/gif/Success.gif" class="w-25" />
            </div>
            <h4 class="text-center p-0 m-0">Student Added Successfully</h4>
            
           
            <div class="row">
                <div class="col-lg-12 d-flex justify-content-center mb-2 py-5">
                    <a href="StudentEntry.aspx" Class="btn bg-success-subtle me-3">Add Another Student</a>
                    <a href="ShowAll.aspx" Class="btn bg-primary-subtle me-3">View Student</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

