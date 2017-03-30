<%@ Page Title="Product" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ProductList.aspx.vb" Inherits="ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Product List</h2>
    <p>
        <asp:Label ID="Label1" runat="server"  Text="Please select a product : "></asp:Label>
        <asp:DropDownList ID="productList" runat="server" Width="309px" DataSourceID="SqlDataSource1" DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="true" >
        </asp:DropDownList>
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [ProductImage] FROM [Products]">
    </asp:SqlDataSource>

    <h2>Product Details</h2>
    <table>
        <tr>
            <td style="width:auto">
                <asp:Image ID="ProductImg" runat="server"/>
            </td>
        </tr>
        <tr>
            <td style="width:250px;"> 
                Product Name : <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:200px;">
                Price : <asp:Label ID="lblPrice" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity" Width="80px" BorderWidth="0px"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" Width="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqQuantityVal" runat="server" ErrorMessage="Quantity is a required field." CssClass="errorMsg" ControlToValidate="txtQuantity" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rangeQuantityVal" runat="server" ErrorMessage="Quantity must range from 1 to 100." CssClass="errorMsg" ControlToValidate="txtQuantity" Display="Dynamic" MaximumValue="100" MinimumValue="1" Type="Integer" ></asp:RangeValidator><br /><br />
            </td>
        </tr>
    </table>
    <br />
    <p>
    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" Height="38px" Width="145px" /> 
    <asp:Button ID="btnCart" runat="server" Text="Go to Cart"  Height="38px" Width="145px" CausesValidation="False" PostBackUrl="~/ShoppingCart.aspx" Visible="false" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

