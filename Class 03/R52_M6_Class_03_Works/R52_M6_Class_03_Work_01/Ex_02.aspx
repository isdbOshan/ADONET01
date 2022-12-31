<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ex_02.aspx.cs" Inherits="R52_M6_Class_03_Work_01.Ex_02" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <link href="Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Books</h3>
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="dsBooks" OnPreRender="GridView1_PreRender">
               <HeaderStyle CssClass="bg-primary text-white" />
                <Columns>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Genre" SortExpression="Genre">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-select" SelectedValue='<%# Bind("Genre") %>' runat="server">
                                <asp:ListItem Value="Thriller">Thriller</asp:ListItem>
                                <asp:ListItem Value="Novel">Novel</asp:ListItem>
                                <asp:ListItem Value="Drama">Drama</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Genre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ListPrice" SortExpression="ListPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("ListPrice", "{0:0.00}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ListPrice", "{0:0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PublishDate" SortExpression="PublishDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4"  CssClass="form-control date"  runat="server" Text='<%# Bind("PublishDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("PublishDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="" CssClass="btn btn-success btn-sm" ><i class="bi bi-save"></i> Insert</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" ><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="" CssClass="btn btn-success btn-sm" ><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="" CssClass="btn btn-danger btn-sm" ><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
        <div class="col-12">
            <h3>Add new</h3>
            <asp:DetailsView ID="DetailsView1" runat="server"  CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="BookId" DataSourceID="dsBooks" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="BookId" HeaderText="BookId" InsertVisible="False" ReadOnly="True" SortExpression="BookId" />
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Genre" SortExpression="Genre">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Genre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                           <asp:DropDownList ID="DropDownList1" CssClass="form-select" SelectedValue='<%# Bind("Genre") %>' runat="server">
                                <asp:ListItem Value="Thriller">Thriller</asp:ListItem>
                                <asp:ListItem Value="Novel">Novel</asp:ListItem>
                                <asp:ListItem Value="Drama">Drama</asp:ListItem>
                               <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Genre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ListPrice" SortExpression="ListPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ListPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("ListPrice", "{0:0.00}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ListPrice" ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PublishDate" SortExpression="PublishDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("PublishDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" CssClass="form-control date" runat="server" Text='<%# Bind("PublishDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success btn-sm" Text=""><i class="bi bi-save"></i> Insert</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Text=""><i class="bi bi-x"></i> Reset</asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>

            </asp:DetailsView>
        </div>
    </div>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="Scripts/jquery-3.6.1.js"></script>
    <script src="Scripts/bootstrap-datepicker.js"></script>
    <script>
        if ($('.date') != null) {
            $('.date').datepicker({
                    format: 'yyyy-mm-dd'
                });
        }
    </script>
</asp:Content>
