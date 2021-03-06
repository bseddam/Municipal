﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;

public partial class Users_LivingLandTax : System.Web.UI.Page
{
    Class2 connsql = new Class2();  string TaxpayerID,RegionID;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (string.IsNullOrEmpty(TaxpayerID))
        {
            if (Session["TaxpayerID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            TaxpayerID = Session["TaxpayerID"].ToString();
        }
       
        //if (islem == "generaltax")
        //{
        //    Response.Write(TaxpayerID);
        //}
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        RegionID = connsql.getdatacell("select regionid from List_classification_Municipal where MunicipalID = (select MunicipalID from Taxpayer where TaxpayerID=" + TaxpayerID.ToString() + ")");
        if (!Page.IsPostBack)
        {
            DataRow userrow = connsql.GetDataRow("Select * from Taxpayer where TaxpayerID="+TaxpayerID);
            LBTaxPayerName.Text = userrow["SName"].ToString() + " " + userrow["Name"].ToString() + " " + userrow["Fname"].ToString();
            YVOK.Text = userrow["YVOK"].ToString();
            VOEN.Text = userrow["VOEN"].ToString();

            
            

            PnlLivingPropertyTax.Visible = false;
            PnlCarParking.Visible = false;
            Pnllease.Visible = false;
            PnlLivingLandTax.Visible = false;
            PnlMeden.Visible = false;
            PnlMenfeet.Visible = false;
            PnlNolivingPropertyTax.Visible = false;
            PnlPrivate.Visible = false;
            PnlNolivingLandtax.Visible = false;
            PnlReklam.Visible = false;
            PnlStosionar.Visible = false;
            Pnltourism.Visible = false;
            PnlVillageLand.Visible = false;
            PnlTransport.Visible = false;

            /*
            SqlDataAdapter dap = new SqlDataAdapter(@"select ClassifID,ClassifName from List_classifications where ListId>=5", connsql.baglan());
            DataTable dt = new DataTable();
            dap.Fill(dt);
            CbTaxes.TextField = "ClassifName";
            CbTaxes.ValueField = "ClassifID";
            CbTaxes.DataSource = dt;
            CbTaxes.DataBind();
            string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";*/
            FillComboBox(CbTaxes, "TaxesPaymentList", "", "TaxesPaymentID", "", "TaxesPaymentTypeName", "");
            
            
           
            int k = 0;
            string vaxt = connsql.getdatacell("select year(getdate()) vaxt ");
            for (var i = int.Parse(vaxt); i >= 1800; i--)
            {
                cmbburaxili.Items.Insert(k, new ListEditItem("" + i + ""));
                k++;
            }
        }

    }
    protected void FillComboBox(ASPxComboBox cbkomponent,string tableName, string fild01,string fild1, string fild02,string fild2, string wherestring)
    {
        string selectsql=@"Select "+fild01+" "+fild1+","+fild02+" "+fild2+" from "+tableName+" "+wherestring;
      SqlDataAdapter dap=new SqlDataAdapter(selectsql,connsql.baglan());
      DataTable dt=new DataTable();
      dap.Fill(dt);
      
      cbkomponent.TextField=fild2;
      cbkomponent.ValueField=fild1;
      cbkomponent.DataSource=dt;
      cbkomponent.DataBind();
      if (dt.Rows.Count > 0)
      {
          cbkomponent.Items.Insert(0, new ListEditItem("Seçin", "-1"));
      }
      cbkomponent.SelectedIndex = 0;

    }
    protected void selectlivingProperty()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn from viewLivingProperty  where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListLivPro.DataSource = dt;
        DataListLivPro.DataBind();
    }
    protected void selectQlivingProperty()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn  from viewQLivingProperty where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListQLivpro.DataSource = dt;
        DataListQLivpro.DataBind();
    }
    protected void selectlivingLand()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn from ViewLivingLand where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListLivLand.DataSource = dt;
        DataListLivLand.DataBind();
    }

    protected void selectQlivingLand()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn, case when TypeUseLand=1 then N'Mülkiyyət' else N'İstifadə' end TypeUseLand1 from ViewQLivingLand Where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListQLivLand.DataSource = dt;
        DataListQLivLand.DataBind();
    }
    protected void selectVillageLand()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn from ViewVillageLand Where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListVillageLand.DataSource = dt;
        DataListVillageLand.DataBind();
    }
    protected void selectMine()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by l.MineID) sn,convert(varchar(10),l.MineRegistrDate,104) RegistrDate1,
        l.MineRegionName+', '+l.MineVillage+', '+l.MineStreet+', '+l.MineHome+', '+l.MineFlat unvan from MineTax l where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListMeden.DataSource = dt;
        DataListMeden.DataBind();
    }
    protected void selectAdvertisement()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"Select ROW_NUMBER() over (order by AdvertisementID) sn,* from ViewAdvertisement where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListAdvertisement.DataSource = dt;
        DataListAdvertisement.DataBind();
    }
    protected void selectCarStop()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select ROW_NUMBER() over (order by l.CarID) sn,l.CarID, l.TaxPayerID, convert(varchar(10),l.RegisterDate,104) RegisterDate, 
                            l.CarStopType, l.RegionID, l.VillageID, l.RegionName+', '+l.VillageName+', '+Street+', '+ l.Home+', '+ l.Flat unvan, l.StopArea, l.CarCount,
                            convert(varchar(10),l.ServiceDate1,104) ServiceDate1, convert(varchar(10),l.ServiceDate2,104) ServiceDate2,c.CarstopType CarstopType1
                            from  CarStop l left join CarstopType c on c.CarstopTypeID=l.CarStopType where l.ExitDate is null and l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListCarStop.DataSource = dt;
        DataListCarStop.DataBind();
    }
    protected void selectHotel()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select ROW_NUMBER() over (order by l.HotelID) sn,l.HotelID, l.TaxpayerID, convert(varchar(10),l.RegistrDate,104) RegistrDate, 
                            case when l.HotelType=1 then N'Mehmanxana'
                                 when l.HotelType=2 then N'Sanatoriya- kurort'
                                 when l.HotelType=3 then N'Turizm'
                             end as  HotelType, l.HotelName, convert(varchar(10),l.ServiceBeginDate,104) ServiceBeginDate, 
                            case when l.ServiceEndDate<'1901.01.01' then  ''
                            else convert(varchar(10),l.ServiceEndDate,104) end ServiceEndDate from  Hotel l where l.ExitDate is null and l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListHotel.DataSource = dt;
        DataListHotel.DataBind();
    }
    protected void selectlease()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *,ROW_NUMBER() over (order by livingAreaid) sn,case when TypeUseLand=1 then N'Torpaq' when TypeUseLand=2 then N'Bina'  else N'Digər' end TypeUseLand1 from ViewLivingAreaLisee where ExitDate is null and TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListLease.DataSource = dt;
        DataListLease.DataBind();
    }
    protected void selectTrade()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select *, ROW_NUMBER() over (order by TradeID) sn from  viewTradeService  where ExitDate is null and TaxPayerId=" + TaxpayerID; 
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListTrade.DataSource = dt;
        DataListTrade.DataBind();
    }
    protected void selectPrivate()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select ROW_NUMBER() over (order by l.AlienationID) sn,l.AlienationID, l.TaxpayerID, convert(varchar(10),l.RegistrDate,104) RegistrDate, 
                            AlienationType,RegionID,VillageID, RegionName+', '+VillageName+', '+Street+', '+Home+', '+Flat unvan, 
                            l.ContractNum, convert(varchar(10),l.ContractGiveDate,104) ContractGiveDate,
case when l.AlienationType=1 then N'Torpaq' 
            when l.AlienationType=2 then N'Bina'
            else N'Digər'  end as  AlienationType1,AmountOnContract 
                            from  Alienation l where l.ExitDate is null and l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, connsql.baglan());
        dap.Fill(dt);
        DataListPrivate.DataSource = dt;
        DataListPrivate.DataBind();
    }
    protected void deleterecordLivLandPro(int id)
    {
        string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId="+id.ToString();
        SqlCommand cmd = new SqlCommand(deletesql,connsql.baglan());
        cmd.ExecuteNonQuery();
        selectlivingProperty();

    }
    protected void deleterecordQLivLandPro(int id)
    {
        string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + id.ToString();
        SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
        cmd.ExecuteNonQuery();
        selectQlivingProperty();

    }
    protected void deleterecordLivLandLand(int id)
    {
        string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + id.ToString();
        SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
        cmd.ExecuteNonQuery();
        selectlivingLand();

    }
    protected void deleterecordQLivLandLand(int id)
    {
        string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + id.ToString();
        SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
        cmd.ExecuteNonQuery();
        selectQlivingLand();

    }
    protected void FillCompanentOnEditLivPro(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId="+id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DERegistrDateLiving.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtDocumentNumberLiving.Text = row["DocumentNumber"].ToString();
            DeGivingDateLiving.Date = Convert.ToDateTime(row["GivingDate"].ToString());
            CbRegionliving.Text = row["SettleAdress_Sh_R_Nme"].ToString();
              if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
              {
                  CbRegionliving.Value = row["SettleAdress_Sh_R_ID"].ToString();
              }
              string sqlqk = "case when TypeID = 4 THEN Name + ' ' + N'kəndi'  when TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' when TypeID = 2 then Name + ' ' + N'şəhəri' when TypeID = 5 then Name + ' ' + N'rayonu' else Name  end as  ";
              FillComboBox(CbQKliving, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbRegionliving.Value.ToString());
              CbQKliving.Text = row["SettleAdress_q_k_Name"].ToString();
              
              if (row["SettleAdress_q_k_ID"].ToString() != "0")
              {
                  CbQKliving.Value = row["SettleAdress_q_k_ID"].ToString();
              }
            CbStreetliving.Text = row["Street"].ToString();
            CbHomeliving.Text = row["Home"].ToString();
            CbFletLiving.Text = row["Flat"].ToString();
           // CbZonaLiving.Value = row["Zona"].ToString();
            if (row["Zona"].ToString() != "0")
            {
                CbZonaLiving.Value = row["Zona"].ToString();
            }
            CBVergiDerecesiLiving.Text = row["TaxRate"].ToString();
            txtGeneralAreaLiving.Text = row["GeneralArea"].ToString();
            if (row["Concession"].ToString() == "1")
            {
                RbGuzeshtHeLiving.Checked = true;
                RbGuzeshtYoxLiving.Checked = false;
            } else 
            if (row["Concession"].ToString() == "2")
            {
                RbGuzeshtYoxLiving.Checked = true;
                RbGuzeshtHeLiving.Checked = false;
            }

            selectlivingProperty();
        }
    }
    protected void FillCompanentOnEditQLivPro(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DeQlivProregistrDate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtQLivProDocumentNumber.Text = row["DocumentNumber"].ToString();
            DEQlivProDocumentDate.Date = Convert.ToDateTime(row["GivingDate"].ToString());
           // txtQlivProObjectKod.Text = row["ObjectCode"].ToString();
            CbQlivProRegion.Text = row["SettleAdress_Sh_R_Nme"].ToString();
            CBQlivproTAxRate.Text = row["TaxRate"].ToString();
            if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
            {
                CbQlivProRegion.Value = row["SettleAdress_Sh_R_ID"].ToString();
            }
            CbQlivProQK.Text = row["SettleAdress_q_k_Name"].ToString();
            if (row["SettleAdress_q_k_ID"].ToString() != "0")
            {
                CbQlivProQK.Value = row["SettleAdress_q_k_ID"].ToString();
            }
            CbQlivProStreet.Text = row["Street"].ToString();
            CbQlivProHome.Text = row["Home"].ToString();
            CbQlivProFlat.Text = row["Flat"].ToString();
            //CbQlivProZona.Value = row["Zona"].ToString();
            if (row["Zona"].ToString() != "0")
            {
                CbQlivProZona.Value = row["Zona"].ToString();
            }
            txtQlivProGeneralArea.Text = row["GeneralArea"].ToString();
        }
    }
    protected void FillCompanentOnEditHotel(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from Hotel where HotelID=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DeHotelRegisterDate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtHotelName.Text = row["HotelName"].ToString();
            DEHotelServicesDate1.Date = Convert.ToDateTime(row["ServiceBeginDate"].ToString());
            if (Convert.ToDateTime(row["ServiceEndDate"].ToString()) <= Convert.ToDateTime("01.01.1902"))
            {
              //  DEHotelServicesDate2.tx = Convert.ToDateTime(row["ServiceEndDate"].ToString());
            }
            else
            {
                DEHotelServicesDate2.Date = Convert.ToDateTime(row["ServiceEndDate"].ToString());
            }
            if (row["HotelType"].ToString() != "0")
            {
                CbHoletType.Value = row["HotelType"].ToString();
            }
        }
    }
    protected void FillCompanentOnEditCarStop(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from CarStop where CarID=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DECarStopRegisterDate.Date = Convert.ToDateTime(row["RegisterDate"].ToString());
            if (row["CarStopType"].ToString() == "1")
            {
                RBCarType1.Checked = true;
            }
            if (row["CarStopType"].ToString() == "2")
            {
                RBCarType2.Checked = true;
            }
            if (row["CarStopType"].ToString() == "3")
            {
                RBCarType3.Checked = true;
            }
            if (row["CarStopType"].ToString() == "4")
            {
                RBCarType4.Checked = true;
            }
            CBCarRegion.Text = row["RegionName"].ToString();
            if (row["RegionID"].ToString() != "0")
            {
                CbQlivProRegion.Value = row["RegionID"].ToString();
            }
            CBCarVillage.Text = row["VillageName"].ToString();
            if (row["VillageID"].ToString() != "0")
            {
                CBCarVillage.Value = row["VillageID"].ToString();
            }
            CBCarStreet.Text = row["Street"].ToString();
            CBCarHome.Text = row["Home"].ToString();
            CbCarFlat.Text = row["Flat"].ToString();

            txtCarArea.Text = row["StopArea"].ToString();
            txtCarCount.Text = row["CarCount"].ToString();
            DECarDate1.Date = Convert.ToDateTime(row["ServiceDate1"].ToString());
            DECarDate2.Date = Convert.ToDateTime(row["ServiceDate2"].ToString());
        }
    }
    protected void FillCompanentOnEditPrivate(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from Alienation where AlienationID=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DEPrivateRegistrdate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            CBPrivateRegion.Text = row["RegionName"].ToString();
            if (row["RegionID"].ToString() != "0")
            {
                CBPrivateRegion.Value = row["RegionID"].ToString();
            }
            CBPrivateVillage.Text = row["VillageName"].ToString();
            if (row["VillageID"].ToString() != "0")
            {
                CBPrivateVillage.Value = row["VillageID"].ToString();
            }
            CBPrivatestreet.Text = row["Street"].ToString();
            CBPrivateHome.Text = row["Home"].ToString();
            CBPrivateFlat.Text = row["Flat"].ToString();
            txtPrivateAmount.Text = row["AmountOnContract"].ToString();
            //CbQlivProZona.Value = row["Zona"].ToString();
            if (row["AlienationType"].ToString() != "0")
            {
                CBPrivateType.Value = row["AlienationType"].ToString();
            }
            txtPrivatContractNum.Text = row["ContractNum"].ToString();
            DEPrivatContracDate.Date = Convert.ToDateTime(row["ContractGiveDate"].ToString());
        }
    }
    protected void FillCompanentOnEditLivLand(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DELivLandRegisterDate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtLivingLandDocNumber.Text = row["DocumentNumber"].ToString();
            DELivingLandDocumentDate.Date = Convert.ToDateTime(row["GivingDate"].ToString());
            DELivLandUsingdate1.Date = Convert.ToDateTime(row["UsingBeginDate"].ToString());
            DELivLandUsingdate2.Text = "";
          //  MsgLivingLand.Text = row["UsingEndDate"].ToString();
            if (row["UsingEndDate"].ToString().Substring(0,10) != "01.01.1900")
            {
                DELivLandUsingdate2.Date = Convert.ToDateTime(row["UsingEndDate"].ToString());
            }
            CbLivLandregion.Text = row["SettleAdress_Sh_R_Nme"].ToString();
            if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
            {
                CbLivLandregion.Value = row["SettleAdress_Sh_R_ID"].ToString();
            }
            CbLivingLandUsingtype.Text = row["TypeUseLand"].ToString();
            if (row["TypeUseLand"].ToString() != "0")
            {
                CbLivingLandUsingtype.Value = row["TypeUseLand"].ToString();
            }
            CbLivLandQK.Text = row["SettleAdress_q_k_Name"].ToString();
            if (row["SettleAdress_q_k_ID"].ToString() != "0")
            {
                CbLivLandQK.Value = row["SettleAdress_q_k_ID"].ToString();
            }
            CbLivLandStreet.Text = row["Street"].ToString();
            CbLivLandHome.Text = row["Home"].ToString();
            CBLivLandFlat.Text = row["Flat"].ToString();
            CbLivingLandFactor.Text = row["TaxRAte"].ToString();
           // CbZonaLiving.Value = row["Zona"].ToString();
            txtLivLandGeneralArea.Text = row["GeneralArea"].ToString();
            if (row["Concession"].ToString() == "1")
            {
                RbLivLandhe.Checked = true;
                RbLivLandyox.Checked = false;
            }
            else
                if (row["Concession"].ToString() == "2")
                {
                    RbLivLandhe.Checked = false;
                    RbLivLandyox.Checked = true;
                }


        }
    }
    protected void FillCompanentOnEditQLivLand(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DEQlivLandRegister.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtQlivLandDocumentNumber.Text = row["DocumentNumber"].ToString();
            DEQlivLandGiveDate.Date = Convert.ToDateTime(row["GivingDate"].ToString());
            DEQlivLandUsingDate1.Date = Convert.ToDateTime(row["UsingBeginDate"].ToString());
            if (Convert.ToDateTime(row["UsingEndDate"].ToString())>=Convert.ToDateTime("01.01.1901"))
            {
            DEQlivLandUsingDate2.Date = Convert.ToDateTime(row["UsingEndDate"].ToString());
            }
            CbQlivLandRegion.Text = row["SettleAdress_Sh_R_Nme"].ToString();
            CbQlivLandTaxRate.Text = row["TaxRate"].ToString();
            if (row["Concession"].ToString()=="1")
            {
                RBQlivLAndhe.Checked = true;
            }
            if (row["Concession"].ToString() == "2")
            {
                RBQlivLAndyox.Checked = true;
            }
            if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
            {
                CbQlivLandRegion.Value = row["SettleAdress_Sh_R_ID"].ToString();
            }
            CbQlivLandUsingLand.Text = row["TypeUseLand"].ToString();
            if (row["TypeUseLand"].ToString() != "0")
            {
                CbQlivLandUsingLand.Value = row["TypeUseLand"].ToString();
            }
            CbQlivLandQk.Text = row["SettleAdress_q_k_Name"].ToString();
            if (row["SettleAdress_q_k_ID"].ToString() != "0")
            {
                CbQlivLandQk.Value = row["SettleAdress_q_k_ID"].ToString();
            }
            CbQlivLandStreet.Text = row["Street"].ToString();
            CbQlivLandHome.Text = row["Home"].ToString();
            CBQlivLandFlat.Text = row["Flat"].ToString();
            // CbZonaLiving.Value = row["Zona"].ToString();
            txtQlivLandGeneralArea.Text = row["GeneralArea"].ToString();

        }
    }
    protected void FillCompanentOnEditVillageLand(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DeVillageRegistr.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtVillageDocumetNumber.Text = row["DocumentNumber"].ToString();
            DeVillageGivDate.Date = Convert.ToDateTime(row["GivingDate"].ToString());
            DeVillageUseDate1.Date = Convert.ToDateTime(row["UsingBeginDate"].ToString());
            if (Convert.ToDateTime(row["UsingEndDate"].ToString()) >= Convert.ToDateTime("01.01.1901"))
            {
                DeVillageUseDate2.Date = Convert.ToDateTime(row["UsingEndDate"].ToString());
            }
            CbVillageRegion.Text = row["SettleAdress_Sh_R_Nme"].ToString();
            if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
            {
                CbVillageRegion.Value = row["SettleAdress_Sh_R_ID"].ToString();
            }
            CbVillageUseType.Text = row["TypeUseLand"].ToString();
            if (row["TypeUseLand"].ToString() != "0")
            {
                CbVillageUseType.Value = row["TypeUseLand"].ToString();
            }
            CbVillageQk.Text = row["SettleAdress_q_k_Name"].ToString();
            if (row["SettleAdress_q_k_ID"].ToString() != "0")
            {
                CbVillageQk.Value = row["SettleAdress_q_k_ID"].ToString();
            }
            CbVillageStreet.Text = row["Street"].ToString();
            CbVillageHome.Text = row["Home"].ToString();
            CbVillageFlat.Text = row["Flat"].ToString();
            // CbZonaLiving.Value = row["Zona"].ToString();
            txtVillageArea.Text = row["GeneralArea"].ToString();
            txtVillageConditionalPoints.Text = row["ConditionalPoints"].ToString();
            CbVillageQualityGroup.Text = row["QualityGroup"].ToString();
            if (row["Concession"].ToString()=="1")
            {
                RBVillageYox.Checked = false;
                RBVillageHe.Checked = true;                
            }
            else
                if (row["Concession"].ToString() == "2")
                {
                    RBVillageHe.Checked = false;
                    RBVillageYox.Checked = true;
                }

        }
    }
    protected void FillCompanentOnEditlease(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from LivingArea where LivingAreaId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DeleaseRegistrDate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtleaseDocNum.Text = row["DocumentNumber"].ToString();
            DeleaseDocGivDate.Date = Convert.ToDateTime(row["GivingDate"].ToString());
            DEleaseDocDate1.Date = Convert.ToDateTime(row["UsingBeginDate"].ToString());
            DEleaseDocDate2.Date = Convert.ToDateTime(row["UsingEndDate"].ToString());
            txtleasefixing.Text = row["LeaseFixing"].ToString();
            CBleaseregion.Text = row["SettleAdress_Sh_R_Nme"].ToString();
            if (row["SettleAdress_Sh_R_ID"].ToString() != "0")
            {
                CBleaseregion.Value = row["SettleAdress_Sh_R_ID"].ToString();
            }
            CBleaseType.Text = row["TypeUseLand"].ToString();
            if (row["TypeUseLand"].ToString() != "0")
            {
                CBleaseType.Value = row["TypeUseLand"].ToString();
            }
            CBleaseQK.Text = row["SettleAdress_q_k_Name"].ToString();
            if (row["SettleAdress_q_k_ID"].ToString() != "0")
            {
                CBleaseQK.Value = row["SettleAdress_q_k_ID"].ToString();
            }
            CbleaseStreet.Text = row["Street"].ToString();
            CBleaseHome.Text = row["Home"].ToString();
            CBleaseFlat.Text = row["Flat"].ToString();
            // CbZonaLiving.Value = row["Zona"].ToString();
            txtleaseArea.Text = row["GeneralArea"].ToString();
            txtleaseFaktor.Text = row["TaxRate"].ToString();

        }
    }
    protected void FillCompanentOnEditTrade(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from TradeService where TradeID=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DETradeRegistrDate.Date = Convert.ToDateTime(row["RegistrDate"].ToString());
            txtTradeDocNum.Text = row["ContractDocNum"].ToString();
            DETradeGivDate.Date = Convert.ToDateTime(row["ContractGiveDate"].ToString());
            DETradeBeginDate.Date = Convert.ToDateTime(row["ContractBeginDate"].ToString());
            DETradeEndDate.Date = Convert.ToDateTime(row["ContractEndDate"].ToString());
            txtTradeLandArea.Text = row["LandArea"].ToString();
            CBTradeRegion.Text = row["RegionName"].ToString();
            if (row["RegionID"].ToString() != "0")
            {
                CBTradeRegion.Value = row["RegionID"].ToString();
            }
            string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
            FillComboBox(CBTradeVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBTradeRegion.Value.ToString());
            CBTradeVillage.Text = row["VillageName"].ToString();
            
            if (row["VillageID"].ToString() != "0")
            {
                CBTradeVillage.Value = row["VillageID"].ToString();
            }
            CBTradeStreet.Text = row["Street"].ToString();
            CBTradeHome.Text = row["Home"].ToString();
            CBTradeFlat.Text = row["Flat"].ToString();
            CbTradeServicesType.Value = row["ServiceType"].ToString();

        }
    }
    protected void FillCompanentOnEditMeden(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from MineTax where MineId=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DEMedenRegstrDate.Date = Convert.ToDateTime(row["MineRegistrDate"].ToString());
            CbMedenType.Text = row["MineType"].ToString();
            if (row["MineTypeID"].ToString() != "0")
            {
                CbMedenType.Value = row["MineTypeID"].ToString();
            }
            txtPositionAdres.Text = row["MinePositionArea"].ToString();
            CbMedenRegion.Text = row["MineRegionName"].ToString();
            if (row["MineRegionID"].ToString() != "0")
            {
                CbMedenRegion.Value = row["MineRegionID"].ToString();
            }
            if (CbMedenRegion.Value != null)
            {
                string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as ";
                FillComboBox(CbMedenQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbMedenRegion.Value.ToString());
            }
            CbMedenQk.Text = row["MineVillage"].ToString();
            if (row["MineVillageId"].ToString() != "0")
            {
                CbMedenQk.Value = row["MineVillageId"].ToString();
            }
            CbMedenStreet.Text = row["MineStreet"].ToString();
            CbMedenHome.Text = row["MineHome"].ToString();
            CbMedenFlat.Text = row["MineFlat"].ToString();

        }
    }
    protected void FillCompanentOnEditAdvertisement(Int64 id)
    {
        SqlDataAdapter dap = new SqlDataAdapter(@"Select * from Advertisement where AdvertisementID=" + id.ToString(), connsql.baglan());
        DataTable dt = new DataTable();
        dap.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            DEAdvertisementRegisterDate.Date = Convert.ToDateTime(row["RegisterDate"].ToString());
            CBAdvertisementKateqoriya.Text = row["Kateqoriya"].ToString();
            if (row["Kateqoriya"].ToString() != "0")
            {
                CBAdvertisementKateqoriya.Value = row["Kateqoriya"].ToString();
            }
            
            CbAdvertisementRegionName.Text = row["RegionName"].ToString();
            if (row["RegionID"].ToString() != "0")
            {
                CbAdvertisementRegionName.Value = row["RegionID"].ToString();
            }
            CBAdvertisementVillageName.Text = row["VillageName"].ToString();
            if (row["VillageId"].ToString() != "0")
            {
                CBAdvertisementVillageName.Value = row["VillageId"].ToString();
            }
            CbAdvertisementStreet.Text = row["Street"].ToString();
            CBAdvertisementHome.Text = row["Home"].ToString();
            CbAdvertisementFlat.Text = row["Flat"].ToString();
            if (row["zonaABC"].ToString() != "1")
                RBAdvertisementA.Checked = true;
            if (row["zonaABC"].ToString() != "2")
                RBAdvertisementB.Checked = true;
            if (row["zonaABC"].ToString() != "3")
                RBAdvertisementC.Checked = true;
            LBAdvertisementFactor.Text = row["Factor"].ToString();
            txtAdvertisementSize.Text = row["AdvertisemenSize"].ToString();
            txtAdvertisementTema.Text = row["AdvertisemenTema"].ToString();
            txtAdvertisementEmsal.Text = row["AdvertisemenEmsal"].ToString();
            txtAdvertisementPermitDocNum.Text = row["AdvertisPermitDocNum"].ToString();
            DEAdvertisementPermitDate1.Date = Convert.ToDateTime(row["AdvertisPermitDocDate1"].ToString());
            DEAdvertisementPermitDate2.Date = Convert.ToDateTime(row["AdvertisPermitDocDate2"].ToString());
            txtContractDocNum.Text = row["ContractDocNum"].ToString();
            DEContractDocDate1.Date = Convert.ToDateTime(row["ContractDocDate1"].ToString());
            DEContractDocDate2.Date = Convert.ToDateTime(row["ContractDocDate2"].ToString());
            OutreachDate1.Date = Convert.ToDateTime(row["OutreachDate1"].ToString());
            OutreachDate2.Date = Convert.ToDateTime(row["OutreachDate2"].ToString());
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), zonaid = 0, consessionid = 0, Livingtypeid = 1, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if ((CbRegionliving.Text.Trim() != "") && (CbRegionliving.Text.Trim() != "Seçin") && (CbRegionliving.Value != null))
        {
            isnum = int.TryParse(CbRegionliving.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }

        float zonafactura = 1;
        if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Items.Count > 0)
        {
            isnum = int.TryParse(CbQKliving.Value.ToString(), out qkid);
        }

        //if (CbQKliving.Items.Count >= 2 && qkid == 0 && isnum == false && CbQKliving.Text.Length>)
        //{
        //    msg += "Qəsəbə/Kənd,";
        //}
        string TaxRate = CBVergiDerecesiLiving.Text;
        if (CbZonaLiving.Text.Trim() != "" && CbZonaLiving.Text.Trim() != "Seçin" && trzonaemsaliLiving.Visible == true)
        {
            isnum = int.TryParse(CbZonaLiving.Value.ToString(), out zonaid);
            zonafactura = float.Parse(connsql.getdatacell("Select FactorName from Factor where zonaID=" + CbZonaLiving.Value.ToString()).ToString());
        }
        else if (trzonaemsaliLiving.Visible == false)
        {
            zonaid = 1;
            zonafactura = 1;
            TaxRate = CBVergiDerecesiLiving.Text.Trim();
        }       
        
        if (RbGuzeshtHeLiving.Checked == true)
        {
            consessionid = 1;
        }
        if (RbGuzeshtYoxLiving.Checked == true)
        {
            consessionid = 2;
        }
        
        if (DERegistrDateLiving.Text == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (txtDocumentNumberLiving.Text == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini,";
        }
        if (DeGivingDateLiving.Text == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini,";
        }
        if (CbQKliving.Text == "" || CbQKliving.Text == "Seçin")
        {
            msg += "Qəsəbə/kəndi,";
        }
        if (CbZonaLiving.Text.Trim() == "Seçin" && trzonaemsaliLiving.Visible == true)
        {
            msg += "Zona əmsalını,";
        }
        if (txtGeneralAreaLiving.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CBVergiDerecesiLiving.Text.Trim() == "Seçin" && trzonaemsaliLiving.Visible == false)
        {
            msg += "vergi dərəcəsini,";
        }
        if (RbGuzeshtYoxLiving.Checked == false && RbGuzeshtHeLiving.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (DERegistrDateLiving.Text.Length <8 || DeGivingDateLiving.Text.Length <8 || txtDocumentNumberLiving.Text == "" || msg.Length > 3)
        {
            msgdocument1.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Xəta", "alert('" + msg + " qeyd edin')", true);
            //  Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
            msgdocument1.ForeColor = System.Drawing.Color.Red;
        }
              else
        {           
            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name, Street, Home,  Flat, GeneralArea, Zona,ZonaFactor,TaxRate, Concession, LivingType, TypeOfDocument) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name, @Street, @Home,  @Flat, @GeneralArea, @Zona, @ZonaFactor,@TaxRate, @Concession, @LivingType, @TypeOfDocument)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DERegistrDateLiving.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtDocumentNumberLiving.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DeGivingDateLiving.Date);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbRegionliving.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQKliving.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CbStreetliving.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbHomeliving.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbFletLiving.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtGeneralAreaLiving.Text.Trim());
            cmd.Parameters.AddWithValue("Zona", zonaid);
            cmd.Parameters.AddWithValue("ZonaFactor",zonafactura);
            cmd.Parameters.AddWithValue("TaxRate", TaxRate);
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.ExecuteNonQuery();
            selectlivingProperty();
            msgdocument1.ForeColor = System.Drawing.Color.Green;
            msgdocument1.Text = "Məlumatlar bazaya daxil oldu";
            clrLivPro();
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "İnfo", "alert('" + "Məlumatlar bazaya daxil oldu" + "')", true);

        }
    }
    protected void DataListLivPro_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       // msgdocument1.Text = e.CommandArgument.ToString();
        if (e.CommandName == "deleterowLivPro")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectlivingProperty();
        }
        if (e.CommandName == "UpdaterowLivPro")
        {
            FillCompanentOnEditLivPro(int.Parse(e.CommandArgument.ToString()));
            Label1.Text = e.CommandArgument.ToString();
        }
        
    }
    protected void btnupdateLivPro_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid  = int.Parse(TaxpayerID), zonaid = 0, consessionid = 0, Livingtypeid = 1, Typeofdocumentid = 1, LivingAreaID=int.Parse(Label1.Text);

        string msg = "";
        bool isnum = false;
        if ((CbRegionliving.Text.Trim() != "") && (CbRegionliving.Text.Trim() != "Seçin") && (CbRegionliving.Value != null))
        {
            isnum = int.TryParse(CbRegionliving.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }

        float zonafactura = 1;
        if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Items.Count > 0)
        {
            isnum = int.TryParse(CbQKliving.Value.ToString(), out qkid);
        }

        //if (CbQKliving.Items.Count >= 2 && qkid == 0 && isnum == false)
        //{
        //    msg += "Qəsəbə/Kənd,";
        //}

        if (RbGuzeshtHeLiving.Checked == true)
        {
            consessionid = 1;
        }
        if (RbGuzeshtYoxLiving.Checked == true)
        {
            consessionid = 2;
        }
        string TaxRate = CBVergiDerecesiLiving.Text;
        if (CbZonaLiving.Text.Trim() != "" && CbZonaLiving.Text.Trim() != "Seçin" && trzonaemsaliLiving.Visible == true)
        {
            isnum = int.TryParse(CbZonaLiving.Value.ToString(), out zonaid);
            zonafactura = float.Parse(connsql.getdatacell("Select FactorName from Factor where zonaID=" + CbZonaLiving.Value.ToString()).ToString());
        }
        else if (trzonaemsaliLiving.Visible == false)
        {
            zonaid = 1;
            zonafactura = 1;
            TaxRate = CBVergiDerecesiLiving.Text.Trim();
        }


        if (DERegistrDateLiving.Text == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (txtDocumentNumberLiving.Text == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini,";
        }
        if (DeGivingDateLiving.Text == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini,";
        }
        if (CbQKliving.Text == "" || CbQKliving.Text == "Seçin")
        {
            msg += "Qəsəbə/kəndi,";
        }
        if (CbZonaLiving.Text.Trim() == "Seçin" && trzonaemsaliLiving.Visible == true)
        {
            msg += "Zona əmsalını,";
        }
        if (txtGeneralAreaLiving.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CBVergiDerecesiLiving.Text.Trim() == "Seçin" && trzonaemsaliLiving.Visible == false)
        {
            msg += "vergi dərəcəsini,";
        }
        if (RbGuzeshtYoxLiving.Checked == false && RbGuzeshtHeLiving.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (DERegistrDateLiving.Text.Length < 8 || DeGivingDateLiving.Text.Length < 8 || txtDocumentNumberLiving.Text == "" || msg.Length > 3)
        {
            msgdocument1.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Xəta", "alert('" + msg + " qeyd edin')", true);
            //  Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
            msgdocument1.ForeColor = System.Drawing.Color.Red;
        }
        else
              {
                  SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, 
                      GivingDate=@GivingDate, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name, Street=@Street, Home=@Home, 
                      Flat=@Flat, GeneralArea=@GeneralArea, Zona=@Zona,ZonaFactor=@ZonaFactor,TaxRate=@TaxRate, Concession=@Concession, LivingType=@LivingType,
                      TypeOfDocument=@TypeOfDocument where LivingAreaID=@LivingAreaID", connsql.baglan());
                  cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
                  cmd.Parameters.AddWithValue("RegistrDate", DERegistrDateLiving.Date);
                  cmd.Parameters.AddWithValue("DocumentNumber", txtDocumentNumberLiving.Text.Trim());
                  cmd.Parameters.AddWithValue("GivingDate", DeGivingDateLiving.Date);
                  cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
                  cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbRegionliving.Text.Trim());
                  cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
                  cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQKliving.Text.Trim());
                  cmd.Parameters.AddWithValue("Street", CbStreetliving.Text.Trim());
                  cmd.Parameters.AddWithValue("Home", CbHomeliving.Text.Trim());
                  cmd.Parameters.AddWithValue("Flat", CbFletLiving.Text.Trim());
                  cmd.Parameters.AddWithValue("GeneralArea", txtGeneralAreaLiving.Text.Trim());
                  cmd.Parameters.AddWithValue("Zona", zonaid);
                  cmd.Parameters.AddWithValue("ZonaFactor", zonafactura);
                  cmd.Parameters.AddWithValue("TaxRate", CBVergiDerecesiLiving.Text);
                  cmd.Parameters.AddWithValue("Concession", consessionid);
                  cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
                  cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
                  cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
                  cmd.ExecuteNonQuery();
                  selectlivingProperty();
                  msgdocument1.ForeColor = System.Drawing.Color.Green;
                  msgdocument1.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
                  clrLivPro();
              }
    }
    protected void DataListLivLand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowLivland")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectlivingLand();
        }
        if (e.CommandName == "UpdaterowLivLand")
        {
            FillCompanentOnEditLivLand(int.Parse(e.CommandArgument.ToString()));
            LbIdLivingAreaLivingLand.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnLivingLandSave_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), consessionid = 0, TypeUseLandid = 0, Livingtypeid = 2, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if ((CbLivLandregion.Text.Trim() != "") && (CbLivLandregion.Text.Trim() != "Seçin") && (CbLivLandregion.Value != null))
        {
            isnum = int.TryParse(CbLivLandregion.Value.ToString(), out regionid);
        }

        if ((CbLivingLandUsingtype.Text.Trim() != "") && (CbLivingLandUsingtype.Text.Trim() != "Seçin") && (CbLivingLandUsingtype.Value != null))
        {
            isnum = int.TryParse(CbLivingLandUsingtype.Value.ToString(), out TypeUseLandid);
        }

        if (DELivLandRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (!isnum || CbLivingLandUsingtype.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növü,";
        }
        

        if (CbLivLandQK.Text.Trim() != "" && CbLivLandQK.Text.Trim() != "Seçin" && CbLivLandQK.Value != null)
           {
               isnum = int.TryParse(CbLivLandQK.Value.ToString(), out qkid);
           }

        if (txtLivingLandDocNumber.Text.Trim() == "")
        {
            msg += "Sənədin nömrəsini,";
        }
        if (DELivingLandDocumentDate.Text.Trim() == "")
        {
            msg += "Sənədin verilmə tarixini,";
        }
        if (DELivLandUsingdate1.Text.Trim() == "")
        {
            msg += "İstifadəyə başlanma tarixini,";
        }
        if (CbLivLandQK.Text.Trim() == "Seçin" || CbLivLandQK.Text.Trim() == "")
            {
                msg += "Qəsəbə/Kənd,";
            }         
        

        if (RbLivLandhe.Checked == true)
        {
            consessionid = 1;
        }
        if (RbLivLandyox.Checked == true)
        {
            consessionid = 2;
        }
        if (txtLivLandGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CbLivingLandFactor.Text.Trim() == "" || CbLivingLandFactor.Text.Trim() == "Seçin")
        {
            msg += "Vergi dərəcəsini,";
        }
        if (RbLivLandyox.Checked == false && RbLivLandhe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        string txtdate2 = "";
        if (DELivLandUsingdate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
        if (msg.Length>3 )
        {
            MsgLivingLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgLivingLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate, UsingBeginDate, UsingEndDate, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name,TypeUseLand, Street, Home,  Flat, GeneralArea, TaxRate, Concession, LivingType, TypeOfDocument) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate, @UsingBeginDate, @UsingEndDate, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name,@TypeUseLand, @Street, @Home,  @Flat, @GeneralArea,@TaxRate, @Concession, @LivingType, @TypeOfDocument)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DELivLandRegisterDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtLivingLandDocNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DELivingLandDocumentDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DELivLandUsingdate1.Date);
            if (DELivLandUsingdate2.Text.Trim()!="")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DELivLandUsingdate2.Date);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", Convert.ToDateTime(txtdate2));
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbLivLandregion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbLivLandQK.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbLivLandStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbLivLandHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBLivLandFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtLivLandGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", CbLivingLandFactor.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.ExecuteNonQuery();
            selectlivingLand();
            clrlivLand();
            MsgLivingLand.ForeColor = System.Drawing.Color.Green;
            MsgLivingLand.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void BtnLivingLandEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID),  consessionid = 0, TypeUseLandid = 0, Livingtypeid = 2, Typeofdocumentid = 1, LivingAreaID = int.Parse(LbIdLivingAreaLivingLand.Text);
        string msg = "";
        bool isnum = false;
        if ((CbLivLandregion.Text.Trim() != "") && (CbLivLandregion.Text.Trim() != "Seçin") && (CbLivLandregion.Value != null))
        {
            isnum = int.TryParse(CbLivLandregion.Value.ToString(), out regionid);
        }

        if ((CbLivingLandUsingtype.Text.Trim() != "") && (CbLivingLandUsingtype.Text.Trim() != "Seçin") && (CbLivingLandUsingtype.Value != null))
        {
            isnum = int.TryParse(CbLivingLandUsingtype.Value.ToString(), out TypeUseLandid);
        }

        if (DELivLandRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (!isnum || CbLivingLandUsingtype.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növü,";
        }


        if (CbLivLandQK.Text.Trim() != "" && CbLivLandQK.Text.Trim() != "Seçin" && CbLivLandQK.Value != null)
        {
            isnum = int.TryParse(CbLivLandQK.Value.ToString(), out qkid);
        }

        if (txtLivingLandDocNumber.Text.Trim() == "")
        {
            msg += "Sənədin nömrəsini,";
        }
        if (DELivingLandDocumentDate.Text.Trim() == "")
        {
            msg += "Sənədin verilmə tarixini,";
        }
        if (DELivLandUsingdate1.Text.Trim() == "")
        {
            msg += "İstifadəyə başlanma tarixini,";
        }
        if (CbLivLandQK.Text.Trim() == "Seçin" || CbLivLandQK.Text.Trim() == "")
        {
            msg += "Qəsəbə/Kənd,";
        }


        if (RbLivLandhe.Checked == true)
        {
            consessionid = 1;
        }
        if (RbLivLandyox.Checked == true)
        {
            consessionid = 2;
        }
        if (txtLivLandGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CbLivingLandFactor.Text.Trim() == "" || CbLivingLandFactor.Text.Trim() == "Seçin")
        {
            msg += "Vergi dərəcəsini,";
        }
        if (RbLivLandyox.Checked == false && RbLivLandhe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        string txtdate2 = "";
        if (DELivLandUsingdate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
        //if (regionid == 1 || (zonaid != 0 && regionid == 1))
        if (msg.Length >3)
        {
            MsgLivingLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgLivingLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, 
                      GivingDate=@GivingDate,UsingBeginDate=@UsingBeginDate,UsingEndDate=@UsingEndDate, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, 
                      SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name,TypeUseLand=@TypeUseLand, Street=@Street, Home=@Home, 
                      Flat=@Flat, GeneralArea=@GeneralArea,TaxRate=@TaxRate, Concession=@Concession, LivingType=@LivingType,
                      TypeOfDocument=@TypeOfDocument where LivingAreaID=@LivingAreaID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DELivLandRegisterDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtLivingLandDocNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DELivingLandDocumentDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DELivLandUsingdate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DELivLandUsingdate2.Date);
            }
            
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbLivLandregion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbLivLandQK.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbLivLandStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbLivLandHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBLivLandFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtLivLandGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", CbLivingLandFactor.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
            cmd.ExecuteNonQuery();
            selectlivingLand();
            clrlivLand();
            MsgLivingLand.ForeColor = System.Drawing.Color.Green;
            MsgLivingLand.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void BtnNewQlivPro_Click(object sender, EventArgs e)
    {
        //Yashayish
    }
    protected void BtnEditQlivPro_Click(object sender, EventArgs e)
    {
       //Yashayish
    }
    protected void BtnEditQlivLand_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), TypeUseLandid = 0,consessionid = 0, Livingtypeid = 4, Typeofdocumentid = 1, LivingAreaID = int.Parse(LbIdQlivLand.Text);
        string msg = "";
        bool isnum = false;
        if (DEQlivLandRegister.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (CbQlivLandUsingLand.Text.Trim() == "" || CbQlivLandUsingLand.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növünü, ";
        }
        if (txtQlivLandDocumentNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini, ";
        }
        if (DEQlivLandGiveDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini, ";
        }
        if (DEQlivLandUsingDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }
        if ((CbQlivLandRegion.Text.Trim() != "") && (CbQlivLandRegion.Text.Trim() != "Seçin") && (CbQlivLandRegion.Value != null))
        {
            isnum = int.TryParse(CbQlivLandRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if ((CbQlivLandUsingLand.Text.Trim() != "") && (CbQlivLandUsingLand.Text.Trim() != "Seçin") && (CbQlivLandUsingLand.Value != null))
        {
            isnum = int.TryParse(CbQlivLandUsingLand.Value.ToString(), out TypeUseLandid);
        }

        string txtdate2 = "";
        if (DEQlivLandUsingDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }


        if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value != null)
        {
            isnum = int.TryParse(CbQKliving.Value.ToString(), out qkid);
        }

        if (CbQlivLandTaxRate.Text.Trim() == "" || CbQlivLandTaxRate.Text.Trim() == "Seçin")
        {
            msg += "Vergi dərəcəsini, ";
        }

        if (txtQlivLandGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }

        if (RBQlivLAndhe.Checked == true)
        {
            consessionid = 1;
        }
        if (RBQlivLAndyox.Checked == true)
        {
            consessionid = 2;
        }
        if (RBQlivLAndyox.Checked == false && RBQlivLAndhe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (msg.Length > 3)
        {
            MsgQlivLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgQlivLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, 
                      GivingDate=@GivingDate,UsingBeginDate=@UsingBeginDate,UsingEndDate=@UsingEndDate, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, 
                      SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name,TypeUseLand=@TypeUseLand, Street=@Street, Home=@Home, 
                      Flat=@Flat,TaxRate=@TaxRate,Concession=@Concession, GeneralArea=@GeneralArea, LivingType=@LivingType,
                      TypeOfDocument=@TypeOfDocument where LivingAreaID=@LivingAreaID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DEQlivLandRegister.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtQlivLandDocumentNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DEQlivLandGiveDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DEQlivLandUsingDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DEQlivLandUsingDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbQlivLandRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQlivLandQk.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbQlivLandStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbQlivLandHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBQlivLandFlat.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", CbQlivLandTaxRate.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("GeneralArea", txtQlivLandGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
            cmd.ExecuteNonQuery();
            selectQlivingLand();
            clrQlivLand();
            MsgQlivLand.ForeColor = System.Drawing.Color.Green;
            MsgQlivLand.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void BtnNewQlivLand_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), consessionid = 0, TypeUseLandid = 0, Livingtypeid = 4, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if (DEQlivLandRegister.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (CbQlivLandUsingLand.Text.Trim() == "" || CbQlivLandUsingLand.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növünü, ";
        }
        if (txtQlivLandDocumentNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini, ";
        }
        if (DEQlivLandGiveDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini, ";
        }
        if (DEQlivLandUsingDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }
        if ((CbQlivLandRegion.Text.Trim() != "") && (CbQlivLandRegion.Text.Trim() != "Seçin") && (CbQlivLandRegion.Value != null))
        {
            isnum = int.TryParse(CbQlivLandRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if ((CbQlivLandUsingLand.Text.Trim() != "") && (CbQlivLandUsingLand.Text.Trim() != "Seçin") && (CbQlivLandUsingLand.Value != null))
        {
            isnum = int.TryParse(CbQlivLandUsingLand.Value.ToString(), out TypeUseLandid);
        }

        string txtdate2 = "";
        if (DEQlivLandUsingDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }

       
           if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value!=null)
           {
               isnum = int.TryParse(CbQKliving.Value.ToString(),out qkid);
           }

           if (CbQlivLandTaxRate.Text.Trim() == "" || CbQlivLandTaxRate.Text.Trim() == "Seçin")
            {
                msg += "Vergi dərəcəsini, ";
            }
         
        if (txtQlivLandGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }

        if (RBQlivLAndhe.Checked == true)
        {
            consessionid = 1;
        }
        if (RBQlivLAndyox.Checked == true)
        {
            consessionid = 2;
        }
        if (RBQlivLAndyox.Checked == false && RBQlivLAndhe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (msg.Length>3)
        {
            MsgQlivLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgQlivLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate, UsingBeginDate, UsingEndDate, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name,TypeUseLand, Street, Home,  Flat,TaxRate,Concession, GeneralArea, LivingType, TypeOfDocument) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate, @UsingBeginDate, @UsingEndDate, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name,@TypeUseLand, @Street, @Home,  @Flat,@TaxRate,@Concession, @GeneralArea, @LivingType, @TypeOfDocument)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DEQlivLandRegister.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtQlivLandDocumentNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DEQlivLandGiveDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DEQlivLandUsingDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DEQlivLandUsingDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbQlivLandRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQlivLandQk.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbQlivLandStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbQlivLandHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBQlivLandFlat.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", CbQlivLandTaxRate.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("GeneralArea", txtQlivLandGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);            
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.ExecuteNonQuery();
            selectQlivingLand();
            clrQlivLand();
            MsgQlivLand.ForeColor = System.Drawing.Color.Green;
            MsgQlivLand.Text = "Məlumatlar bazaya daxil oldu";
        }
    }

    protected void DataListQLivLand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowQLivLand")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectQlivingLand();
        }
        if (e.CommandName == "UpdaterowQLivLand")
        {
            FillCompanentOnEditQLivLand(int.Parse(e.CommandArgument.ToString()));
            LbIdQlivLand.Text = e.CommandArgument.ToString();
        }
    }
    protected void clrQlivPro()
    {
        DeQlivProregistrDate.Text = "";
        txtQLivProDocumentNumber.Text = "";
        DEQlivProDocumentDate.Text = "";
       // txtQlivProObjectKod.Text = "";
        if (int.Parse(RegionID) > 14)
        {
           // CbQlivProRegion.SelectedIndex = 0;
            CBQlivproTAxRate.SelectedIndex = 0;
        }
        CbQlivProQK.SelectedIndex = 0;
        CbQlivProStreet.Text = "";
        CbQlivProHome.Text = "";
        CbQlivProFlat.Text = "";
        CbQlivProZona.SelectedIndex = 0;
        txtQlivProGeneralArea.Text = "";
        
    }
    protected void clrlivLand()
    {
        DELivLandRegisterDate.Text = "";
        txtLivingLandDocNumber.Text = "";
        CbLivingLandUsingtype.SelectedIndex = 0;
        DELivingLandDocumentDate.Text = "";
        DELivLandUsingdate1.Text = "";
        DELivLandUsingdate2.Text = "";
        if (int.Parse(RegionID) > 14)
        {
           // CbLivLandregion.SelectedIndex = 0;
        }
        CbLivLandQK.SelectedIndex = 0;
        CbLivLandStreet.Text = "";
        CbLivLandHome.Text = "";
        CBLivLandFlat.Text = "";      
        txtLivLandGeneralArea.Text = "";
        if (int.Parse(RegionID) > 14)
        {
            CbLivingLandFactor.SelectedIndex = 0;
        }
        RbLivLandhe.Checked = false;
        RbLivLandyox.Checked = false;
    }
    protected void clrlease()
    {
        DeleaseRegistrDate.Text = "";
        txtleaseDocNum.Text = "";
        DeleaseDocGivDate.Text = "";
        DEleaseDocDate1.Text = "";
        DEleaseDocDate2.Text = "";
        txtleasefixing.Text = "";
        CBleaseType.SelectedIndex = 0;
       // CBleaseregion.SelectedIndex = 0;
        CBleaseQK.SelectedIndex = 0;
        CbleaseStreet.Text = "";
        CBleaseHome.Text = "";
        CBleaseFlat.Text = "";
        txtleaseArea.Text = "";
        txtleaseFaktor.Text = "";
    }
    protected void clrQlivLand()
    {
        DEQlivLandRegister.Text = "";
        txtQlivLandDocumentNumber.Text = "";
        CbQlivLandUsingLand.SelectedIndex = 0;
        DEQlivLandGiveDate.Text = "";
        DEQlivLandUsingDate1.Text = "";
        DEQlivLandUsingDate2.Text = "";
        if (int.Parse(RegionID) > 14)
        {
           // CbQlivLandRegion.SelectedIndex = 0;
            CbQlivLandTaxRate.SelectedIndex = 0;
        }
        CbQlivLandQk.SelectedIndex = 0;
        CbQlivLandStreet.Text = "";
        CbQlivLandHome.Text = "";
        CBQlivLandFlat.Text = "";
        CbQlivProZona.SelectedIndex = 0;
        txtQlivLandGeneralArea.Text = "";
        
        RBQlivLAndhe.Checked = false;
        RBQlivLAndyox.Checked = false;
    }
    protected void clrVillageLand()
    {
        DeVillageRegistr.Text = "";
        txtVillageDocumetNumber.Text = "";
        CbVillageUseType.SelectedIndex = 0;
        DeVillageGivDate.Text = "";
        DeVillageUseDate1.Text = "";
        DeVillageUseDate2.Text = "";
       // CbVillageRegion.SelectedIndex = 0;
        CbVillageQk.SelectedIndex = 0;
        CbVillageStreet.Text = "";
        CbVillageHome.Text = "";
        CbVillageFlat.Text = "";
        txtVillageArea.Text = "";
        CbVillageQualityGroup.SelectedIndex = 0;
        txtVillageConditionalPoints.Text = "";
        RBVillageHe.Checked = false;
        RBVillageYox.Checked = false;
    }
    protected void clrPrivate()
    {
        DEPrivateRegistrdate.Text = "";
        CBPrivateType.SelectedIndex = 0;
      //  CBPrivateRegion.SelectedIndex = 0;
        CBPrivateVillage.SelectedIndex = 0;
        CBPrivatestreet.Text = "";
        CBPrivateHome.Text = "";
        CBPrivateFlat.Text = "";
        DEPrivatContracDate.Text = "";
        txtPrivatContractNum.Text = "";
        txtPrivateAmount.Text = "";

        CBQlivproTAxRate.SelectedIndex = 0;
    }
    protected void clrTrade()
    {
        DETradeRegistrDate.Text = "";
        txtTradeDocNum.Text = "";
        DETradeGivDate.Text = "";
        DETradeBeginDate.Text = "";
        DETradeEndDate.Text = "";
        txtTradeLandArea.Text = "";
      //  CBTradeRegion.SelectedIndex = 0;

        CBTradeVillage.SelectedIndex = 0;
        CBTradeStreet.SelectedIndex = 0;
        CBTradeHome.SelectedIndex = 0;
        CBTradeFlat.SelectedIndex = 0;
        CbTradeServicesType.SelectedIndex = 0;
    }
    protected void clrHotel()
    {
        DeHotelRegisterDate.Text = "";
        CbHoletType.SelectedIndex = 0;
        txtHotelName.Text = "";
        DEHotelServicesDate1.Text = "";
        DEHotelServicesDate2.Text = "";
    }
    protected void clrCarStop()
    {
        DECarStopRegisterDate.Text = "";
        RBCarType1.Checked = false;
        RBCarType2.Checked = false;
        RBCarType3.Checked = false;
        RBCarType4.Checked = false;
        txtCarArea.Text = "";
        txtCarCount.Text = "";
        DECarDate1.Text = "";
        DECarDate2.Text = "";
      //  CBCarRegion.SelectedIndex = 0;
        CBCarVillage.SelectedIndex = 0;
        CBCarStreet.SelectedIndex = 0;
        CBCarHome.SelectedIndex = 0;
        CbCarFlat.SelectedIndex = 0;
    }
    protected void clrAdvertisement()
    {
        DEAdvertisementRegisterDate.Text = "";
        CBAdvertisementKateqoriya.SelectedIndex = 0;
        RBAdvertisementA.Checked = false;
        RBAdvertisementB.Checked = false;
        RBAdvertisementC.Checked = false;
     //   CbAdvertisementRegionName.SelectedIndex = 0;
        CBAdvertisementVillageName.SelectedIndex = 0;
        CbAdvertisementStreet.SelectedIndex = 0;
        CBAdvertisementHome.SelectedIndex = 0;
        CbAdvertisementFlat.SelectedIndex = 0;
        LBAdvertisementFactor.Text = "";
        txtAdvertisementSize.Text = "";
        txtAdvertisementTema.Text = "";
        txtAdvertisementEmsal.Text = "";
        txtAdvertisementPermitDocNum.Text = "";
        DEAdvertisementPermitDate1.Text = "";
        DEAdvertisementPermitDate2.Text = "";
        txtContractDocNum.Text = "";
        DEContractDocDate1.Text = "";
        DEContractDocDate2.Text = "";
        OutreachDate1.Text = "";
        OutreachDate2.Text = ""; 
    }
    protected void BtnQlivProNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), zonaid = 0, Livingtypeid = 3, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if ((CbQlivProRegion.Text.Trim() != "") && (CbQlivProRegion.Text.Trim() != "Seçin") && (CbQlivProRegion.Value != null))
        {
            isnum = int.TryParse(CbQlivProRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }
        /*
           if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value!=null)
           {
               isnum = int.TryParse(CbQKliving.Value.ToString(),out qkid);
           }
          
            if (CbQKliving.Items.Count!=0 && qkid==0 && isnum==false)
            {
                msg += "Qəsəbə/Kənd,";
            }
          */
        if (DeQlivProregistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (txtQLivProDocumentNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini,";
        }
        if (DEQlivProDocumentDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin tarixini,";
        }
        //if (txtQlivProObjectKod.Text.Trim() == "")
        //{
        //    msg += "Obyektin kodunu,";
        //}
        if (txtQlivProGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CBQlivproTAxRate.Text.Trim() == "")
        {
            msg += "Vergi dərəcəsini,";
        }
        float zonafactura=1;
        isnum = false;
        if (CbQlivProZona.Text.Trim() != "" && CbQlivProZona.Text.Trim() != "Seçin" && CbQlivProZona.Visible==true)
        {
            isnum = int.TryParse(CbQlivProZona.Value.ToString(), out zonaid);
            zonafactura = float.Parse(connsql.getdatacell("Select FactorName from Factor where zonaID=" + CbQlivProZona.Value.ToString()).ToString());
        }
        else if (CbQlivProZona.Visible == false)
        {
            zonaid = 1;
            zonafactura = 1;
          //  TaxRate = CBVergiDerecesiLiving.Text.Trim();
        }
        if (!isnum && CbQlivProZona.Visible == true)
        {
            msg += "Zona əmsalını,";
        }

      
        //if (regionid == 1 || (zonaid != 0 && regionid == 1))
        if (msg.Length>3)
        {
            MsgQLivPro.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgQLivPro.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
           

            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate,ObjectCode, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name, Street, Home,  Flat, GeneralArea, Zona,ZonaFactor, TaxRate, LivingType, TypeOfDocument) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate,@ObjectCode, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name, @Street, @Home,  @Flat, @GeneralArea, @Zona,@ZonaFactor, @TaxRate, @LivingType, @TypeOfDocument)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeQlivProregistrDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtQLivProDocumentNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DEQlivProDocumentDate.Date);
            cmd.Parameters.AddWithValue("ObjectCode", "");
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbQlivProRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQlivProQK.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CbQlivProStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbQlivProHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbQlivProFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtQlivProGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("Zona", zonaid);
            cmd.Parameters.AddWithValue("ZonaFactor", zonafactura);
            cmd.Parameters.AddWithValue("TaxRate", CBQlivproTAxRate.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.ExecuteNonQuery();
            selectQlivingProperty();
            clrQlivPro();
            MsgQLivPro.ForeColor = System.Drawing.Color.Green;
            MsgQLivPro.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void BtnQlivProEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), zonaid = 0,  Livingtypeid = 3, Typeofdocumentid = 1, LivingAreaID = int.Parse(LbQLivPro.Text);
        string msg = "";
        bool isnum = false;
        if ((CbQlivProRegion.Text.Trim() != "") && (CbQlivProRegion.Text.Trim() != "Seçin") && (CbQlivProRegion.Value != null))
        {
            isnum = int.TryParse(CbQlivProRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }
        /*
           if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value!=null)
           {
               isnum = int.TryParse(CbQKliving.Value.ToString(),out qkid);
           }
          
            if (CbQKliving.Items.Count!=0 && qkid==0 && isnum==false)
            {
                msg += "Qəsəbə/Kənd,";
            }
          */
        if (DeQlivProregistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini,";
        }
        if (txtQLivProDocumentNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini,";
        }
        if (DEQlivProDocumentDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin tarixini,";
        }
        //if (txtQlivProObjectKod.Text.Trim() == "")
        //{
        //    msg += "Obyektin kodunu,";
        //}
        if (txtQlivProGeneralArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni,";
        }
        if (CBQlivproTAxRate.Text.Trim() == "")
        {
            msg += "Vergi dərəcəsini,";
        }
        float zonafactura=1;
        isnum = false;
        if (CbQlivProZona.Text.Trim() != "" && CbQlivProZona.Text.Trim() != "Seçin" && CbQlivProZona.Visible==true)
        {
            isnum = int.TryParse(CbQlivProZona.Value.ToString(), out zonaid);
            zonafactura = float.Parse(connsql.getdatacell("Select FactorName from Factor where zonaID=" + CbQlivProZona.Value.ToString()).ToString());
        }
        else if (CbQlivProZona.Visible == false)
        {
            zonaid = 1;
            zonafactura = 1;
          //  TaxRate = CBVergiDerecesiLiving.Text.Trim();
        }
        if (!isnum && CbQlivProZona.Visible == true)
        {
            msg += "Zona əmsalını,";
        }


        //if (regionid == 1 || (zonaid != 0 && regionid == 1))
        if (msg.Length > 3)
        {
            MsgQLivPro.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgQLivPro.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            
            SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, 
                      GivingDate=@GivingDate, ObjectCode=@ObjectCode, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name, Street=@Street, Home=@Home, 
                      Flat=@Flat, GeneralArea=@GeneralArea, Zona=@Zona,ZonaFactor=@ZonaFactor, TaxRate=@TaxRate, LivingType=@LivingType,
                      TypeOfDocument=@TypeOfDocument where LivingAreaID=@LivingAreaID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeQlivProregistrDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtQLivProDocumentNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DEQlivProDocumentDate.Date);
            cmd.Parameters.AddWithValue("ObjectCode", "");
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbQlivProRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbQlivProQK.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CbQlivProStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbQlivProHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbQlivProFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtQlivProGeneralArea.Text.Trim());
            cmd.Parameters.AddWithValue("Zona", zonaid);
            cmd.Parameters.AddWithValue("ZonaFactor", zonafactura);
            cmd.Parameters.AddWithValue("TaxRate", CBQlivproTAxRate.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
            cmd.ExecuteNonQuery();
            selectQlivingProperty();
            clrQlivPro();
            MsgQLivPro.ForeColor = System.Drawing.Color.Green;
            MsgQLivPro.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void DataListQLivpro_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowQLivPro")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectQlivingProperty();
        }
        if (e.CommandName == "UpdaterowQLivPro")
        {
            FillCompanentOnEditQLivPro(int.Parse(e.CommandArgument.ToString()));
            LbQLivPro.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnvillageEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), consessionid = 0, TypeUseLandid = 0, Livingtypeid = 5, Typeofdocumentid = 1, LivingAreaID = int.Parse(LbİdVillageLand.Text);
        string msg = "";
        bool isnum = false;
        if (DeVillageRegistr.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (CbVillageUseType.Text.Trim() == "" || CbVillageUseType.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növünü, ";
        }
        if ((CbVillageUseType.Text.Trim() != "") && (CbVillageUseType.Text.Trim() != "Seçin") && (CbVillageUseType.Value != null))
        {
            isnum = int.TryParse(CbVillageUseType.Value.ToString(), out TypeUseLandid);
        }
        if (txtVillageDocumetNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini, ";
        }
        if (DeVillageGivDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini, ";
        }
        if (DeVillageUseDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }

        if ((CbVillageRegion.Text.Trim() != "") && (CbVillageRegion.Text.Trim() != "Seçin") && (CbVillageRegion.Value != null))
        {
            isnum = int.TryParse(CbVillageRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (txtVillageArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }
        if (CbVillageQualityGroup.Text.Trim() == "" || CbVillageQualityGroup.Text.Trim() == "Seçin")
        {
            msg += "Keyfiyyət qrupunu, ";
        }
        if (txtVillageConditionalPoints.Text.Trim() == "")
        {
            msg += "Şərti balı, ";
        }
        float Taxrate = 0.06f;
        string txtdate2 = "";
        if (DeVillageUseDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }

        if (RBVillageHe.Checked == true)
        {
            consessionid = 1;
        }
        if (RBVillageYox.Checked == true)
        {
            consessionid = 2;
        }
        if (RBVillageYox.Checked == false && RBVillageHe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (msg.Length > 3)
        {
            MsgVillageLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgVillageLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, 
                      GivingDate=@GivingDate,UsingBeginDate=@UsingBeginDate,UsingEndDate=@UsingEndDate, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, 
                      SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name,TypeUseLand=@TypeUseLand, Street=@Street, Home=@Home, 
                      Flat=@Flat, GeneralArea=@GeneralArea,QualityGroup=@QualityGroup,ConditionalPoints=@ConditionalPoints,Concession=@Concession, TaxRate=@TaxRate, LivingType=@LivingType,
                      TypeOfDocument=@TypeOfDocument where LivingAreaID=@LivingAreaID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeVillageRegistr.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtVillageDocumetNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DeVillageGivDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DeVillageUseDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DeVillageUseDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbVillageRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbVillageQk.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbVillageStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbVillageHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbVillageFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtVillageArea.Text.Trim());
            cmd.Parameters.AddWithValue("QualityGroup", CbVillageQualityGroup.Text.Trim());
            cmd.Parameters.AddWithValue("ConditionalPoints", txtVillageConditionalPoints.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("TaxRate", Taxrate);
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
            cmd.ExecuteNonQuery();
            selectVillageLand();
            clrVillageLand();
            MsgVillageLand.ForeColor = System.Drawing.Color.Green;
            MsgVillageLand.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
   
    protected void BtnvillageNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), consessionid = 0, TypeUseLandid = 0, Livingtypeid = 5, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if (DeVillageRegistr.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (CbVillageUseType.Text.Trim() == "" || CbVillageUseType.Text.Trim() == "Seçin")
        {
            msg += "Torpağın istifadə növünü, ";
        }
        if ((CbVillageUseType.Text.Trim() != "") && (CbVillageUseType.Text.Trim() != "Seçin") && (CbVillageUseType.Value != null))
        {
            isnum = int.TryParse(CbVillageUseType.Value.ToString(), out TypeUseLandid);
        }        
        if (txtVillageDocumetNumber.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin nömrəsini, ";
        }
        if (DeVillageGivDate.Text.Trim() == "")
        {
            msg += "Mülkiyyət sənədinin verilmə tarixini, ";
        }
        if (DeVillageUseDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }

        if ((CbVillageRegion.Text.Trim() != "") && (CbVillageRegion.Text.Trim() != "Seçin") && (CbVillageRegion.Value != null))
        {
            isnum = int.TryParse(CbVillageRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (txtVillageArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }
        if (CbVillageQualityGroup.Text.Trim() == "" || CbVillageQualityGroup.Text.Trim() == "Seçin")
        {
            msg += "Keyfiyyət qrupunu, ";
        }
        if (txtVillageConditionalPoints.Text.Trim() == "")
        {
            msg += "Şərti balı, ";
        }
        float Taxrate = 0.06f;
        string txtdate2 = "";
        if (DeVillageUseDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }

        if (RBVillageHe.Checked == true)
        {
            consessionid = 1;
        }
        if (RBVillageYox.Checked == true)
        {
            consessionid = 2;
        }
        if (RBVillageYox.Checked == false && RBVillageHe.Checked == false)
        {
            msg += "Vergi güzəştini,";
        }
        if (msg.Length>3)
        {
            MsgVillageLand.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgVillageLand.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate, UsingBeginDate, UsingEndDate, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name,TypeUseLand, Street, Home,  Flat, GeneralArea, QualityGroup, ConditionalPoints, Concession,Taxrate, LivingType, TypeOfDocument) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate, @UsingBeginDate, @UsingEndDate, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name,@TypeUseLand, @Street, @Home,  @Flat, @GeneralArea, @QualityGroup, @ConditionalPoints, @Concession,@Taxrate, @LivingType, @TypeOfDocument)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeVillageRegistr.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtVillageDocumetNumber.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DeVillageGivDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DeVillageUseDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DeVillageUseDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CbVillageRegion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CbVillageQk.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbVillageStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CbVillageHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbVillageFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtVillageArea.Text.Trim());
            cmd.Parameters.AddWithValue("QualityGroup", CbVillageQualityGroup.Text.Trim());
            cmd.Parameters.AddWithValue("ConditionalPoints", txtVillageConditionalPoints.Text.Trim());
            cmd.Parameters.AddWithValue("Concession", consessionid);
            cmd.Parameters.AddWithValue("taxrate", Taxrate);
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.ExecuteNonQuery();
            selectVillageLand();
            clrVillageLand();
            MsgVillageLand.ForeColor = System.Drawing.Color.Green;
            MsgVillageLand.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void DataListVillageLand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowVillageLand")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectVillageLand();
        }
        if (e.CommandName == "UpdaterowVillageLand")
        {
            FillCompanentOnEditVillageLand(int.Parse(e.CommandArgument.ToString()));
            LbİdVillageLand.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnMedenNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), MunicipalID = 1, MineTypeID = 0;
        string msg = "";
        bool isnum = false;
        if ((CbMedenRegion.Text.Trim() != "") && (CbMedenRegion.Text.Trim() != "Seçin") && (CbMedenRegion.Value != null))
        {
            isnum = int.TryParse(CbMedenRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }
        if ((CbMedenType.Text.Trim() != "") && (CbMedenType.Text.Trim() != "Seçin") && (CbMedenType.Value != null))
        {
            isnum = int.TryParse(CbMedenType.Value.ToString(), out MineTypeID);
        }
        if (!isnum)
        {
            msg += "Torpağın istifadə növü,";
        }
        /*
           if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value!=null)
           {
               isnum = int.TryParse(CbQKliving.Value.ToString(),out qkid);
           }
          
            if (CbQKliving.Items.Count!=0 && qkid==0 && isnum==false)
            {
                msg += "Qəsəbə/Kənd,";
            }
          */
        //if (CbZonaLiving.Text.Trim() != "" && CbZonaLiving.Text.Trim() != "Seçin")
        //{
        //    isnum = int.TryParse(CbZonaLiving.Value.ToString(), out zonaid);
        //}
        //if (!isnum)
        //{
        //    msg += "Zona əmsalını,";
        //}

        //if (RbQLivLandhe.Checked == true)
        //{
        //    consessionid = 1;
        //}
        //if (RbLivLandyox.Checked == true)
        //{
        //    consessionid = 2;
        //}
        //if (RbLivLandyox.Checked == false && RbLivLandhe.Checked == false)
        //{
        //    msg += "Vergi güzəştini,";
        //}
        if (msg.Length>3)
        {
            MsgMeden.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgMeden.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"insert into MineTax (MineTypeID,MineType, MineRegistrDate, MinePositionArea, MineRegionId, MineRegionName, MineVillageId, MineVillage, MineStreet, MineHome, MineFlat, 
                      MunicipalId, TaxpayerId) values (@MineTypeID, @MineType, @MineRegistrDate, @MinePositionArea, @MineRegionId, @MineRegionName, @MineVillageId, @MineVillage, @MineStreet, @MineHome, @MineFlat, 
                      @MunicipalId, @TaxpayerId)", connsql.baglan());
            cmd.Parameters.AddWithValue("MineTypeID", MineTypeID);
            cmd.Parameters.AddWithValue("MineType", CbMedenType.Text);
            cmd.Parameters.AddWithValue("MineRegistrDate", DEMedenRegstrDate.Date);
            cmd.Parameters.AddWithValue("MinePositionArea", txtPositionAdres.Text.Trim());
            cmd.Parameters.AddWithValue("MineRegionId", regionid);
            cmd.Parameters.AddWithValue("MineRegionName", CbMedenRegion.Text.Trim());
            cmd.Parameters.AddWithValue("MineVillageId", qkid);
            cmd.Parameters.AddWithValue("MineVillage", CbMedenQk.Text.Trim());
            cmd.Parameters.AddWithValue("MineStreet", CbMedenStreet.Text.Trim());
            cmd.Parameters.AddWithValue("MineHome", CbMedenHome.Text.Trim());
            cmd.Parameters.AddWithValue("MineFlat", CbMedenFlat.Text.Trim());
            cmd.Parameters.AddWithValue("MunicipalId", MunicipalID);
            cmd.Parameters.AddWithValue("TaxpayerId", taxbayerid);
            cmd.ExecuteNonQuery();
            selectMine();
            clrMine();
            MsgMeden.ForeColor = System.Drawing.Color.Green;
            MsgMeden.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void BtnMedenEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), MunicipalID = 1, MineTypeID = 0, Mineid = int.Parse(LbIdMeden.Text);
        string msg = "";
        bool isnum = false;
        if ((CbMedenRegion.Text.Trim() != "") && (CbMedenRegion.Text.Trim() != "Seçin") && (CbMedenRegion.Value != null))
        {
            isnum = int.TryParse(CbMedenRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }
        if ((CbMedenType.Text.Trim() != "") && (CbMedenType.Text.Trim() != "Seçin") && (CbMedenType.Value != null))
        {
            isnum = int.TryParse(CbMedenType.Value.ToString(), out MineTypeID);
        }
        if (!isnum)
        {
            msg += "Torpağın istifadə növü,";
        }
        /*
           if (CbQKliving.Text.Trim() != "" && CbQKliving.Text.Trim() != "Seçin" && CbQKliving.Value!=null)
           {
               isnum = int.TryParse(CbQKliving.Value.ToString(),out qkid);
           }
          
            if (CbQKliving.Items.Count!=0 && qkid==0 && isnum==false)
            {
                msg += "Qəsəbə/Kənd,";
            }
          */
        //if (CbZonaLiving.Text.Trim() != "" && CbZonaLiving.Text.Trim() != "Seçin")
        //{
        //    isnum = int.TryParse(CbZonaLiving.Value.ToString(), out zonaid);
        //}
        //if (!isnum)
        //{
        //    msg += "Zona əmsalını,";
        //}

        //if (RbQLivLandhe.Checked == true)
        //{
        //    consessionid = 1;
        //}
        //if (RbLivLandyox.Checked == true)
        //{
        //    consessionid = 2;
        //}
        //if (RbLivLandyox.Checked == false && RbLivLandhe.Checked == false)
        //{
        //    msg += "Vergi güzəştini,";
        //}
        if (msg.Length>3)
        {
            MsgMeden.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            MsgMeden.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"Update MineTax set MineTypeID=@MineTypeID,MineType=@MineType, MineRegistrDate=@MineRegistrDate, MinePositionArea=@MinePositionArea,
                                                    MineRegionId=@MineRegionId, MineRegionName=@MineRegionName, MineVillageId=@MineVillageId, MineVillage=@MineVillage, 
                                                    MineStreet=@MineStreet, MineHome=@MineHome, MineFlat=@MineFlat,MunicipalId=@MunicipalId, TaxpayerId=@TaxpayerId where MineID=@MineID", connsql.baglan());
            cmd.Parameters.AddWithValue("MineTypeID", MineTypeID);
            cmd.Parameters.AddWithValue("MineType", CbMedenType.Text);
            cmd.Parameters.AddWithValue("MineRegistrDate", DEMedenRegstrDate.Date);
            cmd.Parameters.AddWithValue("MinePositionArea", txtPositionAdres.Text.Trim());
            cmd.Parameters.AddWithValue("MineRegionId", regionid);
            cmd.Parameters.AddWithValue("MineRegionName", CbMedenRegion.Text.Trim());
            cmd.Parameters.AddWithValue("MineVillageId", qkid);
            cmd.Parameters.AddWithValue("MineVillage", CbMedenQk.Text.Trim());
            cmd.Parameters.AddWithValue("MineStreet", CbMedenStreet.Text.Trim());
            cmd.Parameters.AddWithValue("MineHome", CbMedenHome.Text.Trim());
            cmd.Parameters.AddWithValue("MineFlat", CbMedenFlat.Text.Trim());
            cmd.Parameters.AddWithValue("MunicipalId", MunicipalID);
            cmd.Parameters.AddWithValue("TaxpayerId", taxbayerid);
            cmd.Parameters.AddWithValue("MineId", Mineid);
            cmd.ExecuteNonQuery();
            selectMine();
            clrMine();
            MsgMeden.ForeColor = System.Drawing.Color.Green;
            MsgMeden.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void DataListMeden_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowMeden")
        {
            string deletesql = @"update MineTax set exitdate=getdate() where MineId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectMine();
        }
        if (e.CommandName == "UpdaterowMeden")
        {
            FillCompanentOnEditMeden(int.Parse(e.CommandArgument.ToString()));
            LbIdMeden.Text = e.CommandArgument.ToString();
        }
    }

    protected void rdmuhli_CheckedChanged(object sender, EventArgs e)
    {
        pnlmuhli.Visible = true;
        pnlmuhsiz.Visible = false;
        txtdeyer.Text = "";
    }
    protected void rdmuhsiz_CheckedChanged(object sender, EventArgs e)
    {
        pnlmuhsiz.Visible = true;
        pnlmuhli.Visible = false;
        txtmuhhecm.Text = "";
    }
    protected void rpneqliyyat_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //if (e.CommandName == "deleterowLivland")
        //{
        //    string deletesql = @"delete LivingArea where LivingAreaId=" + e.CommandArgument.ToString();
        //    SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
        //    cmd.ExecuteNonQuery();
        //    selectlivingLand();
        //}
        //if (e.CommandName == "UpdaterowLivLand")
        //{
        //    FillCompanentOnEditLivLand(int.Parse(e.CommandArgument.ToString()));
        //    LbIdLivingAreaLivingLand.Text = e.CommandArgument.ToString();
        //}


        if (e.CommandName == "deleterowneqliyyat")
        {
            string deletesql = @"update WaterAirTransport set exitdate=getdate() where TransportID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            vizualneqliyyat();
        }
        if (e.CommandName == "Updaterowneqliyyat")
        {
            gizle.Text = e.CommandArgument.ToString();
            DataRow drodeyici = connsql.GetDataRow(@"SELECT * 
from WaterAirTransport where TransportID=" + e.CommandArgument.ToString());
            qeydtrx.Date = Convert.ToDateTime(drodeyici["Registrdate"].ToString()).Date; 
            txtmulknom.Text = drodeyici["DocumentNumber"].ToString();
            mukltrx.Date = Convert.ToDateTime(drodeyici["GivingDate"].ToString()).Date; 
            txtneqladi.Text = drodeyici["Name"].ToString();
            cmbburaxili.Text = drodeyici["GraduationYear"].ToString();
            txtmuhhecm.Text = drodeyici["MotorSize"].ToString();
            txtdeyer.Text = drodeyici["Price"].ToString();
            if (drodeyici["TransportType"].ToString() == "1")
            {
                rdsu.Checked = true;
            }
            else
            {
                rdhava.Checked = true;
            }
            if (drodeyici["MotorType"].ToString() == "1")
            {
                rdmuhli.Checked = true;
                rdmuhsiz.Checked = false;
                pnlmuhli.Visible = true;
                pnlmuhsiz.Visible = false;
                txtdeyer.Text = "0";
            }
            else if (drodeyici["MotorType"].ToString() == "2")
            {
                rdmuhsiz.Checked = true;
                rdmuhli.Checked = false;
                pnlmuhli.Visible = false;
                pnlmuhsiz.Visible = true;
                txtmuhhecm.Text = "0";
            }
            //FillCompanentOnEditLivLand(int.Parse(e.CommandArgument.ToString()));
            //LbIdLivingAreaLivingLand.Text = e.CommandArgument.ToString();

        }
    }
    protected void btnsuhava_Click(object sender, EventArgs e)
    {
        int muherrik; int nov;
        if (rdmuhli.Checked)
        {
            muherrik = 1;
        }
        else
        {
            muherrik = 2;
        }

        if (rdsu.Checked)
        {
            nov = 1;
        }
        else
        {
            nov = 2;
        }
        SqlCommand cmd = new SqlCommand(@"Update WaterAirTransport set  Registrdate=@Registrdate,DocumentNumber=@DocumentNumber,
GivingDate=@GivingDate,Name=@Name,GraduationYear=@GraduationYear,MotorSize=@MotorSize,Price=@Price,MotorType=@MotorType,TransportType=@TransportType 
where TransportID=" + gizle.Text, connsql.baglan());
        cmd.Parameters.AddWithValue("Registrdate", qeydtrx.Date);
        cmd.Parameters.AddWithValue("DocumentNumber", txtmulknom.Text.Trim());
        cmd.Parameters.AddWithValue("GivingDate", mukltrx.Date);
        cmd.Parameters.AddWithValue("Name", txtneqladi.Text.Trim());
        cmd.Parameters.AddWithValue("GraduationYear", int.Parse(cmbburaxili.SelectedItem.ToString()));
        if (rdmuhli.Checked)
        {
            cmd.Parameters.AddWithValue("MotorSize", int.Parse(txtmuhhecm.Text.Trim()));
        }
        else
        {
            cmd.Parameters.AddWithValue("MotorSize", 0);
        }
        if (rdmuhsiz.Checked)
        {
            cmd.Parameters.AddWithValue("Price", int.Parse(txtdeyer.Text.Trim()));
        }
        else
        {
            cmd.Parameters.AddWithValue("Price", 0);
        }
        cmd.Parameters.AddWithValue("MotorType", muherrik);
        cmd.Parameters.AddWithValue("TransportType", nov);
        cmd.ExecuteNonQuery();
        vizualneqliyyat();
        clrNeqliyyat();
    }

    protected void neqlyelaveet_Click(object sender, EventArgs e)
    {
        int muherrik; int nov;
        if (rdmuhli.Checked)
        {
            muherrik = 1;
        }
        else
        {
            muherrik = 2;
        }

        if (rdsu.Checked)
        {
            nov = 1;
        }
        else
        {
            nov = 2;
        }

        string MunicipalId = ""; string MunicipalName = "";

        DataRow Municipal = connsql.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }
        if (qeydtrx.Text != "" && txtmulknom.Text != "" && mukltrx.Text != "" && txtneqladi.Text != "" && cmbburaxili.Text != "")
        {
            SqlCommand cmd = new SqlCommand(@"insert into WaterAirTransport (MotorType,TransportType,TaxpayerID, Registrdate, DocumentNumber, GivingDate, Name, GraduationYear, MotorSize, Price)
values (@MotorType,@TransportType,@TaxpayerID,  @Registrdate, @DocumentNumber, @GivingDate, @Name, @GraduationYear, @MotorSize, @Price)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", int.Parse(TaxpayerID));
            cmd.Parameters.AddWithValue("Registrdate", qeydtrx.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtmulknom.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", mukltrx.Date);
            cmd.Parameters.AddWithValue("Name", txtneqladi.Text.Trim());
            cmd.Parameters.AddWithValue("GraduationYear", int.Parse(cmbburaxili.Text.ToString()));
            if (rdmuhli.Checked)
            {
                cmd.Parameters.AddWithValue("MotorSize", int.Parse(txtmuhhecm.Text.Trim()));
            }
            else
            {
                cmd.Parameters.AddWithValue("MotorSize", 0);
            }
            if (rdmuhsiz.Checked)
            {
                cmd.Parameters.AddWithValue("Price", int.Parse(txtdeyer.Text.Trim()));
            }
            else
            {
                cmd.Parameters.AddWithValue("Price", 0);
            }



            cmd.Parameters.AddWithValue("MotorType", muherrik);
            cmd.Parameters.AddWithValue("TransportType", nov);
            cmd.ExecuteNonQuery();
            //selectlivingLand();
            //MsgLivingLand.ForeColor = System.Drawing.Color.Green;
            //MsgLivingLand.Text = "Məlumatlar bazaya daxil oldu";
            vizualneqliyyat();
            lblsms.Text = "";
            clrNeqliyyat();
        }
        else
        {
            lblsms.Text = "Məlumat tam deyil";
        }

    }
    protected void clrNeqliyyat()
    {
        qeydtrx.Text = "";
        txtmulknom.Text = "";
        mukltrx.Text = "";
        cmbburaxili.SelectedIndex = 0;
        txtneqladi.Text = "";
        txtmuhhecm.Text = "";
        txtdeyer.Text = "";
        rdmuhli.Checked = true;
        rdmuhsiz.Checked = false;
    }
    protected void clrMine()
    {
        DEMedenRegstrDate.Text = "";
        txtPositionAdres.Text = "";
        CbMedenType.SelectedIndex = 0;
        CbMedenRegion.SelectedIndex = 0; ;
        CbMedenQk.SelectedIndex = 0;
        CbMedenStreet.Text = "";
        CbMedenHome.Text = "";
        CbMedenFlat.Text = "";
    }
    void vizualneqliyyat()
    {
        string MunicipalId = ""; string MunicipalName = "";
        DataRow Municipal = connsql.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }
        DataTable region2 = connsql.getdatatable(@"select * from ViewWaterAirTransport where  TaxpayerID=" + TaxpayerID + " order by NowTime desc");
        rpneqliyyat.DataSource = region2;
        rpneqliyyat.DataBind();
    }
    protected void CbRegionliving_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void BtnleaseNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), TypeUseLandid = 0, Livingtypeid = 8, Typeofdocumentid = 1;
        string msg = "";
        bool isnum = false;
        if (DeleaseRegistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (txtleaseDocNum.Text.Trim() == "")
        {
            msg += "İcarə müqaviləsinin nömrəsini, ";
        }
        if (DeleaseDocGivDate.Text.Trim() == "")
        {
            msg += "İcarə müqaviləsinin verilmə tarixini, ";
        }
        if (DEleaseDocDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }
        if ((CBleaseType.Text.Trim() != "") && (CBleaseType.Text.Trim() != "Seçin") && (CBleaseType.Value != null))
        {
            isnum = int.TryParse(CBleaseType.Value.ToString(), out TypeUseLandid);
        }
        if (!isnum)
        {
            msg += "İcarəyə verilmiş mülkiyyətin növünü, ";
        }
        if (txtleasefixing.Text.Trim() == "")
        {
            msg += "İcarəyə verilmiş mülkiyyətin təyinatını,";
        }
        if ((CBleaseregion.Text.Trim() != "") && (CBleaseregion.Text.Trim() != "Seçin") && (CBleaseregion.Value != null))
        {
            isnum = int.TryParse(CBleaseregion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }
        
        string txtdate2 = "";
        if (DEleaseDocDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
        if (txtleaseArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }
        if (txtleaseFaktor.Text.Trim() == "")
        {
            msg += "Vergi əmsalını, ";
        }
        if (msg.Length>3)
        {
            LbleaseMsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbleaseMsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
          //  double datecalc = (DEleaseDocDate2.Date.Month - DEleaseDocDate1.Date.Month) + 12 * (DEleaseDocDate2.Date.Year - DEleaseDocDate1.Date.Year); ;

            SqlCommand cmd = new SqlCommand(@"insert into LivingArea (TaxpayerID, RegistrDate, DocumentNumber, GivingDate, UsingBeginDate, UsingEndDate, SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID, SettleAdress_q_k_Name,TypeUseLand, Street, Home,  Flat, GeneralArea, LivingType, TypeOfDocument, LeaseFixing,TaxRate) values ( @TaxpayerID, 
                      @RegistrDate, @DocumentNumber, @GivingDate, @UsingBeginDate, @UsingEndDate, @SettleAdress_Sh_R_ID, @SettleAdress_Sh_R_Nme, 
                      @SettleAdress_q_k_ID, @SettleAdress_q_k_Name,@TypeUseLand, @Street, @Home,  @Flat, @GeneralArea, @LivingType, @TypeOfDocument,@LeaseFixing, @TaxRate)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeleaseRegistrDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtleaseDocNum.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DeleaseDocGivDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DEleaseDocDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DEleaseDocDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CBleaseregion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CBleaseQK.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbleaseStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBleaseHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBleaseFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtleaseArea.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LeaseFixing", txtleasefixing.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", txtleaseFaktor.Text.Trim());
            cmd.ExecuteNonQuery();
            selectlease();
            clrlease();
            LbleaseMsg.ForeColor = System.Drawing.Color.Green;
            LbleaseMsg.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void CBleaseregion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CBleaseQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBleaseregion.Value.ToString());
    }
    protected void DataListLease_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowlease")
        {
            string deletesql = @"update LivingArea set exitdate=getdate() where LivingAreaId=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectlease();
        }
        if (e.CommandName == "Updaterowlease")
        {
            FillCompanentOnEditlease(int.Parse(e.CommandArgument.ToString()));
            LbleaseID.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnleaseEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), TypeUseLandid = 0, Livingtypeid = 8, Typeofdocumentid = 1, LivingAreaID = int.Parse(LbleaseID.Text);
        string msg = "";
        bool isnum = false;
        if (DeleaseRegistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (txtleaseDocNum.Text.Trim() == "")
        {
            msg += "İcarə müqaviləsinin nömrəsini, ";
        }
        if (DeleaseDocGivDate.Text.Trim() == "")
        {
            msg += "İcarə müqaviləsinin verilmə tarixini, ";
        }
        if (DEleaseDocDate1.Text.Trim() == "")
        {
            msg += "İstifadə müddətini, ";
        }
        if ((CBleaseType.Text.Trim() != "") && (CBleaseType.Text.Trim() != "Seçin") && (CBleaseType.Value != null))
        {
            isnum = int.TryParse(CBleaseType.Value.ToString(), out TypeUseLandid);
        }
        if (!isnum)
        {
            msg += "İcarəyə verilmiş mülkiyyətin növünü, ";
        }
        if (txtleasefixing.Text.Trim() == "")
        {
            msg += "İcarəyə verilmiş mülkiyyətin təyinatını,";
        }
        if ((CBleaseregion.Text.Trim() != "") && (CBleaseregion.Text.Trim() != "Seçin") && (CBleaseregion.Value != null))
        {
            isnum = int.TryParse(CBleaseregion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu,";
        }

        string txtdate2 = "";
        if (DEleaseDocDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
        if (txtleaseArea.Text.Trim() == "")
        {
            msg += "Ümumi sahəni, ";
        }
        if (txtleaseFaktor.Text.Trim() == "")
        {
            msg += "Vergi əmsalını, ";
        }
        if (msg.Length > 3)
        {
            LbleaseMsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbleaseMsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"Update LivingArea set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, DocumentNumber=@DocumentNumber, GivingDate=@GivingDate, 
                                              UsingBeginDate=@UsingBeginDate, UsingEndDate=@UsingEndDate, SettleAdress_Sh_R_ID=@SettleAdress_Sh_R_ID, SettleAdress_Sh_R_Nme=@SettleAdress_Sh_R_Nme, 
                      SettleAdress_q_k_ID=@SettleAdress_q_k_ID, SettleAdress_q_k_Name=@SettleAdress_q_k_Name,TypeUseLand=@TypeUseLand, Street=@Street, Home=@Home,  Flat=@Flat,
                      GeneralArea=@GeneralArea, LivingType=@LivingType, TypeOfDocument=@TypeOfDocument, LeaseFixing=@LeaseFixing,TaxRate=@TaxRate Where LivingAreaID=@LivingAreaID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeleaseRegistrDate.Date);
            cmd.Parameters.AddWithValue("DocumentNumber", txtleaseDocNum.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", DeleaseDocGivDate.Date);
            cmd.Parameters.AddWithValue("UsingBeginDate", DEleaseDocDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("UsingEndDate", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("UsingEndDate", DEleaseDocDate2.Date);
            }
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_ID", regionid);
            cmd.Parameters.AddWithValue("SettleAdress_Sh_R_Nme", CBleaseregion.Text.Trim());
            cmd.Parameters.AddWithValue("SettleAdress_q_k_ID", qkid);
            cmd.Parameters.AddWithValue("SettleAdress_q_k_Name", CBleaseQK.Text.Trim());
            cmd.Parameters.AddWithValue("TypeUseLand", TypeUseLandid);
            cmd.Parameters.AddWithValue("Street", CbleaseStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBleaseHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBleaseFlat.Text.Trim());
            cmd.Parameters.AddWithValue("GeneralArea", txtleaseArea.Text.Trim());
            cmd.Parameters.AddWithValue("LivingType", Livingtypeid);
            cmd.Parameters.AddWithValue("TypeOfDocument", Typeofdocumentid);
            cmd.Parameters.AddWithValue("LeaseFixing", txtleasefixing.Text.Trim());
            cmd.Parameters.AddWithValue("TaxRate", txtleaseFaktor.Text.Trim());
            cmd.Parameters.AddWithValue("LivingAreaID", LivingAreaID);
            cmd.ExecuteNonQuery();
            selectlease();
            clrlease();
            LbleaseMsg.ForeColor = System.Drawing.Color.Green;
            LbleaseMsg.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }

    protected void BtnAdvertisementNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Kateqoriya = 0, rbzona = 0;
        string msg = "";
        bool isnum = false;
        if (DEAdvertisementRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        isnum = false;
        if ((CBAdvertisementKateqoriya.Text.Trim() != "") && (CBAdvertisementKateqoriya.Text.Trim() != "Seçin") && (CBAdvertisementKateqoriya.Value != null))
        {
            isnum = int.TryParse(CBAdvertisementKateqoriya.Value.ToString(), out Kateqoriya);
        }
        if (!isnum)
        {
            msg += "Reklamın yerləşdiyi yeri, ";
        }
        if ((CbAdvertisementRegionName.Text.Trim() != "") && (CbAdvertisementRegionName.Text.Trim() != "Seçin") && (CbAdvertisementRegionName.Value != null))
        {
            isnum = int.TryParse(CbAdvertisementRegionName.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (RBAdvertisementA.Checked == true)
        {
            rbzona = 1;
        }
        if (RBAdvertisementB.Checked == true)
        {
            rbzona = 2;
        }
        if (RBAdvertisementC.Checked == true)
        {
            rbzona = 3;
        }
        if (rbzona == 0)
        {
            msg += "Yerləşdiyi zonanı, ";
        }
        if (txtAdvertisementSize.Text.Trim() == "")
        {
            msg += "Reklamın ölçüsünü, ";
        }
        if (txtAdvertisementTema.Text.Trim() == "")
        {
            msg += "Reklamın mövzusunu, ";
        }
        if (txtAdvertisementEmsal.Text.Trim() == "")
        {
            msg += "Reklamın əmsalı, ";
        }
        //if (txtAdvertisementPermitDocNum.Text.Trim() == "")
        //{
        //    msg += "İcazə sənədinin nömrəsini, ";
        //}
        //if (DEAdvertisementPermitDate1.Text.Trim() == "")
        //{
        //    msg += "İcazə sənədinin Müddətini, ";
        //}
        if (txtContractDocNum.Text.Trim() == "")
        {
            msg += "Müqavilənin nömrəsini, ";
        }
        if (DEContractDocDate1.Text.Trim() == "")
        {
            msg += "Müqavilənin müddətini";
        }
        if (OutreachDate1.Text.Trim() == "")
        {
            msg += "Yayımın başlanma tarixini, ";
        }
        //if (OutreachDate2.Text.Trim() == "")
        //{
        //    msg += "Yayımın dayandırılma tarixini, ";
        //}



        string txtdate1 = "", txtdate2 = "", txtdate3 = "";
        if (DEAdvertisementPermitDate1.Text.Trim() == "")
        {
            txtdate3 = "01.01.1900";
        }
        if (DEAdvertisementPermitDate2.Text.Trim()=="")
        {
            txtdate1 = "01.01.1900";        
        }
        if (DEContractDocDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
       
        if (msg.Length>3)
        {
            LbAdvertisementMSG.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbAdvertisementMSG.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"insert into Advertisement (TaxpayerID, RegisterDate, Kateqoriya, kateqoriyatxt, RegionID, RegionName, VillageId, VillageName, Street, Home, Flat, ZonaABC, 
                      AdvertisemenSize, AdvertisemenTema,AdvertisemenEmsal, AdvertisPermitDocNum, AdvertisPermitDocDate1, AdvertisPermitDocDate2, ContractDocNum, ContractDocDate1, 
                      ContractDocDate2, OutreachDate1, OutreachDate2,Factor) values ( @TaxpayerID, @RegisterDate, @Kateqoriya, @kateqoriyatxt, @RegionID, @RegionName, @VillageId, @VillageName, @Street, @Home, @Flat, @ZonaABC, 
                      @AdvertisemenSize, @AdvertisemenTema,@AdvertisemenEmsal, @AdvertisPermitDocNum, @AdvertisPermitDocDate1, @AdvertisPermitDocDate2, @ContractDocNum, @ContractDocDate1, 
                      @ContractDocDate2, @OutreachDate1, @OutreachDate2,@Factor)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegisterDate", DEAdvertisementRegisterDate.Date);
            cmd.Parameters.AddWithValue("Kateqoriya", Kateqoriya);
            cmd.Parameters.AddWithValue("kateqoriyatxt", CBAdvertisementKateqoriya.Text.Trim());
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CbAdvertisementRegionName.Text.Trim());
            cmd.Parameters.AddWithValue("VillageId", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBAdvertisementVillageName.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CbAdvertisementStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBAdvertisementHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbAdvertisementFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ZonaABC", rbzona);
            cmd.Parameters.AddWithValue("AdvertisemenSize", txtAdvertisementSize.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisemenTema", txtAdvertisementTema.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisemenEmsal", txtAdvertisementEmsal.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisPermitDocNum", txtAdvertisementPermitDocNum.Text.Trim());
            if (txtdate3 != "")
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate1", txtdate3);
            }
            else
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate1", DEAdvertisementPermitDate1.Date);
            }
            if (txtdate1 != "")
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate2", txtdate1);
            }
            else
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate2", DEAdvertisementPermitDate2.Date);
            }
            cmd.Parameters.AddWithValue("ContractDocNum", txtContractDocNum.Text.Trim());
            cmd.Parameters.AddWithValue("ContractDocDate1", DEContractDocDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("ContractDocDate2", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("ContractDocDate2", DEContractDocDate2.Date);
            }
            cmd.Parameters.AddWithValue("OutreachDate1", OutreachDate1.Date);
            cmd.Parameters.AddWithValue("OutreachDate2", OutreachDate2.Date);
            cmd.Parameters.AddWithValue("Factor", LBAdvertisementFactor.Text.Trim());
            cmd.ExecuteNonQuery();
            selectAdvertisement();
            clrAdvertisement();
            LbAdvertisementMSG.ForeColor = System.Drawing.Color.Green;
            LbAdvertisementMSG.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void DataListAdvertisement_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowAdvertisement")
        {
            string deletesql = @"update Advertisement set exitdate=getdate() where AdvertisementID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectAdvertisement();
        }
        if (e.CommandName == "UpdaterowAdvertisement")
        {
            FillCompanentOnEditAdvertisement(int.Parse(e.CommandArgument.ToString()));
            LBAdvertisementID.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnAdvertisementEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Kateqoriya = 0, rbzona = 0, AdvertisementID = int.Parse(LBAdvertisementID.Text.Trim());
        string msg = "";
        bool isnum = false;
        if (DEAdvertisementRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        isnum = false;
        if ((CBAdvertisementKateqoriya.Text.Trim() != "") && (CBAdvertisementKateqoriya.Text.Trim() != "Seçin") && (CBAdvertisementKateqoriya.Value != null))
        {
            isnum = int.TryParse(CBAdvertisementKateqoriya.Value.ToString(), out Kateqoriya);
        }
        if (!isnum)
        {
            msg += "Reklamın yerləşdiyi yeri, ";
        }
        if ((CbAdvertisementRegionName.Text.Trim() != "") && (CbAdvertisementRegionName.Text.Trim() != "Seçin") && (CbAdvertisementRegionName.Value != null))
        {
            isnum = int.TryParse(CbAdvertisementRegionName.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (RBAdvertisementA.Checked == true)
        {
            rbzona = 1;
        }
        if (RBAdvertisementB.Checked == true)
        {
            rbzona = 2;
        }
        if (RBAdvertisementC.Checked == true)
        {
            rbzona = 3;
        }
        if (rbzona == 0)
        {
            msg += "Yerləşdiyi zonanı, ";
        }
        if (txtAdvertisementSize.Text.Trim() == "")
        {
            msg += "Reklamın ölçüsünü, ";
        }
        if (txtAdvertisementTema.Text.Trim() == "")
        {
            msg += "Reklamın mövzusunu, ";
        }
        if (txtAdvertisementEmsal.Text.Trim() == "")
        {
            msg += "Reklamın əmsalı, ";
        }
        //if (txtAdvertisementPermitDocNum.Text.Trim() == "")
        //{
        //    msg += "İcazə sənədinin nömrəsini, ";
        //}
        //if (DEAdvertisementPermitDate1.Text.Trim() == "")
        //{
        //    msg += "İcazə sənədinin Müddətini, ";
        //}
        if (txtContractDocNum.Text.Trim() == "")
        {
            msg += "Müqavilənin nömrəsini, ";
        }
        if (DEContractDocDate1.Text.Trim() == "")
        {
            msg += "Müqavilənin müddətini";
        }
        if (OutreachDate1.Text.Trim() == "")
        {
            msg += "Yayımın başlanma tarixini, ";
        }
        if (OutreachDate2.Text.Trim() == "")
        {
            msg += "Yayımın dayandırılma tarixini, ";
        }




        string txtdate1 = "", txtdate2 = "",txtdate3 = "";
        if (DEAdvertisementPermitDate1.Text.Trim() == "")
        {
            txtdate3 = "01.01.1900";
        }
        if (DEAdvertisementPermitDate2.Text.Trim() == "")
        {
            txtdate1 = "01.01.1900";
        }
        if (DEContractDocDate2.Text.Trim() == "")
        {
            txtdate2 = "01.01.1900";
        }
        if (msg.Length > 3)
        {
            LbAdvertisementMSG.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbAdvertisementMSG.ForeColor = System.Drawing.Color.Red;
        }
        else
        {


            SqlCommand cmd = new SqlCommand(@"Update Advertisement set TaxpayerID=@TaxpayerID, RegisterDate=@RegisterDate, Kateqoriya=@Kateqoriya, kateqoriyatxt=@kateqoriyatxt, 
                                              RegionID=@RegionID, RegionName=@RegionName, VillageId=@VillageId, VillageName=@VillageName, Street=@Street, Home=@Home, Flat=@Flat, 
                                              ZonaABC=@ZonaABC, AdvertisemenSize=@AdvertisemenSize, AdvertisemenTema=@AdvertisemenTema,AdvertisemenEmsal=@AdvertisemenEmsal, AdvertisPermitDocNum=@AdvertisPermitDocNum,
                                              AdvertisPermitDocDate1=@AdvertisPermitDocDate1, AdvertisPermitDocDate2=@AdvertisPermitDocDate2, ContractDocNum=@ContractDocNum, 
                                              ContractDocDate1=@ContractDocDate1,ContractDocDate2=@ContractDocDate2, OutreachDate1=@OutreachDate1, OutreachDate2=@OutreachDate2,
                                              Factor=@Factor 
                                              where AdvertisementID=@AdvertisementID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegisterDate", DEAdvertisementRegisterDate.Date);
            cmd.Parameters.AddWithValue("Kateqoriya", Kateqoriya);
            cmd.Parameters.AddWithValue("kateqoriyatxt", CBAdvertisementKateqoriya.Text.Trim());
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CbAdvertisementRegionName.Text.Trim());
            cmd.Parameters.AddWithValue("VillageId", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBAdvertisementVillageName.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CbAdvertisementStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBAdvertisementHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbAdvertisementFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ZonaABC", rbzona);
            cmd.Parameters.AddWithValue("AdvertisemenSize", txtAdvertisementSize.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisemenTema", txtAdvertisementTema.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisemenEmsal", txtAdvertisementEmsal.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisPermitDocNum", txtAdvertisementPermitDocNum.Text.Trim());
            if (txtdate3 != "")
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate1", txtdate3);
            }
            else
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate1", DEAdvertisementPermitDate1.Date);
            }

            if (txtdate1 != "")
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate2", txtdate1);
            }
            else
            {
                cmd.Parameters.AddWithValue("AdvertisPermitDocDate2", DEAdvertisementPermitDate2.Date);
            }
            cmd.Parameters.AddWithValue("ContractDocNum", txtContractDocNum.Text.Trim());
            cmd.Parameters.AddWithValue("ContractDocDate1", DEContractDocDate1.Date);
            if (txtdate2 != "")
            {
                cmd.Parameters.AddWithValue("ContractDocDate2", txtdate2);
            }
            else
            {
                cmd.Parameters.AddWithValue("ContractDocDate2", DEContractDocDate2.Date);
            }
            cmd.Parameters.AddWithValue("OutreachDate1", OutreachDate1.Date);
            cmd.Parameters.AddWithValue("OutreachDate2", OutreachDate2.Date);
            cmd.Parameters.AddWithValue("Factor", LBAdvertisementFactor.Text.Trim());
            cmd.Parameters.AddWithValue("AdvertisementID", AdvertisementID);
            cmd.ExecuteNonQuery();
            selectAdvertisement();
            clrAdvertisement();
            LbAdvertisementMSG.ForeColor = System.Drawing.Color.Green;
            LbAdvertisementMSG.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void DateListCarStop_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowCarStop")
        {
            string deletesql = @"update CarStop set exitdate=getdate() where CarID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectCarStop();
        }
        if (e.CommandName == "UpdaterowCarStop")
        {
            FillCompanentOnEditCarStop(int.Parse(e.CommandArgument.ToString()));
            LbCarStopID.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnCarStopNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), rbzona = 0;
        string msg = "";
        if (DECarStopRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        

        if (RBCarType1.Checked == true)
        {
            rbzona = 1;
        }
        if (RBCarType2.Checked == true)
        {
            rbzona = 2;
        }
        if (RBCarType3.Checked == true)
        {
            rbzona = 3;
        }
        if (RBCarType4.Checked == true)
        {
            rbzona = 4;
        }
        if (rbzona == 0)
        {
            msg += "Dayanacağın Növünü, ";
        }

        bool isnum = false;
        if ((CBCarRegion.Text.Trim() != "") && (CBCarRegion.Text.Trim() != "Seçin") && (CBCarRegion.Value != null))
        {
            isnum = int.TryParse(CBCarRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBCarVillage.Text.Trim() != "" && CBCarVillage.Text.Trim() != "Seçin" && CBCarVillage.Value != null)
        {
            isnum = int.TryParse(CBCarVillage.Value.ToString(), out qkid);
        }

        if (CBCarVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kəndi, ";
        }

        if (txtCarArea.Text.Trim() == "")
        {
            msg += "Dayanacağın sahəsi, ";
        }
        if (txtCarCount.Text.Trim() == "")
        {
            msg += "Tutumu(avtomobil sayı), ";
        }
        if (DECarDate1.Text.Trim() == "")
        {
            msg += "Xidmət göstərilməsinin başlanma tarixini, ";
        }
        //if (DECarDate2.Text.Trim() == "")
        //{
        //    msg += "Xidmət göstərilməsinin dayandırılma tarixini, ";
        //}
        if (msg.Length>3)
        {
            LbCarStopmsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbCarStopmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string txtdate="";
            if (DECarDate2.Text.Trim() == "")
            {
                txtdate = "01.01.1900";
            }

            SqlCommand cmd = new SqlCommand(@"insert into CarStop (TaxPayerID, RegisterDate, CarStopType, RegionID, RegionName, VillageID, 
                                              VillageName, Street, Home, Flat, StopArea, CarCount, ServiceDate1,ServiceDate2) 
                                              values ( @TaxPayerID, @RegisterDate, @CarStopType, @RegionID, @RegionName, @VillageID, @VillageName,
                                                       @Street, @Home, @Flat, @StopArea, @CarCount, @ServiceDate1, @ServiceDate2)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxPayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegisterDate", DECarStopRegisterDate.Date);
            cmd.Parameters.AddWithValue("CarStopType", rbzona);
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBCarRegion.Text.Trim());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBCarVillage.Text.ToString());
            cmd.Parameters.AddWithValue("Street", CBCarStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBCarHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbCarFlat.Text.Trim());
            cmd.Parameters.AddWithValue("StopArea", txtCarArea.Text.Trim());
            cmd.Parameters.AddWithValue("CarCount", txtCarCount.Text.Trim());
            cmd.Parameters.AddWithValue("ServiceDate1", DECarDate1.Date);

            if (txtdate != "")
            {
                cmd.Parameters.AddWithValue("ServiceDate2", txtdate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ServiceDate2", DECarDate2.Date);
            }
            cmd.ExecuteNonQuery();
            selectCarStop();
            clrCarStop();
            LbCarStopmsg.ForeColor = System.Drawing.Color.Green;
            LbCarStopmsg.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void CBCarRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CBCarVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBCarRegion.Value.ToString());
    }
    protected void BtnCarStopEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), rbzona = 0, carID = int.Parse(LbCarStopID.Text.ToString());
        string msg = "";
        if (DECarStopRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }


        if (RBCarType1.Checked == true)
        {
            rbzona = 1;
        }
        if (RBCarType2.Checked == true)
        {
            rbzona = 2;
        }
        if (RBCarType3.Checked == true)
        {
            rbzona = 3;
        }
        if (RBCarType4.Checked == true)
        {
            rbzona = 4;
        }
        if (rbzona == 0)
        {
            msg += "Dayanacağın Növünü, ";
        }

        bool isnum = false;
        if ((CBCarRegion.Text.Trim() != "") && (CBCarRegion.Text.Trim() != "Seçin") && (CBCarRegion.Value != null))
        {
            isnum = int.TryParse(CBCarRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBCarVillage.Text.Trim() != "" && CBCarVillage.Text.Trim() != "Seçin" && CBCarVillage.Value != null)
        {
            isnum = int.TryParse(CBCarVillage.Value.ToString(), out qkid);
        }

        if (CBCarVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kəndi, ";
        }

        if (txtCarArea.Text.Trim() == "")
        {
            msg += "Dayanacağın sahəsi, ";
        }
        if (txtCarCount.Text.Trim() == "")
        {
            msg += "Tutumu(avtomobil sayı), ";
        }
        if (DECarDate1.Text.Trim() == "")
        {
            msg += "Xidmət göstərilməsinin başlanma tarixini, ";
        }
        //if (DECarDate2.Text.Trim() == "")
        //{
        //    msg += "Xidmət göstərilməsinin dayandırılma tarixini, ";
        //}
        if (msg.Length > 3)
        {
            LbCarStopmsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbCarStopmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string txtdate = "";
            if (DECarDate2.Text.Trim() == "")
            {
                txtdate = "01.01.1900";
            }

            SqlCommand cmd = new SqlCommand(@"Update CarStop set TaxPayerID=@TaxPayerID, RegisterDate=@RegisterDate, CarStopType=@CarStopType, RegionID=@RegionID, 
                                              RegionName=@RegionName, VillageID=@VillageID, VillageName=@VillageName, Street=@Street, Home=@Home, Flat=@Flat, 
                                              StopArea=@StopArea, CarCount=@CarCount, ServiceDate1=@ServiceDate1,ServiceDate2=@ServiceDate2 where CarID=@CarID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxPayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegisterDate", DECarStopRegisterDate.Date);
            cmd.Parameters.AddWithValue("CarStopType", rbzona);
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBCarRegion.Text.Trim());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBCarVillage.Text.ToString());
            cmd.Parameters.AddWithValue("Street", CBCarStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBCarHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CbCarFlat.Text.Trim());
            cmd.Parameters.AddWithValue("StopArea", txtCarArea.Text.Trim());
            cmd.Parameters.AddWithValue("CarCount", txtCarCount.Text.Trim());
            cmd.Parameters.AddWithValue("ServiceDate1", DECarDate1.Date);
            if (txtdate != "")
            {
                cmd.Parameters.AddWithValue("ServiceDate2", txtdate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ServiceDate2", DECarDate2.Date);
            }

            cmd.Parameters.AddWithValue("CarID", carID);
            cmd.ExecuteNonQuery();
            selectCarStop();
            clrCarStop();
            LbCarStopmsg.ForeColor = System.Drawing.Color.Green;
            LbCarStopmsg.Text = "Məlumatlar üzərində düzəlişlər yadda saxlanıldı";
        }
    }
    protected void BtnHotelNew_Click(object sender, EventArgs e)
    {
        int  qkid = 0, taxbayerid = int.Parse(TaxpayerID);
        string msg = "";

        if (DeHotelRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini";
        }

        bool isnum = false;


        if (CbHoletType.Text.Trim() != "" && CbHoletType.Text.Trim() != "Seçin" && CbHoletType.Value != null)
        {
            isnum = int.TryParse(CbHoletType.Value.ToString(), out qkid);
        }

        if (CbHoletType.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Müəssənin növünü, ";
        }

        if (txtHotelName.Text.Trim() == "")
        {
            msg += "Müəssisənin adını, ";
        }
        if (DEHotelServicesDate1.Text.Trim() == "")
        {
            msg += "Xidmət göstərilməsinin başlanma tarixini, ";
        }
        //if (DEHotelServicesDate2.Text.Trim() == "")
        //{
        //    msg += "Xidmət göstərilməsinin dayandırılma tarixini, ";
        //}
        string txtdate = "";
        if (DEHotelServicesDate2.Text.Trim() == "")
        {
            txtdate = "01.01.1900";
        }
        if (msg.Length > 3)
        {
            LbHotelMsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbHotelMsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"insert into Hotel (TaxpayerID, RegistrDate, HotelType, HotelName, ServiceBeginDate, ServiceEndDate) 
                                              values (@TaxpayerID, @RegistrDate, @HotelType, @HotelName, @ServiceBeginDate, @ServiceEndDate)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeHotelRegisterDate.Date);
            cmd.Parameters.AddWithValue("HotelType", CbHoletType.Value.ToString());
            cmd.Parameters.AddWithValue("HotelName", txtHotelName.Text.ToString());
            cmd.Parameters.AddWithValue("ServiceBeginDate", DEHotelServicesDate1.Date);
            if (txtdate != "")
            {
                cmd.Parameters.AddWithValue("ServiceEndDate", txtdate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ServiceEndDate", DEHotelServicesDate2.Date);
            }
            cmd.ExecuteNonQuery();
            selectHotel();
            clrHotel();
            LbHotelMsg.ForeColor = System.Drawing.Color.Green;
            LbHotelMsg.Text = "Məlumatlar bazaya daxil oldu";
        }
    }
    protected void DataListHotel_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowHotel")
        {
            string deletesql = @"update Hotel set exitdate=getdate() where HotelID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectHotel();
        }
        if (e.CommandName == "UpdaterowHotel")
        {
            FillCompanentOnEditHotel(int.Parse(e.CommandArgument.ToString()));
            LbHotelID.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnHotelEdit_Click(object sender, EventArgs e)
    {
        int  qkid = 0, taxbayerid = int.Parse(TaxpayerID),  HotelID = int.Parse(LbHotelID.Text.ToString());
        string msg = "";
        if (DeHotelRegisterDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini";
        }

        bool isnum = false;
        

        if (CbHoletType.Text.Trim() != "" && CbHoletType.Text.Trim() != "Seçin" && CbHoletType.Value != null)
        {
            isnum = int.TryParse(CbHoletType.Value.ToString(), out qkid);
        }

        if (CbHoletType.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Müəssənin növünü, ";
        }

        if (txtHotelName.Text.Trim() == "")
        {
            msg += "Müəssisənin adını, ";
        }
        if (DEHotelServicesDate1.Text.Trim() == "")
        {
            msg += "Xidmət göstərilməsinin başlanma tarixini, ";
        }
        //if (DEHotelServicesDate2.Text.Trim() == "")
        //{
        //    msg += "Xidmət göstərilməsinin dayandırılma tarixini, ";
        //}
        string txtdate = "";
        if (DEHotelServicesDate2.Text.Trim() == "")
        {
            txtdate = "01.01.1900";
        }
        if (msg.Length>3)
        {
            LbHotelMsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbHotelMsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"Update Hotel set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, HotelType=@HotelType, HotelName=@HotelName, 
                                              ServiceBeginDate=@ServiceBeginDate, ServiceEndDate=@ServiceEndDate where hotelID=@HotelID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DeHotelRegisterDate.Date);
            cmd.Parameters.AddWithValue("HotelType", CbHoletType.Value);
            cmd.Parameters.AddWithValue("HotelName", txtHotelName.Text);
            cmd.Parameters.AddWithValue("ServiceBeginDate", DEHotelServicesDate1.Date);
            if (txtdate != "")
            {
                cmd.Parameters.AddWithValue("ServiceEndDate", txtdate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ServiceEndDate", DEHotelServicesDate2.Date);
            }
            cmd.Parameters.AddWithValue("HotelID", HotelID);
            cmd.ExecuteNonQuery();
            selectHotel();
            clrHotel();
            LbHotelMsg.ForeColor = System.Drawing.Color.Green;
            LbHotelMsg.Text = "Məlumatlar üzərində düzəliş yadda saxlanıldı";
        }
    }
    protected void BtnTradeNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Tradeservicestype = 0;
        string msg = "";
        bool isnum = false;
        if (DETradeRegistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }

        if (txtTradeDocNum.Text.Trim() == "")
        {
            msg += "Müqavilənin nömrəsini, ";
        }
        if (DETradeGivDate.Text.Trim() == "")
        {
            msg += "Müqavilənin bağlanma tarixini, ";
        }
        if (DETradeBeginDate.Text.Trim() == "")
        {
            msg += "Müqavilənin müddətini, ";
        }
        string txtDate = "";
        if (DETradeEndDate.Text.Trim() == "")
        {
            txtDate = "01.01.1900";
        }
        if (txtTradeLandArea.Text.Trim() == "")
        {
            msg += "Ayrılmış torpağın sahəsini, ";
        }
        if ((CBTradeRegion.Text.Trim() != "") && (CBTradeRegion.Text.Trim() != "Seçin") && (CBTradeRegion.Value != null))
        {
            isnum = int.TryParse(CBTradeRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBTradeVillage.Text.Trim() != "" && CBTradeVillage.Text.Trim() != "Seçin")
        {
            isnum = int.TryParse(CBTradeVillage.Value.ToString(), out qkid);
        }

        if (CBTradeVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kəndi, ";
        }

        if (CbTradeServicesType.Text.Trim() != "" && CbTradeServicesType.Text.Trim() != "Seçin" && CbTradeServicesType.Value != null)
        {
            isnum = int.TryParse(CbTradeServicesType.Value.ToString(), out Tradeservicestype);
        }

        if (CbTradeServicesType.Items.Count != 0 && Tradeservicestype == 0 && isnum == false)
        {
            msg += "Göstərilən xidmətin növünü,";
        }

        if (msg.Length>3)
        {
            LbTrademsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbTrademsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"insert into TradeService (TaxpayerID, RegistrDate, ContractDocNum, ContractGiveDate, ContractBeginDate, ContractEndDate, LandArea, 
                                              RegionID, RegionName, VillageID,VillageName, Street, Home, Flat, ServiceType) 
                                              values (@TaxpayerID, @RegistrDate, @ContractDocNum, @ContractGiveDate, @ContractBeginDate, @ContractEndDate, @LandArea, 
                                              @RegionID, @RegionName, @VillageID, @VillageName, @Street, @Home, @Flat, @ServiceType)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DETradeRegistrDate.Date);
            cmd.Parameters.AddWithValue("ContractDocNum", txtTradeDocNum.Value.ToString());
            cmd.Parameters.AddWithValue("ContractGiveDate", DETradeGivDate.Date);
            cmd.Parameters.AddWithValue("ContractBeginDate", DETradeBeginDate.Date);
            if (txtDate != "")
            {
                cmd.Parameters.AddWithValue("ContractEndDate", txtDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ContractEndDate", DETradeEndDate.Date);
            }
            cmd.Parameters.AddWithValue("LandArea", txtTradeLandArea.Text.Trim());
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBTradeRegion.Text.Trim());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBTradeVillage.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CBTradeStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBTradeHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBTradeFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ServiceType", Tradeservicestype);
            cmd.ExecuteNonQuery();
            selectTrade();
            clrTrade();
            LbTrademsg.ForeColor = System.Drawing.Color.Green;
            LbTrademsg.Text = "Məlumatlar bazaya daxil oldu";
        } 
    }
    protected void BtnTradeEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Tradeservicestype = 0, TradeID=int.Parse(LbTradeID.Text.Trim());
        string msg = "";
        bool isnum = false;
        if (DETradeRegistrDate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }

        if (txtTradeDocNum.Text.Trim() == "")
        {
            msg += "Müqavilənin nömrəsini, ";
        }
        if (DETradeGivDate.Text.Trim() == "")
        {
            msg += "Müqavilənin bağlanma tarixini, ";
        }
        if (DETradeBeginDate.Text.Trim() == "")
        {
            msg += "Müqavilənin müddətini, ";
        }
        string txtDate = "";
        if (DETradeEndDate.Text.Trim() == "")
        {
            txtDate = "01.01.1900";
        }
        if (txtTradeLandArea.Text.Trim() == "")
        {
            msg += "Ayrılmış torpağın sahəsini, ";
        }
        if ((CBTradeRegion.Text.Trim() != "") && (CBTradeRegion.Text.Trim() != "Seçin") && (CBTradeRegion.Value != null))
        {
            isnum = int.TryParse(CBTradeRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBTradeVillage.Text.Trim() != "" && CBTradeVillage.Text.Trim() != "Seçin")
        {
            isnum = int.TryParse(CBTradeVillage.Value.ToString(), out qkid);
        }

        if (CBTradeVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kəndi, ";
        }

        if (CbTradeServicesType.Text.Trim() != "" && CbTradeServicesType.Text.Trim() != "Seçin" && CbTradeServicesType.Value != null)
        {
            isnum = int.TryParse(CbTradeServicesType.Value.ToString(), out Tradeservicestype);
        }

        if (CbTradeServicesType.Items.Count != 0 && Tradeservicestype == 0 && isnum == false)
        {
            msg += "Göstərilən xidmətin növünü,";
        }

        if (msg.Length > 3)
        {
            LbTrademsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LbTrademsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"update TradeService set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, ContractDocNum=@ContractDocNum, ContractGiveDate=@ContractGiveDate,
                                              ContractBeginDate=@ContractBeginDate, ContractEndDate=@ContractEndDate, LandArea=@LandArea, RegionID=@RegionID, RegionName=@RegionName, 
                                              VillageID=@VillageID,VillageName=@VillageName, Street=@Street, Home=@Home, Flat=@Flat, ServiceType=@ServiceType where TradeID=@TradeID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DETradeRegistrDate.Date);
            cmd.Parameters.AddWithValue("ContractDocNum", txtTradeDocNum.Value.ToString());
            cmd.Parameters.AddWithValue("ContractGiveDate", DETradeGivDate.Date);
            cmd.Parameters.AddWithValue("ContractBeginDate", DETradeBeginDate.Date);
            if (txtDate != "")
            {
                cmd.Parameters.AddWithValue("ContractEndDate", txtDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("ContractEndDate", DETradeEndDate.Date);
            }
            cmd.Parameters.AddWithValue("LandArea", txtTradeLandArea.Text.Trim());
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBTradeRegion.Text.Trim());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBTradeVillage.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CBTradeStreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBTradeHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBTradeFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ServiceType", Tradeservicestype);
            cmd.Parameters.AddWithValue("TradeID", TradeID);
            cmd.ExecuteNonQuery();
            selectTrade();
            clrTrade();
            LbTrademsg.ForeColor = System.Drawing.Color.Green;
            LbTrademsg.Text = "Məlumatlar üzərində edilən düzəlişlər yadda saxlanıldı";
        } 
    }
    protected void DataListTrade_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowTrade")
        {
            string deletesql = @"update TradeService set exitdate=getdate() where TradeID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectTrade();
        }
        if (e.CommandName == "UpdaterowTrade")
        {
            FillCompanentOnEditTrade(int.Parse(e.CommandArgument.ToString()));
            LbTradeID.Text = e.CommandArgument.ToString();
        }
    }
    protected void BtnPrivateNew_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Privateservicestype = 0;
        string msg = "";
        if (DEPrivateRegistrdate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        bool isnum = false;
        if (CBPrivateType.Text.Trim() != "" && CBPrivateType.Text.Trim() != "Seçin" && CBPrivateType.Value != null)
        {
            isnum = int.TryParse(CBPrivateType.Value.ToString(), out Privateservicestype);
        }

        if (CBPrivateType.Items.Count != 0 && Privateservicestype == 0 && isnum == false)
        {
            msg += "Mülkiyyətin növünü, ";
        }
        isnum = false;
        if ((CBPrivateRegion.Text.Trim() != "") && (CBPrivateRegion.Text.Trim() != "Seçin") && (CBPrivateRegion.Value != null))
        {
            isnum = int.TryParse(CBPrivateRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBPrivateVillage.Text.Trim() != "" && CBPrivateVillage.Text.Trim() != "Seçin" && CBPrivateVillage.Value != null)
        {
            isnum = int.TryParse(CBPrivateVillage.Value.ToString(), out qkid);
        }

        if (CBPrivateVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kənd-i, ";
        }

        if (txtPrivatContractNum.Text.Trim() == "")
        {
            msg += "Müqaviləsinin nömrəsini, ";
        }
        if (DEPrivatContracDate.Text.Trim() == "")
        {
            msg += "Müqaviləsinin verilmə tarixini, ";
        }
        if (txtPrivateAmount.Text.Trim() == "")
        {
            msg += "Ödəniləcək məbləği, ";
        }

        if (msg.Length>3)
        {
            LBPrivatemsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LBPrivatemsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"insert into Alienation (TaxpayerID, RegistrDate, AlienationType, RegionID, RegionName, VillageID, VillageName, Street, Home, Flat,
                                              ContractNum, ContractGiveDate,AmountOnContract) values (@TaxpayerID, @RegistrDate, @AlienationType, @RegionID, @RegionName, @VillageID, @VillageName, 
                                              @Street, @Home, @Flat, @ContractNum, @ContractGiveDate,@AmountOnContract)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DEPrivateRegistrdate.Date);
            cmd.Parameters.AddWithValue("AlienationType", CBPrivateType.Value);
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBPrivateRegion.Text.ToString());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBPrivateVillage.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CBPrivatestreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBPrivateHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBPrivateFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ContractNum", txtPrivatContractNum.Text.ToString());
            cmd.Parameters.AddWithValue("ContractGiveDate", DEPrivatContracDate.Date);
            cmd.Parameters.AddWithValue("AmountOnContract", txtPrivateAmount.Text.Trim());
            cmd.ExecuteNonQuery();
            selectPrivate();
            clrPrivate();
            LBPrivatemsg.ForeColor = System.Drawing.Color.Green;
            LBPrivatemsg.Text = "Məlumatlar bazaya daxil oldu";
        } 
    }
    protected void BtnPrivateEdit_Click(object sender, EventArgs e)
    {
        int regionid = 0, qkid = 0, taxbayerid = int.Parse(TaxpayerID), Privateservicestype = 0, AlienationID = int.Parse(LBPrivateID.Text.Trim());
        string msg = "";
        if (DEPrivateRegistrdate.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        bool isnum = false;
        if (CBPrivateType.Text.Trim() != "" && CBPrivateType.Text.Trim() != "Seçin" && CBPrivateType.Value != null)
        {
            isnum = int.TryParse(CBPrivateType.Value.ToString(), out Privateservicestype);
        }

        if (CBPrivateType.Items.Count != 0 && Privateservicestype == 0 && isnum == false)
        {
            msg += "Mülkiyyətin növünü, ";
        }
        isnum = false;
        if ((CBPrivateRegion.Text.Trim() != "") && (CBPrivateRegion.Text.Trim() != "Seçin") && (CBPrivateRegion.Value != null))
        {
            isnum = int.TryParse(CBPrivateRegion.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        isnum = false;

        if (CBPrivateVillage.Text.Trim() != "" && CBPrivateVillage.Text.Trim() != "Seçin" && CBPrivateVillage.Value != null)
        {
            isnum = int.TryParse(CBPrivateVillage.Value.ToString(), out qkid);
        }

        if (CBPrivateVillage.Items.Count != 0 && qkid == 0 && isnum == false)
        {
            msg += "Qəsəbə/Kənd-i, ";
        }

        if (txtPrivatContractNum.Text.Trim() == "")
        {
            msg += "Müqaviləsinin nömrəsini, ";
        }
        if (DEPrivatContracDate.Text.Trim() == "")
        {
            msg += "Müqaviləsinin verilmə tarixini, ";
        }
        if (txtPrivateAmount.Text.Trim() == "")
        {
            msg += "Ödəniləcək məbləği, ";
        }

        if (msg.Length > 3)
        {
            LBPrivatemsg.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            LBPrivatemsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"Update Alienation set TaxpayerID=@TaxpayerID, RegistrDate=@RegistrDate, AlienationType=@AlienationType, RegionID=@RegionID,
                                              RegionName=@RegionName, VillageID=@VillageID, VillageName=@VillageName, Street=@Street, Home=@Home, Flat=@Flat,
                                              ContractNum=@ContractNum, ContractGiveDate=@ContractGiveDate, AmountOnContract=@AmountOnContract where AlienationID=@AlienationID", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", taxbayerid);
            cmd.Parameters.AddWithValue("RegistrDate", DEPrivateRegistrdate.Date);
            cmd.Parameters.AddWithValue("AlienationType", CBPrivateType.Value);
            cmd.Parameters.AddWithValue("RegionID", regionid);
            cmd.Parameters.AddWithValue("RegionName", CBPrivateRegion.Text.ToString());
            cmd.Parameters.AddWithValue("VillageID", qkid);
            cmd.Parameters.AddWithValue("VillageName", CBPrivateVillage.Text.Trim());
            cmd.Parameters.AddWithValue("Street", CBPrivatestreet.Text.Trim());
            cmd.Parameters.AddWithValue("Home", CBPrivateHome.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", CBPrivateFlat.Text.Trim());
            cmd.Parameters.AddWithValue("ContractNum", txtPrivatContractNum.Text.ToString());
            cmd.Parameters.AddWithValue("ContractGiveDate", DEPrivatContracDate.Date);
            cmd.Parameters.AddWithValue("AmountOnContract", txtPrivateAmount.Text.Trim());
            cmd.Parameters.AddWithValue("AlienationID", AlienationID);
            cmd.ExecuteNonQuery();
            selectPrivate();
            clrPrivate();
            LBPrivatemsg.ForeColor = System.Drawing.Color.Green;
            LBPrivatemsg.Text = "Məlumatlar üzərində edilən düzəlişlər yadda saxlanıldı";
        } 
 
    }
    protected void DataListPrivate_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowPrivate")
        {
            string deletesql = @"update Alienation set exitdate=getdate() where AlienationID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            selectPrivate();
        }
        if (e.CommandName == "UpdaterowPrivate")
        {
            FillCompanentOnEditPrivate(int.Parse(e.CommandArgument.ToString()));
            LBPrivateID.Text = e.CommandArgument.ToString();
        }
    }

    void vizualmenfeet()
    {
        DataTable region2 = connsql.getdatatable(@"select *,RegionName+' '+Village+' '+Street+' '+Home+' '+Flat as unvan  
from ProfitsTax where  TaxpayerID=" + TaxpayerID + " and ExitDate is null order by NowTime desc");
        rpmenfeet.DataSource = region2;
        rpmenfeet.DataBind();
    }


    protected void btnmenfeet_Click1(object sender, EventArgs e)
    {
        string msg = "";
        if (qeydtarix.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (txtmuesadi.Text.Trim() == "")
        {
            msg += "Müəssisənin adını, ";
        }
        if (txtfealnov.Text.Trim() == "")
        {
            msg += "Fəaliyyət növünü, ";
        }
        if (txtnumdoc.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin nömrəsini, ";
        }
        if (txtvertrx.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin verilmə tarixini, ";
        }
        if (txtvertrx.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin verilmə tarixini, ";
        }
        bool isnum = false;
        int regionid = 0;
        if ((cmbray.Text.Trim() != "") && (cmbray.Text.Trim() != "Seçin") && (cmbray.Value != null))
        {
            isnum = int.TryParse(cmbray.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (txtpoctin.Text.Trim()=="")
        {
          msg += "Poçt indeksini, ";
        }
        if (msg.Length > 3)
        {
            lbler.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            lbler.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlCommand cmd = new SqlCommand(@"insert into ProfitsTax (RegionName,Flat,Home,Street,Village,CompanyName,ActivitieType,TaxpayerID, RegstrDate, DocumentNumber, GivingDate,
PostIndex) 
values (@RegionName,@Flat,@Home,@Street,@Village,@CompanyName,@ActivitieType,@TaxpayerID,  @RegstrDate, @DocumentNumber, @GivingDate, @PostIndex)", connsql.baglan());
            cmd.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
            cmd.Parameters.AddWithValue("Village", cmbyasmen.Text.Trim());
            cmd.Parameters.AddWithValue("Street", cmbkuce.Text.Trim());
            cmd.Parameters.AddWithValue("Home", cmbev.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", cmbmenzil.Text.Trim());
            cmd.Parameters.AddWithValue("RegionName", cmbray.Text.Trim());
            cmd.Parameters.AddWithValue("RegstrDate", qeydtarix.Date);
            cmd.Parameters.AddWithValue("CompanyName", txtmuesadi.Text.Trim());
            cmd.Parameters.AddWithValue("ActivitieType", txtfealnov.Text.Trim());
            cmd.Parameters.AddWithValue("DocumentNumber", txtnumdoc.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", txtvertrx.Date);
            cmd.Parameters.AddWithValue("PostIndex", txtpoctin.Text.Trim());
            cmd.ExecuteNonQuery();
            vizualmenfeet();
            clrMenfet();
        }
    }
    protected void btnmendeyiw_Click1(object sender, EventArgs e)
    {
        string msg = "";
        if (qeydtarix.Text.Trim() == "")
        {
            msg += "Qeydiyyat tarixini, ";
        }
        if (txtmuesadi.Text.Trim() == "")
        {
            msg += "Müəssisənin adını, ";
        }
        if (txtfealnov.Text.Trim() == "")
        {
            msg += "Fəaliyyət növünü, ";
        }
        if (txtnumdoc.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin nömrəsini, ";
        }
        if (txtvertrx.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin verilmə tarixini, ";
        }
        if (txtvertrx.Text.Trim() == "")
        {
            msg += "Hüquqi ünvanı təsdiq edən sənədin verilmə tarixini, ";
        }
        bool isnum = false;
        int regionid = 0;
        if ((cmbray.Text.Trim() != "") && (cmbray.Text.Trim() != "Seçin") && (cmbray.Value != null))
        {
            isnum = int.TryParse(cmbray.Value.ToString(), out regionid);
        }
        if (!isnum)
        {
            msg += "Şəhəri/Rayonu, ";
        }
        if (txtpoctin.Text.Trim()=="")
        {
          msg += "Poçt indeksini, ";
        }
        if (msg.Length > 3)
        {
            lbler.Text = msg.Substring(0, msg.Length - 2) + " qeyd edin";
            lbler.ForeColor = System.Drawing.Color.Red;
        }
        else
        {

            SqlCommand cmd = new SqlCommand(@"Update ProfitsTax set Village=@Village,Street=@Street,Home=@Home,Flat=@Flat,CompanyName=@CompanyName,ActivitieType=@ActivitieType,
RegstrDate=@RegstrDate,DocumentNumber=@DocumentNumber,GivingDate=@GivingDate,PostIndex=@PostIndex 
where IncomeTaxID=" + lblgizlemen.Text, connsql.baglan());
            cmd.Parameters.AddWithValue("Village", cmbyasmen.Text.Trim());
            cmd.Parameters.AddWithValue("Street", cmbkuce.Text.Trim());
            cmd.Parameters.AddWithValue("Home", cmbev.Text.Trim());
            cmd.Parameters.AddWithValue("Flat", cmbmenzil.Text.Trim());
            cmd.Parameters.AddWithValue("RegionName", cmbray.Text.Trim());
            cmd.Parameters.AddWithValue("RegstrDate", qeydtarix.Date);
            cmd.Parameters.AddWithValue("CompanyName", txtmuesadi.Text.Trim());
            cmd.Parameters.AddWithValue("ActivitieType", txtfealnov.Text.Trim());
            cmd.Parameters.AddWithValue("DocumentNumber", txtnumdoc.Text.Trim());
            cmd.Parameters.AddWithValue("GivingDate", txtvertrx.Date);
            cmd.Parameters.AddWithValue("PostIndex", txtpoctin.Text.Trim());
            cmd.ExecuteNonQuery();
            vizualmenfeet();
            clrMenfet();
        }
    }
    protected void rpmenfeet_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deleterowmenfeet")
        {
            string deletesql = @"update ProfitsTax set exitdate=getdate() where IncomeTaxID=" + e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(deletesql, connsql.baglan());
            cmd.ExecuteNonQuery();
            vizualmenfeet();
        }
        if (e.CommandName == "Updaterownmenfeet")
        {
            lblgizlemen.Text = e.CommandArgument.ToString();
            DataRow drodeyici = connsql.GetDataRow(@"SELECT * 
from ProfitsTax where IncomeTaxID=" + e.CommandArgument.ToString());
            qeydtarix.Text = connsql.tarixkesdatetime(drodeyici["RegstrDate"].ToString());
            cmbray.Text = drodeyici["RegionName"].ToString();
            cmbyasmen.Text = drodeyici["Village"].ToString();
            cmbkuce.Text = drodeyici["Street"].ToString();
            cmbev.Text = drodeyici["Home"].ToString();
            cmbmenzil.Text = drodeyici["Flat"].ToString();
            txtmuesadi.Text = drodeyici["CompanyName"].ToString();
            txtfealnov.Text = drodeyici["ActivitieType"].ToString();
            txtnumdoc.Text = drodeyici["DocumentNumber"].ToString();
            txtvertrx.Text = connsql.tarixkesdatetime(drodeyici["GivingDate"].ToString());
            txtpoctin.Text = drodeyici["PostIndex"].ToString();
        }
    }
    protected void clrLivPro()
    {
        DERegistrDateLiving.Text = "";
        txtDocumentNumberLiving.Text = "";
        DeGivingDateLiving.Text = "";
        if (int.Parse(RegionID) > 15 && int.Parse(RegionID) != 64 && int.Parse(RegionID) != 37 && int.Parse(RegionID) != 60 && int.Parse(RegionID) != 62)
        {
            CBVergiDerecesiLiving.SelectedIndex = 0;   
        }
        CbQKliving.SelectedIndex = 0;
        CbStreetliving.Text = "";
        CbHomeliving.Text = "";
        CbFletLiving.Text = "";
        CbZonaLiving.SelectedIndex = 0;
        txtGeneralAreaLiving.Text = "";
        RbGuzeshtHeLiving.Checked = false;
        RbGuzeshtYoxLiving.Checked = false;
        
    }
    protected void clrMenfet()
    {
        qeydtarix.Text = "";
        txtmuesadi.Text = "";
        txtfealnov.Text = "";
        txtnumdoc.Text = "";
        txtvertrx.Text = "";
        cmbray.SelectedIndex = 0;
        cmbyasmen.SelectedIndex = 0;
        cmbkuce.Text = "";
        cmbev.Text = "";
        cmbmenzil.Text = "";
        txtpoctin.Text = "";
    }

    protected void CbTaxes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CbTaxes.Value != null)
        {
            if (CbTaxes.Value.ToString() == "1")
            {
                selectlivingProperty();
                PnlLivingPropertyTax.Visible = true;
                PnlCarParking.Visible = false;
                Pnllease.Visible = false;
                PnlLivingLandTax.Visible = false;
                PnlMeden.Visible = false;
                PnlMenfeet.Visible = false;
                PnlNolivingPropertyTax.Visible = false;
                PnlPrivate.Visible = false;
                PnlNolivingLandtax.Visible = false;
                PnlReklam.Visible = false;
                PnlStosionar.Visible = false;
                Pnltourism.Visible = false;
                PnlVillageLand.Visible = false;
                PnlTransport.Visible = false;
                
                string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                FillComboBox(CbRegionliving, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                CbRegionliving.SelectedIndex = 1;
                FillComboBox(CbQKliving, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbRegionliving.Value.ToString());

                string selectsql = @"select f.ZonaID,'Zona '+convert(nvarchar,f.ZonaID)+N'  -  ( '+convert(nvarchar,f.FactorName)+' )' zonaname from Factor f 
                                     where f.FactorID in (select FactorID from (select ZonaID, MAX(FactorID) FactorID from Factor  group by ZonaID) t1 )";
                
                CbRegionliving.Enabled = false;
                SqlDataAdapter dap = new SqlDataAdapter(selectsql, connsql.baglan());
                DataTable dt = new DataTable();
                dap.Fill(dt);

                CbZonaLiving.TextField = "zonaname";
                CbZonaLiving.ValueField = "ZonaID";
                CbZonaLiving.DataSource = dt;
                CbZonaLiving.DataBind();
                if (dt.Rows.Count > 0)
                {
                    CbZonaLiving.Items.Insert(0, new ListEditItem("Seçin", "-1"));
                }
                CbZonaLiving.SelectedIndex = 0;
                if (int.Parse(RegionID) > 14 && int.Parse(RegionID) != 64 &&  int.Parse(RegionID) != 60 && int.Parse(RegionID) != 15)
                {
                    trzonaemsaliLiving.Visible = false;
                    CBVergiDerecesiLiving.SelectedIndex = 0;
                    CBVergiDerecesiLiving.Enabled = true;
                }
                else if (int.Parse(RegionID) == 64 || int.Parse(RegionID) == 60 || int.Parse(RegionID) == 15)
                {
                    trzonaemsaliLiving.Visible = false;
                    CBVergiDerecesiLiving.SelectedIndex = 2;
                    CBVergiDerecesiLiving.Enabled = false;  
                }
                else  if (int.Parse(RegionID) <= 14)
                {
                    trzonaemsaliLiving.Visible = true;
                    CBVergiDerecesiLiving.SelectedIndex = 1;
                    CBVergiDerecesiLiving.Enabled = false;                  
                }
                
                
            } else
            if (CbTaxes.Value.ToString() == "2")
            {
                
                PnlLivingPropertyTax.Visible = false;
                PnlCarParking.Visible = false;
                Pnllease.Visible = false;
                PnlLivingLandTax.Visible = true;
                PnlMeden.Visible = false;
                PnlMenfeet.Visible = false;
                PnlNolivingPropertyTax.Visible = false;
                PnlPrivate.Visible = false;
                PnlNolivingLandtax.Visible = false;
                PnlReklam.Visible = false;
                PnlStosionar.Visible = false;
                Pnltourism.Visible = false;
                PnlVillageLand.Visible = false;
                PnlTransport.Visible = false;
                string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                FillComboBox(CbLivLandregion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                CbLivLandregion.SelectedIndex = 1;
                CbLivLandregion.Enabled = false;
                FillComboBox(CbLivLandQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbLivLandregion.Value.ToString());
                if (int.Parse(RegionID) <= 14)
                {
                    CbLivingLandFactor.SelectedIndex = 1;
                    CbLivingLandFactor.Enabled = false;
                }

                selectlivingLand();
                

            } else
            if (CbTaxes.Value.ToString() == "3")
            {
                PnlLivingPropertyTax.Visible = false;
                PnlCarParking.Visible = false;
                Pnllease.Visible = false;
                PnlLivingLandTax.Visible = false;
                PnlMeden.Visible = false;
                PnlMenfeet.Visible = false;
                PnlNolivingPropertyTax.Visible = true;
                PnlPrivate.Visible = false;
                PnlNolivingLandtax.Visible = false;
                PnlReklam.Visible = false;
                PnlStosionar.Visible = false;
                Pnltourism.Visible = false;
                PnlVillageLand.Visible = false;
                PnlTransport.Visible = false;
                
                string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                FillComboBox(CbQlivProRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                CbQlivProRegion.SelectedIndex = 1;
                CbQlivProRegion.Enabled = false;
                FillComboBox(CbQlivProQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbQlivProRegion.Value.ToString());

                string selectsql = @"select f.ZonaID,'Zona '+convert(nvarchar,f.ZonaID)+N'  -  ( '+convert(nvarchar,f.FactorName)+' )' zonaname from Factor f 
                                     where f.FactorID in (select FactorID from (select ZonaID, MAX(FactorID) FactorID from Factor  group by ZonaID) t1 )";
                SqlDataAdapter dap = new SqlDataAdapter(selectsql, connsql.baglan());
                DataTable dt = new DataTable();
                dap.Fill(dt);

                CbQlivProZona.TextField = "zonaname";
                CbQlivProZona.ValueField = "ZonaID";
                CbQlivProZona.DataSource = dt;
                CbQlivProZona.DataBind();
                if (dt.Rows.Count > 0)
                {
                    CbQlivProZona.Items.Insert(0, new ListEditItem("Seçin", "-1"));
                }
                CbQlivProZona.SelectedIndex = 0;
                if (int.Parse(RegionID) > 14 && int.Parse(RegionID) != 64 && int.Parse(RegionID) != 60 && int.Parse(RegionID) != 15)
                {
                    trzonaemsaliQLiving.Visible = false;
                    CBQlivproTAxRate.SelectedIndex = 0;
                    CBQlivproTAxRate.Enabled = true;
                }
                else if (int.Parse(RegionID) == 64 || int.Parse(RegionID) == 60 || int.Parse(RegionID) == 15)
                {
                    trzonaemsaliQLiving.Visible = false;
                    CBQlivproTAxRate.SelectedIndex = 2;
                    CBQlivproTAxRate.Enabled = false;
                }
                else if (int.Parse(RegionID) <= 14)
                {
                    trzonaemsaliQLiving.Visible = true;
                    CBQlivproTAxRate.SelectedIndex = 1;
                    CBQlivproTAxRate.Enabled = false;
                }
                selectQlivingProperty();

            }
            else
                if (CbTaxes.Value.ToString() == "4")
                {
                    PnlLivingPropertyTax.Visible = false;
                    PnlCarParking.Visible = false;
                    Pnllease.Visible = false;
                    PnlLivingLandTax.Visible = false;
                    PnlMeden.Visible = false;
                    PnlMenfeet.Visible = false;
                    PnlNolivingPropertyTax.Visible = false;
                    PnlPrivate.Visible = false;
                    PnlNolivingLandtax.Visible = true;
                    PnlReklam.Visible = false;
                    PnlStosionar.Visible = false;
                    Pnltourism.Visible = false;
                    PnlVillageLand.Visible = false;
                    PnlTransport.Visible = false;
                    
                    string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                    FillComboBox(CbQlivLandRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                    string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                    CbQlivLandRegion.SelectedIndex = 1;
                    CbQlivLandRegion.Enabled = false;
                    FillComboBox(CbQlivLandQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbQlivLandRegion.Value.ToString());
                    if (int.Parse(RegionID) <= 14)
                    {
                        CbQlivLandTaxRate.SelectedIndex = 1;
                        CbQlivLandTaxRate.Enabled = false;
                    }
                    selectQlivingLand();

                }
                else
                    if (CbTaxes.Value.ToString() == "5")
                    {
                        PnlLivingPropertyTax.Visible = false;
                        PnlCarParking.Visible = false;
                        Pnllease.Visible = false;
                        PnlLivingLandTax.Visible = false;
                        PnlMeden.Visible = false;
                        PnlMenfeet.Visible = false;
                        PnlNolivingPropertyTax.Visible = false;
                        PnlPrivate.Visible = false;
                        PnlNolivingLandtax.Visible = false;
                        PnlReklam.Visible = false;
                        PnlStosionar.Visible = false;
                        Pnltourism.Visible = false;
                        PnlVillageLand.Visible = true;
                        PnlTransport.Visible = false;
                        string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                        FillComboBox(CbVillageRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", "where RegionsID=" + RegionID);
                        CbVillageRegion.SelectedIndex = 1;
                        CbVillageQualityGroup.SelectedIndex = 0;
                        CbVillageRegion.Enabled = false;
                        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as ";
                        FillComboBox(CbVillageQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbVillageRegion.Value.ToString());
                        selectVillageLand();

                    }
                    else
                        if (CbTaxes.Value.ToString() == "6")
                        {
                            PnlLivingPropertyTax.Visible = false;
                            PnlCarParking.Visible = false;
                            Pnllease.Visible = false;
                            PnlLivingLandTax.Visible = false;
                            PnlMeden.Visible = false;
                            PnlMenfeet.Visible = false;
                            PnlNolivingPropertyTax.Visible = false;
                            PnlPrivate.Visible = false;
                            PnlNolivingLandtax.Visible = false;
                            PnlReklam.Visible = false;
                            PnlStosionar.Visible = false;
                            Pnltourism.Visible = false;
                            PnlVillageLand.Visible = false;
                            PnlTransport.Visible = true;
                            vizualneqliyyat();

                        }
                        else
                            if (CbTaxes.Value.ToString() == "7")
                            {
                                PnlLivingPropertyTax.Visible = false;
                                PnlCarParking.Visible = false;
                                Pnllease.Visible = false;
                                PnlLivingLandTax.Visible = false;
                                PnlMeden.Visible = true;
                                PnlMenfeet.Visible = false;
                                PnlNolivingPropertyTax.Visible = false;
                                PnlPrivate.Visible = false;
                                PnlNolivingLandtax.Visible = false;
                                PnlReklam.Visible = false;
                                PnlStosionar.Visible = false;
                                Pnltourism.Visible = false;
                                PnlVillageLand.Visible = false;
                                PnlTransport.Visible = false;
                                string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                FillComboBox(CbMedenRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", "");
                                selectMine();

                            }
                            else
                                if (CbTaxes.Value.ToString() == "8")
                                {
                                    PnlLivingPropertyTax.Visible = false;
                                    PnlCarParking.Visible = false;
                                    Pnllease.Visible = true;
                                    PnlLivingLandTax.Visible = false;
                                    PnlMeden.Visible = false;
                                    PnlMenfeet.Visible = false;
                                    PnlNolivingPropertyTax.Visible = false;
                                    PnlPrivate.Visible = false;
                                    PnlNolivingLandtax.Visible = false;
                                    PnlReklam.Visible = false;
                                    PnlStosionar.Visible = false;
                                    Pnltourism.Visible = false;
                                    PnlVillageLand.Visible = false;
                                    PnlTransport.Visible = false;
                                    string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                    FillComboBox(CBleaseregion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", "where RegionsID=" + RegionID);
                                    CBleaseregion.SelectedIndex = 1;
                                    CBleaseregion.Enabled = false;
                                    string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                                    FillComboBox(CBleaseQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBleaseregion.Value.ToString());
                                    selectlease();

                                }
                                else
                                    if (CbTaxes.Value.ToString() == "9")
                                    {
                                        PnlLivingPropertyTax.Visible = false;
                                        PnlCarParking.Visible = false;
                                        Pnllease.Visible = false;
                                        PnlLivingLandTax.Visible = false;
                                        PnlMeden.Visible = false;
                                        PnlMenfeet.Visible = false;
                                        PnlNolivingPropertyTax.Visible = false;
                                        PnlPrivate.Visible = false;
                                        PnlNolivingLandtax.Visible = false;
                                        PnlReklam.Visible = true;
                                        PnlStosionar.Visible = false;
                                        Pnltourism.Visible = false;
                                        PnlVillageLand.Visible = false;
                                        PnlTransport.Visible = false;
                                        string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                        FillComboBox(CbAdvertisementRegionName, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", "where RegionsID=" + RegionID);
                                        CbAdvertisementRegionName.SelectedIndex = 1;
                                        CbAdvertisementRegionName.Enabled = false;
                                        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                                        FillComboBox(CBAdvertisementVillageName, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbAdvertisementRegionName.Value.ToString());
                                        selectAdvertisement();

                                    }
                                    else
                                        if (CbTaxes.Value.ToString() == "10")
                                        {
                                            PnlLivingPropertyTax.Visible = false;
                                            PnlCarParking.Visible = true;
                                            Pnllease.Visible = false;
                                            PnlLivingLandTax.Visible = false;
                                            PnlMeden.Visible = false;
                                            PnlMenfeet.Visible = false;
                                            PnlNolivingPropertyTax.Visible = false;
                                            PnlPrivate.Visible = false;
                                            PnlNolivingLandtax.Visible = false;
                                            PnlReklam.Visible = false;
                                            PnlStosionar.Visible = false;
                                            Pnltourism.Visible = false;
                                            PnlVillageLand.Visible = false;
                                            PnlTransport.Visible = false;
                                            string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                            FillComboBox(CBCarRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", "where RegionsID=" + RegionID);
                                            CBCarRegion.SelectedIndex = 1;
                                            CBCarRegion.Enabled = false;
                                            string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                                            FillComboBox(CBCarVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBCarRegion.Value.ToString());
                                            selectCarStop();

                                        }
                                        else
                                            if (CbTaxes.Value.ToString() == "11")
                                            {
                                                PnlLivingPropertyTax.Visible = false;
                                                PnlCarParking.Visible = false;
                                                Pnllease.Visible = false;
                                                PnlLivingLandTax.Visible = false;
                                                PnlMeden.Visible = false;
                                                PnlMenfeet.Visible = false;
                                                PnlNolivingPropertyTax.Visible = false;
                                                PnlPrivate.Visible = false;
                                                PnlNolivingLandtax.Visible = false;
                                                PnlReklam.Visible = false;
                                                PnlStosionar.Visible = false;
                                                Pnltourism.Visible = true;
                                                PnlVillageLand.Visible = false;
                                                PnlTransport.Visible = false;
                                                selectHotel();

                                            }
                                            else
                                                if (CbTaxes.Value.ToString() == "12")
                                                {
                                                    PnlLivingPropertyTax.Visible = false;
                                                    PnlCarParking.Visible = false;
                                                    Pnllease.Visible = false;
                                                    PnlLivingLandTax.Visible = false;
                                                    PnlMeden.Visible = false;
                                                    PnlMenfeet.Visible = false;
                                                    PnlNolivingPropertyTax.Visible = false;
                                                    PnlPrivate.Visible = false;
                                                    PnlNolivingLandtax.Visible = false;
                                                    PnlReklam.Visible = false;
                                                    PnlStosionar.Visible = true;
                                                    Pnltourism.Visible = false;
                                                    PnlVillageLand.Visible = false;
                                                    PnlTransport.Visible = false;
                                                    string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                                    FillComboBox(CBTradeRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                                                    string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as ";
                                                    CBTradeRegion.SelectedIndex = 1;
                                                    CBTradeRegion.Enabled = false;
                                                    FillComboBox(CBTradeVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBTradeRegion.Value.ToString());
                                                    selectTrade();

                                                }
                                                else
                                                    if (CbTaxes.Value.ToString() == "13")
                                                    {
                                                        PnlLivingPropertyTax.Visible = false;
                                                        PnlCarParking.Visible = false;
                                                        Pnllease.Visible = false;
                                                        PnlLivingLandTax.Visible = false;
                                                        PnlMeden.Visible = false;
                                                        PnlMenfeet.Visible = false;
                                                        PnlNolivingPropertyTax.Visible = false;
                                                        PnlPrivate.Visible = true;
                                                        PnlNolivingLandtax.Visible = false;
                                                        PnlReklam.Visible = false;
                                                        PnlStosionar.Visible = false;
                                                        Pnltourism.Visible = false;
                                                        PnlVillageLand.Visible = false;
                                                        string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                                        FillComboBox(CBPrivateRegion, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where RegionsID=" + RegionID);
                                                        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
                                                        CBPrivateRegion.SelectedIndex = 1;
                                                        CBPrivateRegion.Enabled = false;
                                                        FillComboBox(CBPrivateVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBPrivateRegion.Value.ToString());
                                                        selectPrivate();
                                                    }
                                                    else
                                                        if (CbTaxes.Value.ToString() == "14")
                                                        {
                                                            PnlLivingPropertyTax.Visible = false;
                                                            PnlCarParking.Visible = false;
                                                            Pnllease.Visible = false;
                                                            PnlLivingLandTax.Visible = false;
                                                            PnlMeden.Visible = false;
                                                            PnlMenfeet.Visible = true;
                                                            PnlNolivingPropertyTax.Visible = false;
                                                            PnlPrivate.Visible = false;
                                                            PnlNolivingLandtax.Visible = false;
                                                            PnlReklam.Visible = false;
                                                            PnlStosionar.Visible = false;
                                                            Pnltourism.Visible = false;
                                                            PnlVillageLand.Visible = false;
                                                            string sqlregion = "case when CityID=1 then Name+N' şəhəri' else Name+N' rayonu'  end as  ";
                                                            FillComboBox(cmbray, "List_classification_Regions", "", "RegionsID", sqlregion, "Name", " where Fordelete=1");
                                                            vizualmenfeet();
                                                        }
            else
            {
                PnlLivingPropertyTax.Visible = false;
                PnlCarParking.Visible = false;
                Pnllease.Visible = false;
                PnlLivingLandTax.Visible = false;
                PnlMeden.Visible = false;
                PnlMenfeet.Visible = false;
                PnlNolivingPropertyTax.Visible = false;
                PnlPrivate.Visible = false;
                PnlNolivingLandtax.Visible = false;
                PnlReklam.Visible = false;
                PnlStosionar.Visible = false;
                Pnltourism.Visible = false;
                PnlVillageLand.Visible = false;
                PnlTransport.Visible = false;
             }
        }
    }
    protected void DataListLivPro_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
      //  DataRow dr = connsql.GetDataRow("select regionid from List_classification_Municipal where MunicipalID = (select MunicipalID from Taxpayer where TaxpayerID=" + TaxpayerID.ToString() + ")");
        if (RegionID!="" && RegionID!=null)
        {
            if (int.Parse(RegionID) >= 15)
            {
                CbZonaLiving.Enabled = false;
                yZonaGridfieldCaption.Visible = false;
                e.Item.FindControl("yZonaGridfield").Visible = false;
               // yzonaemsali.Visible = false;

            }
            else if (int.Parse(RegionID) < 15)
            {
                CbZonaLiving.Enabled = true;
                yZonaGridfieldCaption.Visible = true;
                e.Item.FindControl("yZonaGridfield").Visible = true;
                //  yzonaemsali.Visible = true;
            }
        }  
        
    }
    protected void DataListLivPro_Init(object sender, EventArgs e)
    {

    }
    protected void DataListLivPro_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
    }
    protected void CbLivLandregion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CbLivLandQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbLivLandregion.Value.ToString());
    }
    protected void CbQlivProRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CbQlivProQK, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbQlivProRegion.Value.ToString());
    }
    protected void CbQlivLandRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CbQlivLandQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbQlivLandRegion.Value.ToString());
    }
    protected void CbVillageRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CbVillageQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbVillageRegion.Value.ToString());
    }
    protected void cmbray_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(cmbyasmen, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + cmbray.Value.ToString());
    }
    protected void CBPrivateRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CBPrivateVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBPrivateRegion.Value.ToString());
    }
    protected void CBTradeRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CBTradeVillage, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CBTradeRegion.Value.ToString());
    }
    protected string getAdvertisemenFactor(string id, string col)
    {
        string s = "";
        DataRow dr = connsql.GetDataRow("Select " + col + " from AdventuraFactor where AdventuraFactorID=" + id);
        if (dr != null)
        {
            s = dr[col].ToString();
        }
        return s;
    }
    protected void RBAdvertisementA_CheckedChanged(object sender, EventArgs e)
    {
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementA.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(),"ColA");
        }
    }
    protected void RBAdvertisementB_CheckedChanged(object sender, EventArgs e)
    {
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementB.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(), "ColB");
        }
    }
    protected void RBAdvertisementC_CheckedChanged(object sender, EventArgs e)
    {
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementC.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(), "ColC");
        }
    }
    protected void CBAdvertisementKateqoriya_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementA.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(), "ColA");
        }
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementB.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(), "ColB");
        }
        if (CBAdvertisementKateqoriya.Value.ToString() != "0" && RBAdvertisementC.Checked == true)
        {
            LBAdvertisementFactor.Text = getAdvertisemenFactor(CBAdvertisementKateqoriya.Value.ToString(), "ColC");
        }
    }
    protected void CbAdvertisementRegionName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CBAdvertisementVillageName, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbAdvertisementRegionName.Value.ToString());
    }
    protected void CbMedenRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sqlqk = "CASE WHEN TypeID = 4 THEN Name + ' ' + N'kəndi'  WHEN TypeID = 3 THEN Name + ' ' + N'qəsəbəsi' WHEN TypeID = 2 THEN Name + ' ' + N'şəhəri' WHEN TypeID = 5 THEN Name + ' ' + N'rayonu' else Name   end as  ";
        FillComboBox(CbMedenQk, "List_SubRegions", "", "CityID", sqlqk, "Name", " Where RegionID=" + CbMedenRegion.Value.ToString());
    }

    public object txtdate2 { get; set; }
}