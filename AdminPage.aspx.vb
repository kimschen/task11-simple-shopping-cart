
Partial Class AdminPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlDataSource1_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs)

        Dim imgupload As FileUpload = DirectCast(ListView1.InsertItem.FindControl("FileUpload1"), FileUpload)
        Dim path As String = Server.MapPath("~/Image/")

        If imgupload.HasFile Then

            'Save the image into the path if the file extensions is allowed
            imgupload.PostedFile.SaveAs(path + imgupload.FileName)

        End If
        'set the parameters value as imgupload
        e.Command.Parameters("@ProductImage").Value = imgupload.FileName

    End Sub
End Class
