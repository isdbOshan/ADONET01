<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDepartments.aspx.cs" Inherits="R52_M6_Class_04_Work_01.ManageDepartments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h5 class="display-6">Departments</h5>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="DepartmentId" DataSourceID="dsDepartments" InsertItemPosition="LastItem">

                <EditItemTemplate>
                    <tr style="">

                        <td>
                            <asp:Label ID="DepartmentIdLabel1" runat="server" Text='<%# Eval("DepartmentId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                        </td>
                        <td>
                            <asp:Button class="btn btn-success btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button class="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">

                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                        </td>
                        <td>
                            <asp:Button class="btn btn-primary btn-sm" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button class="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">

                        <td>
                            <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                        </td>
                        <td>
                            <asp:Button class="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button class="btn btn-success btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="table table-bordered">
                                    <thead class="table-light">
                                        <tr runat="server" style="">

                                            <th runat="server">Department Id</th>
                                            <th runat="server">Department Name</th>
                                            <th runat="server"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-light btn-sm" ShowFirstPageButton="false" ShowLastPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="dsDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Departments] WHERE [DepartmentId] = @DepartmentId" InsertCommand="INSERT INTO [Departments] ([DepartmentName]) VALUES (@DepartmentName)" SelectCommand="SELECT * FROM [Departments]" UpdateCommand="UPDATE [Departments] SET [DepartmentName] = @DepartmentName WHERE [DepartmentId] = @DepartmentId">
        <DeleteParameters>
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

