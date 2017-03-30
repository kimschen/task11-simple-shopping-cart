<%@ Page Title="Check Out" EnableEventValidation="False" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Check out</h2>
    <p>Order details</p>
    <p>
        <asp:ListBox ID="ListBox1" runat="server" Height="238px" Width="604px" Font-Size="Medium"></asp:ListBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Total Price: "></asp:Label>
        <asp:Label ID="lblTotal" runat="server" ForeColor="red" Font-Size="Large"></asp:Label>
    </p>
    <hr />
    <h2>Customer Details</h2>
    <p>Please enter customer details as below</p>

    <div id="customerInfo">
    <p></p>
    <p>First Name:
        <asp:TextBox ID="FirstName" runat="server" Width="179px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVfirstName" runat="server" ControlToValidate="FirstName" ErrorMessage="Please enter your first name" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>Last Name:
        <asp:TextBox ID="LastName" runat="server" Width="182px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVlastName" runat="server" ControlToValidate="LastName" ErrorMessage="Please enter your last name" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>Contact Number:
        <asp:TextBox ID="ContactNum" runat="server" Width="182px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVcontact" runat="server" ControlToValidate="ContactNum" ErrorMessage="Please enter your contact number" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>

    <p>Address
        <asp:TextBox ID="Address" runat="server" Width="282px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVaddress" runat="server" ControlToValidate="Address" ErrorMessage="Please enter your shipping address" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>Postal Code
        <asp:TextBox ID="PostalCode" runat="server" Width="282px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVpostcode" runat="server" ControlToValidate="PostalCode" ErrorMessage="Please enter postal code" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>
        Email :
        <asp:TextBox ID="Email" runat="server" Width="194px" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVemail" runat="server" ControlToValidate="Email" ErrorMessage="Required" BorderStyle="NotSet" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>       
    </p>
    <h2>Credit Card Details</h2>
    <p></p>
    <p>Card holder name:
        <asp:TextBox ID="CardHolderName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVcardName" runat="server" ControlToValidate="CardHolderName" ErrorMessage="Please enter your card holder name" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>Credit card number :
        <asp:TextBox ID="CreditCardNum" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVcardNum" runat="server" ControlToValidate="CreditCardNum" ErrorMessage="Please enter your credit card number" CssClass="errorMsg"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Image ID="paypal" runat="server" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" Width="145" AlternateText="Check out with PayPal" BackColor="Transparent"/></p>
    <br />
        <asp:Button ID="PayBtn" runat="server" Text="Pay" Height="38px" Width="145px"/>
        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Height="38px" Width="145px" PostBackUrl="~/ShoppingCart.aspx"/>
        <br />
        <br />
    </div>
</asp:Content>
