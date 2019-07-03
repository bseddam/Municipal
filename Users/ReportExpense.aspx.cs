using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_ReportExpense : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iller();
            vizual();
            sahe();
            xerc();

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
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
    }
    void vizual()
    {
        string MunicipalId = "";
        string MunicipalName = "";
        string Regionname = "";
        if (Session["UserID"] != null)
        {
            DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,CASE WHEN lr.CityID = 2 THEN lr.Name + ' ' + 'rayonu' WHEN lr.CityID = 1 
THEN lr.Name + ' ' + N'şəhəri' END Name from Users u inner join List_classification_Municipal lm
on u.MunicipalID=lm.MunicipalID inner join List_classification_Regions lr on lm.RegionID=lr.RegionsID Where  u.UserID=" + Session["UserID"].ToString());
            if (Municipal != null)
            {
                MunicipalId = Municipal["MunicipalID"].ToString();
                MunicipalName = Municipal["MunicipalName"].ToString();
                Regionname = Municipal["Name"].ToString();
            }
        }
        else {
            Response.Redirect("~/Default.aspx");
        }

        lblbeladi.Text = MunicipalName;
        lblrayon.Text = Regionname;

        string bel;
        string sahe;
        string teyinati;
        string teyinati1;

        bel = " and lcm.MunicipalID='" + MunicipalId + "' ";
        
     

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




        umumigelir.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg     
   from Taxpayer tx inner join Payments p on tx.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm 
on tx.MunicipalID=lcm.MunicipalID  where  p.Operation=10 and tx.ForDelete=1 and "
+ cmbhesabatili.SelectedItem.ToString() + "=year(p.NowTime)" + bel + 
@" ) + (select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Dotation p 
inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where Dotationtype in (1,2,3) and 
year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString() + bel + @") +(select (select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
m.ForDelete=1 and " + cmbhesabatili.SelectedItem.ToString() + "-1>=year(p.NowTime)  " + bel +
" )  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi  from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + "-1 " + bel +
" )  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else " +
" SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc   from ExpensesProject p inner join List_classification_Municipal lcm " +
" on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  " + bel  + "  and ExpensesType=1  )) as numeric(15,2)) ");

        gelir.Text = klas.getdatacell(@"select cast(Sum(p.Amount) as numeric(18,2)) mebleg      
   from Taxpayer tx inner join Payments p on tx.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm 
on tx.MunicipalID=lcm.MunicipalID  where  p.Operation=10 and tx.ForDelete=1 and "
      + cmbhesabatili.SelectedItem.ToString() + "=year(p.NowTime) " +  bel );

        dotasiya.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString()   + bel );

        iane.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString()   + bel );

        lbldiger.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + cmbhesabatili.SelectedItem.ToString()   + bel );

        lblxerc.Text = klas.getdatacell(@"select cast(SUM(amount+case when DFMF22 is null then 0 else dfmf22 end) as numeric(18,2)) cemi from ExpensesProject p 
inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where ExpensesType=1 and ExpensesYear="
+ cmbhesabatili.SelectedItem.ToString()   + bel  + sahe + teyinati);

        lbllayihe.Text = klas.getdatacell(@"select cast(SUM(amount) as numeric(18,2)) cemi from ExpensesProject p 
inner join List_classification_Municipal lcm
on p.MunicipalID=lcm.MunicipalID where ExpensesType=2 and ExpensesYear="
 + cmbhesabatili.SelectedItem.ToString()   + bel  + sahe + teyinati);



        lblqaliq.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
m.ForDelete=1 and " + cmbhesabatili.SelectedItem.ToString() + "-1>=year(p.NowTime)  " + bel  +
" )  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi  from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + "-1 " + bel  +
" )  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else " +
" SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc   from ExpensesProject p inner join List_classification_Municipal lcm " +
" on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  " + bel  + "  and ExpensesType=1  ) as numeric(18,2))");






        trx.Text = trx1.Text = trx2.Text = trx3.Text = trx4.Text = cmbhesabatili.SelectedItem.ToString();
        

        DataTable region2 = klas.getdatatable(@"select ExpensesID,Amount ayri,Convert(nvarchar(50),mebleg1) teyinat,
ep1.MunicipalID,ep1.MunicipalName,ep1.ExpensesYear,Convert(nvarchar(50),ep1.mebleg) sahe,ep1.ExpensesAreaID,ep1.ExpensesAreaName,
Convert(nvarchar(50), c.ExpensesSubAreaID) ExpensesSubAreaID,c.ExpensesSubAreaName,ad.NoteText,case when lcc.sort Is null then 100000 else lcc.sort  end  as sort1,
case when lcc1.sort Is null then 100000 else lcc1.sort  end  as sort2
 from (
select SUM(Amount+case when DFMF22 is null then 0 else DFMF22 end) mebleg,ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName " + teyinati1 + "  from ExpensesProject p " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear= " + cmbhesabatili.SelectedItem.ToString() + " " + bel + sahe + teyinati +
"group by ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName " + teyinati1 + " ) as ep1 " +
"inner join (" +
"select SUM(Amount) mebleg1,ExpensesYear,p.ExpensesAreaID,p.MunicipalID,p.ExpensesSubAreaID," +
"p.ExpensesAreaName,p.ExpensesSubAreaName,lcm.MunicipalName from ExpensesProject p " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear= " + cmbhesabatili.SelectedItem.ToString() + "  " + bel + sahe + teyinati +
"group by ExpensesYear,p.MunicipalID,p.ExpensesAreaID,p.ExpensesAreaName,lcm.MunicipalName,p.ExpensesSubAreaID,p.ExpensesSubAreaName " +
") as c on c.MunicipalID=ep1.MunicipalID and c.ExpensesYear=ep1.ExpensesYear and c.ExpensesAreaID=ep1.ExpensesAreaID  " +
"and c.ExpensesAreaName=ep1.ExpensesAreaName " +
"inner join ( " +
"select ExpensesID,NoteText,ExpensesYear,p.ExpensesAreaID,p.MunicipalID,p.ExpensesSubAreaID,(Amount+case when DFMF22 is null then 0 else DFMF22 end) Amount, " +
"p.ExpensesAreaName,p.ExpensesSubAreaName,lcm.MunicipalName from ExpensesProject p  " +
"inner join List_classification_Municipal lcm on p.MunicipalID=lcm.MunicipalID where ExpensesType=1  and ExpensesYear= " + cmbhesabatili.SelectedItem.ToString() + "  " + bel + sahe + teyinati +
") ad on ad.MunicipalID=c.MunicipalID and ad.ExpensesYear=c.ExpensesYear and  " +
"ad.ExpensesAreaID=c.ExpensesAreaID and c.ExpensesSubAreaID=ad.ExpensesSubAreaID and c.ExpensesAreaName=ad.ExpensesAreaName " +
"and c.ExpensesSubAreaName=ad.ExpensesSubAreaName " +
"left join List_classifications lcc on lcc.ClassifID=c.ExpensesAreaID " +
"left join List_classifications lcc1 on lcc1.ClassifID=c.ExpensesSubAreaID order by MunicipalID,sort1,sort2");




        Repeater1.DataSource = klas.tekrarlamaxerc("ExpensesAreaName", "sahe", "ExpensesSubAreaName", "Sn", region2);
        Repeater1.DataBind();
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