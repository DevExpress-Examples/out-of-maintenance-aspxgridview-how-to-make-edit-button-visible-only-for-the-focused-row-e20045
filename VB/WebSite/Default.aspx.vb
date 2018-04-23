Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub ASPxButton1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim editBtn As ASPxButton = CType(sender, ASPxButton)
		Dim container As GridViewDataItemTemplateContainer = CType(editBtn.NamingContainer, GridViewDataItemTemplateContainer)
		editBtn.ClientInstanceName = "EditButton" & container.VisibleIndex
		editBtn.ClientSideEvents.Click = String.Format("function(s,e){{grid.StartEditRow({0});}}", container.VisibleIndex)
	End Sub
	Protected Sub ASPxButton1_Load(ByVal sender As Object, ByVal e As EventArgs)
		Dim editBtn As ASPxButton = CType(sender, ASPxButton)
		Dim container As GridViewDataItemTemplateContainer = CType(editBtn.NamingContainer, GridViewDataItemTemplateContainer)
		editBtn.ClientVisible = (grid.FocusedRowIndex = container.VisibleIndex)
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Throw New NotImplementedException("Data modification is not allowed for examples")

	End Sub
End Class