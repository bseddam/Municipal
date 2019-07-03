using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepagesdcx : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            selectProfits();
        }
    }


    protected void selectProfits()
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
        DataTable dt1 = klas.getdatatable(@"select '' sn, 
                                           N'  Cəmi ' fullname, 
                                           '' YVOK,
                                           '' CompanyName,
                                           '' ActivitieType,
                                           '' unvan,
                                           sum(c.Income) Income,
                                           Sum(c.Expense) Expense,
                                           SUM(c.Amount) as Amount,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                    from Taxpayer t inner join ProfitsTax p on p.TaxpayerID=t.TaxpayerID left join 
                                    CalcProfits c on c.ProfitsID=p.IncomeTaxID 
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1 " + MunicipalId + ray);
        
        DataListCem.DataSource = dt1;
        DataListCem.DataBind();



        DataTable dt = klas.getdatatable(@"select   '' sn, 
                                       t.SName+' '+t.Name+' '+t.FName as fullname, 
                                       t.YVOK,
                                       p.CompanyName,
                                       p.ActivitieType,
                                       p.RegionName+', '+p.Village+', '+p.Street+', '+p.Home+', '+p.Flat as unvan,
                                       sum(c.Income) Income,
                                       Sum(c.Expense) Expense,
                                       SUM(c.Amount) as Amount,
                                       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                from Taxpayer t inner join ProfitsTax p on p.TaxpayerID=t.TaxpayerID left join CalcProfits c on c.ProfitsID=p.IncomeTaxID
                           inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1 " + MunicipalId + ray+
        "group by t.SName+' '+t.Name+' '+t.FName, t.YVOK,p.CompanyName, p.ActivitieType, p.RegionName+', '+p.Village+', '+p.Street+', '+p.Home+', '+p.Flat ");
        
        DataListBaza.DataSource = dt;
        DataListBaza.DataBind();
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
        selectProfits();
    }
}