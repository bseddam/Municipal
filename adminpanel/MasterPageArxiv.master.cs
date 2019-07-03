using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;

public partial class adminpanel_MasterPageArxiv : System.Web.UI.MasterPage
{
    Class2 klas = new Class2(); string IndividualLegal = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!Page.IsPostBack)
        {
            try
            {
                rayon();
                municipal();
                IndividualLegal = Request.QueryString["IndividualLegal"];
                if (Session["UserID1"] == null || Session["passvord1"] == null)
                {
                    Response.Redirect("EntryAdmin.aspx");
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
               
            }
        }
    }
 
    void vizual()
    {
        if (Session["UserID1"] == null || Session["passvord1"] == null)
        {
            Response.Redirect("EntryAdmin.aspx");
        }
        //        string MunicipalId = ""; string MunicipalName = "";
        //        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
        //on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        //        if (Municipal != null)
        //        {
        //            MunicipalId = Municipal["MunicipalID"].ToString();
        //            MunicipalName = Municipal["MunicipalName"].ToString();
        //        }
        string swhere = "";

        if (ddlrayon.SelectedValue.ToString() != "-1")
        {
            swhere = swhere + "lcm.RegionID=" + ddlrayon.SelectedValue.ToString() + " and ";
        }
        if (ddlbelediyye.SelectedValue.ToString() != "-1")
        {
            swhere = swhere + "ka.MunicipalID=" + ddlbelediyye.SelectedValue.ToString() + " and ";
        }

        DataTable region2 = klas.getdatatable(@"select ROW_NUMBER() over(order by TaxpayerID) sn,LivingAreaID,Taxesid, TaxesPaymentTypeName ,
ka.TaxpayerID,Fordelete,Individual_Legal,ka.MunicipalID,Name,Name1,SName,FName,MunicipalName, YVOK,unvan from (
select  LivingAreaID,Taxesid, TaxesPaymentTypeName ,tx.TaxpayerID,Fordelete,Individual_Legal,MunicipalID,Name,Name1,SName,FName,
YVOK,VOEN,unvan from
(
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
end as Name,Name Name1,SName,FName,YVOK,VOEN,'' unvan from Taxpayer where ForDelete=0

) as ka inner join List_classification_Municipal lcm on lcm.MunicipalID=ka.MunicipalID  
where "+swhere+" Individual_Legal="
 + lblindividuallegal.Text + " and YVOK like '%" + txtyvok.Text + "%'  and Name1 like N'%" + txtad.Text + "%'  and SName like N'%"
 + txtsoyad.Text + "%' and FName like N'%" + txtataadi.Text + "%' order by sn,municipalid");
        GridView1.DataSource = region2;
        GridView1.DataBind();



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
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        LinkButton lnkPortal = (LinkButton)sender;
        string info = lnkPortal.CommandArgument;
        string[] arg = new string[2];
        char[] splitter = { 'Ё' };
        arg = info.Split(splitter);

        SqlCommand cmd = new SqlCommand(@"insert into DeleteTaxes (TaxpayerID,TaxesID,LivingAreaID, Deteleobyektname, Adress,YVOK,MunicipalID,Name)
values (@TaxpayerID,@TaxesID,@LivingAreaID,@Deteleobyektname,@Adress,@YVOK,@MunicipalID,@Name)", klas.baglan());
        cmd.Parameters.AddWithValue("TaxpayerID", arg[0]);
        cmd.Parameters.AddWithValue("TaxesID", arg[1]);
        cmd.Parameters.AddWithValue("LivingAreaID", arg[2]);
        cmd.Parameters.AddWithValue("Deteleobyektname", arg[3]);
        cmd.Parameters.AddWithValue("Adress", arg[4]);
        cmd.Parameters.AddWithValue("YVOK", arg[5]);
        cmd.Parameters.AddWithValue("MunicipalID", arg[6]);
        cmd.Parameters.AddWithValue("Name", arg[7]);
        cmd.ExecuteNonQuery();

      


        if (arg[1] == "0" && arg[2] == "0")
        {

            if (klas.getdatatable("select TaxpayerID from Payments where TaxpayerID=" + arg[0] + " and amount<>0 and Operation=10").Rows.Count == 0)
            {
                klas.cmd("Delete from Taxpayer  Where Fordelete=0 and TaxpayerID=" + arg[0]);
            }
            else
            {
                Class2.MsgBox("Bu vergi odəyicisinə məxsus sistemə odəniş daxil edilmişdir.", Page);
            }
        }
        if (arg[1] == "1" || arg[1] == "2" || arg[1] == "3" || arg[1] == "4" || arg[1] == "5" || arg[1] == "8")
        {
            klas.cmd("Delete from LivingArea   Where ExitDate is not null and LivingAreaID=" + arg[2]);
        }
        if (arg[1] == "6")
        {
            klas.cmd("Delete from WaterAirTransport  Where ExitDate is not null and TransportID=" + arg[2]);
        }
        if (arg[1] == "7")
        {
            klas.cmd("Delete from MineTax  Where ExitDate is not null and MineId=" + arg[2]);
        }
        if (arg[1] == "9")
        {
            klas.cmd("Delete from Advertisement  Where ExitDate is not null and AdvertisementID=" + arg[2]);
        }
        if (arg[1] == "10")
        {
            klas.cmd("Delete from CarStop  Where ExitDate is not null and CarID=" + arg[2]);
        }
        if (arg[1] == "11")
        {
            klas.cmd("Delete from Hotel  Where ExitDate is not null and HotelID=" + arg[2]);
        }
        if (arg[1] == "12")
        {
            klas.cmd("Delete from TradeService  Where ExitDate is not null and TradeID=" + arg[2]);
        }
        if (arg[1] == "13")
        {
            klas.cmd("Delete from Alienation Where ExitDate is not null and AlienationID=" + arg[2]);
        }
        if (arg[1] == "14")
        {
            klas.cmd("Delete from ProfitsTax  Where ExitDate is not null and IncomeTaxID=" + arg[2]);
        }
        vizual();
        //if (IndividualLegal != "")
        //{
        //    vizual();
        //}
       // Response.Redirect(lblsehife.Text + ".aspx?IndividualLegal=" + lblindividuallegal.Text);
    }
    protected void btnaxtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        vizual();
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }

}
