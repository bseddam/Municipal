using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            kk();
            xx();
        }
    }
    void xx()
    {
        DataTable dtiller = klas.getdatatable(@"select distinct txl.TaxesPaymentID, 
case when txl.TaxesPaymentID in(1,3,6) then N'Əmlak vergisi' 
when txl.TaxesPaymentID in(2,4,5) then N'Torpaq vergisi' else  
TaxesPaymentTypeName end TaxesPaymentTypeName 
 from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID 
 inner join (select * from TaxesPaymentList d union 
select 15,N'Maliyyə sanksiyası','3',getdate() ) txl on txl.TaxesPaymentID=p.TaxesPaymentID 
order by txl.TaxesPaymentID");
        vergiadi.DataTextField = "TaxesPaymentTypeName";
        vergiadi.DataValueField = "TaxesPaymentID";
        vergiadi.DataSource = dtiller;
        vergiadi.DataBind();
        vergiadi.Items.Insert(0, new ListItem("Ümumi", "-1"));
        vergiadi.SelectedValue = "-1";
    }
    void kk()
    {
        if (Session["UserID"] != null)
        {
            string MunicipalId = ""; string MunicipalName = "";
            string vergiid = ""; string tarix1 = ""; string tarix2 = ""; string odenisnovu = "";
            DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
            if (Municipal != null)
            {
                MunicipalId = Municipal["MunicipalID"].ToString();
                MunicipalName = Municipal["MunicipalName"].ToString();
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

            string yvok="";
            if (txtyvok.Text == " " || txtyvok.Text == "" || txtyvok.Text == null)
            {
                yvok = "  ";
            }
            else
            {
                yvok = "  and t.YVOK like N'%" + txtyvok.Text + "%'";
            }
            if (ddlodenisnovu.SelectedValue.ToString() == "-1" || ddlodenisnovu.SelectedValue.ToString() == "" || ddlodenisnovu.SelectedValue.ToString() == null)
            {
                odenisnovu = " ";
            }
            else if (ddlodenisnovu.SelectedValue.ToString() == "1")
            {
                odenisnovu = " and p.TaxesPaymentOnline=1 ";
            }
            else
            {
                odenisnovu = " and p.TaxesPaymentOnline is null ";
            }

            if (MunicipalId != "")
            {
                DataTable dt = klas.getdatatable(@"select '0' sn, N' Cəmi ' fullname, '' YVOK,
Sum(p.Amount) mebleg, '' Tarix,'' TaxesPaymentName          
                   from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID where 1=1 " 
+ tarix1 + tarix2 + yvok + odenisnovu +
                 " and p.Operation=10 and t.ForDelete=1  and t.MunicipalID=" + MunicipalId + " " + vergiid +
                 " union all select '1' sn, t.SName+' '+t.Name+' '+t.FName as fullname, " +
                 "                          t.YVOK,   " +
                 "                          p.Amount mebleg," +
                 "                          convert(varchar,p.NowTime,104) Tarix," +
                 "  case when p.TaxesPaymentID=1 then N'Əmlak vergisi' " +
                 " when p.TaxesPaymentID=2 then N'Torpaq vergisi' else TaxesPaymentTypeName end TaxesPaymentName      " +
                 " from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID " +
                 " inner join (select * from TaxesPaymentList d union select 15,N'Maliyyə sanksiyası','3',getdate()) txl " +
                 "on txl.TaxesPaymentID=p.TaxesPaymentID where 1=1 " +
                 tarix1 + tarix2 + yvok + odenisnovu + " and p.Operation=10  and t.MunicipalID=" 
                 + MunicipalId + " and t.ForDelete=1 " + vergiid +
                 " order by sn, tarix desc");
                
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
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
}