<%@ Page Title="Gelen Mesajlar" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Messages.aspx.cs" Inherits="webtabanliproje.Admin.Messages" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Gelen Mesajlar</h1>
        </div>

        <div class="card bg-dark text-white">
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvMessages" runat="server"
                        CssClass="table table-dark table-striped table-hover align-middle" AutoGenerateColumns="False"
                        OnRowCommand="gvMessages_RowCommand" DataKeyNames="Id" GridLines="None" BorderStyle="None">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="#" ItemStyle-Width="50px" />
                            <asp:BoundField DataField="SenderName" HeaderText="Ad Soyad" />
                            <asp:HyperLinkField DataNavigateUrlFields="SenderEmail"
                                DataNavigateUrlFormatString="mailto:{0}" DataTextField="SenderEmail"
                                HeaderText="E-posta" />
                            <asp:TemplateField HeaderText="Mesaj">
                                <ItemTemplate>
                                    <div style="max-width: 400px; white-space: pre-wrap;">
                                        <%# Eval("MessageContent") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SentDate" HeaderText="Tarih"
                                DataFormatString="{0:dd.MM.yyyy HH:mm}" />

                            <asp:TemplateField HeaderText="İşlemler" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteMessage"
                                        CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-danger btn-sm"
                                        OnClientClick="return confirm('Bu mesajı silmek istediğinize emin misiniz?')">
                                        <i class="fas fa-trash"></i> Sil
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center py-5 text-muted">
                                <i class="fas fa-inbox fa-3x mb-3"></i>
                                <p>Henüz hiç mesajınız yok.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>