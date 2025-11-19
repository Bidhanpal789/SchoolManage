<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="UpdateStudent.aspx.cs" Inherits="UpdateStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Update Student | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow border-0 border-start border-primary border-2">
        <div class="card-body">
            <h3 class="text-center p-0 mb-3">Student <span class="text-warning">Update</span>
            </h3>

            <div class="row g-3">
                <!-- Roll -->
                <div class="col-lg-4 col-md-4">
                    <label class="form-label">
                        Student Roll: <span class="text-danger">*</span>
                    </label>
                    <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control w-75" TextMode="Number" />
                </div>

                <!-- Class -->
                <div class="col-lg-4 col-md-4">
                    <label class="form-label">
                        Class: <span class="text-danger">*</span>
                    </label>
                    <asp:DropDownList runat="server" ID="ddlClassFetch" CssClass="form-select w-75">
                        <asp:ListItem Text="--Select Class--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                    </asp:DropDownList>
                </div>

                <!-- Fetch Btn + Image -->
                <div class="col-lg-4 col-md-4 d-flex flex-column align-items-center">
                    <p class="p-0 m-0">Choose Photo</p>
                    <asp:FileUpload ID="studentImg" runat="server" CssClass="w-75" />
                    <img src="assets/file/avatar.png" id="imgStudent" runat="server" class="border shadow rounded" style="height: 7rem; width: 6rem;" />
                </div>

                <!-- Photo Upload -->
                <div class="col-12 d-flex flex-column align-items-center justify-content-between px-3">

                    <div class="col-lg-4 d-flex justify-content-between">
                        <asp:Button Text="Fetch" runat="server" CssClass="btn bg-info-subtle shadow mb-2" OnClick="btnFetch_Click" />
                        <asp:Button ID="btnChangePic" Text="Change Picture" runat="server" CssClass="btn bg-primary-subtle shadow mb-2" OnClick="btnChangePic_Click" />
                    </div>


                </div>

                <hr class="my-2" />

                <!-- Name -->
                <div class="col-md-6">
                    <label class="form-label">Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <!-- Father's Name -->
                <div class="col-md-6">
                    <label class="form-label">Father's Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" />
                </div>

                <!-- DOB -->
                <div class="col-md-6">
                    <label class="form-label">Date Of Birth <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
                </div>

                <!-- Govt ID Type -->
                <div class="col-md-6">
                    <label class="form-label">Gov't Id Type <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlGovtId" CssClass="form-select">
                        <asp:ListItem Text="--Select--" />
                        <asp:ListItem Text="Aadhaar (UID)" />
                        <asp:ListItem Text="PAN" />
                        <asp:ListItem Text="EPIC (Voter)" />
                        <asp:ListItem Text="Driving License" />
                    </asp:DropDownList>
                </div>

                <!-- Govt ID No -->
                <div class="col-md-6">
                    <label class="form-label">Gov't Id No. <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtGovtIdNo" runat="server" CssClass="form-control" TextMode="Number" />
                </div>

                <!-- Email -->
                <div class="col-md-6">
                    <label class="form-label">Email ID (Optional)</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>

                <!-- Phone -->
                <div class="col-md-6">
                    <label class="form-label">Phone No <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="phone" />
                </div>

                <!-- Class Dropdown -->
                <div class="col-md-6">
                    <label class="form-label">Class <span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-select">
                        <asp:ListItem Text="--Select Class--" />
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                    </asp:DropDownList>
                </div>

                <!-- Address -->
                <div class="col-md-6">
                    <label class="form-label">Address <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                </div>

                <!-- Status -->
                <div class="col-md-6">
                    <label class="form-label">Status</label>
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-select">
                        <asp:ListItem Text="Active" />
                        <asp:ListItem Text="Inactive" />
                    </asp:DropDownList>
                </div>

                <!-- Save -->
                <div class="col-12 d-flex justify-content-end">
                    <asp:Button Text="Save Change" ID="btnSaveChange" CssClass="btn btn-primary" runat="server" OnClick="btnSaveChange_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

