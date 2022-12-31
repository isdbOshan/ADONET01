<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployees.aspx.cs" Inherits="R52_M6_Class_04_Work_01.ManageEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h5 class="display-6">Employees</h5>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeId" DataSourceID="dsEmployees" InsertItemPosition="LastItem">
               
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-success" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeIdLabel1" runat="server" Text='<%# Eval("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ID="JoinDateTextBox" runat="server" Text='<%# Bind("JoinDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                             <asp:DropDownList CssClass="form-select" DataSourceID="dsDepartments" DataTextField="DepartmentName"  DataValueField="DepartmentId"  ID="DepartmentIdTextBox" runat="server" SelectedValue='<%# Bind("DepartmentId") %>' >
                                
                            </asp:DropDownList>
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
                        <td>
                            <asp:Button CssClass="btn btn-primary" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ID="JoinDateTextBox" runat="server" Text='<%# Bind("JoinDate", "{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-select" DataSourceID="dsDepartments" DataTextField="DepartmentName" AppendDataBoundItems="true" DataValueField="DepartmentId"  ID="DepartmentIdTextBox" runat="server" SelectedValue='<%# Bind("DepartmentId") %>' >
                                <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeIdLabel" runat="server" Text='<%# Eval("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeNameLabel" runat="server" Text='<%# Eval("EmployeeName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="JoinDateLabel" runat="server" Text='<%# Eval("JoinDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <thead class="bg-light">
                                        <tr runat="server">
                                        <th runat="server"></th>
                                        <th runat="server">Employee Id</th>
                                        <th runat="server">Employee Name</th>
                                        <th runat="server">Join Date</th>
                                        <th runat="server">Phone</th>
                                        <th runat="server">Department</th>
                                    </tr>
                                    </thead>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-light btn-sm" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
               
            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="dsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeId] = @EmployeeId" InsertCommand="INSERT INTO [Employees] ([EmployeeName], [JoinDate], [Phone], [DepartmentId]) VALUES (@EmployeeName, @JoinDate, @Phone, @DepartmentId)" SelectCommand="SELECT Employees.EmployeeId, Employees.EmployeeName, Employees.JoinDate, Employees.Phone, Employees.DepartmentId, Departments.DepartmentName FROM Employees INNER JOIN Departments ON Employees.DepartmentId = Departments.DepartmentId" UpdateCommand="UPDATE [Employees] SET [EmployeeName] = @EmployeeName, [JoinDate] = @JoinDate, [Phone] = @Phone, [DepartmentId] = @DepartmentId WHERE [EmployeeId] = @EmployeeId">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter DbType="Date" Name="JoinDate" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter DbType="Date" Name="JoinDate" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="Scripts/jquery-3.6.1.js"></script>
    <script src="Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(".date").datepicker({
            format: 'yyyy-mm-dd'
        });
    </script>
</asp:Content>
