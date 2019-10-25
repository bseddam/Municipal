using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_RepPayment : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {
            if (Session["UserID1"] == null)
            {
                Response.Redirect("EntryAdmin.aspx");
            }

            xx();
            rayon();
            municipal();
        }
    }


    void xx()
    {
        DataTable dtiller = klas.getdatatable(@"select 
distinct txl.TaxesPaymentID,case when txl.TaxesPaymentID in(1,3,6) then N'Əmlak vergisi' 
when txl.TaxesPaymentID in(2,4,5) then N'Torpaq vergisi' else  
TaxesPaymentTypeName end TaxesPaymentTypeName 
 from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID 
inner join (select * from TaxesPaymentList d union 
select 15,N'Maliyyə sanksiyası','3',getdate() ) txl on 
txl.TaxesPaymentID=p.TaxesPaymentID order by txl.TaxesPaymentID");
        vergiadi.DataTextField = "TaxesPaymentTypeName";
        vergiadi.DataValueField = "TaxesPaymentID";
        vergiadi.DataSource = dtiller;
        vergiadi.DataBind();
        vergiadi.Items.Insert(0, new ListItem("Ümumi", "-1"));
        vergiadi.SelectedValue = "-1";
    }
    void kk()
    {
        if (Session["UserID1"] == null)
        {
            Response.Redirect("EntryAdmin.aspx");
        }
        string MunicipalId = ""; string ray = " "; string vergiid = ""; string tarix1 = "";
        string tarix2 = ""; string yvok = "";string odenisnovu="";

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


        if (txtyvok.Text == " " || txtyvok.Text == "" || txtyvok.Text == null)
        {
            yvok = "  ";
        }
        else
        {
            yvok = "  and t.YVOK like N'%" + txtyvok.Text + "%'";
        }


        if (vergiadi.SelectedValue.ToString() == "-1" || vergiadi.SelectedValue.ToString() == "" || vergiadi.SelectedValue.ToString() == null)
        {
            vergiid = " ";
        }
        else
        {
            vergiid = " and p.TaxesPaymentID=" + vergiadi.SelectedValue.ToString();
        }
        if (DEDate1.Text == "" || DEDate1.Text == null)
        {
            tarix1 = " ";
        }
        else
        {
            tarix1 = " and convert(date,p.NowTime)>=convert(date,'" + DEDate1.Text + "',104) ";
        }
        if (DEDate2.Text == "" || DEDate2.Text == null)
        {
            tarix2 = " ";
        }
        else
        {
            tarix2 = " and convert(date,p.NowTime)<=convert(date,'" + DEDate2.Text + "',104) ";
        }
        if (ddlodenisnovu.SelectedValue.ToString() == "-1" || ddlodenisnovu.SelectedValue.ToString() == "" || ddlodenisnovu.SelectedValue.ToString() == null)
        {
            odenisnovu = " ";
        }
        else if(ddlodenisnovu.SelectedValue.ToString() == "1")
        {
            odenisnovu = " and p.TaxesPaymentOnline=1 ";
        }
        else
        {
            odenisnovu = " and p.TaxesPaymentOnline is null ";
        }



        DataTable dt = klas.getdatatable(@"select '0' sn, '' fullname, '' YVOK,
CAST(Sum(p.Amount)as numeric(18,2)) mebleg, cast(sum(p.Amount)*3/100 as numeric(18,2)) faizmebleg, 
cast(Sum(p.Amount)-sum(p.Amount)*3/100 as numeric(18,2)) qaliq, '' Tarix,
'' odenisnovu,
'' TaxesPaymentName,
'' MunicipalName,'' Name   from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID 
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID 
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID  where 1=1  "
+ tarix1 + tarix2 + vergiid + MunicipalId + ray + yvok + odenisnovu+
@" and p.Operation=10     union  all 
select '1' sn, t.SName+' '+t.Name+' '+t.FName as fullname, t.YVOK, CAST(p.Amount as numeric(18,2)) mebleg, 
cast(p.Amount*3/100 as numeric(18,2)) faizmebleg,
cast(p.Amount-p.Amount*3/100 as numeric(18,2)) qaliq,
convert(varchar,p.NowTime,104) Tarix,case when p.TaxesPaymentOnline=1 then 'Online' else N'Nəğd' end odenisnovu,
case when p.TaxesPaymentID=1 then N'Əmlak vergisi' 
when p.TaxesPaymentID=2 then N'Torpaq vergisi' else TaxesPaymentTypeName end TaxesPaymentName,lcm.MunicipalName,
case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end Name
from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID 
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID 
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID 
inner join (select * from TaxesPaymentList d union select 15,N'Maliyyə sanksiyası','3',getdate() )
 txl on txl.TaxesPaymentID=p.TaxesPaymentID where 1=1 " +
         tarix1 + tarix2 + vergiid + MunicipalId + ray + yvok + odenisnovu + @" and p.Operation=10  
        order by sn,Name,MunicipalName, tarix desc");

        GridView1.DataSource = dt;
        GridView1.DataBind();


    }
    protected void btnaxtar_Click(object sender, EventArgs e)
    {
        kk();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        kk();
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
}