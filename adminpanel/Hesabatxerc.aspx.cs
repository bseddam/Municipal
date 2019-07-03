using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_Hesabatxerc : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iller();
            select1();
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
    protected void select1()
    {

        string hesabatayi1 = " ", hesabatayi2 = "  ", hesabatayix1 = " ", hesabatayix2 = " ", hesabatayiq1 = " ", hesabatayiq2 = " ";
        if (cmbhesabatayi1.SelectedValue == "-1" || cmbhesabatayi1.SelectedValue == "" || cmbhesabatayi1.SelectedValue == null)
        {
            hesabatayi1 = "  ";
            hesabatayix1 = "  ";
        }
        else
        {
            hesabatayi1 = " and " + cmbhesabatayi1.SelectedItem.ToString() + "<= epi.ExpensesHalfYear ";
            hesabatayix1 = " and " + cmbhesabatayi1.SelectedItem.ToString() + "<= month(p.NowTime) ";
            hesabatayiq1 = " and " + cmbhesabatayi1.SelectedItem.ToString() + "<= month(DotationGiveDate) ";
        }

        if (cmbhesabatayi2.SelectedValue == "-1" || cmbhesabatayi2.SelectedValue == "" || cmbhesabatayi2.SelectedValue == null)
        {
            hesabatayi2 = "  ";
            hesabatayix2 = "  ";
        }
        else
        {
            hesabatayi2 = " and " + cmbhesabatayi2.SelectedItem.ToString() + ">= epi.ExpensesHalfYear ";
            hesabatayix2 = " and " + cmbhesabatayi2.SelectedItem.ToString() + ">= month(p.NowTime) ";
            hesabatayiq2 = " and " + cmbhesabatayi2.SelectedItem.ToString() + ">= month(DotationGiveDate) ";
        }




        string dc = klas.getdatacell(@"select dbo.ayuzre1('" + cmbhesabatili.SelectedValue + "','" + hesabatayi1 + "','"
            + hesabatayi2 + "','" + hesabatayix1 + "','" + hesabatayix2 + "','" + hesabatayiq1 + "','" + hesabatayiq2 + 
            "')");
        string dc1 = klas.getdatacell(@"select dbo.ayuzre2('" + cmbhesabatili.SelectedValue + "','" + hesabatayi1 + "','"
    + hesabatayi2 + "','" + hesabatayix1 + "','" + hesabatayix2 + "','" + hesabatayiq1 + "','" + hesabatayiq2 +
    "')");

        string dc2 = dc + dc1;


//        string dcx = klas.getdatacell(@"select t1.* from 
//(
//select ' ' name,sum(yerliozunuidetme) yerliozunuidetme,sum(tehsilsahesi) tehsilsahesi,sum(sehiyye) sehiyye,
//sum(medeniyyet) medeniyyet,sum(idman) idman,sum(avtomobil) avtomobil,sum(menzilkomunal) menzilkomunal,
//sum(suteserrufati) suteserrufati,sum(iqtisadisahe) iqtisadisahe,sum(yerliekoloji) yerliekoloji,
//sum(yerlisosialmud) yerlisosialmud,sum(digerxerc) digerxerc,sum(qaliq) qaliq,sum(cemi) cemi,sum(gelir) gelir,
//sum(dotasiya) dotasiya,sum(iane) iane,sum(umumixerc) umumixerc,' ' RegionID from 
//(" + dc2 + ") as kk union " + dc2 + ") t1 order by name");

//        DataTable dt = klas.getdatatable(@"select t1.* from 
//(
//select ' ' name,sum(yerliozunuidetme) yerliozunuidetme,sum(tehsilsahesi) tehsilsahesi,sum(sehiyye) sehiyye,
//sum(medeniyyet) medeniyyet,sum(idman) idman,sum(avtomobil) avtomobil,sum(menzilkomunal) menzilkomunal,
//sum(suteserrufati) suteserrufati,sum(iqtisadisahe) iqtisadisahe,sum(yerliekoloji) yerliekoloji,
//sum(yerlisosialmud) yerlisosialmud,sum(digerxerc) digerxerc,sum(qaliq) qaliq,sum(cemi) cemi,sum(gelir) gelir,
//sum(dotasiya) dotasiya,sum(iane) iane,sum(digergelir) digergelir,sum(umumixerc) umumixerc,' ' RegionID from 
//(" + dc2 + ") as kk union " + dc2 + ") t1 order by name");


        DataTable dt = klas.getdatatable(@"select t1.* from 
(
select ' ' name,cast(sum(yerliozunuidetme) as numeric(15,2)) yerliozunuidetme,
cast(sum(tehsilsahesi) as numeric(15,2)) tehsilsahesi,
cast(sum(sehiyye) as numeric(15,2)) sehiyye,
cast(sum(medeniyyet) as numeric(15,2)) medeniyyet,
cast(sum(idman) as numeric(15,2)) idman,
cast(sum(avtomobil) as numeric(15,2)) avtomobil,
cast(sum(menzilkomunal)  as numeric(15,2)) menzilkomunal,
cast(sum(suteserrufati)  as numeric(15,2)) suteserrufati,
cast(sum(iqtisadisahe) as numeric(15,2)) iqtisadisahe,
cast(sum(yerliekoloji) as numeric(15,2)) yerliekoloji,
cast(sum(yerlisosialmud) as numeric(15,2)) yerlisosialmud,
cast(sum(digerxerc)  as numeric(15,2)) digerxerc,
cast(sum(qaliq)  as numeric(15,2)) qaliq,
cast(sum(cemi) as numeric(15,2)) cemi,
cast(sum(gelir) as numeric(15,2)) gelir,
cast(sum(dotasiya) as numeric(15,2)) dotasiya,
cast(sum(iane) as numeric(15,2)) iane,
cast(sum(digergelir) as numeric(15,2)) digergelir,
cast(sum(umumixerc) as numeric(15,2)) umumixerc,' ' RegionID from 
(





select lcm1.name,cast((select sum(Amount+case when DFMF22 is null then 0 else dfmf22 end) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where epi.ExpensesAreaID=49 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerliozunuidetme,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=50 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) tehsilsahesi,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=51 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) sehiyye,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=52 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) medeniyyet,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=53 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) idman,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=54 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) avtomobil,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=55 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) menzilkomunal,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=56 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) suteserrufati,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=57 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) iqtisadisahe,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=58 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerliekoloji,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=59 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerlisosialmud,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID in(210,211,0) and ExpensesType=1 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) digerxerc,
cast((select (select case when sum(p.Amount) is null then 0 else sum(p.Amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
where p.Operation=10 and year(p.NowTime)<=" + cmbhesabatili.SelectedValue + @" -1 and lcm.RegionID=lcm1.RegionsID)
 + (select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID)
- (select case when SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) end xerc from ExpensesProject epi inner join List_classification_Municipal lcm 
on epi.MunicipalID=lcm.MunicipalID where ExpensesYear<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID and ExpensesType=1)) as numeric(15,2)) qaliq,


cast( (select (select case when SUM(amount) is null then 0 else SUM(amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
where p.Operation=10  and year(p.NowTime)=" + cmbhesabatili.SelectedValue + " " + @hesabatayix1 + " " + @hesabatayix2 + @" and lcm.RegionID=lcm1.RegionsID) +
(select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID))
+ (select (select case when sum(p.Amount) is null then 0 else sum(p.Amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
 where p.Operation=10  and year(p.NowTime)<=" + cmbhesabatili.SelectedValue + @" -1 and lcm.RegionID=lcm1.RegionsID)+ 
 (select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID)
 - (select case when SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) end xerc from ExpensesProject epi inner join List_classification_Municipal lcm 
 on epi.MunicipalID=lcm.MunicipalID where ExpensesYear<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID and ExpensesType=1)) as numeric(15,2))  cemi,



cast( (select sum(p.Amount) mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID
 where p.Operation=10 and year(p.NowTime)=" + cmbhesabatili.SelectedValue + " " + @hesabatayix1 + " " + @hesabatayix2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) gelir,



cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) dotasiya,
cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) iane,
cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) digergelir,
cast( (select sum(amount+case when DFMF22 is null then 0 else dfmf22 end) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where ExpensesType=1 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) umumixerc,
lcm1.RegionsID RegionID from List_classification_Regions lcm1 where lcm1.ForDelete=1
group by lcm1.RegionsID,lcm1.Name











) as kk union 









select lcm1.name,cast((select sum(Amount+case when DFMF22 is null then 0 else dfmf22 end) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where epi.ExpensesAreaID=49  and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerliozunuidetme,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=50 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) tehsilsahesi,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=51 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) sehiyye,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=52 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) medeniyyet,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=53 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) idman,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=54 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) avtomobil,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=55 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) menzilkomunal,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=56 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) suteserrufati,
 cast(( select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=57 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) iqtisadisahe,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=58 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerliekoloji,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=59 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) yerlisosialmud,
 cast((select sum(Amount) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID in(210,211,0) and ExpensesType=1 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) digerxerc,
cast((select (select case when sum(p.Amount) is null then 0 else sum(p.Amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
where p.Operation=10  and year(p.NowTime)<=" + cmbhesabatili.SelectedValue + @" -1 and lcm.RegionID=lcm1.RegionsID)
 + (select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID)
- (select case when SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) end xerc from ExpensesProject epi inner join List_classification_Municipal lcm 
on epi.MunicipalID=lcm.MunicipalID where ExpensesYear<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID and ExpensesType=1)) as numeric(15,2)) qaliq,
cast( (select (select case when SUM(amount) is null then 0 else SUM(amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
where p.Operation=10  and year(p.NowTime)=" + cmbhesabatili.SelectedValue + " " + @hesabatayix1 + " " + @hesabatayix2 + @" and lcm.RegionID=lcm1.RegionsID) +
(select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID))
+ (select (select case when sum(p.Amount) is null then 0 else sum(p.Amount) end mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID 
 where p.Operation=10 and year(p.NowTime)<=" + cmbhesabatili.SelectedValue + @" -1 and lcm.RegionID=lcm1.RegionsID)+ 
 (select case when SUM(amount) is null then 0 else SUM(amount) end cemi from Dotation m inner join List_classification_Municipal lcm 
on m.MunicipalID=lcm.MunicipalID where year(DotationGiveDate)<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID)
 - (select case when SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) end xerc from ExpensesProject epi inner join List_classification_Municipal lcm 
 on epi.MunicipalID=lcm.MunicipalID where ExpensesYear<=" + cmbhesabatili.SelectedValue + @" -1  and lcm.RegionID=lcm1.RegionsID and ExpensesType=1)) as numeric(15,2))  cemi,

cast( (select sum(p.Amount) mebleg  from Payments p inner join Taxpayer tx on tx.TaxpayerID=p.TaxpayerID 
 inner join List_classification_Municipal lcm on tx.MunicipalID=lcm.MunicipalID
 where p.Operation=10 and year(p.NowTime)=" + cmbhesabatili.SelectedValue + " " + @hesabatayix1 + " " + @hesabatayix2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) gelir,
cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) dotasiya,
cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) iane,
cast( (select sum(amount) from Dotation p inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + cmbhesabatili.SelectedValue + " " + @hesabatayiq1 + " " + @hesabatayiq2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) digergelir,
cast( (select sum(amount+case when DFMF22 is null then 0 else dfmf22 end) mebleg from ExpensesProject epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where ExpensesType=1 and epi.ExpensesYear=" + cmbhesabatili.SelectedValue + " " + @hesabatayi1 + " " + @hesabatayi2 + @" and lcm.RegionID=lcm1.RegionsID) as numeric(15,2)) umumixerc,
lcm1.RegionsID RegionID from List_classification_Regions lcm1 where lcm1.ForDelete=1
group by lcm1.RegionsID,lcm1.Name






) t1 order by name");


        GridView1.DataSource = dt;
        GridView1.DataBind();
        if (GridView1.Rows.Count > 0)
        {
            GridView1.HeaderRow.Cells[3].Text = cmbhesabatili.SelectedItem.ToString() + "-cı ilə qalıq";
            GridView1.HeaderRow.Cells[4].Text = cmbhesabatili.SelectedItem.ToString() + "-cı ildə vergi və ödənişlərdən daxil olma";
            GridView1.HeaderRow.Cells[8].Text = cmbhesabatili.SelectedItem.ToString() + "-cı ildə bələdiyyələrin ümumi xərci";
            
       
        }
    }



    protected void btnhesab_Click(object sender, EventArgs e)
    {

        select1();
       
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        select1();
    }
}