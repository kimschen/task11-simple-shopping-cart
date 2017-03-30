Imports Microsoft.VisualBasic
Imports System.Data

Public Class CartItem
    Public Product As Product
    Public Quantity As Integer
    Public total As Decimal

    Public Function Display() As String

        total = FormatCurrency(Quantity * Product.UnitPrice)


        Return Product.ProductName.ToString() + " ( " + Quantity.ToString() + " x " + FormatCurrency(Product.UnitPrice).ToString() + " ) = " + FormatCurrency(total).ToString()

    End Function

End Class
