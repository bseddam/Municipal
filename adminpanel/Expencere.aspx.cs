using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_Reports : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            iller();
            sahe();
            xerc();
            
           // vizual();
        }
     
    }
    void iller()
    {
        cmbhesabatili.Items.Clear();
        int k = 0;
        string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
        for (var i = int.Parse(vaxt); i >= 2014; i--)
        {
            cmbhesabatili.Items.Insert(k, new ListItem("" + i + ""));
            k++;
        }

        cmbhesabatayi1.Items.Clear();
        cmbhesabatayi1.Items.Insert(0, new ListItem("Ümumi", "-1"));
        for (var i = 1; i <= 12; i++)
        {
            cmbhesabatayi1.Items.Insert(i, new ListItem("" + i + "", "" + i + ""));
        }
        cmbhesabatayi1.SelectedIndex = 0;


        cmbhesabatayi2.Items.Clear();
        cmbhesabatayi2.Items.Insert(0, new ListItem("Ümumi", "-1"));
        for (var i = 1; i <= 12; i++)
        {
            cmbhesabatayi2.Items.Insert(i, new ListItem("" + i + "", "" + i + ""));
        }
        cmbhesabatayi2.SelectedIndex = 0;
    }
    void vizual()
    {
       
        lblrayon.Text = ddlrayon.SelectedItem.ToString();
        lblbeladi.Text = ddlbelediyye.SelectedItem.ToString();
       
        string bel;
        string ray;
        string sahe;
        string teyinati;
        string teyinati1;



        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "")
        {
            bel = "  ";
        }
        else
        {
            bel = " and lcm.MunicipalID='" + ddlbelediyye.SelectedValue + "' ";
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID='" + ddlrayon.SelectedValue + "' ";
        }

        if (cmbsahe.SelectedValue == "-1" || cmbsahe.SelectedValue == "" || cmbsahe.SelectedValue == null)
        {
            sahe = "  ";
        }
        else
        {
            sahe = " and p.ExpensesAreaID='" + cmbsahe.SelectedValue + "' ";
        }
        if (cmbxerc.SelectedValue == "-1" || cmbxerc.SelectedValue == "" || cmbxerc.SelectedValue == null)
        {
            teyinati = "  ";
            teyinati1 = "  ";
        }
        else
        {
            teyinati = " and p.ExpensesSubAreaID='" + cmbxerc.SelectedValue + "' ";
            teyinati1 = ",p.ExpensesSubAreaID ";
        }

        string hesabatayi1 = " "; string hesabatayi1x = "  ";
        if (cmbhesabatayi1.SelectedValue == "-1" || cmbhesabatayi1.SelectedValue == "" || cmbhesabatayi1.SelectedValue == null)
        {
            hesabatayi1 = "  ";
            hesabatayi1x = "  ";
        }
        else
        {
            hesabatayi1 = " and "+ cmbhesabatayi1.SelectedItem.ToString() + "<=month(p.NowTime) ";
            hesabatayi1x = " and " + cmbhesabatayi1.SelectedItem.ToString() + "<= p.ExpensesHalfYear ";
        }

        string hesabatayi2 = " "; string hesabatayi2x = " ";
        if (cmbhesabatayi2.SelectedValue == "-1" || cmbhesabatayi2.SelectedValue == "" || cmbhesabatayi2.SelectedValue == null)
        {
            hesabatayi2 = "  ";
        }
        else
        {
            hesabatayi2 = " and " + cmbhesabatayi2.SelectedItem.ToString() + ">=month(p.NowTime) ";
            hesabatayi2x = " and " + cmbhesabatayi2.SelectedItem.ToString() + ">= p.ExpensesHalfYear ";
        }

        umumigelir.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg     
    from Taxpayer tx inner join Payments p on tx.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm 
on tx.MunicipalID=lcm.MunicipalID  where  p.Operation=10  and "
            + cmbhesabatili.SelectedItem.ToString() + "=year(p.NowTime) " + hesabatayi1 + hesabatayi2 + bel + ray +
@" ) + (select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Dotation p 
inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where Dotationtype in (1,2,3) and 
year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1 + hesabatayi2 + bel + ray + 
@") +(select (select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + "-1>=year(p.NowTime)  " + bel + ray +
" )  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi  from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + "-1 " + bel + ray +
" )  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else " +
" SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc   from ExpensesProject p inner join List_classification_Municipal lcm " +
" on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  " + bel + ray  + "  and ExpensesType=1  )) as numeric(15,2)) ");


        gelir.Text = klas.getdatacell(@"select cast(Sum(p.Amount) as numeric(18,2)) mebleg      
   from Taxpayer tx inner join Payments p on tx.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm 
on tx.MunicipalID=lcm.MunicipalID  where  p.Operation=10  and "
            + cmbhesabatili.SelectedItem.ToString() + "=year(p.NowTime) "+ hesabatayi1 + hesabatayi2 + bel + ray);

        dotasiya.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1 + hesabatayi2 + bel + ray);

        iane.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1 + hesabatayi2 + bel + ray);
        
        lbldiger.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1 + hesabatayi2 + bel + ray);

        lblxerc.Text = klas.getdatacell(@"select cast(SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) as numeric(18,2)) cemi from ExpensesProject p 
inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where ExpensesType=1 and ExpensesYear="
+ cmbhesabatili.SelectedItem.ToString() + hesabatayi1x + hesabatayi2x + bel + ray + sahe + teyinati);

        lbllayihe.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) cemi from ExpensesProject p 
inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where ExpensesType=2 and ExpensesYear="
 + cmbhesabatili.SelectedItem.ToString() + hesabatayi1x + hesabatayi2x + bel + ray + sahe + teyinati);

     
        lblqaliq.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + "-1>=year(p.NowTime)  " + bel + ray +
" )  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<="+ cmbhesabatili.SelectedItem.ToString() + "-1 " + bel + ray +
" )  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else " +
" SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc  from ExpensesProject p inner join List_classification_Municipal lcm " +
" on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  " + bel + ray + " and ExpensesType=1 ) as numeric(18,2))");

        string vaxt = cmbhesabatili.SelectedItem.ToString();
        trx.Text = trx1.Text = trx2.Text = trx3.Text = trx4.Text = vaxt;

        //string buil = klas.getdatacell("select year(getdate()) il");
        //string kecenil = klas.getdatacell("select year(getdate())-1 il");
        //lbltrx29.Text = buil;
        //lbltrx.Text = buil;
        //lbltrx0.Text = buil;
        //lbltrx1.Text = buil;


        DataTable region2 = klas.getdatatable(@"select case when lr.CityID = 2 then lr.Name + ' ' + 'rayonu' 
when lr.CityID = 1 then lr.Name + ' ' + N'şəhəri' end as Name,lcm.MunicipalName,ExpensesID,Amount ayri,Convert(nvarchar(50),mebleg1) teyinat,
ep1.MunicipalID,ep1.MunicipalName,ep1.ExpensesYear,Convert(nvarchar(50),ep1.mebleg) sahe,ep1.ExpensesAreaID,ep1.ExpensesAreaName,
Convert(nvarchar(50), c.ExpensesSubAreaID) ExpensesSubAreaID,c.ExpensesSubAreaName,ad.NoteText,case when lcc.sort Is null then 100000 else lcc.sort  end  as sort1,
case when lcc1.sort Is null then 100000 else lcc1.sort  end  as sort2
 from (
select SUM(Amount+case when DFMF22 is null then 0 else DFMF22 end) mebleg,ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName " + teyinati1 + "  from ExpensesProject p " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1x + hesabatayi2x + bel + ray + sahe + teyinati +
"group by ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName " + teyinati1 + " ) as ep1 " +
"inner join (" +
"select SUM(Amount) mebleg1,ExpensesYear,p.ExpensesAreaID,p.MunicipalID,p.ExpensesSubAreaID," +
"p.ExpensesAreaName,p.ExpensesSubAreaName,lcm.MunicipalName from ExpensesProject p " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1x + hesabatayi2x + bel + ray + sahe + teyinati +
"group by ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName,p.ExpensesSubAreaID,p.ExpensesSubAreaName " +
") as c on c.MunicipalID=ep1.MunicipalID and c.ExpensesYear=ep1.ExpensesYear and c.ExpensesAreaID=ep1.ExpensesAreaID  " +
"and c.ExpensesAreaName=ep1.ExpensesAreaName " +
"inner join ( " +
"select ExpensesID,NoteText,ExpensesYear,p.ExpensesAreaID,p.MunicipalID,p.ExpensesSubAreaID,(Amount+case when DFMF22 is null then 0 else DFMF22 end) Amount, " +
"p.ExpensesAreaName,p.ExpensesSubAreaName,lcm.MunicipalName from ExpensesProject p  " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear=" + cmbhesabatili.SelectedItem.ToString() + hesabatayi1x + hesabatayi2x + bel + ray + sahe + teyinati +
") ad on ad.MunicipalID=c.MunicipalID and ad.ExpensesYear=c.ExpensesYear and  " +
"ad.ExpensesAreaID=c.ExpensesAreaID and c.ExpensesSubAreaID=ad.ExpensesSubAreaID and c.ExpensesAreaName=ad.ExpensesAreaName " +
"and c.ExpensesSubAreaName=ad.ExpensesSubAreaName " +
"left join List_classifications lcc on lcc.ClassifID=c.ExpensesAreaID " +
"left join List_classifications lcc1 on lcc1.ClassifID=c.ExpensesSubAreaID "+
"inner join List_classification_Municipal lcm on lcm.MunicipalID=ep1.MunicipalID " +
"inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID order by MunicipalID,sort1,sort2");



        Repeater1.DataSource = klas.tekrarlamaxerc("ExpensesAreaID", "ExpensesAreaName", "ExpensesSubAreaID", "ExpensesSubAreaName", "sahe","Sn", region2);
        Repeater1.DataBind();
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable(@"select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" 
            + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable(@"select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name 
from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void sahe()
    {

        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=8  order by sort");
        cmbsahe.DataTextField = "ClassifName";
        cmbsahe.DataValueField = "ClassifID";
        cmbsahe.DataSource = region2;
        cmbsahe.DataBind();
        cmbsahe.Items.Insert(0, new ListItem("Ümumi", "-1"));
        cmbsahe.SelectedIndex = 0;
    }
    void xerc()
    {

        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=" + klas.ConvertString(cmbsahe.SelectedItem.Value) + "  order by sort");
        cmbxerc.DataTextField = "ClassifName";
        cmbxerc.DataValueField = "ClassifID";
        cmbxerc.DataSource = region2;
        cmbxerc.DataBind();
        //if (region2.Rows.Count != 0)
            cmbxerc.Items.Insert(0, new ListItem("Ümumi", "-1"));
        //cmbxerc.SelectedIndex = 0;

    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }

    protected void btnhesab_Click(object sender, EventArgs e)
    {
        vizual();
    }

    protected void cmbsahe_SelectedIndexChanged1(object sender, EventArgs e)
    {
        xerc();
    }
           
}