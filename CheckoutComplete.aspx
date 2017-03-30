<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CheckoutComplete.aspx.vb" Inherits="CheckoutComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2> Thank you! </h2>
    <p>Your receipt will be emailed to you shortly.</p>
    <p>Payment Transaction ID: <asp:Label ID="TransactionId" runat="server">1234567</asp:Label></p>
</asp:Content>

