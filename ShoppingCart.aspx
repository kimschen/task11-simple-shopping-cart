<%@ Page Title="Shopping Cart" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.vb" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Shopping Cart</h2>


    <table>
        <tr>
            <td>
                <asp:ListBox ID="myCart" runat="server" Height="238px" Width="604px" Font-Size="Medium"></asp:ListBox>
            </td>
            <td>
                <asp:Button ID="removeBtn" runat="server" Text="Remove Item" Height="38px" Width="145px" />
                <asp:Button ID="clearBtn" runat="server" Text="Clear Cart" Height="38px" Width="145px" />
            </td>
        </tr>
    </table>
    <br />
    <p>
        <asp:Label ID="Label1" runat="server" Text="Total price : "></asp:Label>
        <asp:Label ID="lblTotal" runat="server" ForeColor="red" Font-Size="Large"></asp:Label>
    </p>
    <p>
    <asp:Button ID="continueBtn" runat="server" Text="Continue Shopping" Height="38px" Width="145px" PostBackUrl="~/ProductList.aspx" />
    <asp:Button ID="checkoutBtn" runat="server" Text="Check Out" Height="38px" Width="145px" />
    <br />
    </p>
    <p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
</asp:Content>

