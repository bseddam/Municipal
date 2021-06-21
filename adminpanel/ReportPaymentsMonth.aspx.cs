using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepagegjv : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            hesabatili();
            //odeniwler();
            //selectpeymants();
        }
    }

    protected void hesabatili()
    {
        DDLHesabatILI.Items.Clear();
        int k = 0;
        string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
        for (var i = int.Parse(vaxt); i >= 2014; i--)
        {
            DDLHesabatILI.Items.Insert(k, new ListItem("" + i + ""));
            k++;
        }
    }
    protected void selectpeymants()
    {

        string MunicipalId = " "; string MunicipalId1 = " "; string ray = " "; string ray1 = " "; 
        string Shesabatili = DDLHesabatILI.SelectedItem.ToString();
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
            MunicipalId1 = " ";
        }
        else
        {
            MunicipalId = " and v.MunicipalID=" + ddlbelediyye.SelectedValue;
            MunicipalId1 = " and v1.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
            ray1 = "  ";
        }
        else
        {
            ray = " and v.RegionID=" + ddlrayon.SelectedValue;
            ray1 = " and v1.RegionID=" + ddlrayon.SelectedValue;
        }
        //if (ddlodeniw.SelectedValue == "-1" || ddlodeniw.SelectedValue == "" || ddlodeniw.SelectedValue == null)
        //{
        //    odeniw = "  ";
        //}
        //else
        //{
        //    odeniw = " and vpb.id=" + ddlodeniw.SelectedValue;
        //}
        if (RadioButton1.Checked == true)
        {
            DataTable dt = klas.getdatatable(@"select Row_Number() over (order by sn1,Name) sn,* from 
(select ' ' sn1,N'Cəmi' Name,Cast(Sum(v1.Yanvar) as numeric(18,2)) Yanvar, Cast(Sum(v1.Fevral) as numeric(18,2)) Fevral, Cast(Sum(v1.mart) as numeric(18,2)) mart,Cast(Sum(v1.Aprel) as numeric(18,2)) Aprel,Cast(Sum(v1.May) as numeric(18,2)) May,Cast(Sum(v1.Iyun) as numeric(18,2)) Iyun,Cast(Sum(v1.Iyul) as numeric(18,2)) Iyul,Cast(Sum(v1.Avqust) as numeric(18,2)) Avqust,Cast(Sum(v1.Sentyabr) as numeric(18,2)) Sentyabr,Cast(Sum(v1.Oktyabr) as numeric(18,2)) Oktyabr,Cast(Sum(v1.Noyabr) as numeric(18,2)) Noyabr,Cast(Sum(v1.Dekabr) as numeric(18,2)) Dekabr,Cast(Sum(v1.Dotasiya) as numeric(18,2)) Dotasiya,case when Cast(Sum(v1.Dotasiya) as numeric(18,2)) is null then 0 else Cast(Sum(v1.Dotasiya) as numeric(18,2)) end+case when Cast(Sum(v1.cemi) as numeric(18,2)) is null then 0 else Cast(Sum(v1.cemi) as numeric(18,2)) end cemi 
from FunkRegionMunicipalPayment(" + Shesabatili + @") v1 where 1=1 and v1.RegionID IS NOT NULL " + ray1 + @" 
 Union select Row_Number() over (order by v.Name) sn1,v.Name,Cast(Sum(v.Yanvar) as numeric(18,2)) Yanvar, Cast(Sum(v.Fevral) as numeric(18,2)) Fevral, Cast(Sum(v.mart) as numeric(18,2)) mart,Cast(Sum(v.Aprel) as numeric(18,2)) Aprel,Cast(Sum(v.May) as numeric(18,2)) May,Cast(Sum(v.Iyun) as numeric(18,2)) Iyun,Cast(Sum(v.Iyul) as numeric(18,2)) Iyul,Cast(Sum(v.Avqust) as numeric(18,2)) Avqust,Cast(Sum(v.Sentyabr) as numeric(18,2)) Sentyabr,Cast(Sum(v.Oktyabr) as numeric(18,2)) Oktyabr,Cast(Sum(v.Noyabr) as numeric(18,2)) Noyabr,Cast(Sum(v.Dekabr) as numeric(18,2)) Dekabr,Cast(Sum(v.Dotasiya) as numeric(18,2)) Dotasiya,case when Cast(Sum(v.Dotasiya) as numeric(18,2)) is null then 0 else Cast(Sum(v.Dotasiya) as numeric(18,2)) end+case when Cast(Sum(v.cemi) as numeric(18,2)) is null then 0 else Cast(Sum(v.cemi) as numeric(18,2)) end cemi 
from FunkRegionMunicipalPayment(" + Shesabatili + @") v where 1=1 and v.RegionID IS NOT NULL " + ray + " group by v.Name) t1");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView2.Visible=false;
            GridView1.Visible = true;  
        }
        else
        {
            DataTable dt = klas.getdatatable(@"select Row_Number() over (order by sn,Name,MunicipalName) sn,* from (select ' ' sn,N'Cəmi' Name,' ' MunicipalName, Cast(Sum(v1.Yanvar) as numeric(18,2)) Yanvar, Cast(Sum(v1.Fevral) as numeric(18,2)) Fevral, Cast(Sum(v1.mart) as numeric(18,2)) mart, Cast(Sum(v1.Aprel) as numeric(18,2)) Aprel, Cast(Sum(v1.May) as numeric(18,2)) May,Cast(Sum(v1.Iyun) as numeric(18,2)) Iyun,Cast(Sum(v1.Iyul) as numeric(18,2)) Iyul,Cast(Sum(v1.Avqust) as numeric(18,2)) Avqust,Cast(Sum(v1.Sentyabr) as numeric(18,2)) Sentyabr,Cast(Sum(v1.Oktyabr) as numeric(18,2)) Oktyabr,Cast(Sum(v1.Noyabr) as numeric(18,2)) Noyabr,Cast(Sum(v1.Dekabr) as numeric(18,2)) Dekabr,Cast(Sum(v1.Dotasiya) as numeric(18,2)) Dotasiya,case when Cast(Sum(v1.Dotasiya) as numeric(18,2)) is null then 0 else Cast(Sum(v1.Dotasiya) as numeric(18,2)) end+case when Cast(Sum(v1.cemi) as numeric(18,2)) is null then 0 else Cast(Sum(v1.cemi) as numeric(18,2)) end cemi 
from FunkRegionMunicipalPayment(" + Shesabatili + @") v1 where 1=1 and v1.RegionID IS NOT NULL " + ray1 + MunicipalId1 + @" Union 
select  Row_Number() over (order by v.Name,v.MunicipalName) sn,v.Name,v.MunicipalName,Cast(Sum(v.Yanvar) as numeric(18,2)) Yanvar, Cast(Sum(v.Fevral) as numeric(18,2)) Fevral, Cast(Sum(v.mart) as numeric(18,2)) mart,Cast(Sum(v.Aprel) as numeric(18,2)) Aprel,Cast(Sum(v.May) as numeric(18,2)) May,Cast(Sum(v.Iyun) as numeric(18,2)) Iyun,Cast(Sum(v.Iyul) as numeric(18,2)) Iyul,Cast(Sum(v.Avqust) as numeric(18,2)) Avqust,Cast(Sum(v.Sentyabr) as numeric(18,2)) Sentyabr,Cast(Sum(v.Oktyabr) as numeric(18,2)) Oktyabr,Cast(Sum(v.Noyabr) as numeric(18,2)) Noyabr,Cast(Sum(v.Dekabr) as numeric(18,2)) Dekabr,Cast(Sum(v.Dotasiya) as numeric(18,2)) Dotasiya,case when Cast(Sum(v.Dotasiya) as numeric(18,2)) is null then 0 else Cast(Sum(v.Dotasiya) as numeric(18,2)) end+case when Cast(Sum(v.cemi) as numeric(18,2)) is null then 0 else Cast(Sum(v.cemi) as numeric(18,2)) end cemi 
from FunkRegionMunicipalPayment(" + Shesabatili + @") v where 1=1 and v.RegionID IS NOT NULL" + ray + MunicipalId + " group by v.Name,v.MunicipalName) t1");
            GridView2.DataSource = dt;
            GridView2.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = true;
            
        }
        

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
    //void odeniwler()
    //{
    //    DataTable region2 = klas.getdatatable(@"select TaxesPaymentID,TaxesPaymentTypeName from TaxesPaymentList where TaxesPaymentType=2 order by TaxesPaymentID ");
    //    ddlodeniw.DataTextField = "TaxesPaymentTypeName";
    //    ddlodeniw.DataValueField = "TaxesPaymentID";
    //    ddlodeniw.DataSource = region2;
    //    ddlodeniw.DataBind();
    //    ddlodeniw.Items.Insert(0, new ListItem("Ümumi", "-1"));
    //}
    protected void btnhesab_Click(object sender, EventArgs e)
    {
        selectpeymants();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        selectpeymants();
    }
}