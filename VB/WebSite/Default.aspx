<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ASPxGrdView: How to Make Edit Button Visible Only for the Focused Row</title>
	<script type="text/javascript">
		var fIndex = 0;
		function OnFocusedRowChanged() {
			var index = grid.GetFocusedRowIndex();
			if (fIndex != index) {
				eval('EditButton' + index.toString()).SetVisible(true);
				if (fIndex >= grid.GetTopVisibleIndex() && fIndex <= grid.GetVisibleRowsOnPage() + grid.GetTopVisibleIndex())
					eval('EditButton' + fIndex.toString()).SetVisible(false);
				fIndex = index;
			}
		}    
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
			KeyFieldName="CustomerID" ClientInstanceName="grid" 
			onrowupdating="grid_RowUpdating">
			<ClientSideEvents FocusedRowChanged="OnFocusedRowChanged" />
			<Columns>
				<dx:GridViewDataTextColumn FieldName="CustomerID" ReadOnly="True" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="6">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="0">
					<EditFormSettings Visible="False" />
					<DataItemTemplate>
						<dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Height="17px"
							OnInit="ASPxButton1_Init" Text="Edit" Width="50px" OnLoad="ASPxButton1_Load">
						</dx:ASPxButton>
					</DataItemTemplate>
				</dx:GridViewDataTextColumn>
			</Columns>
			<SettingsBehavior AllowFocusedRow="True" />
		</dx:ASPxGridView>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Northwind.mdb"
			SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Country], [Phone] FROM [Customers]"
			UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [Country] = ?, [Phone] = ? WHERE (([CustomerID] = ?))">
			<UpdateParameters>
				<asp:Parameter Name="CompanyName" Type="String" />
				<asp:Parameter Name="ContactName" Type="String" />
				<asp:Parameter Name="Country" Type="String" />
				<asp:Parameter Name="Phone" Type="String" />
				<asp:Parameter Name="CustomerID" Type="String" />
			</UpdateParameters>
		</asp:AccessDataSource>
	</div>
	</form>
</body>
</html>