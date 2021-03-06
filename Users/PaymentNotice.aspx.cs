﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;

public partial class Users_PaymentNotice : System.Web.UI.Page
{
    Class2 klas = new Class2(); Hesablanmalar hesabla = new Hesablanmalar(); 
    string TaxpayerID; static string prevPage = String.Empty;
    float umumiborc = 0, cem08 = 0, cem11 = 0, cemtq = 0, cemfaiz = 0, cemsanksiya=0;
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
        
        if (!Page.IsPostBack)
        {
            prevPage = Request.Url.AbsoluteUri.ToString();
    
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            //if (islem != "PaymentNotice")
            //{
            //    pnlhtml.Visible = false;
            //}
            //else
            //{
      
            //}
            if (TaxpayerID != null)
            {

                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
                string MunicipalId = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();
                }
      
                DataRow drtediyye1 = klas.GetDataRow(@"select 
SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name,StatusPositionName  from Structure as st
inner join List_classification_Municipal as lm on st.MunicipalID=lm.MunicipalID   where st.MunicipalID =" + MunicipalId + " and Charge=1");
                if (drtediyye1 != null)
                {
                    mehsul.Text = drtediyye1["StatusPositionName"].ToString();
                    lblsedradsoy.Text = drtediyye1["Name"].ToString();
                    string indikivaxt = klas.getdatacell("SELECT GETDATE() as indikivaxt");
                    lblsedrtarix.Text = klas.tarixkesdatetime(indikivaxt).ToString();
                }
                string vaxt = klas.getdatacell(@"select getdate() as vaxt");
                lbltrx1.Text = Convert.ToDateTime(vaxt).Year.ToString();
                lbltrx2.Text = Convert.ToDateTime(vaxt).Year.ToString();
                trxili.Text = Convert.ToDateTime(vaxt).Year.ToString();
                lbltrxili2.Text = Convert.ToDateTime(vaxt).Year.ToString();
                DataRow drtediyye = klas.GetDataRow(@"select lm.MunicipalName,lm.Municipalphone,tx.Mobiltel,tx.Workltel,tx.Hometel,tx.ActualAdress,tx.YVOK,lm.MunicipalAdress,
Bank,lm.VOEN, AccountNumber,tx.SName +' '+ tx.Name +' '+tx.FName+case when tx.Gender=1 then N' oğlu' when tx.Gender=2 then N' qızı' end as Name
from Taxpayer as tx inner join List_classification_Municipal as lm on tx.MunicipalID=lm.MunicipalID  where  tx.TaxpayerID =" + TaxpayerID);
                if (drtediyye != null)
                {
                    string stel = "";
                    bool bool1 = false;
                    if (drtediyye["Mobiltel"].ToString() != "")
                    {
                        stel = "m: " + drtediyye["Mobiltel"].ToString();
                        bool1 = true;
                    }
                    if (drtediyye["Workltel"].ToString() != "")
                    {
                        if (bool1 == true)
                        {
                            stel =stel + ", i: " + drtediyye["Workltel"].ToString();
                        }
                        else
                        {
                            stel = "i: " + drtediyye["Workltel"].ToString();
                            bool1 = true;
                        }
                    }
                    if (drtediyye["Hometel"].ToString() != "")
                    {
                        if (bool1 == true)
                        {
                            stel = stel + ", e: " + drtediyye["Hometel"].ToString();
                        }
                        else
                        {
                            stel = "e: " + drtediyye["Hometel"].ToString();
                        }
                    }
                    bank.Text = drtediyye["Bank"].ToString();
                    voen.Text = drtediyye["VOEN"].ToString();
                    hesabn.Text = drtediyye["AccountNumber"].ToString();
                    lblbeladi.Text = drtediyye["MunicipalName"].ToString();
                    lbladsoyad.Text = drtediyye["Name"].ToString();
                    lblbeltel.Text = drtediyye["Municipalphone"].ToString();
                    lblodtel.Text = stel;
                    lblodunvan.Text= lblodunvan1.Text = drtediyye["ActualAdress"].ToString();
                    lblyvok.Text = lblyvok1.Text= drtediyye["YVOK"].ToString();
                    lblbelediyyeadi.Text = drtediyye["MunicipalName"].ToString();
                    lblbelunvani.Text = drtediyye["MunicipalAdress"].ToString();
                    lblmen.Text = drtediyye["Name"].ToString();
                    lblodeyicitel.Text = stel;
                }

                DataRow dr1 = klas.GetDataRow(@"select TaxpayerID from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear=Year(getdate()) and TaxesType=1");
                if (dr1 != null)
                {
                    lblvergiadi.Text = "əmlak";
                    DataRow dr11 = klas.GetDataRow(@"select TaxpayerID from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear=Year(getdate()) and TaxesType=2");
                    if (dr11 != null)
                    {
                        lblvergiadi.Text =lblvergiadi.Text + " və torpaq";
                    }
                }
                else
                {
                    lblvergiadi.Text = "torpaq";
                }



                string buil = klas.getdatacell(@"select year(getdate())");
                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "11", buil);

                emlak("1");

                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "11", buil);

                emlak("2");
                //pnlhtml.Visible = true;
                pnlsanksiya.Visible = true;
                
            }
            
        }
    }





   

    void emlak(string verginov)
    {
        SqlConnection baglan = klas.baglan();


        DataRow drw3 = klas.GetDataRow(@"select Series,SanctionTax,CalcID,TaxpayerID,CalcYear,AmountTax,cast(AmountTax/2 as numeric(15,2)) as yarisi
from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear=Year(getdate()) and TaxesType in (" + verginov + ") order by CalcID desc");
        if (drw3 != null)
        {
            lblseria.Text = drw3["Series"].ToString();
            seriakotuk.Text = drw3["Series"].ToString();
        }

        float tq = 0;
        float tart = 0;
        float tfaiz = 0;
        float tsanksia = 0;
        float emlakv = 0;
        float eo08 = 0;
        float eo11 = 0;
        hesabla.CalcToday(verginov, TaxpayerID);

        DataRow drinsertsora = klas.GetDataRow(@" select mt.TaxpayerId,p3.Operation,
  --@qaliq=
  case when p3.RemainingDebt is null then 0 else p3.RemainingDebt end  qaliq, 
	 
	 --@artiqodeme= 
	 case when  p3.morepayment is null then 0   else p3.morepayment  end artiqodeme,  
	 	 --@yenigday=
	         case when (case when  
             p3.RemainingDebt is null then 0 
            else p3.RemainingDebt end=0) then 0 
        else 
        DATEDIFF(DAY,(p3.NowTime),GETDATE() ) 
        end as yenigday,
         --@yenifaiz=
        DATEDIFF(DAY,p3.NowTime,GETDATE())*  
        p3.RemainingDebt/1000 as yenifaiz,
         --@yenifaizqaliq=
		(DATEDIFF(DAY,p3.NowTime,GETDATE())* 
         p3.RemainingDebt/1000) + p3.PercentDebt as yenifaizqaliq, 
	 
	 --@sanction=
	 p3.sanction ,p3.PaymentID,
		Convert(varchar,p3.NowTime,104) as DrealDatetime, 
        Convert(varchar,Getdate(),104) nowdatetime 
	 from CalcTaxes  mt 
left join (select xx.TaxpayerID,xx.TaxesPaymentID,max(xx.PaymentID) as PaymentID from Payments xx group by xx.TaxpayerID,xx.TaxesPaymentID) p2  
 on p2.TaxpayerID=mt.TaxpayerID and TaxesPaymentID=mt.TaxesType
 left join Payments p3 on p2.PaymentID=p3.PaymentID
 inner join Taxpayer t on t.TaxpayerID=mt.TaxpayerID 
 where mt.TaxesType=" + verginov + " and mt.TaxpayerID=" + TaxpayerID + " and CalcYear=YEAR(GETDATE())");
        
        if (drinsertsora != null)
        {

            tq = float.Parse(drinsertsora["qaliq"].ToString());
            tart = float.Parse(drinsertsora["artiqodeme"].ToString());
            tfaiz = 0;
            if (drinsertsora["yenifaizqaliq"] != null && drinsertsora["yenifaizqaliq"].ToString() != "")
            {
                tfaiz = float.Parse(drinsertsora["yenifaizqaliq"].ToString());
            }
            tsanksia = 0;
            if (drinsertsora["sanction"] != null && drinsertsora["sanction"].ToString() != "")
            {
                tsanksia = float.Parse(drinsertsora["sanction"].ToString());
            }

            DataRow dremlak = klas.GetDataRow(@"select Series,SanctionTax,CalcID,TaxpayerID,CalcYear,AmountTax,cast(AmountTax/2 as numeric(15,2)) as yarisi
from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear<=Year(getdate()) and TaxesType=" + verginov + " order by CalcYear desc");

            emlakv = 0;
            if (dremlak != null)
            {
                emlakv = float.Parse(dremlak["AmountTax"].ToString());
            }


            eo08 = emlakv / 2;
            eo11 = emlakv / 2;


            if (verginov == "1")
            {
                
                
                cem08 = eo08;
                cem11 = eo11;
                cemtq = tq;
                cemfaiz = tfaiz;
                cemsanksiya = tsanksia;
                string datelastinsert = klas.getdatacell("Select Getdate()");
                string ilindiki = klas.getdatacell("Select Year(Getdate())");

                if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.08." + ilindiki) && Convert.ToDateTime(datelastinsert) <= Convert.ToDateTime("15.11." + ilindiki))
                {
                    umumiborc = umumiborc + eo11 + tq + tfaiz + tsanksia-tart;
                }
                else if (Convert.ToDateTime(datelastinsert) < Convert.ToDateTime("15.08." + ilindiki))
                {
                    umumiborc = umumiborc + eo11 +eo08+ tq + tfaiz + tsanksia - tart;
                }
                else if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.11." + ilindiki))
                {
                    umumiborc = umumiborc + tq + tfaiz + tsanksia - tart;
                }
               
                
                lblevergi.Text = Math.Round(Convert.ToDecimal(emlakv), 2).ToString();
            }
            else
            {
                

                cem08 += eo08;
                cem11 += eo11;
                cemtq += tq;
                cemfaiz += tfaiz;
                cemsanksiya += tsanksia;


                string datelastinsert = klas.getdatacell("Select Getdate()");
                string ilindiki = klas.getdatacell("Select Year(Getdate())");

                if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.08." + ilindiki) && Convert.ToDateTime(datelastinsert) <= Convert.ToDateTime("15.11." + ilindiki))
                {
                    umumiborc = umumiborc + eo11 + tq + tfaiz + tsanksia - tart;
                }
                else if (Convert.ToDateTime(datelastinsert) < Convert.ToDateTime("15.08." + ilindiki))
                {
                    umumiborc = umumiborc + eo11 + eo08 + tq + tfaiz + tsanksia - tart;
                }
                else if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.11." + ilindiki))
                {
                    umumiborc = umumiborc + tq + tfaiz + tsanksia - tart;
                }

                lbltvergi.Text = Math.Round(Convert.ToDecimal(emlakv), 2).ToString();
                lbltarixindenman.Text = Math.Round(Convert.ToDecimal(cem08), 2).ToString();
                lbltarixedekman.Text = Math.Round(Convert.ToDecimal(cem11), 2).ToString();
                lblborc.Text = Math.Round(Convert.ToDecimal(cemtq), 2).ToString();
                lblfaizmeb.Text = Math.Round(Convert.ToDecimal(cemfaiz), 2).ToString();
                string payment = klas.getdatacell(@"select 
  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID + 
" and p.TaxesPaymentID=15 and p.Operation<>10 ) - ( case when 	(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID + 
" and p.TaxesPaymentID=15 and p.Operation=10) is null then 0 else  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID + 
" and p.TaxesPaymentID=15 and p.Operation=10)  end ) as sanctionborc");


                if (payment != null && payment != "")
                {
                    lblmaliyesanksiya.Text = Math.Round(float.Parse(payment), 2).ToString();
                    umumiborc = umumiborc + float.Parse(payment);
                }
                lblodcekmebleg.Text = Math.Round(Convert.ToDecimal(umumiborc), 2).ToString();
                lblhesmanat.Text = Math.Round(Convert.ToDecimal(umumiborc), 2).ToString();
            }
        }
        else 
        {

            cem08 += eo08;
            cem11 += eo11;
            cemtq += tq;
            cemfaiz += tfaiz;
            cemsanksiya += tsanksia;
            if (umumiborc < 0)
            {
                umumiborc = 0;
            }
            umumiborc = umumiborc + eo11 + eo08 + tq + tfaiz + tsanksia;
            string datelastinsert = klas.getdatacell("Select Getdate()");
            string ilindiki = klas.getdatacell("Select Year(Getdate())");

            if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.08." + ilindiki) && Convert.ToDateTime(datelastinsert) <= Convert.ToDateTime("15.11." + ilindiki))
            {

                umumiborc = (float)System.Math.Round(umumiborc - eo08, 2, MidpointRounding.AwayFromZero);
            }
            else if (Convert.ToDateTime(datelastinsert) < Convert.ToDateTime("15.08." + ilindiki))
            {
                umumiborc = (float)System.Math.Round(umumiborc, 2, MidpointRounding.AwayFromZero);
            }
            else
                if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.11." + ilindiki))
                {

                    umumiborc = (float)System.Math.Round(umumiborc - eo08 - eo11, 2, MidpointRounding.AwayFromZero);
                }


            lbltvergi.Text = Math.Round(Convert.ToDecimal(emlakv), 2).ToString();
            lbltarixindenman.Text = Math.Round(Convert.ToDecimal(cem08), 2).ToString();
            lbltarixedekman.Text = Math.Round(Convert.ToDecimal(cem11), 2).ToString();
            lblborc.Text = Math.Round(Convert.ToDecimal(cemtq), 2).ToString();
            lblfaizmeb.Text = Math.Round(Convert.ToDecimal(cemfaiz), 2).ToString();

            if (verginov != "1")
            {
                string payment = klas.getdatacell(@"  select 
  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation<>10 ) - ( case when 	(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10) is null then 0 else  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10)  end ) as sanctionborc");
                if (payment != null && payment != "")
                {
                    lblmaliyesanksiya.Text = Math.Round(float.Parse(payment), 2).ToString();
                    umumiborc = umumiborc + float.Parse(payment);
                }
            }

            lblodcekmebleg.Text = Math.Round(Convert.ToDecimal(umumiborc), 2).ToString();
            lblhesmanat.Text = Math.Round(Convert.ToDecimal(lblodcekmebleg.Text), 2).ToString();
        }
    }
    protected void btnsanksiya_Click(object sender, EventArgs e)
    {
        SqlConnection baglanx = klas.baglan();
//        string datetoday = klas.getdatacell(@"Select NowTime from Payments where TaxesPaymentID=15 
//and TaxpayerID=" + TaxpayerID + " order by NowTime desc,PaymentID desc");
//        string datelastinsert = klas.getdatacell("Select Getdate()");

//        if (Convert.ToDateTime(datetoday).ToString("yyyy-MM-dd") != Convert.ToDateTime(datelastinsert).ToString("yyyy-MM-dd"))
//        {
//            string payment = klas.getdatacell(@"Select Amount from Payments where 
//TaxesPaymentID=15 and TaxpayerID=" + TaxpayerID + " order by NowTime desc,PaymentID desc");
            //if (payment == null)
            //{
            //    payment = "0";
            //}
            float payment1 = 0;
            if ( txtsanksiya.Text != "")
            {
                payment1 =  float.Parse(txtsanksiya.Text);
            }
            
            SqlCommand cmdx = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Operation,Amount,RemainingDebt,
PercentDayCount,PercentCounted,PercentDebt,PaymentDocument,NowTime,MorePayment,Sanction) 
values (@TaxpayerID,@TaxesPaymentID,@Operation,@Amount,@RemainingDebt,@PercentDayCount,@PercentCounted,@PercentDebt,@PaymentDocument,
getdate(),@MorePayment,@Sanction)", baglanx);
            cmdx.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
            cmdx.Parameters.AddWithValue("TaxesPaymentID", 15);
            cmdx.Parameters.AddWithValue("Operation", 11);
            cmdx.Parameters.AddWithValue("RemainingDebt", int.Parse("0"));
            cmdx.Parameters.AddWithValue("MorePayment", int.Parse("0"));
            cmdx.Parameters.AddWithValue("Sanction", payment1);
            cmdx.Parameters.AddWithValue("Amount", payment1);
            cmdx.Parameters.AddWithValue("PercentDayCount", int.Parse("0"));
            cmdx.Parameters.AddWithValue("PercentCounted", int.Parse("0"));
            cmdx.Parameters.AddWithValue("PercentDebt", int.Parse("0"));
            cmdx.Parameters.AddWithValue("PaymentDocument", "");
            cmdx.ExecuteNonQuery();
        //}
        //else
        //{
        //    string id = klas.getdatacell("Select PaymentID from Payments where TaxesPaymentID=15 and TaxpayerID=" + TaxpayerID + " and operation<>10 order by NowTime desc,PaymentID desc");

        //    if (id != "" && id != null)
        //    {
        //        SqlCommand cmdx = new SqlCommand(@"update Payments set TaxpayerID=@TaxpayerID,TaxesPaymentID=@TaxesPaymentID,
        //                                   Operation=@Operation,Sanction=@Sanction,Amount=@Amount where PaymentID=" + id, baglanx);
        //        cmdx.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
        //        cmdx.Parameters.AddWithValue("TaxesPaymentID", 15);
        //        cmdx.Parameters.AddWithValue("Operation", 11);
        //        cmdx.Parameters.AddWithValue("Sanction", txtsanksiya.Text);
        //        cmdx.Parameters.AddWithValue("Amount", txtsanksiya.Text);
        //        cmdx.ExecuteNonQuery();
        //    }
        //}

        Response.Redirect("~/users/PaymentNotice.aspx?TaxpayerID=" + TaxpayerID + "&islem=PaymentNotice&IndividualLegal=1");

    }

}