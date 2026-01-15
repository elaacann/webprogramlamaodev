<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="webtabanliproje._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Hero Section -->
        <section class="d-flex align-items-center justify-content-center text-center"
            style="min-height: 80vh; background: linear-gradient(135deg, #0f0f0f 0%, #1a1a1a 100%);">
            <div class="container">
                <h1 class="display-3 fw-bold mb-4" id="heroTitle" runat="server"></h1>
                <p class="lead mb-5 text-muted" id="heroSubtitle" runat="server" style="font-size: 1.5rem;"></p>
                <a href="#projects" class="btn btn-primary btn-lg rounded-pill px-5">Projelerimi İncele</a>
            </div>
        </section>

        <!-- About Section -->
        <section id="about" class="py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <h2 class="display-4 fw-bold mb-4">Hakkımda</h2>
                        <p class="lead text-muted" id="aboutText" runat="server"></p>
                    </div>
                    <div class="col-lg-6">
                        <!-- Skills -->
                        <h3 class="fw-bold mb-4">Yeteneklerim</h3>
                        <asp:Repeater ID="rptSkills" runat="server">
                            <ItemTemplate>
                                <div class="mb-3">
                                    <div class="d-flex justify-content-between">
                                        <span class="fw-bold">
                                            <%# Eval("Name") %>
                                        </span>
                                        <span>
                                            <%# Eval("Rate") %>%
                                        </span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar" role="progressbar"
                                            style='width: <%# Eval("Rate") %>%; background-color: var(--primary-color);'
                                            aria-valuenow='<%# Eval("Rate") %>' aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section id="projects" class="py-5 bg-darker" style="background-color: #121212;">
            <div class="container py-5">
                <h2 class="display-4 fw-bold mb-5 text-center">Projelerim</h2>
                <div class="row g-4">
                    <asp:Repeater ID="rptProjects" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <div class="card h-100 border-0" style="background-color: var(--card-bg);">
                                    <img src='<%# Eval("ImageUrl") %>' class="card-img-top" alt='<%# Eval("Title") %>'
                                        style="height: 200px; object-fit: cover; opacity: 0.8;">
                                    <div class="card-body">
                                        <h5 class="card-title fw-bold">
                                            <%# Eval("Title") %>
                                        </h5>
                                        <p class="card-text text-muted">
                                            <%# Eval("Description") %>
                                        </p>
                                        <a href='<%# Eval("Link") %>' target="_blank"
                                            class="btn btn-outline-light btn-sm rounded-pill">Projeyi Görüntüle</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="py-5">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="display-4 fw-bold mb-4">İletişim</h2>
                        <p class="lead text-muted mb-5">Bir projeniz mi var? Konuşalım.</p>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card border-0 p-4" style="background-color: var(--card-bg);">
                            <div class="mb-3">
                                <label class="form-label">Ad Soyad</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                    style="background: #252525; border: none; color: #fff;"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">E-posta</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                                    style="background: #252525; border: none; color: #fff;"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mesajınız</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine"
                                    Rows="5" style="background: #252525; border: none; color: #fff;"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSend" runat="server" Text="Mesajı Gönder"
                                CssClass="btn btn-primary btn-lg rounded-pill" OnClick="btnSend_Click" />
                            <asp:Label ID="lblStatus" runat="server" CssClass="mt-3 d-block"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </asp:Content>