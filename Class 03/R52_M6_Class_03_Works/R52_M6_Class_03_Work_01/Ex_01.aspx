<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ex_01.aspx.cs" Inherits="R52_M6_Class_03_Work_01.Ex_01" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Books</h3>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="BookId" DataSourceID="dsBooks" OnPreRender="GridView1_PreRender">
               <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
                    <asp:BoundField DataField="PublishDate" HeaderText="PublishDate" SortExpression="PublishDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="" CssClass="btn btn-success btn-sm" ><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" ><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="" CssClass="btn btn-success btn-sm" ><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="" CssClass="btn btn-danger btn-sm" ><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-warning">
                        <p>No record found</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:books %>" DeleteCommand="DELETE FROM [Books] WHERE [BookId] = @BookId" InsertCommand="INSERT INTO [Books] ([Title], [Genre], [ListPrice], [PublishDate]) VALUES (@Title, @Genre, @ListPrice, @PublishDate)" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [Genre] = @Genre, [ListPrice] = @ListPrice, [PublishDate] = @PublishDate WHERE [BookId] = @BookId">
                <DeleteParameters>
                    <asp:Parameter Name="BookId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Genre" Type="String" />
                    <asp:Parameter Name="ListPrice" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PublishDate" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Genre" Type="String" />
                    <asp:Parameter Name="ListPrice" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PublishDate" />
                    <asp:Parameter Name="BookId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-12">
            <h3>Create new</h3>
            <asp:DetailsView ID="DetailsView1" runat="server"  CssClass="table table-bordered" DataKeyNames="BookId" DataSourceID="dsBooks" DefaultMode="Insert" AutoGenerateRows="False">
                <Fields>
                    <asp:BoundField DataField="BookId" HeaderText="BookId" InsertVisible="False" ReadOnly="True" SortExpression="BookId" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
                    <asp:BoundField DataField="PublishDate" HeaderText="PublishDate" SortExpression="PublishDate" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>

