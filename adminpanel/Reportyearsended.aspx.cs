using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class adminpanel_Reportyearsended : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; string islem; string TaxpayerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TaxpayerID = Request.QueryString["TaxpayerID"];
            islem = Request.QueryString["islem"];
        }
        catch (Exception)
        { }
        if (!Page.IsPostBack)
        {

            if (Session["UserID1"] == null)
            {
                Response.Redirect("EntryAdmin.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
            iller();
            rayon();
            municipal();
            vizual();
        }
    }
    void vizual()
    {
        if (Session["UserID1"] == null)
        {
            Response.Redirect("EntryAdmin.aspx");
        }
        string MunicipalId = ""; string ray = " "; string il = " ";
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

        if (ddlil.SelectedValue == "-1" || ddlil.SelectedValue == "" || ddlil.SelectedValue == null)
        {
            il = "  ";
        }
        else
        {
            il = " and xerc.ExpensesYear=" + ddlil.SelectedValue;
        }



        DataTable region2 = klas.getdatatable(@"select distinct case when lblfiziki<>lblguzestli+lblguzestsiz or lblfiziki+lblhuquqi<>lblqeydealmiw or cast(lblfizemlak as numeric(18,2))<>cast((lblfizemlak0+lblfizemlak2) as numeric(18,2)) or 
cast(lblfizemlak1 as numeric(18,2)) >cast(lblfizemlak0 as numeric(18,2)) or cast(lblfizemlak3 as numeric(18,2))>cast(lblfizemlak2 as numeric(18,2)) 
or lblodeeml > lblodeeml1+lblodeeml2 or lblodeeml>lblqeydealmiw or cast(lbltorpsahe as numeric(18,2))<>cast(lblheyet+lblheyet1 as numeric(18,2)) or 
cast(lblheyet0 as numeric(18,2))>cast(lbltorpsahe as numeric(18,2)) or cast(lblsahibkar0 as numeric(18,2))>cast(lblsahibkar as numeric(18,2)) or cast(lblkendt0 as numeric(18,2))>cast(lblkendt as numeric(18,2)) or lblodtorp >lblqeydealmiw or lblmedsay0>lblmedsay or lblmedsay>lblqeydealmiw or
cast(lblmedkm0 as numeric(18,2))>cast(lblmedkm  as numeric(18,2)) or menfsay0>menfsay or reksay0>reksay or cast(rekolcusu0 as numeric(18,2))>cast(rekolcusu as numeric(18,2)) or hotelsay0>hotelsay or avtsay0>avtsay or sexssay0>sexssay then '-----' else '+' end incomesehv ,
case when xerc.FundID is null then '-----' else '+' end FundID ,
case when inc.IncomeID is null then '-----' else '+' end IncomeID,case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName ,lcm.MunicipalName,Uname,
Passvord,u.UserID,lcm.MunicipalID,SName +' '+ u.Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name
from Users u inner join List_classification_Municipal lcm on u.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lr.RegionsID=lcm.RegionID
full outer join IncomeForYear inc on inc.MunicipalID=lcm.MunicipalID  
full outer join (select efa.MunicipalID,FundID,ep.ExpensesYear from ExpensesFundsAllocated  efa inner join ExpensesProjectIllik ep on efa.MunicipalID=ep.MunicipalID and efa.ReportYear=ep.ExpensesYear) xerc 
on xerc.MunicipalID=lcm.MunicipalID where 1=1 " + MunicipalId + ray + il + "  order by RegionName,MunicipalName");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();

    }
    void iller()
    {
        DataTable region2 = klas.getdatatable(@"select distinct ExpensesYear from ExpensesProjectIllik ");
        ddlil.DataTextField = "ExpensesYear";
        ddlil.DataValueField = "ExpensesYear";
        ddlil.DataSource = region2;
        ddlil.DataBind();
        ddlil.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable(@"select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable(@"select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }

    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void axtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
}