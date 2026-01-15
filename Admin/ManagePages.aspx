<%@ Page Title="Manage Pages" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManagePages.aspx.cs" Inherits="webtabanliproje.Admin.ManagePages" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>Sayfaları Yönet</h2>
        <asp:MultiView ID="mvPages" runat="server" ActiveViewIndex="0">
            <asp:View ID="vList" runat="server">
                <asp:Button ID="btnAdd" runat="server" Text="Yeni Sayfa Ekle" CssClass="btn btn-success mb-3"
                    OnClick="btnAdd_Click" />
                <asp:GridView ID="gvPages" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False" OnRowCommand="gvPages_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Başlık" />
                        <asp:BoundField DataField="Slug" HeaderText="Uzanti (URL)" />
                        <asp:CheckBoxField DataField="IsActive" HeaderText="Aktif" />
                        <asp:BoundField DataField="DisplayOrder" HeaderText="Sıralama" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditPage"
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm"><i
                                        class="fas fa-edit"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeletePage"
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
                        <asp:Label ID="lblTitle" runat="server" Text="Sayfa Ekle/Düzenle"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="mb-3">
                            <label>Sayfa Başlığı</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Uzantı (URL Segment)</label>
                            <asp:TextBox ID="txtSlug" runat="server" CssClass="form-control"
                                placeholder="ornek: gizlilik-politikasi"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>İçerik (HTML İzinli)</label>
                            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine"
                                Rows="10"></asp:TextBox>
                        </div>
                        <div class="mb-3 form-check">
                            <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">Aktif mi?</label>
                        </div>
                        <div class="mb-3">
                            <label>Sıralama</label>
                            <asp:TextBox ID="txtOrder" runat="server" CssClass="form-control" TextMode="Number">
                            </asp:TextBox>
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