<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ex_01.aspx.cs" Inherits="R52_M6_Class_02_Work_01.Ex_01" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <div id="alert" runat="server" visible="false" class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Success!</strong> File uploaded.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
           <div class="form-group row">
               <label class="col-form-label col-form-label col-2 text-end">Select picture</label>
               <div class="col-4">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control form-control-sm"  />
            
               </div>
               <div class="col-6">
                   <asp:Button ID="Button1" CssClass="btn btn-primary btn-sm" runat="server" Text="Upload" OnClick="Button1_Click" />
               </div>
           </div>
            
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                   <div class="d-flex gap-3">
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="card" style="width:15rem;">
                         <img src='<%# Eval("file", "/Uploads/{0}") %>' class="card-img-top" alt="File">
                      </div>
                </ItemTemplate>
                <FooterTemplate>
                   </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
