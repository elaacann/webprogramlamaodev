<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Page.aspx.cs"
    Inherits="webtabanliproje.Page" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="display-4 fw-bold mb-4">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </h1>
            <div class="content-area" style="font-size: 1.1rem; line-height: 1.8;">
                <asp:Literal ID="litContent" runat="server"></asp:Literal>
            </div>
        </div>
    </asp:Content>