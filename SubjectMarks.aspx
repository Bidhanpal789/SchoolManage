<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SubjectMarks.aspx.cs" Inherits="SubjectMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Subject Marks | SchoolNest
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card shadow">
        <div class="card-body py-3">
            <h4 class="text-center mb-4">Subject <span class="text-warning">Marks</span></h4>
         
            <div class="row">
                <div class="col-lg-12 d-flex mb-2">
                    <div class="col-lg-6 d-flex px-2">
                        <div class="col-lg-5">
                            <p>Class <span class="text-danger">*</span></p>
                        </div>
                        <div class="col-lg-7">
                            <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                                <asp:ListItem Text="--Select Class--" />
                                <asp:ListItem Text="1" />
                                <asp:ListItem Text="2" />
                                <asp:ListItem Text="3" />
                                <asp:ListItem Text="4" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-6 d-flex px-2">
                        <div class="col-lg-5">
                            <p>Term <span class="text-danger">*</span></p>
                        </div>
                        <div class="col-lg-7">
                            <asp:DropDownList runat="server" ID="ddlTerm" CssClass="form-select">
                                <asp:ListItem Text="--Select Term--" />
                                <asp:ListItem Text="1" Value="1" />
                                <asp:ListItem Text="2" Value="2" />
                                <asp:ListItem Text="3" Value="3" />
                                <asp:ListItem Text="Annual" Value="Annual" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="border-top border-warning mb-2">
                </div>
                <div class="row d-flex justify-content-center">

                    <div class="col-12 col-md-10 col-lg-10">
                        <asp:GridView ID="grdSubjects" runat="server" AutoGenerateColumns="false" CssClass="table  shadow d-print-grid">
                            <Columns>
                                <asp:BoundField DataField="subjectCode" HeaderText="Subject Code" ItemStyle-CssClass="text-center" HeaderStyle-CssClass=" bg-secondary-subtle p-2 text-center" />
                                <asp:BoundField DataField="subject" HeaderText="Subject Name" ItemStyle-CssClass="text-uppercase p-2" HeaderStyle-CssClass="bg-secondary-subtle" />
                                <asp:TemplateField HeaderText="Full Marks" HeaderStyle-CssClass="bg-secondary-subtle">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtFullMarks" CssClass="form-control w-50 text-center my-1 p-2" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center text-muted py-2">No subjects available</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>




                    <div class="col-lg-12 d-flex justify-content-center mt-4">
                        <asp:Button Text="Submit" ID="btnSubmit" runat="server" CssClass="btn bg-primary-subtle shadow px-5 mb-5" OnClick="btnSubmit_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

