using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_ExpencereForyear : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            sahe();
            xerc();
           
        }
    }
    void vizual()
    {
        lblrayon.Text = ddlrayon.SelectedItem.ToString();
        lblbeladi.Text = ddlbelediyye.SelectedItem.ToString();

        string bel;
        string ray;
        string sahe;
        string teyinati;


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
            sahe = " and epi.ExpensesAreaID='" + cmbsahe.SelectedValue + "' ";
        }
        if (cmbxerc.SelectedValue == "-1" || cmbxerc.SelectedValue == "" || cmbxerc.SelectedValue == null)
        {
            teyinati = "  ";
            //teyinati1 = "  ";
        }
        else
        {
            teyinati = " and epi.ExpensesSubAreaID='" + cmbxerc.SelectedValue + "' ";
            //teyinati1 = ",ep.ExpensesSubAreaID ";
        }

        gelir.Text = klas.getdatacell(@"select cast(Sum(lblumumigelir) as numeric(18,2)) mebleg from IncomeForYear inc 
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID  " + bel + ray);

        dotasiya.Text = klas.getdatacell(@"select cast(Sum(lbldotasiya) as numeric(18,2)) mebleg from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " + bel + ray);


        lblxerc.Text = klas.getdatacell(@"select cast(Sum(lblumumixerc) as numeric(18,2)) mebleg from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " + bel + ray);

        lblqaliq.Text = klas.getdatacell(@"select cast(Sum(lblqaliq) as numeric(18,2)) mebleg from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " + bel + ray);

        lblqaliq0.Text = klas.getdatacell(@"select cast(Sum(lblqaliq0) as numeric(18,2)) mebleg from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " + bel + ray);

        lbliane.Text = klas.getdatacell(@"select cast(Sum(lbliane) as numeric(18,2)) mebleg from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " + bel + ray);


//        string vaxt = klas.getdatacell(@"select year(getdate()) as vaxt");
//        trx.Text = vaxt;
//        trx1.Text = vaxt;
//        trx2.Text = vaxt;


        DataTable region2 = klas.getdatatable(@"select case when lr.CityID = 2 then lr.Name + ' ' + 'rayonu' 
when lr.CityID = 1 then lr.Name + ' ' + N'şəhəri' end as Name,lcm.MunicipalName,epi.ExpensesYear,
ExpensesAreaID,ExpensesAreaName,ExpensesSubAreaID,ExpensesSubAreaName,Convert(nvarchar(50),FundsAllocated) FundsAllocated,NoteText,epi.Amount,epi.MunicipalID 
from ExpensesFundsAllocated efa full outer join ExpensesProjectIllik epi on efa.SubID=epi.ExpensesSubAreaID and efa.reportyear=epi.ExpensesYear 
and epi.MunicipalID=efa.MunicipalID 
inner join List_classification_Municipal lcm on lcm.MunicipalID=epi.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 " + ray+ bel + sahe + teyinati + " order by MunicipalID,ExpensesAreaID,ExpensesSubAreaID");
        //        DataTable region2 = klas.getdatatable(@"select ExpensesID,Amount ayri,Convert(nvarchar(50),mebleg1) teyinat,
        //ep1.MunicipalID,ep1.MunicipalName,ep1.ExpensesYear,Convert(nvarchar(50),ep1.mebleg) sahe,ep1.ExpensesAreaID,ep1.ExpensesAreaName,
        //Convert(nvarchar(50), c.ExpensesSubAreaID) ExpensesSubAreaID,c.ExpensesSubAreaName,ad.NoteText,case when lcc.sort Is null then 100000 else lcc.sort  end  as sort1,
        //case when lcc1.sort Is null then 100000 else lcc1.sort  end  as sort2
        // from (
        //select SUM(Amount) mebleg,ExpensesYear,ep.MunicipalID,ep.ExpensesAreaID,ep.ExpensesAreaName,m.MunicipalName " + teyinati1 + "  from ExpensesProject ep " +
        //"inner join List_classification_Municipal m on ep.MunicipalID=m.MunicipalID where ExpensesType=1  and ExpensesYear=year(getdate())" + bel + sahe + teyinati +
        //"group by ExpensesYear,ep.MunicipalID,ep.ExpensesAreaID,ep.ExpensesAreaName,m.MunicipalName " + teyinati1 + " ) as ep1 " +
        //"inner join (" +
        //"select SUM(Amount) mebleg1,ExpensesYear,ep.ExpensesAreaID,ep.MunicipalID,ep.ExpensesSubAreaID," +
        //"ep.ExpensesAreaName,ep.ExpensesSubAreaName,m.MunicipalName from ExpensesProject ep " +
        //"inner join List_classification_Municipal m on ep.MunicipalID=m.MunicipalID where ExpensesType=1  and ExpensesYear=year(getdate()) " + bel + sahe + teyinati +
        //"group by ExpensesYear,ep.MunicipalID,ep.ExpensesAreaID,ep.ExpensesAreaName,m.MunicipalName,ep.ExpensesSubAreaID,ep.ExpensesSubAreaName " +
        //") as c on c.MunicipalID=ep1.MunicipalID and c.ExpensesYear=ep1.ExpensesYear and c.ExpensesAreaID=ep1.ExpensesAreaID  " +
        //"and c.ExpensesAreaName=ep1.ExpensesAreaName " +
        //"inner join ( " +
        //"select ExpensesID,NoteText,ExpensesYear,ep.ExpensesAreaID,ep.MunicipalID,ep.ExpensesSubAreaID,Amount, " +
        //"ep.ExpensesAreaName,ep.ExpensesSubAreaName,m.MunicipalName from ExpensesProject ep  " +
        //"inner join List_classification_Municipal m on ep.MunicipalID=m.MunicipalID where ExpensesType=1  and ExpensesYear=year(getdate()) " + bel + sahe + teyinati +
        //") ad on ad.MunicipalID=c.MunicipalID and ad.ExpensesYear=c.ExpensesYear and  " +
        //"ad.ExpensesAreaID=c.ExpensesAreaID and c.ExpensesSubAreaID=ad.ExpensesSubAreaID and c.ExpensesAreaName=ad.ExpensesAreaName " +
        //"and c.ExpensesSubAreaName=ad.ExpensesSubAreaName " +
        //"left join List_classifications lcc on lcc.ClassifID=c.ExpensesAreaID " +
        //"left join List_classifications lcc1 on lcc1.ClassifID=c.ExpensesSubAreaID order by MunicipalID,sort1,sort2");

        //Repeater1.DataSource = klas.tekrarlamaxerc("ExpensesAreaName", "FundsAllocated", "ExpensesSubAreaName", "Sn", region2);
        GridView1.DataSource =region2;
        GridView1.DataBind();
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
    void sahe()
    {

        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=300  order by sort");
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
    }

    protected void btnhesab_Click(object sender, EventArgs e)
    {
        vizual();
    }

    protected void cmbsahe_SelectedIndexChanged1(object sender, EventArgs e)
    {
        xerc();
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        vizual();
    }
}