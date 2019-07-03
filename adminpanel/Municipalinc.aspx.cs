using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_Municipalinc : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
        }
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
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }

    protected void btnhesab_Click(object sender, EventArgs e)
    {
        kk();
    }
    void kk()
    {
        string munid = " "; string ray = " 0";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            munid = " ";
        }
        else
        {
            munid = " and lcm.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }

        lblbelsay.Text = klas.getdatacell(@"select COUNT(lcm.MunicipalID) from IncomeForYear t1  
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where lcm.RegionID is not null and lcm.RegionID <>0" + ray + munid);


        lblrayonsay.Text = klas.getdatacell(@"select  
count( distinct lr.RegionsID) from IncomeForYear t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1  " + ray + munid);


        DataRow drxerc = klas.GetDataRow(@"select       sum(IncomeID) IncomeID,
      sum(lblfiziki) lblfiziki,
      sum(lblguzestli) lblguzestli,
      sum(lblguzestsiz) lblguzestsiz,
      sum(lblhuquqi) lblhuquqi,
      sum(lblqeydealmiw) lblqeydealmiw,
      sum(lblfizemlak) lblfizemlak,
      sum(lblfizemlak4) lblfizemlak4,
      sum(lblfizemlak0) lblfizemlak0,
      sum(lblfizemlak1) lblfizemlak1,
      sum(lblfizemlak2) lblfizemlak2,
      sum(lblfizemlak3) lblfizemlak3,
      sum(lblodeeml) lblodeeml,
      sum(lblodeeml1) lblodeeml1,
      sum(lblodeeml2) lblodeeml2,
      sum(lblcarieml) lblcarieml,
      sum(lbloteneml) lbloteneml,
      sum(lbltorpsayi) lbltorpsayi,
      sum(lbltorpsahe) lbltorpsahe,
      sum(lblheyet) lblheyet,
      sum(lblheyet1) lblheyet1,
      sum(lblheyet0) lblheyet0,
      sum(lblsahibkar) lblsahibkar,
      sum(lblsahibkar0) lblsahibkar0,
      sum(lblkendt) lblkendt,
      sum(lblkendt0) lblkendt0,
      sum(lblodtorp) lblodtorp,
      sum(lblcaritorp) lblcaritorp,
      sum(lblotencaritorp) lblotencaritorp,
      sum(lblmedsay) lblmedsay,
      sum(lblmedsay0) lblmedsay0,
      sum(lblmedkm) lblmedkm,
      sum(lblmedkm0) lblmedkm0,
      sum(medmebl) medmebl,
      sum(medmebl0) medmebl0,
      sum(menfsay) menfsay,
      sum(menfsay0) menfsay0,
      sum(menfmeb) menfmeb,
      sum(menfdax) menfdax,
      sum(menfdax0) menfdax0,
      sum(reksay) reksay,
      sum(rekolcusu) rekolcusu,
      sum(reksay0) reksay0,
      sum(rekolcusu0) rekolcusu0,
      sum(rekmebleg) rekmebleg,
      sum(rekmebleg0) rekmebleg0,
      sum(hotelsay) hotelsay,
      sum(hotelsay0) hotelsay0,
      sum(hoteladam) hoteladam,
      sum(hoteladam0) hoteladam0,
      sum(hotelmebl) hotelmebl,
      sum(hotelmebl0) hotelmebl0,
      sum(avtsay) avtsay,
      sum(avtsay0) avtsay0,
      sum(avttutum) avttutum,
      sum(avtpark) avtpark,
      sum(avtmebleg) avtmebleg,
      sum(avtmebleg0) avtmebleg0,
      sum(sexssay) sexssay,
      sum(sexssay0) sexssay0,
      sum(sexsmebl) sexsmebl,
      sum(sexsmebl0) sexsmebl0,
      sum(mulkmebl1) mulkmebl1,
      sum(mulkmebl0) mulkmebl0,
      sum(icaremebl1) icaremebl1,
      sum(icaremebl0) icaremebl0
 from IncomeForYear  t1 inner join List_classification_Municipal lcm 
on t1.MunicipalID=lcm.MunicipalID  where 1=1 " + ray + munid);
        if (drxerc != null)
        {
            lblfiziki.Text = drxerc["lblfiziki"].ToString();
            lblguzestli.Text = drxerc["lblguzestli"].ToString();
            lblguzestsiz.Text = drxerc["lblguzestsiz"].ToString();
            lblhuquqi.Text = drxerc["lblhuquqi"].ToString();
            lblqeydealmiw.Text = drxerc["lblqeydealmiw"].ToString();
            lblfizemlak.Text = drxerc["lblfizemlak"].ToString();
            lblfizemlak4.Text = drxerc["lblfizemlak4"].ToString();
            lblfizemlak0.Text = drxerc["lblfizemlak0"].ToString();
            lblfizemlak1.Text = drxerc["lblfizemlak1"].ToString();
            lblfizemlak2.Text = drxerc["lblfizemlak2"].ToString();
            lblfizemlak3.Text = drxerc["lblfizemlak3"].ToString();
            lblodeeml.Text = drxerc["lblodeeml"].ToString();
            lblodeeml1.Text = drxerc["lblodeeml1"].ToString();
            lblodeeml2.Text = drxerc["lblodeeml2"].ToString();
            lblcarieml.Text = drxerc["lblcarieml"].ToString();
            lbloteneml.Text = drxerc["lbloteneml"].ToString();
            lbltorpsayi.Text = drxerc["lbltorpsayi"].ToString();
            lbltorpsahe.Text = drxerc["lbltorpsahe"].ToString();
            lblheyet.Text = drxerc["lblheyet"].ToString();
            lblheyet1.Text = drxerc["lblheyet1"].ToString();
            lblheyet0.Text = drxerc["lblheyet0"].ToString();
            lblsahibkar.Text = drxerc["lblsahibkar"].ToString();
            lblsahibkar0.Text = drxerc["lblsahibkar0"].ToString();
            lblkendt.Text = drxerc["lblkendt"].ToString();
            lblkendt0.Text = drxerc["lblkendt0"].ToString();
            lblodtorp.Text = drxerc["lblodtorp"].ToString();
            lblcaritorp.Text = drxerc["lblcaritorp"].ToString();
            lblotencaritorp.Text = drxerc["lblotencaritorp"].ToString();
            lblmedsay.Text = drxerc["lblmedsay"].ToString();
            lblmedsay0.Text = drxerc["lblmedsay0"].ToString();
            lblmedkm.Text = drxerc["lblmedkm"].ToString();
            lblmedkm0.Text = drxerc["lblmedkm0"].ToString();
            medmebl.Text = drxerc["medmebl"].ToString();
            medmebl0.Text = drxerc["medmebl0"].ToString();
            menfsay.Text = drxerc["menfsay"].ToString();
            menfsay0.Text = drxerc["menfsay0"].ToString();
            menfmeb.Text = drxerc["menfmeb"].ToString();
            menfdax.Text = drxerc["menfdax"].ToString();
            menfdax0.Text = drxerc["menfdax0"].ToString();
            reksay.Text = drxerc["reksay"].ToString();
            rekolcusu.Text = drxerc["rekolcusu"].ToString();
            reksay0.Text = drxerc["reksay0"].ToString();
            rekolcusu0.Text = drxerc["rekolcusu0"].ToString();
            rekmebleg.Text = drxerc["rekmebleg"].ToString();
            rekmebleg0.Text = drxerc["rekmebleg0"].ToString();
            hotelsay.Text = drxerc["hotelsay"].ToString();
            hotelsay0.Text = drxerc["hotelsay0"].ToString();
            hoteladam.Text = drxerc["hoteladam"].ToString();
            hoteladam0.Text = drxerc["hoteladam0"].ToString();
            hotelmebl.Text = drxerc["hotelmebl"].ToString();
            hotelmebl0.Text = drxerc["hotelmebl0"].ToString();
            avtsay.Text = drxerc["avtsay"].ToString();
            avtsay0.Text = drxerc["avtsay0"].ToString();
            avttutum.Text = drxerc["avttutum"].ToString();
            avtpark.Text = drxerc["avtpark"].ToString();
            avtmebleg.Text = drxerc["avtmebleg"].ToString();
            avtmebleg0.Text = drxerc["avtmebleg0"].ToString();
            sexssay.Text = drxerc["sexssay"].ToString();
            sexssay0.Text = drxerc["sexssay0"].ToString();
            sexsmebl.Text = drxerc["sexsmebl"].ToString();
            sexsmebl0.Text = drxerc["sexsmebl0"].ToString();
            mulkmebl1.Text = drxerc["mulkmebl1"].ToString();
            mulkmebl0.Text = drxerc["mulkmebl0"].ToString();
            icaremebl1.Text = drxerc["icaremebl1"].ToString();
            icaremebl0.Text = drxerc["icaremebl0"].ToString();
        }
    }
}