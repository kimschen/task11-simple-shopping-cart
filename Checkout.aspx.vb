Imports System.Data
Imports System.Net.Mail
Imports System.Text
Imports System.IO
Imports System.Data.Entity

Partial Class Checkout
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

    'Cart display
    Public Sub DisplayCart()

        'clear items in the listbox
        ListBox1.Items.Clear()

        Dim CartItem As CartItem
        Dim CartEntry As DictionaryEntry
        Dim alltotal As Decimal

        'loop and display every item in the list box
        For Each CartEntry In Cart
            CartItem = CType(CartEntry.Value, CartItem)
            alltotal += CDec(CartItem.total)
            ListBox1.Items.Add(CartItem.Display)

        Next

        'display total price
        lblTotal.Text = FormatCurrency(alltotal)

    End Sub

    Protected Sub PayBtn_Click(sender As Object, e As EventArgs) Handles PayBtn.Click

        Dim db = New eStoreDBEntities()

        'save customer info into database
        Dim user = New CustomerInfo()
        user.UserId = user.UserId
        user.FirstName = FirstName.Text
        user.LastName = LastName.Text
        user.PhoneNumber = ContactNum.Text
        user.Address = Address.Text
        user.PostalCode = PostalCode.Text
        user.Email = Email.Text

        db.CustomerInfoes.Add(user)
        db.SaveChanges()



        '(NEED ADVICE) Error : Object must be of type String

        'Dim myOrderList As SortedList = GetCart()
        'For i As Integer = 0 To myOrderList.Count - 1
        ' myOrder = New OrderDetail()
        '.OrderID = myOrder.OrderID
        'myOrder.UserId = user.UserId
        'myOrder.ProductName = myOrderList(i).Product.ProductName
        'myOrder.UnitPrice = myOrderList(i).Product.UnitPrice
        'myOrder.Quantity = myOrderList(i).Quantity

        'db.OrderDetails.Add(myOrder)
        'db.SaveChanges()
        'Next




        'email subject
        Dim myMsg As New MailMessage()
        myMsg.Subject = "eStore - Order receipt"

        Dim sb = New StringBuilder()

        'Loop every item in the the listbox as object and return string
        'Append into email
        'Append break space
        For Each item As Object In ListBox1.Items
            sb.Append(item.ToString())
            sb.Append("<br/>")
        Next

        'Message body display items from listbox and customer details
        myMsg.Body = sb.ToString() + Label2.Text + lblTotal.Text + "<br/>" + "FirstName: " + FirstName.Text + "<br/>" + "Last Name: " + LastName.Text + "<br/>" + "Contact Number: " + ContactNum.Text + "<br/>" + "Address: " + Address.Text + "<br/>"

        'email address
        myMsg.From = New MailAddress("youremail@hotmail.com")
        myMsg.To.Add(New MailAddress("youremail@hotmail.com"))
        myMsg.To.Add(New MailAddress(Email.Text))

        myMsg.IsBodyHtml = True

        Dim mySmtpClient As New SmtpClient()
        mySmtpClient.Send(myMsg)

        'clear all items in the listbox
        ListBox1.Items.Clear()
        Response.Redirect("CheckoutComplete.aspx")

    End Sub
End Class
