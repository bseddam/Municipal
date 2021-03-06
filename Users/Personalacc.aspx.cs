﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;

public partial class Users_Personalacc : System.Web.UI.Page
{
    Class2 klas = new Class2(); Hesablanmalar hesabla = new Hesablanmalar(); 
    string TaxpayerID; static string prevPage = String.Empty; 
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
           

            if (TaxpayerID != null)
            {
                //                case when LivingType=1 or LivingType=3 then N'əmlak vergisi' 
                //when LivingType=2 or LivingType=4 or LivingType=5 then N'torpaq vergisi' end as LivingType1,
                //case when LivingType=1 or LivingType=3 then N'198.1.1. –ci ' 
                //when LivingType=2 or LivingType=4 or LivingType=5 then N'206.3 – cü ' end as LivingType2,
                string MunicipalId = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();
                }



                DataRow drtediyye = klas.GetDataRow(@"select case when tx.Individual_Legal=1 then N'fiziki'
when tx.Individual_Legal=2 then N'hüquqi' end Individual_Legal,lm.MunicipalName,lm.Municipalphone,tx.Mobiltel,tx.ActualAdress,tx.YVOK,
lm.MunicipalAdress,StatusPositionName,
case 
when Individual_Legal=1 then tx.SName +' '+ tx.Name +' '+tx.FName+case when tx.Gender=1 then N' oğlu' when tx.Gender=2 then N' qızı' end
when Individual_Legal=2 then CompanyName
end as Name,
u.SName +' '+ u.Name +' '+u.FName+case when u.Gender=1 then N' oğlu' when u.Gender=2 then N' qızı' end Name1,
st.SName +' '+ st.Name +' '+st.FName+case when st.Gender=1 then N' oğlu' when st.Gender=2 then N' qızı' end Name2,tx.ActualAdress,tx.Mobiltel
 from Taxpayer as tx inner join List_classification_Municipal as lm on tx.MunicipalID=lm.MunicipalID
inner join Users u on u.MunicipalID=lm.MunicipalID
inner join Structure st on lm.MunicipalID=st.MunicipalID
  where st.charge=1 and tx.TaxpayerID =" + TaxpayerID);
                if (drtediyye != null)
                {
                    adsoyad.Text = drtediyye["Name"].ToString();
                    fizhuq.Text = drtediyye["Individual_Legal"].ToString();
                    beled.Text = drtediyye["MunicipalName"].ToString();
                    yvok.Text = drtediyye["YVOK"].ToString();
                    mehsulsexs.Text = drtediyye["Name1"].ToString();
                    vxor.Text = drtediyye["Name2"].ToString();
                    unvan.Text = drtediyye["ActualAdress"].ToString();
                    tel.Text = drtediyye["Mobiltel"].ToString();
                    mehsul.Text = drtediyye["StatusPositionName"].ToString();
                }

                il.Text = klas.getdatacell(@"select year(GETDATE())");


                string buil = klas.getdatacell(@"select year(getdate())");
                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "11", buil);
                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "11", buil);

                hesabla.CalcToday("1", TaxpayerID);
                hesabla.CalcToday("2", TaxpayerID);
                vizual();

                string payment = "";
                float payment1 = 0;
                payment = klas.getdatacell("Select top 1 cast(RemainingDebt+Sanction+PercentDebt as numeric(18,2)) umumiborc from Payments where TaxesPaymentID=1 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");
                
                if (payment != "" && payment!=null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }
                payment = klas.getdatacell("Select top 1 cast(RemainingDebt+Sanction+PercentDebt as numeric(18,2)) umumiborc from Payments where TaxesPaymentID=2 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }
                DataRow drborc7 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=7) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID and p.TaxesPaymentID=7) end AS numeric(18,2)) borc
  from MineTax mt inner join CalcMine ct on mt.MineId=ct.MineID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
                if (drborc7 != null)
                {
                    payment = drborc7["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }

                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=7 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }


                DataRow drborc8 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) end AS numeric(18,2)) borc
  from ViewLivingAreaLisee mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
                if (drborc8 != null)
                {
                    payment = drborc8["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }


                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=8 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }


                DataRow drborc9 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) end   AS numeric(18,2)) borc
  from ViewAdvertisement mt where mt.TaxpayerID=" + TaxpayerID + " and ExitDate is null group by mt.TaxpayerId");
                if (drborc9 != null)
                {
                    payment = drborc9["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }
                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=9 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }


                DataRow drborc10 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) end   AS numeric(18,2)) borc
  from CarStop mt inner join CalcCarStop ct on mt.CarID=ct.CarStopID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
                if (drborc10 != null)
                {
                    payment = drborc10["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }


                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=10 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }



                DataRow drborc11 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) end   AS numeric(18,2)) borc
  from Hotel mt inner join CalcHotel ct on mt.HotelID=ct.HotelID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
                if (drborc11 != null)
                {
                    payment = drborc11["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }

                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=11 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }


                DataRow drborc12 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) end   AS numeric(18,2)) borc
  from viewTradeService mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
                if (drborc12 != null)
                {
                    payment = drborc12["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }

                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=12 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }



                DataRow drborc13 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when AmountOnContract is null then 0 else AmountOnContract end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) end  AS numeric(18,2)) borc
  from Alienation mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
                if (drborc13 != null)
                {
                    payment = drborc13["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }
                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=13 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }



                DataRow drborc14 = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) end   AS numeric(18,2)) borc
  from ProfitsTax mt inner join CalcProfits ct on mt.IncomeTaxID=ct.ProfitsID where mt.TaxpayerID=" + TaxpayerID +
       "  and ExitDate is null group by mt.TaxpayerId");
                if (drborc14 != null)
                {
                    payment = drborc14["borc"].ToString();
                }
                else
                {
                    payment = "0";
                }
                //payment = klas.getdatacell("Select top 1 RemainingDebt from Payments where TaxesPaymentID=14 and TaxpayerID=" + TaxpayerID + " order by PaymentID desc");

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }

                payment = klas.getdatacell(@"select 
  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation<>10) - (case when 	(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10) is null then 0 else  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10)  end ) as sanctionborc");
                if (payment != null && payment != "")
                {
                    payment = Math.Round(float.Parse(payment), 2).ToString();
                }
                else
                {
                    payment = "0";
                }

                if (payment != "" && payment != null)
                {
                    payment1 = payment1 + float.Parse(payment);
                }
                lblumumiborc.Text = Math.Round(payment1, 2).ToString()+"  manat";
            }

        }
    }
    void vizual()
    {

        DataTable region2 = klas.getdatatable(@"select  PaymentID,Sanction, TaxpayerID, p.TaxesPaymentID,case when p.TaxesPaymentID=1 then N'Əmlak vergisi' 
when p.TaxesPaymentID=2 then N'Torpaq vergisi' when p.TaxesPaymentID=15 then N'Maliyyə sanksiyası' end  TaxesPaymentTypeName, Operation,CAST(Amount as numeric(18,2)) Amount,CAST(RemainingDebt as numeric(18,2)) RemainingDebt,
CAST(MorePayment as numeric(18,2)) MorePayment , PercentDayCount,  CAST(PercentCounted as numeric(18,2)) PercentCounted ,
CAST(PercentDebt as numeric(18,2)) PercentDebt, PaymentDocument, p.NowTime,
case 
when  Operation=10 then N'Ödəmə' else N'Hesablanma' end Operation1,cast(RemainingDebt+Sanction+PercentDebt as numeric(18,2)) umumiborc  from Payments p
inner join TaxesPaymentList txl on txl.TaxesPaymentID=p.TaxesPaymentID where  TaxpayerID=" + TaxpayerID + " and p.TaxesPaymentID in (1,2,15) order by p.PaymentID");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();
        if (region2 == null)
        {
            emlaktorp.Visible = false;
        }
        else
        {
            emlaktorp.Visible = true;
        }

        DataTable region3 = klas.getdatatable(@"select fullname,kkk.YVOK,Mobiltel,kkk.TaxpayerID,case when kkk.Operation=10 then N'Ödəmə' else 'Hesablama' end Operation,kkk.Amount,kkk.RemainingDebt,kkk.MorePayment,
kkk.PaymentDocument,kkk.NowTime,TaxesPaymentTypeName,kkk.TaxesPaymentID from (
select t.SName+' '+t.Name+' '+FName as fullname,t.YVOK,Mobiltel,p.TaxpayerID,p.Operation,p.Amount,p.RemainingDebt,p.MorePayment,p.PaymentDocument,p.NowTime,TaxesPaymentTypeName,p.TaxesPaymentID,PaymentID
from Payments p 
inner join Taxpayer t on t.TaxpayerID=p.TaxpayerID
inner join (select * from TaxesPaymentList union select 15,'Sanksiya','0','2020-10-15 00:00:00.000') tpl on tpl.TaxesPaymentID=p.TaxesPaymentID
where p.TaxesPaymentID not in (1,2)

union
select fullname,YVOK,Mobiltel,TaxpayerID,'' Operation,'' Amount,v.Payment RemainingDebt,'' MorePayment,'' PaymentDocument,GETDATE() NowTime,TaxesPaymentTypeName,TaxesPaymentID,0 PaymentID
from  viewdepts  v where TaxesPaymentID not in (1,2)
) kkk where TaxpayerID=" + TaxpayerID + " order by PaymentID");
        Repeater2.DataSource = region3;
        Repeater2.DataBind();
        if (region3 == null)
        {
            pnlodeniw.Visible = false;
        }
        else {
            pnlodeniw.Visible = true;
        }
      

    }

}