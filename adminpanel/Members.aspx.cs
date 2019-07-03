using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using System.IO;
using System.Drawing;

public partial class adminpanel_Members : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string islem; string TaxpayerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            //vizual();
        }
    }
    void vizual()
    {
        string MunicipalId = ""; string ray = " ";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
        }
        else
        {
            MunicipalId = " and lcm.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }
        DataTable region2 = klas.getdatatable(@"select '' sn,SName +' '+ st.Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name
,StatusPositionName,Photo,Signature,StructureID,case when Charge=1 then N'Məsul şəxs' else '' end Charge,lcm.MunicipalName,
case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName 
from Structure  st 
inner join List_classification_Municipal lcm on lcm.MunicipalID=st.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where st.ForDelete=1 " + MunicipalId + ray + " order by st.NowTime desc");
        GridView1.DataSource = region2;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        vizual();
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    protected void axtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
}