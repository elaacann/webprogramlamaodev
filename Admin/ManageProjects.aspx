<%@ Page Title="Manage Projects" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageProjects.aspx.cs" Inherits="webtabanliproje.Admin.ManageProjects" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>Projeleri Yönet</h2>
        <asp:MultiView ID="mvProjects" runat="server" ActiveViewIndex="0">
            <asp:View ID="vList" runat="server">
                <asp:Button ID="btnAdd" runat="server" Text="Yeni Proje Ekle" CssClass="btn btn-success mb-3"
                    OnClick="btnAdd_Click" />
                <asp:GridView ID="gvProjects" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False" OnRowCommand="gvProjects_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' width="50" height="50" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DisplayOrder" HeaderText="Order" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditProject"
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm"><i
                                        class="fas fa-edit"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteProject"
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
                        <asp:Label ID="lblTitle" runat="server" Text="Proje Ekle/Düzenle"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="mb-3">
                            <label>Başlık</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Açıklama</label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Görsel URL</label>
                            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Link</label>
                            <asp:TextBox ID="txtLink" runat="server" CssClass="form-control"></asp:TextBox>
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