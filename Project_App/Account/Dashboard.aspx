<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project_App.Account.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>
            Welcome <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </h1>
    </div>
    <br />
    <div class="container align-items-start" style="padding: 5px 0px 5px 0px">
        <asp:Panel ID="Panel1" runat="server">
            <asp:HiddenField ID="UserIdHiddenField" runat="server" />
            <div class="row my-1" style="width: 45%">
                <asp:Label ID="Label2" runat="server" Text="Name" CssClass="col"></asp:Label>
                <asp:TextBox ID="Name_txt" runat="server" CssClass="col"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="col" ControlToValidate="Name_txt" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="row my-1" style="width: 45%">
                <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col"></asp:Label>
                <asp:TextBox ID="Email_txt" runat="server" CssClass="col"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="col" ControlToValidate="Email_txt" ErrorMessage="Enter Correct E-Mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="row my-1" style="width: 45%">
                <asp:Label ID="Label3" runat="server" Text="Password" CssClass="col"></asp:Label>
                <asp:TextBox ID="Password_txt" runat="server" CssClass="col" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="col" ControlToValidate="Password_txt" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="row my-1" style="width: 45%">
                <asp:Label ID="Label5" runat="server" Text="Confirm Password" CssClass="col"></asp:Label>
                <asp:TextBox ID="Confirm_txt" runat="server" CssClass="col" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="col" ControlToCompare="Password_txt" ControlToValidate="Confirm_txt" ErrorMessage="Enter Same Password" ForeColor="Red"></asp:CompareValidator>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Submit" OnCLick="Button1_Submit" />
        </asp:Panel>
        
    </div>
    <br />
    <div class="flex align-text-center gap-5">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" EditRowStyle-HorizontalAlign="Center" EditRowStyle-VerticalAlign="Middle" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:BoundField DataField="Id"  HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false"/>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you want to delete this item?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#CCCCCC" BorderColor="#000066" BorderStyle="Double" BorderWidth="5px"></EditRowStyle>
        </asp:GridView>

    </div>
</asp:Content>
