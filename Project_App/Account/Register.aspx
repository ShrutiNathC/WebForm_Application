<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project_App.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Register"></asp:Label>

    <br />
    <div class="container align-items-start" style="padding: 5px 0px 5px 0px">
       <form>
        <div class="row my-1" style="width: 40%">
            <asp:Label ID="Label2" runat="server" Text="Name" CssClass="col"></asp:Label>
            <asp:TextBox ID="Name_txt" runat="server" CssClass="col"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="col" ControlToValidate="Name_txt" ErrorMessage="Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="row my-1" style="width: 40%">
            <asp:Label ID="Label3" runat="server" Text="Password" CssClass="col"></asp:Label>
            <asp:TextBox ID="password_txt" runat="server" CssClass="col" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="col" ErrorMessage="Enter Password" ForeColor="Red" ControlToValidate="password_txt"></asp:RequiredFieldValidator>
        </div>
           <div class="row my-1" style="width: 40%">
               <asp:Label ID="Label5" runat="server" Text="Email" CssClass="col"></asp:Label>
               <asp:TextBox ID="EmailBox" runat="server" CssClass="col" TextMode="Email"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="col" ErrorMessage="Enter Correct E-Mail" ControlToValidate="EmailBox" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
           </div>
           
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>
    </form>
    </div>
        <div style="width: 40%">
            <br />
            <asp:Label ID="Label4" runat="server" Text="Have Account?"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Account/Login.aspx" CausesValidation="False">Log In</asp:LinkButton>
            <br />
        </div>

    </asp:Content>
