<%@ Page Title="Manage Skills" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageSkills.aspx.cs" Inherits="webtabanliproje.Admin.ManageSkills" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>Yetenekleri Yönet</h2>
        <asp:MultiView ID="mvSkills" runat="server" ActiveViewIndex="0">
            <asp:View ID="vList" runat="server">
                <asp:Button ID="btnAdd" runat="server" Text="Yeni Yetenek Ekle" CssClass="btn btn-success mb-3"
                    OnClick="btnAdd_Click" />
                <asp:GridView ID="gvSkills" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False" OnRowCommand="gvSkills_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Yetenek Adı" />
                        <asp:BoundField DataField="Rate" HeaderText="Oran (%)" />
                        <asp:BoundField DataField="DisplayOrder" HeaderText="Sıralama" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditSkill"
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm"><i
                                        class="fas fa-edit"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteSkill"
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
                        <asp:Label ID="lblTitle" runat="server" Text="Yetenek Ekle/Düzenle"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="mb-3">
                            <label>Yetenek Adı</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Oran (0-100)</label>
                            <asp:TextBox ID="txtRate" runat="server" CssClass="form-control" TextMode="Number">
                            </asp:TextBox>
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