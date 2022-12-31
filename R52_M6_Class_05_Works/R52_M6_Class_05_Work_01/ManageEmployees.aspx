<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployees.aspx.cs" Inherits="R52_M6_Class_05_Work_01.ManageEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-6 offset-3">
            <asp:DropDownList CssClass="form-select" AppendDataBoundItems="true" ID="DropDownList1" runat="server" DataSourceID="dsDept" DataTextField="DepartmentName" DataValueField="DepartmentId" AutoPostBack="True">
                <asp:ListItem Value="" Selected="True">Select Department</asp:ListItem>
            </asp:DropDownList>
            
        </div>
        <div class="col-3">
            <div class="d-flex justify-content-end">
                <a class="btn btn-primary" href="AddEmployee.aspx">Add New</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <h4 class="display-6">Employees</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="EmployeeId" DataSourceID="dsEmp">
                <Columns>
                    <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1"  runat="server" Text='<%# Bind("Picture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <%-- <asp:Image ID="Image1" CssClass="rounded-circle" style="width:40px" ImageUrl='<%# Eval("Picture", "~/Pictures/{0}") %>' runat="server" />--%>
                            <img src='<%# Eval("Picture", "/Pictures/{0}") %>' class="rounded-circle" style="width:40px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="JoinDate"  HeaderText="JoinDate" SortExpression="JoinDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="Department"  />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsEmp" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Employees.EmployeeId, Employees.EmployeeName, Employees.JoinDate, Employees.Phone, Employees.Picture, Employees.DepartmentId, Departments.DepartmentName FROM Employees INNER JOIN Departments ON Employees.DepartmentId = Departments.DepartmentId WHERE (Employees.DepartmentId = @DepartmentId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="DepartmentId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <asp:SqlDataSource ID="dsDept" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
