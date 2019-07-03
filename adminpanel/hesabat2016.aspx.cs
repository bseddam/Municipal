using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_hesabat2016 : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            select1();
        }
    }
 
    protected void select1()
    {

        DataTable dt = klas.getdatatable(@"select ROW_NUMBER() over (order by lcr.Name)-1 sn1,lcr.Name,t1.* from 
(
select cast((Sum(case when lblumumigelir is null then 0 else lblumumigelir end)+
Sum(case when lbldotasiya is null then 0 else lbldotasiya end )+
Sum(case when lbliane is null then 0 else lbliane end)+
Sum(case when lblqaliq0 is null then 0 else lblqaliq0 end)) as numeric(18,2)) cemi,
cast(Sum(lblqaliq0) as numeric(18,2)) qaliqoten,
cast(Sum(lblumumigelir) as numeric(18,2)) gelir,
cast(Sum(lbldotasiya) as numeric(18,2)) dotasiya,
cast(Sum(lbliane) as numeric(18,2)) iane,
cast(Sum(lblumumixerc) as numeric(18,2)) umumixerc,
cast(Sum(lblqaliq) as numeric(18,2)) qaliq,
(select SUM(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where epi.ExpensesSubAreaID=270 and epi.ExpensesAreaID=246 and epi.ExpensesYear=2016) yerliozunuidetme,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=247 and epi.ExpensesYear=2016) tehsilsahesi,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=248 and epi.ExpensesYear=2016) sehiyye,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=249 and epi.ExpensesYear=2016) medeniyyet,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=250 and epi.ExpensesYear=2016) idman,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=251 and epi.ExpensesYear=2016) avtomobil,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=252 and epi.ExpensesYear=2016) menzilkomunal,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=253 and epi.ExpensesYear=2016) suteserrufati,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=254 and epi.ExpensesYear=2016) iqtisadisahe,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=255 and epi.ExpensesYear=2016) yerliekoloji,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=256 and epi.ExpensesYear=2016) yerlisosialmud,
  ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=317 and epi.ExpensesYear=2016) digerxerc,0 RegionID from IncomeForYear inc 
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID

union 

select cast((Sum(case when lblumumigelir is null then 0 else lblumumigelir end)+
Sum(case when lbldotasiya is null then 0 else lbldotasiya end )+
Sum(case when lbliane is null then 0 else lbliane end)+
Sum(case when lblqaliq0 is null then 0 else lblqaliq0 end)) as numeric(18,2)) cemi,
cast(Sum(lblqaliq0) as numeric(18,2)) qaliqoten,
cast(Sum(lblumumigelir) as numeric(18,2)) gelir,
cast(Sum(lbldotasiya) as numeric(18,2)) dotasiya,
cast(Sum(lbliane) as numeric(18,2)) iane,
cast(Sum(lblumumixerc) as numeric(18,2)) umumixerc,
cast(Sum(lblqaliq) as numeric(18,2)) qaliq,

(select SUM(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
 where epi.ExpensesSubAreaID=270 and epi.ExpensesAreaID=246 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) yerliozunuidetme,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=247 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) tehsilsahesi,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=248 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) sehiyye,
 (select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=249 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) medeniyyet,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=250 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) idman,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=251 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) avtomobil,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=252 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) menzilkomunal,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=253 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) suteserrufati,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=254 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) iqtisadisahe,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=255 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) yerliekoloji,
 ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=256 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) yerlisosialmud,
  ( select sum(Amount) mebleg from ExpensesProjectIllik epi
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID 
 where epi.ExpensesAreaID=317 and epi.ExpensesYear=2016 and lcm.RegionID=lcm1.RegionID) digerxerc,
 
 lcm1.RegionID from IncomeForYear inc 
inner join List_classification_Municipal lcm1 on lcm1.MunicipalID=inc.MunicipalID
group by lcm1.RegionID) t1
left join List_classification_Regions lcr on t1.RegionID=lcr.RegionsID");

        GridView1.DataSource = dt;
        GridView1.DataBind();
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