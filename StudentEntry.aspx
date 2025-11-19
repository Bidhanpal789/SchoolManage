<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="StudentEntry.aspx.cs" Inherits="StudentEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student Entry | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow border-0 border-start border-primary border-2">
        <div class="card-body">
            <h3 class="text-center p-0 mb-4">Student <span class="text-warning">Entry</span></h3>

            <!-- Tab Menu -->
            <ul class="nav nav-tabs" id="entryTabs" runat="server" role="tablist">
                <li class="nav-item">
                    <div class="px-2" data-bs-toggle="tab" data-bs-target="#manual" type="button" role="tab">
                        <button class="nav-link" id="manual-tab" data-bs-toggle="tab" data-bs-target="#manual" type="button" role="tab">Manual Entry</button>
                    </div>
                </li>
                <li class="nav-item">
                    <div data-bs-toggle="tab" data-bs-target="#manual" type="button" role="tab">
                        <button class="nav-link" id="excel-tab" data-bs-toggle="tab" data-bs-target="#excel" type="button" role="tab">Excel Upload</button>
                    </div>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content mt-3" id="entryTabContent">

                <!-- Manual Entry Tab -->
                <div class="tab-pane fade show" id="manual" role="tabpanel">
                    <div class="row g-3">
                        <!-- Keep your existing manual entry fields here -->
                        <!-- Class -->
                        <div class="col-md-12">
                            <div class="col-md-3 d-flex">
                                <div>
                                    <label class="form-label">Class <span class="text-danger">*</span></label>
                                </div>
                                <div class="ps-3">
                                    <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-select">
                                        <asp:ListItem Text="--Select Class--" />
                                        <asp:ListItem Text="1" />
                                        <asp:ListItem Text="2" />
                                        <asp:ListItem Text="3" />
                                        <asp:ListItem Text="4" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label text-primary m-0">Serial No:</label>
                            <asp:Label Text="SN" ID="lblRoll" runat="server" CssClass="form-control-plaintext text-secondary" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label text-primary">Roll No:</label>
                            <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>

                        <!-- Photo Upload -->
                        <div class="col-md-6">
                            <label class="form-label">Upload Photo</label>
                            <div class="d-flex flex-wrap gap-2 align-items-center">
                                <asp:FileUpload ID="studentImg" runat="server" CssClass="form-control" />
                                <asp:Button Text="Upload" CssClass="btn btn-primary" runat="server" OnClick="bntUpload_Click" />
                                <img src="#" id="imgStudent" runat="server" class="border rounded shadow" style="height: 7rem; width: 6rem;" visible="false" />
                            </div>
                        </div>

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
                            <label class="form-label">Date of Birth <span class="text-danger">*</span></label>
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
                            <asp:TextBox ID="txtGovtIdNo" TextMode="Number" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <label class="form-label">Email ID (Optional)</label>
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Phone -->
                        <div class="col-md-6">
                            <label class="form-label">Phone No <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtPhone" TextMode="Phone" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Address -->
                        <div class="col-md-6">
                            <label class="form-label">Address <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>



                        <!-- Submit -->
                        <div class="col-12 d-flex justify-content-end">
                            <asp:Button Text="Add Student" ID="btnAddStudent" CssClass="btn btn-primary" runat="server" OnClick="btnAddStudent_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Excel Upload Tab -->
        <div class="tab-pane fade overflow-hidden" id="excel" role="tabpanel">
            <div class="col-md-12 px-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold mb-3">
                            <i class="bi bi-upload text-primary"></i>Step 1: Upload File
                        </h5>

                        <!-- Upload Box -->
                        <div id="dropZone" class="border border-2 border-dashed rounded p-5 text-center bg-light">
                            <i class="bi bi-cloud-arrow-up fs-1 text-primary"></i>
                            <p class="mt-2 text-muted">Drag & drop a file to upload</p>

                            <!-- Hidden ASP.NET FileUpload -->
                            <asp:FileUpload ID="fileExcel" runat="server" CssClass="d-none" onchange="showFileName(this)" />

                            <!-- Custom Button -->
                            <button type="button" class="btn btn-outline-primary mt-2" onclick="document.getElementById('<%= fileExcel.ClientID %>').click()">
                                Choose File
                            </button>
                            <div>
                                 <a href="assets/file/StudentData.xlsx">Click Here to download Blank Excel File</a>
                            </div>

                            <!-- File Info -->
                            <div id="fileInfo" class="mt-2 text-success fw-semibold"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Upload Button -->
            <div class="col-md-12 mt-3 pe-5 text-end">
                <asp:Button Text="Upload & Save" ID="Button1" CssClass="btn btn-success" runat="server" OnClick="btnUploadExcel_Click" />
            </div>


        </div>

        <!-- Optional: Preview Grid -->
        <div class="mt-4 overflow-x-scroll">
            <asp:GridView ID="gvPreview" runat="server" CssClass="table table-bordered table-striped mx-2"></asp:GridView>
        </div>
        <!-- Hidden field to store active tab -->
        <asp:HiddenField ID="hdnActiveTab" runat="server" />
    </div>



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let manualTab = document.getElementById('manual-tab');
            let excelTab = document.getElementById('excel-tab');
            let manualContent = document.getElementById('manual');
            let excelContent = document.getElementById('excel');
            let hdnActiveTab = document.getElementById('<%= hdnActiveTab.ClientID %>');
            let fileInput = document.getElementById("fileExcel");
            let fileInfo = document.getElementById("fileInfo");

            // ---- TAB ACTIVATION ----
            function activateTab(tabName) {
                if (tabName === "excel") {
                    excelTab.classList.add('active');
                    manualTab.classList.remove('active');
                    excelContent.classList.add('show', 'active');
                    manualContent.classList.remove('show', 'active');
                } else {
                    manualTab.classList.add('active');
                    excelTab.classList.remove('active');
                    manualContent.classList.add('show', 'active');
                    excelContent.classList.remove('show', 'active');
                }
                hdnActiveTab.value = tabName; // save active tab
            }

            manualTab.addEventListener('click', function () { activateTab("manual"); });
            excelTab.addEventListener('click', function () { activateTab("excel"); });

            // Restore tab after postback
            if (hdnActiveTab.value === "excel") {
                activateTab("excel");
            } else {
                activateTab("manual");
            }

            // ---- FILE UPLOAD PREVIEW ----
            fileInput.addEventListener("change", function () {
                if (fileInput.files.length > 0) {
                    fileInfo.textContent = "Selected: " + fileInput.files[0].name;
                    fileInfo.classList.add("text-success");
                } else {
                    fileInfo.textContent = "";
                }
            });
        });

        // Clear file manually
        function clearFile() {
            let fileInput = document.getElementById("fileExcel");
            fileInput.value = "";
            document.getElementById("fileInfo").textContent = "";
        }


        function showFileName(input) {
            let info = document.getElementById("fileInfo");

            if (input.files.length > 0) {
                let file = input.files[0];
                let allowedExtensions = [".xls", ".xlsx"];
                let fileName = file.name.toLowerCase();
                let valid = allowedExtensions.some(ext => fileName.endsWith(ext));

                if (!valid) {
                    
                    alert("Invalid file type. Please upload an Excel file (.xls or .xlsx).");    
                    return;
                }
                info.textContent = "Selected: " + file.name;
            } else {    
                info.textContent = "";
            }
        }

    </script>


</asp:Content>
