using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MunicipalIncome : System.Web.UI.Page
{

    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iller1();

            iller();
            // kk();
        }
    }
    void iller1()
    {
        cmbhesabatili.Items.Clear();
        int k = 0;
        string vaxt = klas.getdatacell("select  year(getdate())  vaxt ");
        for (var i = int.Parse(vaxt); i >= 2014; i--)
        {
            cmbhesabatili.Items.Insert(k, new ListItem("" + i + ""));
            k++;
        }
    }
   
    void iller()
    {
        string buil = klas.getdatacell("select  " + cmbhesabatili.SelectedItem.ToString() + "  il");
        string kecenil = klas.getdatacell("select  " + cmbhesabatili.SelectedItem.ToString() + " -1 il");
        lbltrx30.Text = buil;
        lbltrx31.Text = kecenil;
        lbltrx29.Text = buil;
        lbltrx.Text = buil;
        lbltrx0.Text = buil;
        lbltrx1.Text = buil;
        lbltrx2.Text = kecenil;
        lbltrx3.Text = buil;
        lbltrx4.Text = buil;
        lbltrx5.Text = kecenil;
        lbltrx6.Text = buil;
        lbltrx7.Text = buil;
        lbltrx8.Text = buil;
        lbltrx9.Text = kecenil;
        lbltrx10.Text = buil;
        lbltrx11.Text = buil;
        lbltrx12.Text = kecenil;
        lbltrx13.Text = buil;
        lbltrx14.Text = buil;
        lbltrx15.Text = kecenil;
        lbltrx16.Text = buil;
        lbltrx17.Text = buil;
        lbltrx18.Text = kecenil;
        lbltrx19.Text = buil;
        lbltrx20.Text = buil;
        lbltrx21.Text = kecenil;
        lbltrx22.Text = buil;
        lbltrx23.Text = kecenil;
        lbltrx25.Text = buil;
        lbltrx26.Text = kecenil;
        lbltrx27.Text = buil;
        lbltrx28.Text = kecenil;

    }
    void kk()
    {
        if (Session["UserID"] != null)
        {
            string MunicipalId = ""; string MunicipalName = ""; string vergiid = ""; string tarix1 = ""; string tarix2 = "";
            DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
            if (Municipal != null)
            {
                MunicipalId = Municipal["MunicipalID"].ToString();
                MunicipalName = Municipal["MunicipalName"].ToString();
            }

            iller();

            string s = " and lcm.MunicipalID=" + MunicipalId;
            string ray = " ";


            lblbelsay.Text = klas.getdatacell(@"select COUNT(MunicipalID) from  List_classification_Municipal  lcm
where RegionID is not null and RegionID <>0" + ray + s);


            lblrayonsay.Text = klas.getdatacell(@"select  
count( distinct lr.RegionsID) from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + ray + s);

            lblfiziki.Text = klas.getdatacell(@"select  count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Individual_Legal=1  " + ray + s + "");


            lblhuquqi.Text = klas.getdatacell(@" select  count(*) sayhuquqi  from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Individual_Legal=2 " + ray + s + "");



            lblguzestli.Text = klas.getdatacell(@"select  Count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Concession=2  and t1.Individual_Legal=1  " + ray + s + "");

            lblguzestsiz.Text = klas.getdatacell(@"select  Count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Concession=1   " + ray + s + "");


            lblqeydealmiw.Text = klas.getdatacell(@" select  Count(*) cem from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + ray + s + "");




            lblfizemlak.Text = klas.getdatacell(@"select cast(SUM(GeneralArea) as numeric(18,2) ) from (
              select vlp.LivingAreaID,vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID from viewLivingProperty vlp
              union 
              select vqlp.LivingAreaID,vqlp.GeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID from  viewQLivingProperty vqlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);


            lblfizemlak0.Text = klas.getdatacell(@"select cast(SUM(GeneralArea) as numeric(18,2) ) from (
              select vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID from viewLivingProperty vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);


            lblfizemlak1.Text = klas.getdatacell(@"select cast(SUM(DiffGeneralArea) as numeric(18,2) ) from (
              select vlp.DiffGeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID from viewLivingProperty vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);

            lblfizemlak2.Text = klas.getdatacell(@"select cast(SUM(GeneralArea) as numeric(18,2) ) from (
              select vqlp.GeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID from  viewQLivingProperty vqlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);


            lblfizemlak3.Text = klas.getdatacell(@"select cast(SUM(GeneralArea) as numeric(18,2) ) from (
              select vqlp.GeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID from  viewQLivingProperty vqlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);



            //        lblfizemlak3.Text = klas.getdatacell(@"select cast(SUM(DiffGeneralArea) as numeric(18,2) ) from (
            //              select vqlp.DiffGeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID from  viewQLivingProperty vqlp
            //              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
            //                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
            //where (year(ExitDate)>= "+ cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "+ cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);



            lblfizemlak4.Text = klas.getdatacell(@"select count(GeneralArea)  from (
              select vlp.LivingAreaID,vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID from viewLivingProperty vlp
              union 
              select vqlp.LivingAreaID,vqlp.GeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID from  viewQLivingProperty vqlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);




            lblodeeml.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer t
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where  t.TaxpayerID in 
( select distinct TaxpayerID from (
select  TaxpayerID from viewQLivingProperty where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
     "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 union " +
    "select  TaxpayerID from viewLivingProperty where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
    "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() +
    "  and ForDelete=1  ) as kk  ) and ForDelete=1 " + ray + s);




            lblodeeml1.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer t
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where  t.TaxpayerID in 
( select distinct TaxpayerID from viewLivingProperty where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
    "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 ) and ForDelete=1 " + ray + s);

            lblodeeml2.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer t
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where  t.TaxpayerID in 
(select distinct TaxpayerID from viewQLivingProperty where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
    "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 ) and ForDelete=1 " + ray + s);



            lbltorpsayi.Text = klas.getdatacell(@"select cast(SUM(GeneralArea)/10000  as numeric(18,4) ) from (
              select vlp.LivingAreaID,vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID,vlp.TypeUseLand from ViewLivingLand vlp
              union 
              select vqlp.LivingAreaID,vqlp.GeneralArea,vqlp.RegistrDate,vqlp.ExitDate,vqlp.TaxpayerID,vqlp.TypeUseLand from  ViewQLivingLand vqlp
              union 
              select vvl.LivingAreaID,vvl.GeneralArea*10000,vvl.RegistrDate,vvl.ExitDate,vvl.TaxpayerID,vvl.TypeUseLand from  ViewVillageLand vvl 
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
    + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 and (emlak.TypeUseLand=1 or emlak.TypeUseLand=2)  " + ray + s);



            //        lbltorpsayi.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer t
            //inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where  t.TaxpayerID in
            //(select distinct TaxpayerID from ViewQLivingLand where (year(ExitDate)>= "+ cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and (YEAR(RegistrDate)<= "+ cmbhesabatili.SelectedItem.ToString() + " ) 
            //and TypeUseLand=1
            //union 
            //select distinct TaxpayerID from ViewLivingLand where (year(ExitDate)>= "+ cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "+ cmbhesabatili.SelectedItem.ToString() + " 
            //and TypeUseLand=1 )" + ray + s + "");



            lbltorpsahe.Text = klas.getdatacell(@"select cast(SUM(GeneralArea/10000) as numeric(18,4) ) from (
              select vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID,vlp.TypeUseLand from ViewLivingLand vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() +
                             "  and ForDelete=1 and (emlak.TypeUseLand=1 or emlak.TypeUseLand=2)" + ray + s);



            lblheyet.Text = klas.getdatacell(@"select cast(SUM(GeneralArea/10000) as numeric(18,4) ) from (
              select vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID,vlp.TypeUseLand from ViewLivingLand vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID  
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
    "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 and emlak.TypeUseLand=1" + ray + s);

            lblheyet1.Text = klas.getdatacell(@"select cast(SUM(GeneralArea/10000) as numeric(18,4) ) from (
              select vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID,vlp.TypeUseLand from ViewLivingLand vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID  
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() +
    "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 and emlak.TypeUseLand=2" + ray + s);


            lblheyet0.Text = klas.getdatacell(@"select cast(SUM(GeneralArea/10000) as numeric(18,4) ) from (
              select vlp.GeneralArea,vlp.RegistrDate,vlp.ExitDate,vlp.TaxpayerID from ViewLivingLand vlp
              ) as emlak inner join Taxpayer t on t.TaxpayerID=emlak.TaxpayerID 
                inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
                              + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1  " + ray + s);


            lblsahibkar.Text = klas.getdatacell(@"select cast(sum(GeneralArea/10000) as numeric(18,4) ) cem 
from ViewqLivingLand vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
                              + cmbhesabatili.SelectedItem.ToString() + " and ForDelete=1  and (vll.TypeUseLand=1 or vll.TypeUseLand=2) " + ray + s + "");

            lblsahibkar0.Text = klas.getdatacell(@"select cast(sum(GeneralArea/10000) as numeric(18,4) )  cem 
from ViewqLivingLand vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
                              + cmbhesabatili.SelectedItem.ToString() + " and ForDelete=1   and (vll.TypeUseLand=1 or vll.TypeUseLand=2) " + ray + s + "");

            //        lblkendt.Text = klas.getdatacell(@"select sum(GeneralArea) cem 
            //from ViewVillageLand vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
            //inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
            //where (year(ExitDate)>= "+ cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "+ cmbhesabatili.SelectedItem.ToString() + " " + ray + s + "");

            lblkendt.Text = klas.getdatacell(@"select cast(sum(GeneralArea) as numeric(18,4) ) cem 
from ViewVillageLand vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
    + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 and (vll.TypeUseLand=1 or vll.TypeUseLand=2)  " + ray + s);

            lblkendt0.Text = klas.getdatacell(@"select cast(sum(GeneralArea) as numeric(18,4) ) cem  
from ViewVillageLand vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= "
    + cmbhesabatili.SelectedItem.ToString() + "  and ForDelete=1 and (vll.TypeUseLand=1 or vll.TypeUseLand=2)  " + ray + s);

            lblcaritorp.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(vll.NowTime) and TaxesPaymentID=2 " + ray + s + "");
            lblotencaritorp.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2) ) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(vll.NowTime) and TaxesPaymentID=2 " + ray + s + "");



            lblodtorp.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer  where  TaxpayerID in (
select distinct t.TaxpayerID from viewQLivingLand  vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + "  " + ray + s +
          " union  select distinct t.TaxpayerID from viewLivingLand  vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID " +
          " inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID  " +
    " where (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) and YEAR(RegistrDate)<= " + cmbhesabatili.SelectedItem.ToString() + " " + ray + s + ")");

            lblcarieml.Text = klas.getdatacell(@"select cast( SUM(Amount) as numeric(18,2)) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(vll.NowTime) and TaxesPaymentID=1 " + ray + s + "");
            lbloteneml.Text = klas.getdatacell(@"select cast( SUM(Amount) as numeric(18,2)) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(vll.NowTime) and TaxesPaymentID=1 " + ray + s + "");

            lblmedsay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from MineTax mt inner join CalcMine cm on mt.MineId=cm.MineID
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + " )");
            lblmedsay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from MineTax mt inner join CalcMine cm on mt.MineId=cm.MineID inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID  where CalcYear= " + cmbhesabatili.SelectedItem.ToString() +
    "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + " )");

            lblmedkm.Text = klas.getdatacell(@"select  cast(sum(Productionsize) as numeric(18,2)) cem from MineTax mt inner join CalcMine cm on mt.MineId=cm.MineID 
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + "");
            lblmedkm0.Text = klas.getdatacell(@"select  cast(sum(Productionsize) as numeric(18,2)) cem from MineTax mt inner join CalcMine cm on mt.MineId=cm.MineID 
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + "");

            medmebl.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments vll 
inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(vll.NowTime) and TaxesPaymentID=7  " + ray + s + "");
            medmebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(vll.NowTime) and TaxesPaymentID=7  " + ray + s + "");


            menfsay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from ProfitsTax mt inner join CalcProfits cm on mt.IncomeTaxID=cm.ProfitsID 
 inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "   and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)  " + ray + s + ")");
            menfsay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from ProfitsTax mt inner join CalcProfits cm on mt.IncomeTaxID=cm.ProfitsID 
 inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "   and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)   " + ray + s + ")");

            menfmeb.Text = klas.getdatacell(@"select  cast(sum(cm.Amount) as numeric(18,2)) cem from ProfitsTax mt inner join CalcProfits cm on 
mt.IncomeTaxID=cm.ProfitsID  inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID  where CalcYear= " + cmbhesabatili.SelectedItem.ToString() +
    "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)  " + ray + s + "");
            menfdax.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=14 " + ray + s + "");
            menfdax0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=14 " + ray + s + "");


            reksay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (select distinct t.TaxpayerID from Advertisement mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractDocDate2)>= " + cmbhesabatili.SelectedItem.ToString() + "   and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)  " + ray + s + ")");

            reksay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (select distinct t.TaxpayerID from Advertisement mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractDocDate2)>= " + cmbhesabatili.SelectedItem.ToString() + "  and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + ")");

            rekolcusu.Text = klas.getdatacell(@"select cast(SUM(AdvertisemenSize) as numeric(18,2)) cem from Advertisement mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractDocDate2)>= " + cmbhesabatili.SelectedItem.ToString() + "   and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + "");

            rekolcusu0.Text = klas.getdatacell(@"select cast(SUM(AdvertisemenSize) as numeric(18,2)) cem from Advertisement mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractDocDate2)>= " + cmbhesabatili.SelectedItem.ToString() + "   and  (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + "");


            rekmebleg.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=9 " + ray + s + "");
            rekmebleg0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=9 " + ray + s + "");

            hotelsay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from Hotel mt inner join CalcHotel cm on mt.HotelID=cm.HotelID
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + ")");
            hotelsay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from Hotel mt inner join CalcHotel cm on mt.HotelID=cm.HotelID
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + ")");
            hoteladam.Text = klas.getdatacell(@"select  cast(sum(PersonCount) as numeric(18,2)) cem from Hotel mt 
inner join CalcHotel cm on mt.HotelID=cm.HotelID  inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where CalcYear= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + "");
            hotelmebl.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=11 " + ray + s + "");
            hotelmebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=11 " + ray + s + "");


            avtsay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer  where  TaxpayerID in (
select distinct t.TaxpayerID from CarStop mt inner join CalcCarStop cm on mt.CarID=cm.CarStopID
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where YEAR(Periodend)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + ")");
            avtsay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer  where  TaxpayerID in (
select distinct t.TaxpayerID from CarStop mt inner join CalcCarStop cm on mt.CarID=cm.CarStopID
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where YEAR(Periodend)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null) " + ray + s + ")");
            avttutum.Text = klas.getdatacell(@"select cast(SUM(mt.CarCount) as numeric(18,2)) cem from CarStop mt 
inner join CalcCarStop cm on mt.CarID=cm.CarStopID 
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where YEAR(Periodend)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + "");
            avtpark.Text = klas.getdatacell(@"select cast(SUM(cm.CarCount) as numeric(18,2)) cem from CarStop mt 
inner join CalcCarStop cm on mt.CarID=cm.CarStopID 
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where YEAR(Periodend)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + "");
            avtmebleg.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=10" + ray + s + "");
            avtmebleg0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=10" + ray + s + "");

            sexssay.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from TradeService mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractEndDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + " )");
            sexssay0.Text = klas.getdatacell(@"select COUNT(TaxpayerID) cem from Taxpayer where  TaxpayerID in (
select distinct t.TaxpayerID from TradeService mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
where year(ContractEndDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  and (year(ExitDate)>= " + cmbhesabatili.SelectedItem.ToString() + "  or ExitDate is null)" + ray + s + " )");
            sexsmebl.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=12 " + ray + s + "");
            sexsmebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=12 " + ray + s + "");

            mulkmebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=13 " + ray + s + "");
            mulkmebl1.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=13 " + ray + s + "");


            icaremebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " -1=YEAR(mt.NowTime) and TaxesPaymentID=8 " + ray + s + "");

            icaremebl1.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=8 " + ray + s + "");

            sankmebl0.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + "-1 =YEAR(mt.NowTime) and TaxesPaymentID=15 " + ray + s + "");

            sankmebl.Text = klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and  " + cmbhesabatili.SelectedItem.ToString() + " =YEAR(mt.NowTime) and TaxesPaymentID=15 " + ray + s + "");

        }

    }


    protected void btnhesab_Click(object sender, EventArgs e)
    {
        kk();
    }
}