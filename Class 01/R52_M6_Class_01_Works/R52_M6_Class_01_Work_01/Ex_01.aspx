<%@ Page Title="Example 01" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ex_01.aspx.cs" Inherits="R52_M6_Class_01_Work_01.Ex_01" %>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row">
        <div class="col-6">
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:Button CssClass="btn btn-outline-danger btn-sm"  ID="Button1" runat="server" 
                Text="Click me" OnClick="Button1_Click" />
        </div>
        <div class="col-6">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

