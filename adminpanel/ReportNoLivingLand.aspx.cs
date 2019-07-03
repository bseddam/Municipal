using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepagexc : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            //selectNoLivingland();
        }
    }

 
    protected void selectNoLivingland()
    {
        string MunicipalId = ""; string ray = " ";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
        }
        else
        {
            MunicipalId = " and t.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }
        DataTable dt = klas.getdatatable(@"select '0' sn, 
                                           N' Cəmi ' fullname, 
                                           '' YVOK,
                                           '' name,
                                           '' Concession1,
                                           sum(l.GeneralArea) GeneralArea,
                                           '' TaxRate,
                                           sum(l.mebleg) mebleg,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix       
                                           from Taxpayer t inner join ViewQLivingLand l on t.TaxpayerID=l.TaxpayerID 
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where t.fordelete=1 and (l.TypeUseLand=1 or l.TypeUseLand=2) and ExitDate is null  " + MunicipalId + ray +
" union " +
"select '1' sn, " +
"                                       t.SName+' '+t.Name+' '+t.FName as fullname, " +
"                                       t.YVOK, " +
"                                       l.Name, " +
"                                       l.Concession1, " +
"                                       l.GeneralArea, " +
                                      " l.TaxRate," +
"                                       l.mebleg, " +
"                                       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix  " +
"                                       from Taxpayer t inner join ViewQLivingLand l on t.TaxpayerID=l.TaxpayerID  " +
"inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where t.fordelete=1 and (l.TypeUseLand=1 or l.TypeUseLand=2) and ExitDate is null " + MunicipalId + ray +
" order by sn,fullname");
       
        GridView1.DataSource = dt;
        GridView1.DataBind();


      
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
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
    void rayon()
    {
        DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    protected void btnhesab_Click(object sender, EventArgs e)
    {
        selectNoLivingland();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        selectNoLivingland();
    }
}