<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="webtabanliproje.Admin.Dashboard" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
            <div class="col-md-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Toplam Proje</div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblProjectCount" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-success mb-3">
                    <div class="card-header">Toplam Yetenek</div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblSkillCount" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-header">Sayfalar</div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblPageCount" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-info mb-3">
                    <div class="card-header">Sosyal Linkler</div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblSocialCount" runat="server" Text="0"></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Hızlı İşlemler
                    </div>
                    <div class="card-body">
                        <a href="ManageProjects.aspx" class="btn btn-primary">Yeni Proje Ekle</a>
                        <a href="Settings.aspx" class="btn btn-secondary">Site Ayarlarını Güncelle</a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>