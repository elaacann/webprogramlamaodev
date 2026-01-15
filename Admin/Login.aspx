<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webtabanliproje.Admin.Login" %>

    <!DOCTYPE html>
    <html data-bs-theme="dark">

    <head runat="server">
        <title>Yönetici Girişi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            body {
                background-color: #121212;
                color: #e0e0e0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .login-form {
                background: #1e1e1e;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="login-form">
                <h3 class="text-center mb-4">Yönetici Girişi</h3>
                <div class="mb-3">
                    <label class="form-label">Kullanıcı Adı</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Kullanıcı adı giriniz"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Şifre</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                        placeholder="Şifre giriniz"></asp:TextBox>
                </div>
                <div class="d-grid">
                    <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn btn-primary"
                        OnClick="btnLogin_Click" />
                </div>
                <div class="mt-3">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </form>
    </body>

    </html>