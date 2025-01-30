<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_App.Account.Login"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="LOG IN TO YOUR ACCOUNT"></asp:Label>
    <br />
    <div class="container align-items-start" style="padding: 5px 0px 5px 0px">
        <form>
            <div class="row my-1" style="width: 40%">
                <asp:Label ID="Label2" runat="server" Text="Name" CssClass="col"></asp:Label>
                <asp:TextBox ID="Name_Box" runat="server" CssClass="col" AutoCompleteType="DisplayName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="col" ControlToValidate="Name_Box" ErrorMessage="Enter Name" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="row my-1" style="width: 40%">
                <asp:Label ID="Label3" runat="server" Text="Password" CssClass="col"></asp:Label>
                <asp:TextBox ID="password_Box" runat="server" CssClass="col" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="col" ControlToValidate="password_Box" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click"/>
        </form>
    </div>
    <div style="width: 40%">
        <br />
        <asp:Label ID="Label4" runat="server" Text="New User?"></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Account/Register.aspx" CausesValidation="False">Create Account</asp:LinkButton>
        <br />
    </div>

</asp:Content>
