using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_Income : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iller1();
            //rayon();
            //municipal();
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
    //void municipal()
    //{
    //    DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
    //    ddlbelediyye.DataTextField = "MunicipalName";
    //    ddlbelediyye.DataValueField = "MunicipalID";
    //    ddlbelediyye.DataSource = region2;
    //    ddlbelediyye.DataBind();
    //    ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    //}
    //void rayon()
    //{
    //    DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
    //    ddlrayon.DataTextField = "Name";
    //    ddlrayon.DataValueField = "RegionsID";
    //    ddlrayon.DataSource = region2;
    //    ddlrayon.DataBind();
    //    ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    //}
    void iller()
    {
       


    }
    void kk()
    {

        iller();
        string s = " "; string ray = " ";
        //if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        //{
        //    s = " ";
        //}
        //else
        //{
        //    s = " and lcm.MunicipalID=" + ddlbelediyye.SelectedValue;
        //}
        //if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        //{
        //    ray = "  ";
        //}
        //else
        //{
        //    ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        //}

        LabelBashliq.Text = (int.Parse(cmbhesabatili.SelectedValue.ToString()) - 1).ToString() + " və " + cmbhesabatili.SelectedValue.ToString()+
                            " illər üzrə bələdiyyə büdcələrinə yerli vergi və<br />ödənişlərdən daxil olmuş vəsaitlər barədə müqayisəli məlumat";
        label1.Text = (int.Parse(cmbhesabatili.SelectedValue.ToString()) - 1).ToString();
        label2.Text = cmbhesabatili.SelectedValue.ToString();
        string buil = cmbhesabatili.SelectedValue.ToString();
        string kecenil = (int.Parse(cmbhesabatili.SelectedValue.ToString()) - 1).ToString();

        //Qaliq

        lblQaliqOtenIl.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + @"-2>=year(p.NowTime)  
)  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + @"-2 
)  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else 
SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc  from ExpensesProject p inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-2  and ExpensesType=1 ) as numeric(18,2))");
        if (lblQaliqOtenIl.Text == "")
        {
            lblQaliqOtenIl.Text = "0";
        }

        lblQaliqBuIl.Text = klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + @"-1>=year(p.NowTime)  
)  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + @"-1 
)  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else 
SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc  from ExpensesProject p inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  and ExpensesType=1 ) as numeric(18,2))");
        if (lblQaliqBuIl.Text == "")
        {
            lblQaliqBuIl.Text = "0";
        }

        float f1 = float.Parse(klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + @"-1>=year(p.NowTime)  
)  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + @"-1 
)  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else 
SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc  from ExpensesProject p inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-1  and ExpensesType=1 ) as numeric(18,2))"));


        float f2 = float.Parse(klas.getdatacell(@"select cast((select case when SUM(p.amount) is null then 0 else SUM(p.amount) end mebleg from Taxpayer m inner join Payments p on 
m.TaxpayerID=p.TaxpayerID inner join List_classification_Municipal lcm on m.MunicipalID=lcm.MunicipalID where  p.Operation=10 and 
 " + cmbhesabatili.SelectedItem.ToString() + @"-2>=year(p.NowTime)  
)  + (select  case when SUM(m.amount) is null then 0 else SUM(m.amount) end cemi from Dotation m inner join List_classification_Municipal lcm " +
"on m.MunicipalID=lcm.MunicipalID where  year(DotationGiveDate)<=" + cmbhesabatili.SelectedItem.ToString() + @"-2 
)  -  (select  case when SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) is null then 0 else 
SUM(case when p.amount is null then 0 else p.amount end+case when DFMF22 is null then 0 else dfmf22 end) end xerc  from ExpensesProject p inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where  ExpensesYear<=" + cmbhesabatili.SelectedItem.ToString() + "-2  and ExpensesType=1 ) as numeric(18,2))"));

        float faiz;
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblQaliqFaiz.Text = faiz.ToString();



        //Torpaq
        lblTorpaqOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end  as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=2 and YEAR(vll.NowTime)=" + kecenil + ray + s);
        lblTorpaqBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=2 and YEAR(vll.NowTime)=" + buil + ray + s);
         faiz = ((float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=2 and YEAR(vll.NowTime)=" + buil + ray + s)) -
 float.Parse(klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=2 and YEAR(vll.NowTime)=" + kecenil + ray + s))) * 100 /
                     float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=2 and YEAR(vll.NowTime)=" + kecenil + ray + s)));
        lblTorpaqFaiz.Text=faiz.ToString();

        //Emlak
        lblEmlakOtenIl.Text = klas.getdatacell(@"select cast( case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and TaxesPaymentID=1 and YEAR(vll.NowTime)=" + kecenil + ray + s);
        lblEmlakBuIl.Text = klas.getdatacell(@"select cast( case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and TaxesPaymentID=1 and YEAR(vll.NowTime)=" + buil + ray + s);

        faiz = ((float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=1 and YEAR(vll.NowTime)=" + buil + ray + s)) -
 float.Parse(klas.getdatacell(@"select cast(SUM(Amount) as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=1 and YEAR(vll.NowTime)=" + kecenil + ray + s))) * 100 /
                     float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2) )  cem  from Payments vll inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
where Operation=10 and  TaxesPaymentID=1 and YEAR(vll.NowTime)=" + kecenil + ray + s)));

     
        lblEmlakFaiz.Text = faiz.ToString();
        if (lblEmlakFaiz.Text == "")
        {
            lblEmlakFaiz.Text = "0";
        }

        lblMedenOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll 
inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10  and TaxesPaymentID=7 and YEAR(vll.NowTime)=" + kecenil + ray + s);
        if (lblMedenOtenIl.Text == "")
        {
            lblMedenOtenIl.Text = "0";
        }
        lblMedenBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll 
inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10  and TaxesPaymentID=7 and YEAR(vll.NowTime)=" + buil + ray + s);
        if (lblMedenBuIl.Text=="")
        {
            lblMedenBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll 
inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10  and TaxesPaymentID=7 and YEAR(vll.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments vll 
inner join Taxpayer  t on vll.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID 
 where Operation=10  and TaxesPaymentID=7 and YEAR(vll.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblMedenFaiz.Text = faiz.ToString();


        lblMenfeetOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=14 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblMenfeetOtenIl.Text == "")
        {
            lblMenfeetOtenIl.Text = "0";
        }
        lblMenfeetBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=14 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblMenfeetBuIl.Text == "")
        {
            lblMenfeetBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=14 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=14 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblMenfeetFaiz.Text = faiz.ToString();

        //Reklam
        lblReklamOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=9 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblReklamOtenIl.Text == "")
        {
            lblReklamOtenIl.Text = "0";
        }
        lblReklamBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=9 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblReklamBuIl.Text == "")
        {
            lblReklamBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=9 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=9 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblReklamFaiz.Text = faiz.ToString();


        //	Stasionar və ya səyyar ticarət ictimai iaşə və digər xidmətlərə görə ödəniş
        lblTicaretOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=12 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblTicaretOtenIl.Text == "")
        {
            lblTicaretOtenIl.Text = "0";
        }
        lblTicaretBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=12 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblTicaretBuIl.Text == "")
        {
            lblTicaretBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=12 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=12 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblTicaretFaiz.Text = faiz.ToString();

        //Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş
        lblMehmanxanaOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=11 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblMehmanxanaOtenIl.Text == "")
        {
            lblMehmanxanaOtenIl.Text = "0";
        }
        lblMehmanxanaBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=11 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblMehmanxanaBuIl.Text == "")
        {
            lblMehmanxanaBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=11 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=11 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblMehmanxanaFaiz.Text = faiz.ToString();

        //	Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş
        lblNeqliyyatOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=10 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblNeqliyyatOtenIl.Text == "")
        {
            lblNeqliyyatOtenIl.Text = "0";
        }
        lblNeqliyyatBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=10 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblNeqliyyatBuIl.Text == "")
        {
            lblNeqliyyatBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=10 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID where Operation=10 and TaxesPaymentID=10 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblNeqliyyatFaiz.Text = faiz.ToString();

        //  Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsindən daxil olan ödəniş
        lblBelediyyeOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=13 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblBelediyyeOtenIl.Text == "")
        {
            lblBelediyyeOtenIl.Text = "0";
        }
        lblBelediyyeBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=13 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblBelediyyeBuIl.Text == "")
        {
            lblBelediyyeBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=13 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=13 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblBelediyyeFaiz.Text = faiz.ToString();

        //Su təchizatı və məişət tullantılarına görə ödəniş
        lblicareBuIl.Text = "0";
        lblicareFaiz.Text = "0";
        lblicareOtenIl.Text = "0";

        lblicareOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10  and TaxesPaymentID=8 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblicareOtenIl.Text == "")
        {
            lblicareOtenIl.Text = "0";
        }
        lblicareBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10  and TaxesPaymentID=8 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblicareBuIl.Text == "")
        {
            lblicareBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10  and TaxesPaymentID=8 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10  and TaxesPaymentID=8 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblicareFaiz.Text = faiz.ToString();






        //Iane
        lblIaneOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + kecenil + ray + s);
        if (lblIaneOtenIl.Text == "")
        {
            lblIaneOtenIl.Text = "0";
        }
        lblIaneBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + buil + ray + s);
        if (lblIaneBuIl.Text == "")
        {
            lblIaneBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=2 and year(DotationGiveDate)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblIaneFaiz.Text = faiz.ToString();








        //Dotasiya
        lblDotasiyaOtenIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + kecenil + ray + s);
        if (lblDotasiyaOtenIl.Text == "")
        {
            lblDotasiyaOtenIl.Text = "0";
        }
        lblDotasiyaBuIl.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + buil + ray + s);
        if (lblDotasiyaBuIl.Text == "")
        {
            lblDotasiyaBuIl.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=1 and year(DotationGiveDate)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblDotasiyaFaiz.Text = faiz.ToString();




        //Sanksiya
        lblsanksiyaotenil.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=15 and YEAR(mt.NowTime)=" + kecenil + ray + s);
        if (lblsanksiyaotenil.Text == "")
        {
            lblsanksiyaotenil.Text = "0";
        }
        lblsanksiyabuil.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=15 and YEAR(mt.NowTime)=" + buil + ray + s);
        if (lblsanksiyabuil.Text == "")
        {
            lblsanksiyabuil.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=15 and YEAR(mt.NowTime)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) cem from Payments  mt
inner join Taxpayer  t on mt.TaxpayerID=t.TaxpayerID
inner join List_classification_Municipal lcm on lcm.MunicipalID=t.MunicipalID
 where Operation=10 and TaxesPaymentID=15 and YEAR(mt.NowTime)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lblsanksiyafaiz.Text = faiz.ToString();














        //Diger gelir
        lbldigerotenil.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + kecenil + ray + s);
        if (lbldigerotenil.Text == "")
        {
            lbldigerotenil.Text = "0";
        }
        lbldigerbuil.Text = klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + buil + ray + s);
        if (lbldigerbuil.Text == "")
        {
            lbldigerbuil.Text = "0";
        }
        f1 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + buil + ray + s));
        f2 = float.Parse(klas.getdatacell(@"select cast(case when SUM(Amount) is null then 0 else SUM(Amount) end as numeric(18,2)) as cemi from Dotation p 
inner join List_classification_Municipal lcm 
on p.MunicipalID=lcm.MunicipalID where Dotationtype=3 and year(DotationGiveDate)=" + kecenil + ray + s));
        if (f2 != 0)
        {
            faiz = (f1 - f2) * 100 / f2;
        }
        else
        { faiz = 0; }
        lbldigerfaiz.Text = faiz.ToString();

        double cemotenil = double.Parse(lblQaliqOtenIl.Text) + double.Parse(lblTorpaqOtenIl.Text) + double.Parse(lblEmlakOtenIl.Text) + double.Parse(lblMedenOtenIl.Text) + double.Parse(lblMenfeetOtenIl.Text) +
                        double.Parse(lblReklamOtenIl.Text) + double.Parse(lblTicaretOtenIl.Text) + double.Parse(lblMehmanxanaOtenIl.Text) + double.Parse(lblNeqliyyatOtenIl.Text) +
                        double.Parse(lblBelediyyeOtenIl.Text) + double.Parse(lblicareOtenIl.Text) + double.Parse(lblIaneOtenIl.Text) + double.Parse(lblDotasiyaOtenIl.Text) + double.Parse(lblsanksiyaotenil.Text) + double.Parse(lbldigerotenil.Text);
        
        
        double cembuil = double.Parse(lblQaliqBuIl.Text) + double.Parse(lblTorpaqBuIl.Text) + double.Parse(lblEmlakBuIl.Text) + double.Parse(lblMedenBuIl.Text) + double.Parse(lblMenfeetBuIl.Text) +
                        double.Parse(lblReklamBuIl.Text) + double.Parse(lblTicaretBuIl.Text) + double.Parse(lblMehmanxanaBuIl.Text) + double.Parse(lblNeqliyyatBuIl.Text) +
                        double.Parse(lblBelediyyeBuIl.Text) + double.Parse(lblicareBuIl.Text) + double.Parse(lblIaneBuIl.Text) + double.Parse(lblDotasiyaBuIl.Text) + double.Parse(lblsanksiyabuil.Text) + double.Parse(lbldigerbuil.Text);

        double cemifaiz = (cembuil - cemotenil) * 100 / cemotenil;
        lblcemOtenIl.Text = cemotenil.ToString();

        lblCemBuIl.Text = cembuil.ToString();
            
        lblCemFaiz.Text = cemifaiz.ToString();
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        //municipal();
    }

    protected void btnhesab_Click(object sender, EventArgs e)
    {
        kk();
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {

    }
}