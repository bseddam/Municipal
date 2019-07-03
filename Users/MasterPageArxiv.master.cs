using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class Users_MasterPageArxiv : System.Web.UI.MasterPage
{
    Class2 klas = new Class2(); string IndividualLegal = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!Page.IsPostBack)
        {
            try
            {
                IndividualLegal = Request.QueryString["IndividualLegal"];
                if (Session["UserID"] == null || Session["passvord"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }

            }
            catch (Exception)
            {
                Response.Write("Yenidən daxil olun");
            }
            lblindividuallegal.Text = IndividualLegal;
            if (IndividualLegal == "1")
            {
                lblsehife.Text = "IndividualArxiv";
            }
            else if (IndividualLegal == "2")
            {
                lblsehife.Text = "LegalArxiv";
            }

            if (IndividualLegal != "")
            {
                vizual();
            }
        }
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        LinkButton lnkPortal = (LinkButton)sender;
        string info = lnkPortal.CommandArgument;
        string[] arg = new string[2];
        char[] splitter = { ';' };
        arg = info.Split(splitter);
        if (arg[1] == "0" && arg[2] == "0")
        {
            klas.cmd("Update Taxpayer set Fordelete=1,FordeleteTime=NULL Where TaxpayerID=" + arg[0]);
        }
        if (arg[1] == "1" || arg[1] == "2" || arg[1] == "3" || arg[1] == "4" || arg[1] == "5" || arg[1] == "8")
        {
            klas.cmd("Update LivingArea set ExitDate=NULL Where LivingAreaID=" + arg[2]);
        }
        if (arg[1] == "6")
        {
            klas.cmd("Update WaterAirTransport set ExitDate=NULL Where TransportID=" + arg[2]);
        }
        if (arg[1] == "7")
        {
            klas.cmd("Update MineTax set ExitDate=NULL Where MineId=" + arg[2]);
        }
        if (arg[1] == "9")
        {
            klas.cmd("Update Advertisement set ExitDate=NULL Where AdvertisementID=" + arg[2]);
        }
        if (arg[1] == "10")
        {
            klas.cmd("Update CarStop set ExitDate=NULL Where CarID=" + arg[2]);
        }
        if (arg[1] == "11")
        {
            klas.cmd("Update Hotel set ExitDate=NULL Where HotelID=" + arg[2]);
        }
        if (arg[1] == "12")
        {
            klas.cmd("Update TradeService set ExitDate=NULL Where TradeID=" + arg[2]);
        }
        if (arg[1] == "13")
        {
            klas.cmd("Update Alienation set ExitDate=NULL Where AlienationID=" + arg[2]);
        }
        if (arg[1] == "14")
        {
            klas.cmd("Update ProfitsTax set ExitDate=NULL Where IncomeTaxID=" + arg[2]);
        }
        if (IndividualLegal != "")
        {
            vizual();
        }
        Response.Redirect(lblsehife.Text + ".aspx?IndividualLegal=" + lblindividuallegal.Text);
    }
    void vizual()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; string MunicipalName = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }



        DataTable region2 = klas.getdatatable(@"select * from (

select  LivingAreaID,Taxesid, TaxesPaymentTypeName ,tx.TaxpayerID,Fordelete,Individual_Legal,MunicipalID,Name,Name1,SName,FName,
YVOK,VOEN,unvan from (


select LivingAreaID,TaxpayerID,LivingType Taxesid,unvan from viewLivingProperty where ExitDate is not null
union select LivingAreaID,TaxpayerID,LivingType Taxesid,unvan from viewQLivingProperty where ExitDate is not null
union select TransportID LivingAreaID,TaxpayerID,6 Taxesid,name unvan from viewWaterAirTransport where ExitDate is not null
union select LivingAreaID,TaxpayerID,LivingType Taxesid,unvan from ViewLivingLand where ExitDate is not null
union select LivingAreaID,TaxpayerID,LivingType Taxesid,unvan from ViewQLivingLand  where ExitDate is not null
union select LivingAreaID,TaxpayerID,LivingType Taxesid,unvan from ViewVillageLand where ExitDate is not null
union select MineId as registrcode,TaxpayerID,7 as Taxesid,MinePositionArea unvan  from MineTax where ExitDate is not null
union select IncomeTaxID as registrcode,TaxpayerID,14 as Taxesid,CompanyName unvan  from ProfitsTax where ExitDate is not null
union select CarID as registrcode,TaxpayerID,10 as Taxesid,VillageName+' '+Street+' '+Home+' '+Flat unvan from CarStop where ExitDate is not null
union select HotelID as registrcode,TaxpayerID,11 as Taxesid,HotelName unvan  from Hotel where ExitDate is not null
union select TradeID as registrcode,TaxpayerID,12 as Taxesid,unvan  from viewTradeService where ExitDate is not null 
union select AdvertisementID as registrcode,TaxpayerID,9 as Taxesid,unvan  from ViewAdvertisement where ExitDate is not null 
union select AlienationID as registrcode,TaxpayerID,13 as Taxesid,VillageName+' '+Street+' '+Home+' '+Flat unvan  from Alienation where ExitDate is not null 
union select LivingAreaID as registrcode,TaxpayerID,8 as Taxesid,SettleAdress_q_k_Name+' '+Street+' '+Home+' '+Flat unvan  from ViewLivingAreaLisee where ExitDate is not null 

) as ee
  inner join TaxesPaymentList tpl on ee.Taxesid=tpl.TaxesPaymentID 
  inner join 
  (
select  case 
when Individual_Legal=1 then SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end
when Individual_Legal=2 then CompanyName
end as Name,Fordelete,Individual_Legal,MunicipalID,NowTime,Name Name1,SName,FName,
YVOK,VOEN,TaxpayerID from Taxpayer ) tx on tx.TaxpayerID=ee.TaxpayerID 

union 

select 0 LivingAreaID,0 taxesid,N'Vergi ödəyicisi silinib' TaxesPaymentTypeName,TaxpayerID,Fordelete,Individual_Legal,MunicipalID,case 
when Individual_Legal=1 then SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end
when Individual_Legal=2 then CompanyName
end as Name,Name Name1,SName,FName,
YVOK,VOEN,'' unvan from Taxpayer where ForDelete=0

) as ka   where Individual_Legal=" + lblindividuallegal.Text + "  and MunicipalID=" + MunicipalId +
   " and YVOK like '%" + txtyvok.Text + "%'  and Name1 like N'%" + txtad.Text + "%'  and SName like N'%" + txtsoyad.Text + "%' and FName like N'%"
   + txtataadi.Text + "%' ");
        DataList1.DataSource = region2;
        DataList1.DataBind();


        //        if (Session["UserID"] == null )
        //        {
        //            Response.Redirect("~/Default.aspx");
        //        }
        //        string MunicipalId = ""; string MunicipalName = "";
        //        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID="+ Session["UserID"].ToString()); 
        //        if (Municipal != null)
        //        {
        //            MunicipalId = Municipal["MunicipalID"].ToString();
        //            MunicipalName = Municipal["MunicipalName"].ToString();
        //        }
        //        DataTable region2 = klas.getdatatable(@"select 
        //case 
        //when Individual_Legal=1 then SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end
        //when Individual_Legal=2 then CompanyName
        //end as Name,
        //YVOK,VOEN,TaxpayerID from Taxpayer  where Individual_Legal=" + lblindividuallegal.Text + " and Fordelete=1 and MunicipalID=" + MunicipalId + " order by NowTime desc");
        //        DataList1.DataSource = region2;
        //        DataList1.DataBind();
    }
    protected void btnaxtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
}
