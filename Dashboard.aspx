<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">



    <!-- Hero Section -->
    <div class="hero-bg mb-5">
        <h1 class="story-script-regular display-4">Welcome Back, Admin!</h1>
        <p class="lead">Manage Students, Subjects, Marks & Reports seamlessly</p>
    </div>

    <div class="container-fluid">
        <!-- Stats Cards Row -->
        <div class="row g-4 mb-2">
            <!-- Students Card -->
            <div class="col-md-3 col-sm-6">
                <div class="card bg-light text-dark shadow h-100" style="border-left: 2px solid blue">
                    <div class="card-body d-flex flex-column align-items-center justify-content-center">
                        <asp:Label Text="" ID="StudentCountLbl" CssClass="card-text fs-3 fw-bold" runat="server" />
                        <h5 class="card-title">Students</h5>
                        <%--<p class="card-text">120</p>--%>
                    </div>
                </div>
            </div>

            <!-- Class Card -->
            <div class="col-md-3 col-sm-6">
                <div class="card bg-light text-dark shadow h-100" style="border-left: 2px solid blue">
                    <div class="card-body d-flex flex-column align-items-center justify-content-center">
                        <i class="lni lni-graduation display-4 mb-2"></i>
                        <asp:Label Text="" ID="lblClass" CssClass="card-text fs-3 fw-bold" runat="server" />
                        <h5 class="card-title">Class</h5>
                    </div>
                </div>
            </div>

            <!-- Subjects Card -->
            <div class="col-md-3 col-sm-6">
                <div class="card bg-light text-dark shadow h-100" style="border-left: 2px solid blue">
                    <div class="card-body d-flex flex-column align-items-center justify-content-center">
                        <i class="lni lni-book display-4 mb-2"></i>
                        <asp:Label Text="" ID="lblSubject" CssClass="card-text fs-3 fw-bold" runat="server" />
                        <h5 class="card-title">Subjects</h5>
                    </div>
                </div>
            </div>

            <!-- Reports Card -->
            <div class="col-md-3 col-sm-6">
                <div class="card bg-light text-dark shadow h-100" style="border-left: 2px solid blue">
                    <div class="card-body d-flex flex-column align-items-center justify-content-center">
                        <i class="lni lni-bar-chart display-4 mb-2"></i>
                        <asp:Label Text="" ID="lblReport" CssClass="card-text fs-3 fw-bold" runat="server" />
                        <h5 class="card-title">Reports</h5>
                    </div>
                </div>
            </div>
        </div>


        <!-- Activity & Performance -->
        <div class="row g-4 mb-5">
            <!-- Performance Overview -->
            <div class="col-lg-7">
                <div class="card shadow-sm border-0 rounded">
                    <div class="card-body">
                        <h5 class="fw-bold">Performance Overview</h5>
                        <canvas id="performanceChart" height="200"></canvas>
                    </div>
                </div>


            </div>

            <!-- Recent Activity -->
            <div class="col-lg-5">
                <div class="card shadow-sm border-0 rounded h-100">
                    <div class="card-body overflow-hidden" style="height: 200px;">
                        <h5 class="fw-bold text-dark mb-3">
                            <i class="lni lni-timer text-primary me-2"></i>Recent Developer Updates
                        </h5>
                        <div class="marquee">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">Created Group By reports (subjects & counts) 
                        <span class="text-muted small">[20 Sep 2025]</span>
                                    <span class="badge bg-success">📑</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Added professional mail templates for login reactivation 
                        <span class="text-muted small">[19 Sep 2025]</span>
                                    <span class="badge bg-primary">📧</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Designed Recent Activity Marquee with hover pause 
                        <span class="text-muted small">[19 Sep 2025]</span>
                                    <span class="badge bg-info text-dark">🎞</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Built Popup Modal for dashboard welcome message 
                        <span class="text-muted small">[18 Sep 2025]</span>
                                    <span class="badge bg-success">💬</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Integrated AVG marks query with chart support 
                        <span class="text-muted small">[17 Sep 2025]</span>
                                    <span class="badge bg-info text-dark">📊</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Added warning system for invalid marks boundaries 
                        <span class="text-muted small">[16 Sep 2025]</span>
                                    <span class="badge bg-warning text-dark">⚡</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Developed marks calculation logic (all terms + final) 
                        <span class="text-muted small">[16 Sep 2025]</span>
                                    <span class="badge bg-primary">🧮</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Fixed duplicate marks entry issue for subjects 
                        <span class="text-muted small">[15 Sep 2025]</span>
                                    <span class="badge bg-danger">🐞</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Created ShowAllSubjects.aspx page for admin 
                        <span class="text-muted small">[15 Sep 2025]</span>
                                    <span class="badge bg-success">📄</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Added QueryString support for rollNo in student profile links 
                        <span class="text-muted small">[14 Sep 2025]</span>
                                    <span class="badge bg-warning text-dark">⚡</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Implemented Student Details Page (IndividualSudent.aspx) 
                        <span class="text-muted small">[13 Sep 2025]</span>
                                    <span class="badge bg-info text-dark">✨</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">Designed Login Page with master page integration 
                        <span class="text-muted small">[12 Sep 2025]</span>
                                    <span class="badge bg-success">✔</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>





            <!-- Quick Actions -->
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 rounded bg-features h-100">
                        <div class="card-body text-center">
                            <i class="lni lni-add-files fs-1 text-primary mb-3"></i>
                            <h6 class="fw-bold">Add Student</h6>
                            <p class="text-muted">Register a new student easily</p>
                            <a href="StudentEntry.aspx" class="btn btn-sm btn-primary">Go</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 rounded bg-features h-100">
                        <div class="card-body text-center">
                            <i class="lni lni-library fs-1 text-success mb-3"></i>
                            <h6 class="fw-bold">Manage Subjects</h6>
                            <p class="text-muted">Create and update subjects</p>
                            <a href="SubjectEntry.aspx" class="btn btn-sm btn-success">Go</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 rounded bg-features h-100">
                        <div class="card-body text-center">
                            <i class="lni lni-bar-chart-alt fs-1 text-warning mb-3"></i>
                            <h6 class="fw-bold">Print Marksheet</h6>
                            <p class="text-muted">Check academic performance</p>
                            <a href="PrintMarksheet.aspx" class="btn btn-sm btn-warning text-white">Go</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const ctx = document.getElementById('performanceChart').getContext('2d');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: <%= chartLabels %>,   // injected from C#
                    datasets: [{
                        label: 'Average Score',
                        data: <%= chartData %>,   // injected from C#
                        backgroundColor: 'rgba(47, 77, 138, 0.2)',
                        borderColor: '#2f4d8a',
                        borderWidth: 3,
                        pointBackgroundColor: '#ffc107',
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            labels: {
                                color: '#333',
                                font: { size: 14 }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: { color: '#333' },
                            grid: { color: '#e0e0e0' }
                        },
                        x: {
                            ticks: { color: '#333' },
                            grid: { color: '#f0f0f0' }
                        }
                    }
                }
            });
        </script>
</asp:Content>




