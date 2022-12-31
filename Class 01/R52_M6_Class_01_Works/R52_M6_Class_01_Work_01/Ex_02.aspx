<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ex_02.aspx.cs" Inherits="R52_M6_Class_01_Work_01.Ex_02" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/font-awesome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row">
        <div class="col">
            <asp:LinkButton CssClass="btn btn-primary btn-sm rounded-circle" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ToolTip="Edit Item"><i class="fa fa-pencil"></i></asp:LinkButton>
            <asp:LinkButton CssClass="btn btn-secondary btn-sm rounded-circle" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ToolTip="Cancel action"><i class="fa fa-remove"></i></asp:LinkButton>
        </div>
        <div class="col">
            <asp:Label CssClass="text-danger" ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

