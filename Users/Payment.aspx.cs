using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using System.Drawing;

public partial class Users_Payment : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; 
     string TaxpayerID;
    Hesablanmalar hesabla = new Hesablanmalar(); 
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
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
            DataRow userrow = klas.GetDataRow("Select * from Taxpayer where TaxpayerID=" + TaxpayerID);
            if (userrow != null)
            {
                LBTaxPayerName.Text = userrow["SName"].ToString() + " " + userrow["Name"].ToString() 
                    + " " + userrow["Fname"].ToString();
                YVOK.Text = userrow["YVOK"].ToString();
                VOEN.Text = userrow["VOEN"].ToString();
            }
            sahe();

         
        }
    }

   

    void sahe()
    {
        DataRow drtediyye1 = klas.GetDataRow(@"select LivingType from LivingArea la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where (LivingType=1 or LivingType=3 or LivingType=6 ) and ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye2 = klas.GetDataRow(@"select LivingType from LivingArea la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where (LivingType=2 or LivingType=4  or LivingType=5 ) and ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye3 = klas.GetDataRow(@"select TaxType from WaterAirTransport la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
  where  ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye4 = klas.GetDataRow(@"select TaxType from MineTax la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and  tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye4x = klas.GetDataRow(@"select tx.TaxpayerID from ViewLivingAreaLisee la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where  ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye5 = klas.GetDataRow(@"select TaxType from ProfitsTax la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and  tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye6 = klas.GetDataRow(@"select TaxType from Advertisement la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye7 = klas.GetDataRow(@"select TaxType from CarStop la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye8 = klas.GetDataRow(@"select TaxType from Hotel la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye9 = klas.GetDataRow(@"select TaxType from TradeService la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye10 = klas.GetDataRow(@"select TaxType from Alienation la inner join Taxpayer tx on tx.TaxpayerID=la.TaxpayerID
          where ExitDate is null and tx.TaxpayerID=" + TaxpayerID);
        DataRow drtediyye11 = klas.GetDataRow(@"Select Sanction from Payments where TaxesPaymentID=15 and TaxpayerID=" + TaxpayerID + " order by NowTime desc");
        cmbvergi.Items.Add(new ListEditItem("Seçin", "-1"));
        if (drtediyye1 != null || drtediyye3 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Əmlak vergisi", "1"));
        }
        if (drtediyye2 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Torpaq vergisi", "2"));
        }
        if (drtediyye4 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Mədən vergisi", "7"));
        }
        if (drtediyye4x != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş", "8"));
        }
        if (drtediyye5 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Mənfəət vergisi", "14"));
        }
        if (drtediyye6 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Reklam ödənişi", "9"));
        }
        if (drtediyye7 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Avtomobil dayanacağı ödənişi", "10"));
        }
        if (drtediyye8 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Mehmanxana, sanatoriya-kurort, turizm xidməti göstərən müəssisənin ödənişi", "11"));
        }
        if (drtediyye9 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Stasionar və səyyar ticarət, ictimai iaşə, digər xidmətlərə görə torpaq sahəsinin ödənişi", "12"));
        }
        if (drtediyye10 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Bələdiyyə mülkiyyətinin özgəninkiləşdirmə ödənişi", "13"));
        }
        if (drtediyye11 != null)
        {
            cmbvergi.Items.Add(new ListEditItem("Maliyyə sanksiyası", "15"));
        }
        cmbvergi.SelectedIndex = 0;
    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        string icaze = "1";
        bool mesage = true;
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>" + odemetrx.Date.Year + " and UserID=" + Session["UserID"].ToString());

        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }


        string dt = klas.getdatacell("select year(getdate())");
        if (dt == "2020" && icaze == "1")
        {
            if (txtsened.Text.Trim().ToUpper().Replace("İ", "I") != "Online".ToUpper())
            {

                if (cmbvergi.Value.ToString() == "1" || cmbvergi.Value.ToString() == "2")
                {
                    // menfi gun yaranmasin deye
//                    string axrincinowtime = klas.getdatacell(@"select top 1 NowTime from Payments p 
//where p.TaxpayerID = " + TaxpayerID +
//" and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + ") order by PaymentID desc");


//                    if (Convert.ToDateTime(odemetrx.Date).Date >= Convert.ToDateTime(axrincinowtime).Date)
//                    {

                        DataRow drqaliq1 = klas.GetDataRow(@"select mt.TaxpayerId, ISNULL(
(select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc),0)
  qaliq,   ISNULL((select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc),0) artiqodeme,  
case when (
ISNULL((select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc),0)=0) then 0 else
DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc),Convert(datetime,'"
 + Convert.ToDateTime(odemetrx.Date).ToString("yyyy-MM-dd 00:00:00.000") + @"'))  end as yenigday,
 DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc),Convert(datetime,'"
 + Convert.ToDateTime(odemetrx.Date).ToString("yyyy-MM-dd 00:00:00.000") + @"'))*    
            (case when 
            (select sum(t1.Amount) from (select top 2 sr.Amount from Payments sr where sr.Operation in (2,3) and  sr.TaxesPaymentID in (" + cmbvergi.Value.ToString() + @") and sr.TaxpayerID=mt.TaxpayerID order by sr.NowTime desc) as t1)<
            (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc) then
            (select sum(t1.Amount) from (select top 2 sr.Amount from Payments sr where sr.Operation in (2,3) and  sr.TaxesPaymentID in (" + cmbvergi.Value.ToString() + @") and sr.TaxpayerID=mt.TaxpayerID order by sr.NowTime desc) as t1) else
            (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc)
            
           end
            )/1000 as yenifaiz," +
         "   (DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + ") order by PaymentID desc),Convert(datetime,'" + Convert.ToDateTime(odemetrx.Date).ToString("yyyy-MM-dd 00:00:00.000") + "'))*" +
         @"    (case when 
            (select sum(t1.Amount) from (select top 2 sr.Amount from Payments sr where sr.Operation in (2,3) and  sr.TaxesPaymentID in (" + cmbvergi.Value.ToString() + @") and sr.TaxpayerID=mt.TaxpayerID order by sr.NowTime desc) as t1)<
            (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc) then
            (select sum(t1.Amount) from (select top 2 sr.Amount from Payments sr where sr.Operation in (2,3) and  sr.TaxesPaymentID in (" + cmbvergi.Value.ToString() + @") and sr.TaxpayerID=mt.TaxpayerID order by sr.NowTime desc) as t1) else
            (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + @") order by PaymentID desc)
            
           end
            )/1000) + " +
         "    (select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + ") order by PaymentID desc) as yenifaizqaliq, " +
         "   (select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in (" + cmbvergi.Value.ToString() + ") order by PaymentID desc) as sanction " +
     " from CalcTaxes mt " +
     "  where mt.TaxpayerID=" + TaxpayerID + " and CalcYear=YEAR(GETDATE()) group by mt.TaxpayerId");


                        SqlConnection baglan = klas.baglan();
                        SqlCommand cmd = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Operation,Amount,RemainingDebt,
PercentDayCount,PercentCounted,PercentDebt,PaymentDocument,NowTime,MorePayment,Sanction) 
values (@TaxpayerID,@TaxesPaymentID,@Operation,@Amount,@RemainingDebt,@PercentDayCount,@PercentCounted,@PercentDebt,@PaymentDocument,
@NowTime,@MorePayment,@Sanction)", baglan);
                        cmd.Parameters.Add("TaxpayerID", TaxpayerID);
                        cmd.Parameters.Add("TaxesPaymentID", cmbvergi.SelectedItem.Value);
                        cmd.Parameters.Add("Operation", 10);


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
                        if (f < 0)
                        {
                            f = 0;
                            yenifaiz = 0;
                            yenigund = 0;
                        }
                        a = float.Parse(mebleg.Text) - kohneqaliq + art;

                        if (float.Parse(mebleg.Text) >= kohneqaliq)
                        {

                            q = 0;
                            art = a;
                        }
                        else
                        {
                            q = kohneqaliq - float.Parse(mebleg.Text);
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

                        if (float.Parse(mebleg.Text) >= kohneqaliq)
                        {

                            cmd.Parameters.Add("RemainingDebt", int.Parse("0"));
                            cmd.Parameters.Add("MorePayment", art);
                        }
                        else
                        {
                            a = kohneqaliq - float.Parse(mebleg.Text);
                            cmd.Parameters.Add("RemainingDebt", a);
                            cmd.Parameters.Add("MorePayment", int.Parse("0"));
                        }
                        cmd.Parameters.Add("Sanction", s);
                        cmd.Parameters.Add("Amount", mebleg.Text);
                        cmd.Parameters.Add("PercentDayCount", yenigund);
                        cmd.Parameters.Add("PercentCounted", yenifaiz);
                        cmd.Parameters.Add("PercentDebt", f);
                        cmd.Parameters.Add("PaymentDocument", txtsened.Text);
                        cmd.Parameters.Add("NowTime", odemetrx.Date);
                        cmd.ExecuteNonQuery();
                        mebleg.Text = "";
                        txtsened.Text = "";
                        odemetrx.Text = "";

                    // menfi gun yaranmasin deye
                    //}
                    //else
                    //{
                    //    mesage = false;
                    //    msg.ForeColor = Color.Red;
                    //    msg.Text = "Tarix düz deyil.";

                    //}
                }
                else if (cmbvergi.Value.ToString() != "-1")
                {
                    float b = 0; float art = 0; float artveodenis = 0; float kohneart = 0;
                    if (qaliqborc.Text == "")
                    {
                        qaliqborc.Text = "0";
                    }
                    if (mebleg.Text == "")
                    {
                        mebleg.Text = "0";
                    }
                    string ko = "";
                    ko = klas.getdatacell("select MorePayment from Payments p where p.TaxpayerID=" + TaxpayerID + " and TaxesPaymentID=" + cmbvergi.SelectedItem.Value.ToString() + " order by paymentid desc ");
                    if (ko != "" && ko != null)
                    {
                        kohneart = float.Parse(ko);
                    }
                    else { kohneart = 0; }

                    artveodenis = kohneart + float.Parse(mebleg.Text);
                    if (artveodenis > float.Parse(qaliqborc.Text))
                    {
                        art = artveodenis - float.Parse(qaliqborc.Text);
                    }
                    else
                    {
                        b = float.Parse(qaliqborc.Text) - float.Parse(mebleg.Text);
                    }
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Amount,PaymentDocument,NowTime,Operation,RemainingDebt,MorePayment) 
values (@TaxpayerID,@TaxesPaymentID,@Amount,@PaymentDocument,@NowTime,@Operation,@RemainingDebt,@MorePayment)", baglan);
                    cmd.Parameters.Add("TaxpayerID", TaxpayerID);
                    cmd.Parameters.Add("TaxesPaymentID", cmbvergi.SelectedItem.Value);
                    cmd.Parameters.Add("Operation", int.Parse("10"));
                    cmd.Parameters.Add("RemainingDebt", b);
                    cmd.Parameters.Add("Amount", mebleg.Text);
                    cmd.Parameters.Add("MorePayment", art);
                    cmd.Parameters.Add("PaymentDocument", txtsened.Text);
                    cmd.Parameters.Add("NowTime", odemetrx.Date);
                    cmd.ExecuteNonQuery();

                    mebleg.Text = "";
                    txtsened.Text = "";
                    odemetrx.Text = "";
                    //Response.Redirect("Payment.aspx?IndividualLegal=" + IndividualLegal + "&TaxpayerID=" + TaxpayerID);
                }


                vizual();
            }
            if (mesage == true)
            {
                msg.Text = "";
            }
        }
        else
        {
            msg.ForeColor = Color.Red;
            msg.Text = "Admin tərəfindən icazə verilmir.";
            //Class2.MsgBox("Admin tərəfindən icazə verilmir.", Page);
        }

    }

    void vizual()
    {

        string buil = klas.getdatacell(@"select year(getdate())");
        if (cmbvergi.Value.ToString() == "1")
        {
            hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "08", buil);
            hesabla.hesab08_11emlaktorpaq("1", TaxpayerID, "11", buil);
            hesabla.CalcToday("1", TaxpayerID);
        }
        else if (cmbvergi.Value.ToString() == "2")
        {
            hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "08", buil);
            hesabla.hesab08_11emlaktorpaq("2", TaxpayerID, "11", buil);
            hesabla.CalcToday("2", TaxpayerID);
        }
        goruntu();
    }



    protected void cmbvergi_SelectedIndexChanged(object sender, EventArgs e)
    {
        qaliqborc.Text = "";
        mebleg.Text = "";
        txtsened.Text = "";
        odemetrx.Text = "";
        vizual();
    }


 
    


    void goruntu() {

        if (cmbvergi.Value.ToString() == "1")
        {

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
                qaliqborc.Text = System.Math.Round(umumiborc, 2, MidpointRounding.AwayFromZero).ToString();

            }
        }
        else if (cmbvergi.Value.ToString() == "2")
        {
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
                qaliqborc.Text = System.Math.Round(umumiborc, 2, MidpointRounding.AwayFromZero).ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "7")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=7) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID and p.TaxesPaymentID=7) end AS numeric(18,2)) borc
  from MineTax mt inner join CalcMine ct on mt.MineId=ct.MineID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "14")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=14) end   AS numeric(18,2)) borc
  from ProfitsTax mt inner join CalcProfits ct on mt.IncomeTaxID=ct.ProfitsID where mt.TaxpayerID=" + TaxpayerID +
        "  and ExitDate is null group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "9")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=9) end   AS numeric(18,2)) borc
  from ViewAdvertisement mt where mt.TaxpayerID=" + TaxpayerID + " and ExitDate is null group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "10")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=10) end   AS numeric(18,2)) borc
  from CarStop mt inner join CalcCarStop ct on mt.CarID=ct.CarStopID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "11")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when Amount is null then 0 else Amount end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=11) end   AS numeric(18,2)) borc
  from Hotel mt inner join CalcHotel ct on mt.HotelID=ct.HotelID where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "12")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=12) end   AS numeric(18,2)) borc
  from viewTradeService mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
        }
        else if (cmbvergi.Value.ToString() == "13")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when AmountOnContract is null then 0 else AmountOnContract end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=13) end  AS numeric(18,2)) borc
  from Alienation mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }

        }
        else if (cmbvergi.Value.ToString() == "8")
        {
            DataRow drborc = klas.GetDataRow(@"select mt.TaxpayerId,cast( sum(case when mebleg is null then 0 else mebleg end )-
case when 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) is null then 0 else 
(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=mt.TaxpayerID
and p.TaxesPaymentID=8) end AS numeric(18,2)) borc
  from ViewLivingAreaLisee mt  where mt.TaxpayerID=" + TaxpayerID + "  and ExitDate is null  group by mt.TaxpayerId");
            if (drborc != null)
            {
                qaliqborc.Text = drborc["borc"].ToString();
            }
            else
            {
                qaliqborc.Text = "0";
            }
        }
        else if (cmbvergi.Value.ToString() == "15")
        {


            string payment = klas.getdatacell(@"  select 
  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation<>10 ) - ( case when 	(select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10) is null then 0 else  (select sum(case when Amount is null then 0 else Amount end) from Payments p where p.TaxpayerID=" + TaxpayerID +
" and p.TaxesPaymentID=15 and p.Operation=10)  end ) as sanctionborc");


            if (payment != null && payment != "")
            {
                qaliqborc.Text = Math.Round(float.Parse(payment), 2).ToString();

            }
        }

        else { qaliqborc.Text = ""; }









        if (qaliqborc.Text != "")
        {
            if (float.Parse(qaliqborc.Text) <= 0)
            {
                qaliqborc.Text = "0";
            }
        }





        string aa = cmbvergi.Value.ToString();

        DataTable region2 = klas.getdatatable(@"select  PaymentID,CAST(Sanction as numeric(18,2)) Sanction, TaxpayerID, TaxesPaymentID, TaxesPaymentName, Operation,CAST(Amount as numeric(18,2)) Amount,CAST(RemainingDebt as numeric(18,2)) RemainingDebt,
CAST(MorePayment as numeric(18,2)) MorePayment , PercentDayCount,  CAST(PercentCounted as numeric(18,2)) PercentCounted ,
CAST(PercentDebt as numeric(18,2)) PercentDebt, PaymentDocument, NowTime,
case 
when  Operation=10 then N'Ödəmə' else N'Hesablanma' end Operation1,cast(RemainingDebt+Sanction+PercentDebt as numeric(18,2)) umumiborc  from Payments where  TaxpayerID=" + TaxpayerID +
   " and TaxesPaymentID in (" + aa + ") order by PaymentID");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();


    }
    
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       
     
        string PaymentID = e.CommandArgument.ToString();
        if (e.CommandName == "deleteRow" )
        {
            string icaze = "1"; 
            DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select year(NowTime) from Payments Where PaymentID=" + 
PaymentID+ @" and operation=10) and UserID=" + Session["UserID"].ToString()+" ");

            DataRow icazeveronline = klas.GetDataRow(@"Select p.TaxesPaymentOnline 
from Payments p  Where PaymentID=" + PaymentID + @" and TaxesPaymentOnline=1 ");


            if (icazever != null)
            {
                icaze = icazever["Icaze"].ToString();
            }

            if(icaze=="1" && icazeveronline==null)
            {
            klas.cmd("Delete from Payments Where PaymentID=" + PaymentID);
            goruntu();
            msg.Text = "";
            }
            else if(icazeveronline != null)
            {
                msg.ForeColor = Color.Red;
                msg.Text = "Online ödənişi silməyə admin tərəfindən icazə verilmir.";
            }
            else 
            {
            msg.ForeColor = Color.Red;
            msg.Text = "Ödənişi silməyə admin tərəfindən icazə verilmir.";
            }
        }
       
    }
       

}