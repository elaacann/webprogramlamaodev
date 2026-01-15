<%@ Page Title="Site Settings" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs" Inherits="webtabanliproje.Admin.Settings" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>Site Ayarları</h2>
        <div class="card">
            <div class="card-body">
                <div class="mb-3">
                    <label>Site Başlığı</label>
                    <asp:TextBox ID="txtSiteTitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label>Giriş Başlığı (Anasayfa)</label>
                    <asp:TextBox ID="txtHeroTitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label>Giriş Alt Başlığı</label>
                    <asp:TextBox ID="txtHeroSubtitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label>Hakkımda Yazısı</label>
                    <asp:TextBox ID="txtAboutText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5">
                    </asp:TextBox>
                </div>
                <div class="mb-3">
                    <label>Alt Bilgi (Footer)</label>
                    <asp:TextBox ID="txtFooterText" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnSave" runat="server" Text="Ayarları Kaydet" CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success ms-2"></asp:Label>
            </div>
        </div>
    </asp:Content>