<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDepartments.aspx.cs" Inherits="R52_M6_Class_05_Work_01.ManageDepartments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h4 class="display-6">Departments</h4>
            <asp:ListView ID="ListView1" runat="server" 
                DataKeyNames="DepartmentId" 
                DataSourceID="SqlDataSource1" 
                InsertItemPosition="LastItem"
                ItemPlaceholderID="items"
                >
               
                <EditItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="DepartmentIdLabel1" runat="server" Text='<%# Eval("DepartmentId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                        </td>
                         <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                        
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                   <table class="table table-bordered table-striped">
                       <thead>
                           <tr>
                               <th>Dept. Id</th>
                               <th>Dep. Name</th>
                               <th></th>
                           </tr>
                       </thead>
                       <tbody id="items" runat="server">

                       </tbody>
                   </table>
                    <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-sm" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                </LayoutTemplate>
                

            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM Departments
WHERE DepartmentId=@DepartmentId" InsertCommand="INSERT INTO Departments(DepartmentName) VALUES (@DepartmentName)" SelectCommand="SELECT * FROM Departments" UpdateCommand="UPDATE Departments SET DepartmentName = @DepartmentName WHERE (DepartmentId = @DepartmentId)">
        <DeleteParameters>
            <asp:Parameter Name="DepartmentId" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentName" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DepartmentName" />
            <asp:Parameter Name="DepartmentId" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
