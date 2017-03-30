Imports System.Data
Partial Class ProductList
    Inherits System.Web.UI.Page

    Private SelectedProduct As Product
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            productList.DataBind()
        End If

        'Display selected product details from dropdown list
        SelectedProduct = Me.GetSelectedProduct()
        ProductImg.ImageUrl = "Image/" & SelectedProduct.ProductImage
        lblName.Text = SelectedProduct.ProductName
        lblPrice.Text = FormatCurrency(SelectedProduct.UnitPrice)

    End Sub

    'Get selected product from dropdown list
    Private Function GetSelectedProduct() As Product

        Dim dbProduct As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        dbProduct.RowFilter = "ProductID = '" & productList.SelectedValue & "'"

        Dim Product As New Product
        Product.ProductID = dbProduct(0)("ProductID").ToString
        Product.ProductImage = dbProduct(0)("ProductImage").ToString
        Product.ProductName = dbProduct(0)("ProductName").ToString
        Product.UnitPrice = CDec(dbProduct(0)("UnitPrice"))
        Return Product

    End Function

    'Add product and quantity to the cart if page is valid
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim CartItem As New CartItem
            CartItem.Product = SelectedProduct
            CartItem.Quantity = CType(txtQuantity.Text, Integer)
            Me.AddToCart(CartItem)
            btnCart.Visible = True
            Response.Redirect("ShoppingCart.aspx")
        End If
    End Sub

    'AddToCart Method
    Private Sub AddToCart(ByVal CartItem As CartItem)
        Dim Cart As SortedList = GetCart()
        Dim sProductID As String = SelectedProduct.ProductID
        If Cart.ContainsKey(sProductID) Then
            CartItem = CType(Cart(sProductID), CartItem)
            CartItem.Quantity += CType(txtQuantity.Text, Integer)
        Else
            Cart.Add(sProductID, CartItem)
        End If
    End Sub

    'use session state object to store the list of the selected items 
    Private Function GetCart() As SortedList
        If Session("Cart") Is Nothing Then
            Session.Add("Cart", New SortedList)
        End If
        Return CType(Session("Cart"), SortedList)
    End Function

End Class
