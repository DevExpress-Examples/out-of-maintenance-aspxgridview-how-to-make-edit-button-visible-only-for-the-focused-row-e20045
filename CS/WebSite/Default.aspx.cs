using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{

    protected void ASPxButton1_Init(object sender, EventArgs e)
    {
        ASPxButton editBtn = (ASPxButton)sender;
        GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)editBtn.NamingContainer;
        editBtn.ClientInstanceName = "EditButton" + container.VisibleIndex;
        editBtn.ClientSideEvents.Click = string.Format("function(s,e){{grid.StartEditRow({0});}}", container.VisibleIndex);
    }
    protected void ASPxButton1_Load(object sender, EventArgs e)
    {
        ASPxButton editBtn = (ASPxButton)sender;
        GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)editBtn.NamingContainer;
        editBtn.ClientVisible = (grid.FocusedRowIndex == container.VisibleIndex);
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        throw new NotImplementedException("Data modification is not allowed for examples");

    }
}