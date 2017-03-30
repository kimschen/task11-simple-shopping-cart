Imports System.Data

Partial Class ShoppingCart
    Inherits System.Web.UI.Page

    Private Cart As SortedList
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Cart = GetCart()
        If Not IsPostBack Then
            Me.DisplayCart()
        End If

    End Sub

    'use session state object to store the list of the selected items 
    Private Function GetCart() As SortedList
        If Session("Cart") Is Nothing Then
            Session.Add("Cart", New SortedList)
        End If
        Return CType(Session("Cart"), SortedList)
    End Function

    'display cart and total price
    'sum up all the total price in cart
    Private Sub DisplayCart()
        myCart.Items.Clear()
        Dim CartItem As CartItem
        Dim CartEntry As DictionaryEntry
        Dim alltotal As Decimal

        For Each CartEntry In Cart
            CartItem = CType(CartEntry.Value, CartItem)
            myCart.Items.Add(CartItem.Display)
            alltotal += CDec(CartItem.total)
        Next

        lblTotal.Text = FormatCurrency(alltotal).ToString()


    End Sub

    'remove selected item from listbox
    Protected Sub removeBtn_Click(sender As Object, e As EventArgs) Handles removeBtn.Click
        If myCart.SelectedIndex > -1 And Cart.Count > 0 Then
            Cart.RemoveAt(myCart.SelectedIndex)
            Me.DisplayCart()
        End If
    End Sub

    'clear all items in cart
    Protected Sub clearBtn_Click(sender As Object, e As EventArgs) Handles clearBtn.Click
        Cart.Clear()
        myCart.Items.Clear()
        lblMsg.Text = ""
    End Sub


    Protected Sub checkoutBtn_Click(sender As Object, e As EventArgs) Handles checkoutBtn.Click
        lblMsg.Text = "Please Wait Checking Out ..."

        Response.Redirect("Checkout.aspx")
    End Sub
End Class
