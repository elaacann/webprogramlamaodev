<%@ Page Title="Manage Social" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageSocial.aspx.cs" Inherits="webtabanliproje.Admin.ManageSocial" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>Sosyal Medya Yönetimi</h2>
        <asp:MultiView ID="mvSocial" runat="server" ActiveViewIndex="0">
            <asp:View ID="vList" runat="server">
                <asp:Button ID="btnAdd" runat="server" Text="Yeni Link Ekle" CssClass="btn btn-success mb-3"
                    OnClick="btnAdd_Click" />
                <asp:GridView ID="gvSocial" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False" OnRowCommand="gvSocial_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="PlatformName" HeaderText="Platform" />
                        <asp:BoundField DataField="Url" HeaderText="URL" />
                        <asp:BoundField DataField="IconClass" HeaderText="Icon Class" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditSocial"
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm"><i
                                        class="fas fa-edit"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteSocial"
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger btn-sm"
                                    OnClientClick="return confirm('Emin misiniz?')"><i class="fas fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>

            <asp:View ID="vEdit" runat="server">
                <div class="card">
                    <div class="card-header">
                        <asp:Label ID="lblTitle" runat="server" Text="Link Ekle/Düzenle"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="mb-3">
                            <label>Platform Adı</label>
                            <asp:TextBox ID="txtPlatform" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>URL</label>
                            <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>İkon Sınıfı (Font Awesome)</label>
                            <asp:TextBox ID="txtIcon" runat="server" CssClass="form-control"
                                placeholder="fab fa-twitter"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSave" runat="server" Text="Kaydet" CssClass="btn btn-primary"
                            OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="İptal" CssClass="btn btn-secondary"
                            OnClick="btnCancel_Click" />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </asp:Content>