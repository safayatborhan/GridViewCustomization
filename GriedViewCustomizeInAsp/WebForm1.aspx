<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GriedViewCustomizeInAsp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="Image">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="image" SortExpression="image">
                    <EditItemTemplate>
                        <asp:Image ID="TextBox2" runat="server" ImageUrl='<%# Eval ("Image") %>' Height="50" Width="50" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="TextBox2" runat="server" ImageUrl='<%# Eval ("Image") %>' Height="100" Width="100" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="description" SortExpression="description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteEmployee" SelectMethod="GetAllEmployees" TypeName="GriedViewCustomizeInAsp.EmployeeDataAccessLayercs" UpdateMethod="UpdateEmployee">
            <DeleteParameters>
                <asp:Parameter Name="image" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
