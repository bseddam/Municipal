using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MethotAll
/// </summary>
public class MethotAll
{
	public MethotAll()
	{
		//
		// TODO: Add constructor logic here
		//
	}


        Class2 klas = new Class2();
        Hesablanmalar hesabla = new Hesablanmalar();

    
   
        public float GetEmlakTorpaq(string verginov, string TaxpayerID)
        {
            SqlConnection baglan = klas.baglan();
            string buil = klas.getdatacell(@"select year(getdate())");


            if (verginov == "1")
            {

                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "11", buil);

                hesabla.CalcToday("1", TaxpayerID);


                float umumiborc = 0;
                DataRow drinsertsora = klas.GetDataRow(@"select mt.TaxpayerId,  case when 
            (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) is null then 0 
            else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) 
       end  qaliq,       
       case when 
            (select top 1 morepayment from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) is null then 0 
         
            else (select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) 
       end  artiqodeme,
       case when (case when 
            (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) is null then 0 
            else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) 
       end=0) then 0
       else
       DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID = 1 order by PaymentID desc),GETDATE() )
       end as yenigday,
       DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc),GETDATE())*
       (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc)/1000 as yenifaiz,
       (DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc),GETDATE())*
        (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc)/1000) 
        +
        (select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) as yenifaizqaliq,
       (select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 1 order by PaymentID desc) as sanction
 from CalcTaxes mt 
  where mt.TaxesType=1 and mt.TaxpayerID=" + TaxpayerID + " and CalcYear=YEAR(GETDATE()) group by mt.TaxpayerId");
                if (drinsertsora != null)
                {

                    float tq = float.Parse(drinsertsora["qaliq"].ToString());
                    float tart = float.Parse(drinsertsora["artiqodeme"].ToString());
                    float tfaiz = 0;
                    if (drinsertsora["yenifaizqaliq"] != null && drinsertsora["yenifaizqaliq"].ToString() != "")
                    {
                        tfaiz = float.Parse(drinsertsora["yenifaizqaliq"].ToString());
                    }

                    float tsanksia = 0;
                    if (drinsertsora["sanction"] != null && drinsertsora["sanction"].ToString() != "")
                    {
                        tsanksia = float.Parse(drinsertsora["sanction"].ToString());
                    }

                    DataRow dremlak = klas.GetDataRow(@"select Series,SanctionTax,CalcID,TaxpayerID,CalcYear,AmountTax,cast(AmountTax/2 as numeric(15,2)) as yarisi
from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear<=Year(getdate()) and TaxesType=1 order by CalcYear desc");


                    float emlakv = 0;
                    if (dremlak != null)
                    {
                        emlakv = float.Parse(dremlak["AmountTax"].ToString());
                    }

                    float eo08 = emlakv / 2;
                    float eo11 = emlakv / 2;


                    string datelastinsert = klas.getdatacell("Select Getdate()");
                    string ilindiki = klas.getdatacell("Select Year(Getdate())");

                    if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.08." + ilindiki) && Convert.ToDateTime(datelastinsert) <= Convert.ToDateTime("15.11." + ilindiki))
                    {

                        umumiborc = eo11 + tq + tfaiz + tsanksia - tart;
                    }
                    else if (Convert.ToDateTime(datelastinsert) < Convert.ToDateTime("15.08." + ilindiki))
                    {
                        umumiborc = eo11 + eo08 + tq + tfaiz + tsanksia - tart;
                    }
                    else if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.11." + ilindiki))
                    {

                        umumiborc = tq + tfaiz + tsanksia - tart;
                    }


                }
                return -float.Parse(System.Math.Round(umumiborc, 2, MidpointRounding.AwayFromZero).ToString());

            }
            // torpaq vergisi

            else if (verginov == "2")
            {


                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "08", buil);
                hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "11", buil);

                hesabla.CalcToday("2", TaxpayerID);


                float umumiborc = 0;
                DataRow drinsertsora = klas.GetDataRow(@"select mt.TaxpayerId,  case when 
            (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) is null then 0 
            else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (2) order by PaymentID desc) 
       end  qaliq,
       
       case when 
            (select top 1 morepayment from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) is null then 0 
         
            else (select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) 
       end  artiqodeme,
       case when (case when 
            (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) is null then 0 
            else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) 
       end=0) then 0
       else
       DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID = 2 order by PaymentID desc),GETDATE() )
       end as yenigday,
       DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc),GETDATE())*
       (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc)/1000 as yenifaiz,
       (DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  =2 order by PaymentID desc),GETDATE())*
        (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc)/1000) 
        +
        (select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) as yenifaizqaliq,
       (select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  = 2 order by PaymentID desc) as sanction
 from CalcTaxes mt 
  where mt.TaxesType=2 and mt.TaxpayerID=" + TaxpayerID + " and CalcYear=YEAR(GETDATE()) group by mt.TaxpayerId");
                if (drinsertsora != null)
                {

                    float tq = float.Parse(drinsertsora["qaliq"].ToString());
                    float tart = float.Parse(drinsertsora["artiqodeme"].ToString());
                    float tfaiz = 0;
                    if (drinsertsora["yenifaizqaliq"] != null && drinsertsora["yenifaizqaliq"].ToString() != "")
                    {
                        tfaiz = float.Parse(drinsertsora["yenifaizqaliq"].ToString());
                    }

                    float tsanksia = 0;
                    if (drinsertsora["sanction"] != null && drinsertsora["sanction"].ToString() != "")
                    {
                        tsanksia = float.Parse(drinsertsora["sanction"].ToString());
                    }

                    DataRow drtorp = klas.GetDataRow(@"select Series,SanctionTax,CalcID,TaxpayerID,CalcYear,AmountTax,cast(AmountTax/2 as numeric(15,2)) as yarisi
from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear=Year(getdate()) and TaxesType=2 order by CalcYear desc");


                    float torpaqv = 0;
                    if (drtorp != null)
                    {
                        torpaqv = float.Parse(drtorp["AmountTax"].ToString());
                    }

                    float eo08 = torpaqv / 2;
                    float eo11 = torpaqv / 2;

                    string datelastinsert = klas.getdatacell("Select Getdate()");

                    if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.08." + DateTime.Now.Year.ToString()) && Convert.ToDateTime(datelastinsert) <= Convert.ToDateTime("15.11." + DateTime.Now.Year.ToString()))
                    {
                        umumiborc = eo11 + tq + tfaiz + tsanksia - tart;
                    }
                    else if (Convert.ToDateTime(datelastinsert) < Convert.ToDateTime("15.08." + DateTime.Now.Year.ToString()))
                    {
                        umumiborc = eo11 + eo08 + tq + tfaiz + tsanksia - tart;
                    }
                    else if (Convert.ToDateTime(datelastinsert) >= Convert.ToDateTime("15.11." + DateTime.Now.Year.ToString()))
                    {
                        umumiborc = tq + tfaiz + tsanksia - tart;
                    }
                    return -float.Parse(System.Math.Round(umumiborc, 2, MidpointRounding.AwayFromZero).ToString());
                }

            }
         
            
                return 0;
            
        }
      
        public float GetOdenishAmount(string verginow, string TaxpayerID)
        {
            float qaliqborc = 0;
            if (verginow == "7")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when Amount is null then 0 else Amount end )-
case when (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=7) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID and p.TaxesPaymentID=7) end  borc
  from MineTax mt inner join CalcMine ct on mt.MineId=ct.MineID where mt.TaxpayerID=" + TaxpayerID + " group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "14")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) end  borc
  from ProfitsTax mt inner join CalcProfits ct on mt.IncomeTaxID=ct.ProfitsID where mt.TaxpayerID=" + TaxpayerID +
            " group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "9")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) end  borc
  from ViewAdvertisement mt where mt.TaxpayerID=" + TaxpayerID + " group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "10")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) end  borc
  from CarStop mt inner join CalcCarStop ct on mt.CarID=ct.CarStopID where mt.TaxpayerID=" + TaxpayerID + " group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "11")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) end  borc
  from Hotel mt inner join CalcHotel ct on mt.HotelID=ct.HotelID where mt.TaxpayerID=" + TaxpayerID + "  group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "12")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) end  borc
  from viewTradeService mt  where mt.TaxpayerID=" + TaxpayerID + " group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "13")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when AmountOnContract is null then 0 else AmountOnContract end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) end  borc
  from Alienation mt  where mt.TaxpayerID=" + TaxpayerID + "  group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            else if (verginow == "8")
            {
                DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) end  borc
  from ViewLivingAreaLisee mt  where mt.TaxpayerID=" + TaxpayerID + "  group by mt.TaxpayerId");
                if (drborc != null)
                {
                    qaliqborc = float.Parse(drborc["borc"].ToString());
                }
            }
            return qaliqborc;
        }
        public void InserTaxes(string TaxpayerID, string taxestype, string amount)
        {
            float qaliqborc = 0;

            if (taxestype == "1" || taxestype == "2")
            {

                DataRow drqaliq1 = klas.GetDataRow(@"select mt.TaxpayerId,  case when " +
       "       (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) is null then 0 " +
       "       else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) " +
     "    end  qaliq, " +
      "   case when " +
      "        (select top 1 morepayment from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) is null then 0 " +
      "        else (select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) " +
     "    end  artiqodeme, " +
    "     case when (case when  " +
       "       (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) is null then 0 " +
       "       else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) " +
      "   end=0) then 0 " +
      "   else " +
      "   DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID in (" + taxestype + ") order by PaymentID desc),GetDate()) " +
      " end as yenigday," +
      "  DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc),GetDate())*" +
      "  (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc)/1000 as yenifaiz," +
     "   (DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc),GetDate())*" +
     "    (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc)/1000) + " +
     "    (select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) as yenifaizqaliq, " +
     "   (select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + taxestype + ") order by PaymentID desc) as sanction " +
 " from CalcTaxes mt " +
 "  where mt.TaxpayerID=" + TaxpayerID + " and CalcYear=YEAR(GETDATE()) group by mt.TaxpayerId");


                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Operation,Amount,RemainingDebt,
PercentDayCount,PercentCounted,PercentDebt,PaymentDocument,NowTime,MorePayment,Sanction) 
values (@TaxpayerID,@TaxesPaymentID,@Operation,@Amount,@RemainingDebt,@PercentDayCount,@PercentCounted,@PercentDebt,@PaymentDocument,
GetDate(),@MorePayment,@Sanction)", baglan);
                cmd.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
                cmd.Parameters.AddWithValue("TaxesPaymentID", taxestype);
                cmd.Parameters.AddWithValue("Operation", 10);


                float a = 0, art = 0; ;
                float f = 0;
                float s = 0;
                float q = 0;
                float kohneqaliq = 0;
                float yenigund = 0;
                float yenifaiz = 0;
                
                if (drqaliq1 != null)
                {

                    art = float.Parse(drqaliq1["artiqodeme"].ToString());
                    if (drqaliq1["yenifaizqaliq"].ToString() != "")
                        f = float.Parse(drqaliq1["yenifaizqaliq"].ToString());
                    if (drqaliq1["Sanction"].ToString() != "")
                        s = float.Parse(drqaliq1["Sanction"].ToString());
                    if (drqaliq1["qaliq"].ToString() != "")
                        kohneqaliq = float.Parse(drqaliq1["qaliq"].ToString());
                    if (drqaliq1["yenigday"].ToString() != "")
                        yenigund = float.Parse(drqaliq1["yenigday"].ToString());
                    if (drqaliq1["yenifaiz"].ToString() != "")
                        yenifaiz = float.Parse(drqaliq1["yenifaiz"].ToString());
                }
                qaliqborc = kohneqaliq;
                a = float.Parse(amount) - kohneqaliq + art;

                if (float.Parse(amount) >= kohneqaliq)
                {
                    q = 0;
                    art = a;
                }
                else
                {
                    q = kohneqaliq - float.Parse(amount);
                    art = 0;
                }
                if (art > q)
                {
                    if (art > f)
                    {
                        art = art - f;
                        f = 0;
                    }
                    else
                    {
                        f = f - art;
                        art = 0;
                    }

                    if (art > s)
                    {
                        art = art - s;
                        s = 0;
                    }
                    else
                    {
                        s = s - art;
                        art = 0;
                    }
                }

                if (float.Parse(amount) >= kohneqaliq)
                {

                    cmd.Parameters.AddWithValue("RemainingDebt", int.Parse("0"));
                    cmd.Parameters.AddWithValue("MorePayment", art);
                }
                else
                {
                    a = kohneqaliq - float.Parse(amount);
                    cmd.Parameters.AddWithValue("RemainingDebt", a);
                    cmd.Parameters.AddWithValue("MorePayment", int.Parse("0"));
                }
                cmd.Parameters.AddWithValue("Sanction", s);
                cmd.Parameters.AddWithValue("Amount", amount);
                cmd.Parameters.AddWithValue("PercentDayCount", yenigund);
                cmd.Parameters.AddWithValue("PercentCounted", yenifaiz);
                cmd.Parameters.AddWithValue("PercentDebt", f);
                cmd.Parameters.AddWithValue("PaymentDocument", "Online");
                cmd.ExecuteNonQuery();
            }
            else
            {
                float b = 0; float art = 0; float artveodenis = 0; float kohneart = 0;
                string ko = "";
                ko = klas.getdatacell("select top 1 MorePayment from Payments p where p.TaxpayerID=" + TaxpayerID + " and TaxesPaymentID=" + taxestype + " order by paymentid desc ");
                if (ko != "" && ko != null)
                {
                    kohneart = float.Parse(ko);
                }
                else { kohneart = 0; }

                artveodenis = kohneart + float.Parse(amount);
                if (artveodenis > qaliqborc)
                {
                    art = artveodenis - qaliqborc;
                }
                else
                {
                    b = qaliqborc - float.Parse(amount);
                }
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Amount,PaymentDocument,NowTime,Operation,RemainingDebt,MorePayment) 
values (@TaxpayerID,@TaxesPaymentID,@Amount,@PaymentDocument,GetDate(),@Operation,@RemainingDebt,@MorePayment)", baglan);
                cmd.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
                cmd.Parameters.AddWithValue("TaxesPaymentID", taxestype);
                cmd.Parameters.AddWithValue("Operation", int.Parse("10"));
                cmd.Parameters.AddWithValue("RemainingDebt", b);
                cmd.Parameters.AddWithValue("Amount", amount);
                cmd.Parameters.AddWithValue("MorePayment", art);
                cmd.Parameters.AddWithValue("PaymentDocument", "Online");
                cmd.ExecuteNonQuery();
            }
        }


        public DataTable GetTaxesObjects(string TaxpayerID)
        {
            DataRow drtediyye1 = klas.GetDataRow(@"select LivingType from LivingArea la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where (LivingType=1 or LivingType=3 or LivingType=6 ) and tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye2 = klas.GetDataRow(@"select LivingType from LivingArea la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where (LivingType=2 or LivingType=4  or LivingType=5 ) and tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye3 = klas.GetDataRow(@"select TaxType from WaterAirTransport la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye4 = klas.GetDataRow(@"select TaxType from MineTax la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye4x = klas.GetDataRow(@"select tx.TaxpayerID from ViewLivingAreaLisee la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye5 = klas.GetDataRow(@"select TaxType from ProfitsTax la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye6 = klas.GetDataRow(@"select TaxType from Advertisement la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye7 = klas.GetDataRow(@"select TaxType from CarStop la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye8 = klas.GetDataRow(@"select TaxType from Hotel la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye9 = klas.GetDataRow(@"select TaxType from TradeService la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataRow drtediyye10 = klas.GetDataRow(@"select TaxType from Alienation la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  tx.TaxpayerID=" + TaxpayerID);
            DataTable dt = new DataTable();
            dt.Columns.Add("RayonID", typeof(String));
            dt.Columns.Add("BelediyyeID", typeof(String));
            dt.Columns.Add("RayonSheher", typeof(String));
            dt.Columns.Add("Belediyye", typeof(String));
            dt.Columns.Add("OdeyiciID", typeof(String));
            dt.Columns.Add("OdeyiciAdi", typeof(String));
            dt.Columns.Add("VergiTipi", typeof(String));
            dt.Columns.Add("VergiAdi", typeof(String));
            dt.Columns.Add("Mebleg", typeof(String));
            dt.Columns.Add("HesabNomresi", typeof(String));
            dt.Columns.Add("BankAdi", typeof(String));
            dt.TableName = "Taxes";
            string taxpayername = klas.getdatacell("Select SName+' '+Name+' '+FName as name from Taxpayer where TaxpayerID=" + TaxpayerID);
            DataRow AccountNumber = klas.GetDataRow("Select AccountNumber,Bank from List_classification_Municipal where MunicipalID = (select MunicipalID from Taxpayer where TaxpayerID=" + TaxpayerID+")");
            DataRow MunicipalName = klas.GetDataRow("Select MunicipalName,MunicipalID from List_classification_Municipal where MunicipalID = (select MunicipalID from Taxpayer where TaxpayerID=" + TaxpayerID + ")");
            DataRow RegionName = klas.GetDataRow("Select Name+' '+case when CityID=1 then N'şəhəri' else 'rayonu' end regionname1,RegionsID from List_classification_Regions where RegionsID in (Select RegionID from List_classification_Municipal where MunicipalID = (select MunicipalID from Taxpayer where TaxpayerID=" + TaxpayerID + "))");
            if (drtediyye1 != null || drtediyye3 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "1";
                dr["VergiAdi"] = "Əmlak vergisi";
                dr["Mebleg"] = GetEmlakTorpaq("1", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye2 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "2";
                dr["VergiAdi"] = "Torpaq vergisi";
                dr["Mebleg"] = GetEmlakTorpaq("2", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye4 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "7";
                dr["VergiAdi"] = "Mədən vergisi";
                dr["Mebleg"] = GetOdenishAmount("7", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye4x != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "8";
                dr["VergiAdi"] = "Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş";
                dr["Mebleg"] = GetOdenishAmount("8", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye5 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "14";
                dr["VergiAdi"] = "Mənfəət vergisi";
                dr["Mebleg"] = GetOdenishAmount("14", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye6 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "9";
                dr["VergiAdi"] = "Küçə (divar) reklamının yayımı üçün ödəniş";
                dr["Mebleg"] = GetOdenishAmount("9", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye7 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "10";
                dr["VergiAdi"] = "Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş";
                dr["Mebleg"] = GetOdenishAmount("10", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye8 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "11";
                dr["VergiAdi"] = "Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş";
                dr["Mebleg"] = GetOdenishAmount("11", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye9 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "12";
                dr["VergiAdi"] = "Stasionar və ya səyyar ticarət, ictimai iaşə və digər xidmətlərə görə ödəniş";
                dr["Mebleg"] = GetOdenishAmount("12", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }
            if (drtediyye10 != null)
            {
                DataRow dr = dt.NewRow();
                dr["RayonID"] = RegionName["RegionsID"].ToString();
                dr["BelediyyeID"] = MunicipalName["MunicipalID"].ToString();
                dr["RayonSheher"] = RegionName["regionname1"].ToString();
                dr["Belediyye"] = MunicipalName["MunicipalName"].ToString();
                dr["OdeyiciID"] = TaxpayerID;
                dr["OdeyiciAdi"] = taxpayername;
                dr["VergiTipi"] = "13";
                dr["VergiAdi"] = "Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsinə görə ödəniş";
                dr["Mebleg"] = GetOdenishAmount("13", TaxpayerID).ToString();
                dr["HesabNomresi"] = Config.ConvertString(AccountNumber["AccountNumber"].ToString());
                dr["BankAdi"] = Config.ConvertString(AccountNumber["Bank"].ToString());
                dt.Rows.Add(dr);
            }

            return dt;
        }
    
}