<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="R52_M6_Class_05_Work_01.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
           
            <div runat="server" id="alertSuccess" visible="false" class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Success!</strong> Data inserted.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <div runat="server" id="alertFailed" visible="false" class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Failed!</strong> Data insert aborted. Picture not selected.
                <button type="button"  class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="EmployeeId" DataSourceID="SqlDataSource2" OnItemInserting="FormView1_ItemInserting" RenderOuterTable="False">
                <HeaderTemplate>
                     <h4 class="display-6">Create new employee</h4>
                </HeaderTemplate>
                <InsertItemTemplate>
                   <div class="form-group row mb-1">
                       <asp:Label AssociatedControlID="TextBox1" CssClass="col-form-label col-2 text-end" ID="Label1" runat="server" Text="Emp. Name"></asp:Label>
                       <div class="col-4">
                           <asp:TextBox Text='<%# Bind("EmployeeName") %>' CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                       </div>
                   </div>
                    <div class="form-group row mb-1">
                       <asp:Label AssociatedControlID="TextBox2" CssClass="col-form-label col-2 text-end" ID="Label2" runat="server" Text="Join Date"></asp:Label>
                       <div class="col-4">
                           <asp:TextBox  Text='<%# Bind("JoinDate", "{0:yyyy-MM-dd}") %>' CssClass="form-control date" ID="TextBox2" runat="server"></asp:TextBox>
                       </div>
                   </div>
                    <div class="form-group row mb-1">
                       <asp:Label AssociatedControlID="TextBox3" CssClass="col-form-label col-2 text-end" ID="Label3" runat="server" Text="Phone"></asp:Label>
                       <div class="col-4">
                           <asp:TextBox Text='<%# Bind("Phone") %>' CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                       </div>
                   </div>
                    <div class="form-group row mb-1">
                       <asp:Label AssociatedControlID="DropDownList1" CssClass="col-form-label col-2 text-end" ID="Label4" runat="server" Text="Department"></asp:Label>
                       <div class="col-4">
                           <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentId" SelectedValue='<%# Bind("DepartmentId") %>'></asp:DropDownList>
                       </div>
                   </div>
                    <div class="form-group row mb-1">
                       <asp:Label AssociatedControlID="fu" CssClass="col-form-label col-2 text-end" ID="Label5" runat="server" Text="Picture"></asp:Label>
                       <div class="col-4">
                           <asp:HiddenField Value='<%# Bind("Picture") %>' ID="HiddenField1" runat="server" />
                           <asp:FileUpload ID="fu" CssClass="form-control" runat="server" />
                       </div>
                   </div>
                     <div class="form-group row mb-1">
                      
                       <div class="col-4 offset-2">
                           <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Insert" CommandName="Insert" />
                           <asp:Button CssClass="btn btn-secondary" ID="Button2" runat="server" Text="Cancel"  CommandName="Cancel" />
                       </div>
                   </div>
                </InsertItemTemplate>
              
            </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeId] = @EmployeeId" InsertCommand="INSERT INTO [Employees] ([EmployeeName], [JoinDate], [Phone], [Picture], [DepartmentId]) VALUES (@EmployeeName, @JoinDate, @Phone, @Picture, @DepartmentId)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [EmployeeName] = @EmployeeName, [JoinDate] = @JoinDate, [Phone] = @Phone, [Picture] = @Picture, [DepartmentId] = @DepartmentId WHERE [EmployeeId] = @EmployeeId">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter DbType="Date" Name="JoinDate" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter DbType="Date" Name="JoinDate" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="Scripts/jquery-3.6.1.js"></script>
    <script src="Scripts/bootstrap-datepicker.js"></script>
    <script>
        $('.date').datepicker({
            format: 'yyyy-mm-dd'
        });
        
    </script>
</asp:Content>
