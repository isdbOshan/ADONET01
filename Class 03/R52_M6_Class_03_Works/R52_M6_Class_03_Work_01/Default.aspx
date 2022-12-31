<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="R52_M6_Class_03_Work_01.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="card col-8 offset-2">
        <div class="card-header">
            <h4 class="card-title">Works</h4>
        </div>
        <div class="card-body">
            <div class="list-group">
                <a href="Ex_01.aspx" class="list-group-item list-group-item-action active" aria-current="true">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">Grid view & Details view</h5>
                        <small>CRUD</small>
                    </div>
                    <p class="mb-1">CRUD - data amnipulation</p>
                   
                </a>
                <a href="Ex_02.aspx" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">Grid & Deials view</h5>
                        <small class="text-muted">Templates</small>
                    </div>
                    <p class="mb-1">Dropdown & Date picker.</p>
                    
                </a>
                
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
