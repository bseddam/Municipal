using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class Users_Calculation : System.Web.UI.Page
{
    //static string prevPage = String.Empty;
    Class2 klas = new Class2();  string TaxpayerID; string MineID, MineInsertUpdate = "0"; 
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
       
        
            DataRow userrow = klas.GetDataRow("Select * from Taxpayer where TaxpayerID=" + TaxpayerID);
            if (userrow != null)
            {
                LBTaxPayerName.Text = userrow["SName"].ToString() + " " + userrow["Name"].ToString() + " " + userrow["Fname"].ToString();
                YVOK.Text = userrow["YVOK"].ToString();
                VOEN.Text = userrow["VOEN"].ToString();
            }
            vergi();

        


        }
    }
    void tediyyetarix()
    {
        DataTable region2 = klas.getdatatable(@"select *,year(GetDate()) il from (select distinct t.TaxpayerID,t.RegistrDate from 
(     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty where ExitDate is null
union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand  where ExitDate is null
union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null) as t where TaxpayerID="
            + TaxpayerID +
   " group by t.TaxpayerID,t.RegistrDate,t.vergitype ) as t1 order by t1.TaxpayerID,t1.RegistrDate");

        ddltediyyetarix.Items.Clear();
        ddltediyyetarix.Items.Insert(0, new ListItem("Seçin", "-1"));
        int b = 0, s = 0;
        b = int.Parse(region2.Rows[0][1].ToString());
        s = int.Parse(region2.Rows[0][2].ToString())-1;
        for (int i = b; i <= s; i++)
        {
            ddltediyyetarix.Items.Insert(i-b+1, new ListItem(i.ToString(), i.ToString()));
        }
        ddlhesvaxti.SelectedValue = "-1";
        Label3.Text = "";
    }
    protected void selectHotel()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select ROW_NUMBER() over (order by l.HotelID) sn,l.HotelID, l.TaxpayerID, convert(varchar(10),l.RegistrDate,104) RegistrDate, 
                            case when l.HotelType=1 then N'Mehmanxana'
                                 when l.HotelType=2 then N'Sanatoriya- kurort'
                                 when l.HotelType=3 then N'Turizm'
                            end as HotelType, l.HotelName, convert(varchar(10),l.ServiceBeginDate,104) ServiceBeginDate, 
                            convert(varchar(10),l.ServiceEndDate,104) ServiceEndDate, 
                            ch.CalcYear,ch.CalcMonth,ch.PersonCount,ch.Degree,cast(ch.Amount as numeric(18,2)) Amount,ch.CalcHotelID
                            from  Hotel l left join CalcHotel ch on ch.HotelID=l.HotelID where l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, klas.baglan());
        dap.Fill(dt);
        DataListHotel.DataSource = dt;
        DataListHotel.DataBind();
    }
    protected void FillCBYearMonth(DropDownList Pddl,int n, int m)
    {
        Pddl.Items.Clear();
        DataTable dt = new DataTable();
        dt.Columns.Add("Value1");
        dt.Columns.Add("Text1");
        DataRow dr;
        dr = dt.NewRow();
        dr["Value1"] = "0";
        dr["Text1"] = "Seçin";
        dt.Rows.Add(dr);
        if (n <= m)
        {
            for (int i = n; i <= m; i++)
            {
                dr = dt.NewRow();
                dr["Value1"] = i.ToString();
                dr["Text1"] = i.ToString();
                dt.Rows.Add(dr);
            }
        }
        else
        {
            for (int i = n; i >= m; i--)
            {
                dr = dt.NewRow();
                dr["Value1"] = i.ToString();
                dr["Text1"] = i.ToString();
                dt.Rows.Add(dr);
            }
        }
        Pddl.DataValueField = "Value1";
        Pddl.DataTextField = "Text1";
        Pddl.DataSource = dt;
        Pddl.DataBind();

    }
    void vergi()
    {
        DataTable dtiller = klas.getdatatable(@"select distinct Taxesid,case when Taxesid in(1,3,6) then N'Əmlak vergisi' when Taxesid in(2,4,5) then N'Torpaq vergisi' else  TaxesPaymentTypeName 
end TaxesPaymentTypeName from (
select LivingAreaID ,TaxpayerID,case when LivingType in(1,3,6) then 1 when LivingType in(2,4,5) then 2 end Taxesid from (
select LivingAreaID,TaxpayerID,LivingType from viewLivingProperty where ExitDate is null
union select LivingAreaID,TaxpayerID,LivingType from viewQLivingProperty where ExitDate is null
union select TransportID LivingAreaID,TaxpayerID,6 LivingType from viewWaterAirTransport where ExitDate is null
union select LivingAreaID,TaxpayerID,LivingType from ViewLivingLand where ExitDate is null
union select LivingAreaID,TaxpayerID,LivingType from ViewQLivingLand  where ExitDate is null
union select LivingAreaID,TaxpayerID,LivingType from ViewVillageLand where ExitDate is null
) l
 
union select MineId as registrcode,TaxpayerID,7 as Taxesid  from MineTax where ExitDate is null
union select IncomeTaxID as registrcode,TaxpayerID,14 as Taxesid  from ProfitsTax where ExitDate is null
union
select CarID as registrcode,TaxpayerID,10 as Taxesid  from CarStop where ExitDate is null
union
select HotelID as registrcode,TaxpayerID,11 as Taxesid  from Hotel where ExitDate is null
) as ee
  inner join TaxesPaymentList tpl on ee.Taxesid=tpl.TaxesPaymentID 
  where TaxpayerID=" + TaxpayerID);
        ddlvergi.DataTextField = "TaxesPaymentTypeName";
        ddlvergi.DataValueField = "Taxesid";
        ddlvergi.DataSource = dtiller;
        ddlvergi.DataBind();
        ddlvergi.Items.Insert(0, new ListItem("Seçin", "-1"));
        ddlvergi.SelectedValue = "-1";
    }
    void vizualmenfeet()
    {
        DataTable region2 = klas.getdatatable(@"select *,CalcYear,CalcMonth,cp.Income Income1,cp.Expense Expense1,Amount
from ProfitsTax pt left join CalcProfits cp on pt.IncomeTaxID=cp.ProfitsID where  TaxpayerID=" + TaxpayerID + " order by cp.NowTime desc");
        rpmenfeet.DataSource = region2;
        rpmenfeet.DataBind();
    }

    protected void rpmenfeet_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "newrownmenfeet")
        {
            lblmenfgizle.Text = e.CommandArgument.ToString();
            lblmenfyoxla.Text = "insert";
            pnlmenf.Visible = true;
            lblmenfeet.Text = "";
            ddlmenfeetil.SelectedValue = "-1";
            txtmenfeetgelir.Text = "";
            txtmenfeetxerc.Text = "";
        }
        if (e.CommandName == "Updaterownmenfeet")
        {
            lblmenfeet.Text = "";
            lblmenfyoxla.Text = "update";
            pnlmenf.Visible = true;
            lblmenfgizle.Text = e.CommandArgument.ToString();
            DataRow drodeyici = klas.GetDataRow(@"SELECT * from CalcProfits where CalcProfitsID=" + lblmenfgizle.Text);
            ddlmenfeetil.Text = drodeyici["CalcYear"].ToString();
            txtmenfeetgelir.Text = drodeyici["Income"].ToString();
            txtmenfeetxerc.Text = drodeyici["Expense"].ToString();
        }
        if (e.CommandName == "deleterowmenfeet")
        {
            lblmenfeet.Text = "";
            klas.cmd("Delete from CalcProfits Where CalcProfitsID=" + e.CommandArgument.ToString());
            vizualmenfeet();

        }

    }



    protected void btnmenfeeti_Click(object sender, EventArgs e)
    {
        if (lblmenfyoxla.Text == "insert" && ddlmenfeetil.SelectedValue != "-1" && txtmenfeetgelir.Text != "" && txtmenfeetxerc.Text != "")
        {
            double mebleg = 0;
            mebleg = (float.Parse(txtmenfeetgelir.Text) - float.Parse(txtmenfeetxerc.Text)) * 0.2;
            SqlConnection baglan = klas.baglan();
            SqlCommand cmd = new SqlCommand(@"insert into CalcProfits (ProfitsID,CalcYear,Income, Expense, Amount)
values (@ProfitsID,@CalcYear,@Income,@Expense,@Amount)", baglan);
            cmd.Parameters.AddWithValue("ProfitsID", lblmenfgizle.Text);
            cmd.Parameters.AddWithValue("CalcYear", ddlmenfeetil.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("Income", txtmenfeetgelir.Text.Trim());
            cmd.Parameters.AddWithValue("Expense", txtmenfeetxerc.Text.Trim());
            cmd.Parameters.AddWithValue("Amount", mebleg);
            cmd.ExecuteNonQuery();
            lblmenfeet.Text = "Məlumat daxil edildi";
            lblmenfeet.ForeColor = Color.Green;
            lblmenfgizle.Text = "";
            vizualmenfeet();
            ddlmenfeetil.SelectedValue = "-1";
            txtmenfeetgelir.Text = "";
            txtmenfeetxerc.Text = "";
            lblmenfyoxla.Text = "";
            pnlmenf.Visible = false;
        }
        else
        {
            lblmenfeet.Text = "Məlumat tam deyil";
            lblmenfeet.ForeColor = Color.Red;
        }


        if (lblmenfyoxla.Text == "update" && ddlmenfeetil.SelectedValue != "-1" && txtmenfeetgelir.Text != "" && txtmenfeetxerc.Text != "")
        {

            double mebleg1 = 0;
            mebleg1 = (float.Parse(txtmenfeetgelir.Text) - float.Parse(txtmenfeetxerc.Text)) * 0.2;
            SqlConnection baglan1 = klas.baglan();
            SqlCommand cmd1 = new SqlCommand(@"Update CalcProfits set  CalcYear=@CalcYear,
Amount=@Amount,Income=@Income,Expense=@Expense where CalcProfitsID=" + lblmenfgizle.Text, baglan1);

            cmd1.Parameters.AddWithValue("CalcYear", ddlmenfeetil.SelectedItem.ToString());
            cmd1.Parameters.AddWithValue("Income", txtmenfeetgelir.Text);
            cmd1.Parameters.AddWithValue("Expense", txtmenfeetxerc.Text);
            cmd1.Parameters.AddWithValue("Amount", mebleg1);
            cmd1.ExecuteNonQuery();
            lblmenfeet.Text = "Məlumat daxil edildi";
            lblmenfeet.ForeColor = Color.Green;
            vizualmenfeet();
            ddlmenfeetil.SelectedValue = "-1";
            txtmenfeetgelir.Text = "";
            txtmenfeetxerc.Text = "";
            lblmenfyoxla.Text = "";
            lblmenfgizle.Text = "";
            pnlmenf.Visible = false;
        }
        else
        {
            lblmenfeet.Text = "Məlumat tam deyil";
            lblmenfeet.ForeColor = Color.Red;
        }
    }




    protected void selectMine()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select l.*,ROW_NUMBER() over (order by l.MineID) sn,convert(varchar(10),l.MineRegistrDate,104) RegistrDate1,
        l.MineRegionName+', '+l.MineVillage+', '+l.MineStreet+', '+l.MineHome+', '+l.MineFlat unvan,
        cm.CalcYear,cm.CalcMonth,cm.Productionsize,cast(cm.Amount as numeric(18,2)) Amount,cm.CalcMineID        
        from MineTax l left join CalcMine cm on cm.mineid=l.MineId where l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, klas.baglan());
        dap.Fill(dt);
        DataListMeden.DataSource = dt;
        DataListMeden.DataBind();
    }
    protected void selectCarStop()
    {
        DataTable dt = new DataTable();
        string sqlstring = @"select ROW_NUMBER() over (order by l.CarID) sn,l.CarID, l.TaxPayerID, convert(varchar(10),l.RegisterDate,104) RegisterDate, 
l.CarStopType, l.RegionID, l.VillageID, l.RegionName+', '+l.VillageName+', '+Street+', '+ l.Home+', '+ l.Flat unvan, l.StopArea, l.CarCount,
convert(varchar(10),l.ServiceDate1,104) +'-'+ convert(varchar(10),l.ServiceDate2,104) ServiceDate2,c.CarstopType CarstopType1,
(convert(varchar(10),cs.Periodbegin,104) +'-'+ convert(varchar(10),cs.Periodend,104)) as Period,cs.CarCount CarCount1,cs.Degree,cast(cs.Amount as numeric(18,2)) Amount,cs.CalcCarStopID,l.CarID
from  CarStop l left join CarstopType c on c.CarstopTypeID=l.CarStopType left join CalcCarStop cs on cs.CarStopID=l.CarID where l.TaxPayerId=" + TaxpayerID;
        SqlDataAdapter dap = new SqlDataAdapter(sqlstring, klas.baglan());
        dap.Fill(dt);
        DataListCarStop.DataSource = dt;
        DataListCarStop.DataBind();
    }
    protected void ddlvergi_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlvergi.SelectedValue == "-1") {
            pnlemlak.Visible = false;
            Pnlmenfeet.Visible = false;
            DivMain.Visible = false;
            DivCar.Visible = false;
            Div3.Visible = false;

            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
        }
        if (ddlvergi.SelectedValue == "1")
        {
            pnlemlak.Visible = true;
            Pnlmenfeet.Visible = false;
            DivMain.Visible = false;
            DivCar.Visible = false;
            Div3.Visible = false;

            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
            lblnamevergi.Text = ddlvergi.SelectedItem.ToString();
             tediyyetarix();
        }
        if (ddlvergi.SelectedValue == "2")
        {
            pnlemlak.Visible = true;
            Pnlmenfeet.Visible = false;
            DivMain.Visible = false;
            DivCar.Visible = false;
            Div3.Visible = false;

            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
            lblnamevergi.Text = ddlvergi.SelectedItem.ToString();
            tediyyetarix();
        }
        else if (ddlvergi.SelectedValue == "14") {
            Pnlmenfeet.Visible = true;
            DivMain.Visible = false;
            DivCar.Visible = false;
            Div3.Visible = false;
            pnlemlak.Visible = false;
            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
            string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
            int k = 0;
            for (var i = int.Parse(vaxt) + 1; i >= 2010; i--)
            {
                ddlmenfeetil.Items.Insert(k, new ListItem("" + i + ""));
                k++;
            }
            ddlmenfeetil.Items.Insert(0, new ListItem("Seçin", "-1"));

            vizualmenfeet();
        }
        else if (ddlvergi.SelectedValue == "7") {
            Pnlmenfeet.Visible = false;
            DivMain.Visible = true;
            DivCar.Visible = false;
            Div3.Visible = false;
            pnlemlak.Visible = false;
            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
            string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
            FillCBYearMonth(DDLMedenYear, int.Parse(vaxt) + 2, int.Parse(vaxt) - 50);
            FillCBYearMonth(DDLMedenMonth, 1, 12);
            selectMine();

        }
        else if (ddlvergi.SelectedValue == "10")
        {
            Pnlmenfeet.Visible = false;
            DivMain.Visible = false;
            DivCar.Visible = true;
            Div3.Visible = false;
            pnlemlak.Visible = false;
            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;




            selectCarStop();
            submain.Visible = false;
            subdivCar.Visible = false;



        }
        else if (ddlvergi.SelectedValue == "11")
        {
            Pnlmenfeet.Visible = false;
            DivMain.Visible = false;
            DivCar.Visible = false;
            Div3.Visible = true;
            pnlemlak.Visible = false;
            pnlmenf.Visible = false;
            submain.Visible = false;
            subdivCar.Visible = false;
            DivHotel.Visible = false;
            string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
            FillCBYearMonth(DDLhotelYear, int.Parse(vaxt) + 2, int.Parse(vaxt) - 50);
            FillCBYearMonth(DDLhotelMonth, 1, 12);
            DivHotel.Visible = false;
            selectHotel();
        }
    }
    protected void clrMine()
    {
        DDLMedenYear.SelectedIndex = 0;
        DDLMedenMonth.SelectedIndex = 0;
        txtMedenSize.Text = "";
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
       
        if (DDLMedenYear.SelectedValue.ToString() != "0" && DDLMedenMonth.SelectedValue.ToString() != "0" && txtMedenSize.Text != "")
        {
            MineInsertUpdate = IDInsertUpdate.Text.Trim();
            MineID = IDLBMeden.Text.Trim();
            if (MineInsertUpdate == "1")
            {
                SqlCommand cmd = new SqlCommand(@" insert into CalcMine (CalcYear, CalcMonth, Productionsize, Amount, MineID)
                                                       Values(@CalcYear, @CalcMonth, @Productionsize, @Amount, @MineID)", klas.baglan());
                cmd.Parameters.AddWithValue("CalcYear", DDLMedenYear.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("CalcMonth", DDLMedenMonth.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("Productionsize", txtMedenSize.Text.ToString());
                cmd.Parameters.AddWithValue("Amount", txtMedenSize.Text.ToString());
                cmd.Parameters.AddWithValue("MineID", MineID);
                cmd.ExecuteNonQuery();
                submain.Visible = false;
                clrMine();
                selectMine();
            }
            else
                if (MineInsertUpdate == "2")
                {
                    SqlCommand cmd = new SqlCommand(@" Update CalcMine set CalcYear=@CalcYear, CalcMonth=@CalcMonth, Productionsize=@Productionsize, Amount=@Amount where  CalcMineID=@CalcMineID", klas.baglan());
                    cmd.Parameters.AddWithValue("CalcYear", DDLMedenYear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("CalcMonth", DDLMedenMonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("Productionsize", txtMedenSize.Text.ToString());
                    cmd.Parameters.AddWithValue("Amount", txtMedenSize.Text.ToString());
                    cmd.Parameters.AddWithValue("CalcMineID", MineID);
                    cmd.ExecuteNonQuery();
                    submain.Visible = false;
                    clrMine();
                    selectMine();
                }
            
            
        }
        else
        {
            LBMSGMeden.Text = "Məlumatlar tam deyil";
        }
        
    }
    protected void btnupdateLivPro_Click(object sender, EventArgs e)
    {

    }
    protected void DataListLivPro_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    
    protected void DataListMeden_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "NewrowMeden")
        {
            submain.Visible = true;
            IDLBMeden.Text = e.CommandArgument.ToString();
            IDInsertUpdate.Text = "1";
        }
        if (e.CommandName == "UpdaterowMeden")
        {
            submain.Visible = true;
            IDLBMeden.Text = e.CommandArgument.ToString();
            DataRow dr = klas.GetDataRow("select * from CalcMine where CalcMineID=" + IDLBMeden.Text);
            DDLMedenYear.SelectedValue = dr["CalcYear"].ToString();
            DDLMedenMonth.SelectedValue = dr["CalcMonth"].ToString();
            txtMedenSize.Text = dr["Productionsize"].ToString();
            IDInsertUpdate.Text = "2";
        }
        if (e.CommandName == "deleterowMeden")
        {
            IDLBMeden.Text = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(@" Delete from CalcMine where CalcMineID=@MineID", klas.baglan());
            cmd.Parameters.AddWithValue("MineID", IDLBMeden.Text);
            cmd.ExecuteNonQuery();
            selectMine();
        }
    }
    protected void DateListCarStop_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "NewrowCarStop")
        {
            subdivCar.Visible = true;
            IDLbCarStop.Text = e.CommandArgument.ToString();
            LBCarInsertUpdate.Text = "1";
        }
        if (e.CommandName == "UpdaterowCarStop")
        {
            subdivCar.Visible = true;
            IDLbCarStop.Text = e.CommandArgument.ToString();
            DataRow dr = klas.GetDataRow("select * from CalcCarStop where CalcCarStopID=" + IDLbCarStop.Text);
            DECarStopDate1.Date = Convert.ToDateTime(dr["Periodbegin"].ToString());
            DECarStopDate2.Date = Convert.ToDateTime(dr["Periodend"].ToString());
            txtCarCount.Text = dr["CarCount"].ToString();
            txtCardigre.Text = dr["Degree"].ToString();
            LBCarInsertUpdate.Text = "2";
        }
        if (e.CommandName == "deleterowCarStop")
        {
            IDLbCarStop.Text = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(@" Delete from CalcCarStop where CalcCarStopID=@MineID", klas.baglan());
            cmd.Parameters.AddWithValue("MineID", IDLbCarStop.Text);
            cmd.ExecuteNonQuery();
            selectCarStop();
        }
    }
    protected void clrCarStop()
    {
        DECarStopDate1.Text = "";
        DECarStopDate2.Text = "";
        txtCarCount.Text = "";
        txtCardigre.Text = "";
    }
    
    protected void clrHotel()
    {
        DDLhotelYear.SelectedIndex = 0;
        DDLhotelMonth.SelectedIndex = 0;
        txtHotelcountPerson.Text = "";
        txthotelFactor.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (DECarStopDate1.Text != "0" && DECarStopDate2.Text.ToString() != "0" && txtCarCount.Text != "" && txtCardigre.Text != "")
        {
            MineInsertUpdate = LBCarInsertUpdate.Text.Trim();
            MineID = IDLbCarStop.Text.Trim();
            float amount = (float)(Convert.ToDouble(txtCarCount.Text.ToString()) * Convert.ToDouble(txtCardigre.Text.ToString()));
            if (MineInsertUpdate == "1")
            {
                SqlCommand cmd = new SqlCommand(@" insert into CalcCarStop  ( Periodbegin, Periodend, CarCount, Degree, Amount, CarStopID)
                                                       Values(@Periodbegin, @Periodend, @CarCount, @Degree, @Amount, @CarStopID)", klas.baglan());
                cmd.Parameters.AddWithValue("Periodbegin", DECarStopDate1.Date);
                cmd.Parameters.AddWithValue("Periodend", DECarStopDate2.Date);
                cmd.Parameters.AddWithValue("CarCount", txtCarCount.Text.ToString());
                cmd.Parameters.AddWithValue("Degree", txtCardigre.Text.ToString());
                cmd.Parameters.AddWithValue("Amount", amount);
                cmd.Parameters.AddWithValue("CarStopID", MineID);
                cmd.ExecuteNonQuery();
                subdivCar.Visible = false;
                clrCarStop();
                selectCarStop();
            }
            else
                if (MineInsertUpdate == "2")
                {
                    SqlCommand cmd = new SqlCommand(@" Update CalcCarStop  set Periodbegin=@Periodbegin, Periodend=@Periodend, CarCount=@CarCount,
                                                       Degree=@Degree, Amount=@Amount where  CalcCarStopID=@CarStopID", klas.baglan());
                    cmd.Parameters.AddWithValue("Periodbegin", DECarStopDate1.Date);
                    cmd.Parameters.AddWithValue("Periodend", DECarStopDate2.Date);
                    cmd.Parameters.AddWithValue("CarCount", txtCarCount.Text.ToString());
                    cmd.Parameters.AddWithValue("Degree", txtCardigre.Text.ToString());
                    cmd.Parameters.AddWithValue("Amount", amount);
                    cmd.Parameters.AddWithValue("CarStopID", MineID);
                    cmd.ExecuteNonQuery();
                    subdivCar.Visible = false;
                    clrCarStop();
                    selectCarStop();
                }
            
            
        }
        else
        {
            LBMsgCarStop.Text = "Məlumatlar tam deyil";
        }

        
        
    }
    protected void DataListHotel_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "NewrowHotel")
        {
            DivHotel.Visible = true;
            lbIDHotel.Text = e.CommandArgument.ToString();
            LbHotelInsertUpdate.Text = "1";
        }
        if (e.CommandName == "UpdaterowHotel")
        {
            DivHotel.Visible = true;
            lbIDHotel.Text = e.CommandArgument.ToString();
            DataRow dr = klas.GetDataRow("select * from CalcHotel where CalcHotelID=" + lbIDHotel.Text);
            DDLhotelYear.SelectedValue = dr["CalcYear"].ToString();
            DDLhotelMonth.SelectedValue = dr["CalcMonth"].ToString();
            txtHotelcountPerson.Text = dr["PersonCount"].ToString();
            txthotelFactor.Text = dr["Degree"].ToString();
            LbHotelInsertUpdate.Text = "2";
        }
        if (e.CommandName == "deleterowHotel")
        {
            lbIDHotel.Text = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand(@" Delete from CalcHotel where CalcHotelID=@MineID", klas.baglan());
            cmd.Parameters.AddWithValue("MineID", lbIDHotel.Text);
            cmd.ExecuteNonQuery();
            selectHotel();
        }
    }
    protected void btnHotel_Click(object sender, EventArgs e)
    {
        if (DDLhotelYear.SelectedValue.ToString() != "0" && DDLhotelMonth.SelectedValue.ToString() != "0" && txtHotelcountPerson.Text != "" && txthotelFactor.Text != "")
        {
            MineInsertUpdate = LbHotelInsertUpdate.Text.Trim();
            MineID = lbIDHotel.Text.Trim();
            float amount = float.Parse(txthotelFactor.Text.ToString()) * float.Parse(txtHotelcountPerson.Text.ToString());
            if (MineInsertUpdate == "1")
            {
                SqlCommand cmd = new SqlCommand(@" insert into CalcHotel (CalcYear, CalcMonth, PersonCount, Degree, Amount, HotelID)
                                                       Values(@CalcYear, @CalcMonth, @PersonCount, @Degree, @Amount, @HotelID)", klas.baglan());
                cmd.Parameters.AddWithValue("CalcYear", DDLhotelYear.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("CalcMonth", DDLhotelMonth.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("PersonCount", txtHotelcountPerson.Text.ToString());
                cmd.Parameters.AddWithValue("Degree", txthotelFactor.Text.ToString());
                cmd.Parameters.AddWithValue("Amount", amount);
                cmd.Parameters.AddWithValue("HotelID", MineID);
                cmd.ExecuteNonQuery();
                DivHotel.Visible = false;
                clrHotel();
                selectHotel();
            }
            else
                if (MineInsertUpdate == "2")
                {
                    SqlCommand cmd = new SqlCommand(@" update CalcHotel set CalcYear=@CalcYear, CalcMonth=@CalcMonth, PersonCount=@PersonCount,
                                                       Degree=@Degree, Amount=@Amount where  CalcHotelID=@HotelID", klas.baglan());
                    cmd.Parameters.AddWithValue("CalcYear", DDLhotelYear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("CalcMonth", DDLhotelMonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("PersonCount", txtHotelcountPerson.Text.ToString());
                    cmd.Parameters.AddWithValue("Degree", txthotelFactor.Text.ToString());
                    cmd.Parameters.AddWithValue("Amount", amount);
                    cmd.Parameters.AddWithValue("HotelID", MineID);
                    cmd.ExecuteNonQuery();
                    DivHotel.Visible = false;
                    clrHotel();
                    selectHotel();
                }


        }
        else
        {
            LBHotelMSG.Text = "Məlumatlar tam deyil";
        }
    }
    protected void btntediyye_Click(object sender, EventArgs e)
    {

        if (ddlhesvaxti.SelectedValue == "1" && ddltediyyetarix.SelectedValue != "-1" && ddlvergi.SelectedValue != "-1")
        {
            hesabla.hesab08_11emlaktorpaq(ddlvergi.SelectedValue.ToString(), TaxpayerID, "08", ddltediyyetarix.SelectedItem.ToString());
            Label3.Text = ddltediyyetarix.SelectedItem.ToString()+" ilin avqustun 8-i üçün hesablama yerinə yetrildi!";
            Label3.ForeColor = Color.Green;
            Label3.Visible = true;
        }
        else if (ddlhesvaxti.SelectedValue == "2" && ddltediyyetarix.SelectedValue != "-1" && ddlvergi.SelectedValue != "-1")
        {
            hesabla.hesab08_11emlaktorpaq(ddlvergi.SelectedValue.ToString(), TaxpayerID, "11", ddltediyyetarix.SelectedItem.ToString());
            Label3.Text = ddltediyyetarix.SelectedItem.ToString() + " ilin noyabrın 15-i üçün hesablama yerinə yetrildi!";
            Label3.ForeColor = Color.Green;
            Label3.Visible = true;
        }
        else {
            Label3.Text = "Məlumat tam deyil.";
            Label3.ForeColor = Color.Red;
            Label3.Visible = true;
        }
//        emlak();
//        torpaq();

        
//        DataRow drw3 = klas.GetDataRow(@"select Series
//from CalcTaxes where TaxpayerID=" + TaxpayerID + " and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + 
//                                  " and TaxesType in ("++")");

//        //Ikinci 15-08-
//        DataRow drw1zx = null;
//        if (drw3 != null)
//        {
//           drw1zx = klas.GetDataRow(@"select TaxpayerID,cast(sum(AmountTax)/2 as numeric(15,2)) as yarisi
//from CalcTaxes where TaxpayerID=" + TaxpayerID + "  and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() +" and TaxesType in ("+ddlvergi.SelectedValue.ToString()+") group by TaxpayerID ");
//        }

//        DataRow drqaliq1 = klas.GetDataRow(@"select mt.TaxpayerId,  case when 
//(select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
//      "      else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//     "  end  qaliq,"+
       
//     "  case when "+
//     "       (select top 1 morepayment from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
         
//     "       else (select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//    "   end  artiqodeme, "+
//     "  case when (case when "+
//     "       (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
//     "       else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//     "  end=0) then 0 "+
//     "  else "+
//     "  DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-08-15 00:00:00.000') )"+
//       "end as yenigday,"+
//       "DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-08-15 00:00:00.000'))*"+
//       "(select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc)/1000 as yenifaiz,"+
//       "(DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-08-15 00:00:00.000'))*"+
//        "(select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc)/1000)"+ 
//        "+(select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) as yenifaizqaliq,"+
//       "(select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) as sanction"+
// " from CalcTaxes mt where mt.TaxpayerID=" + TaxpayerID + " and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " group by mt.TaxpayerId");

//        string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
//        if (ddltediyyetarix.SelectedItem.ToString() != vaxt)
//        {
//            //Response.Write(mebleg.Text +' '+ drqaliq1["qaliq"].ToString());
//            SqlConnection baglanx = klas.baglan();
//            SqlCommand cmdx = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Operation,Amount,RemainingDebt,
//PercentDayCount,PercentCounted,PercentDebt,PaymentDocument,NowTime,MorePayment,Sanction) 
//values (@TaxpayerID,@TaxesPaymentID,@Operation,@Amount,@RemainingDebt,@PercentDayCount,@PercentCounted,@PercentDebt,@PaymentDocument,
//CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-08-15 00:00:00.000'), @MorePayment,@Sanction)", baglanx);
//            cmdx.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
//            cmdx.Parameters.AddWithValue("TaxesPaymentID", ddlvergi.SelectedValue.ToString());

//            cmdx.Parameters.AddWithValue("Operation", 11);
//            float a = 0, art = 0;
//            float f = 0;
//            float s = 0;
//            float q = 0;
//            int d = 0;
//            float yf = 0;
//            float mebleq = 0;
//            if (drw1zx != null)
//            {
//                q = float.Parse(drw1zx["yarisi"].ToString());
//                mebleq = q;
//            }
//            if (drqaliq1 != null)
//            {
//                q = q + float.Parse(drqaliq1["qaliq"].ToString());

//                art = float.Parse(drqaliq1["artiqodeme"].ToString());
//                if(drqaliq1["yenifaizqaliq"].ToString()!=""){
//                f = float.Parse(drqaliq1["yenifaizqaliq"].ToString());
//                }
//                if (drqaliq1["yenigday"].ToString() != "")
//                {
//                    d = int.Parse(drqaliq1["yenigday"].ToString());
//                }
//                if (drqaliq1["yenifaiz"].ToString() != "")
//                {
//                    yf = float.Parse(drqaliq1["yenifaiz"].ToString());
//                }
//                if (drqaliq1["Sanction"].ToString() != "")
//                {
//                    s = float.Parse(drqaliq1["Sanction"].ToString());
//                }
//            }
//            a = art - q;


//            if (art >= q)
//            {
//                q = 0;
//                art = a;
//            }
//            else
//            {
//                art = 0;
//                q = q - art;
//            }
//            if (art > q)
//            {
//                if (art > f)
//                {
//                    art = art - f;
//                    f = 0;
//                }
//                else
//                {
//                    f = f - art;
//                    art = 0;
//                }

//                if (art > s)
//                {
//                    art = art - s;
//                    s = 0;
//                }
//                else
//                {
//                    s = s - art;
//                    art = 0;
//                }
//            }

//            if (0 >= q)
//            {

//                cmdx.Parameters.AddWithValue("RemainingDebt", int.Parse("0"));
//                cmdx.Parameters.AddWithValue("MorePayment", art);
//            }
//            else
//            {
//                a = q;
//                cmdx.Parameters.AddWithValue("RemainingDebt", a);
//                cmdx.Parameters.AddWithValue("MorePayment", int.Parse("0"));
//            }
//            cmdx.Parameters.AddWithValue("Sanction", s);
//            cmdx.Parameters.AddWithValue("Amount", mebleq);
//            cmdx.Parameters.AddWithValue("PercentDayCount", d);
//            cmdx.Parameters.AddWithValue("PercentCounted", yf);
//            cmdx.Parameters.AddWithValue("PercentDebt", f);
//            cmdx.Parameters.AddWithValue("PaymentDocument", "");
//            cmdx.ExecuteNonQuery();
//    }


//        drqaliq1 = klas.GetDataRow(@"select mt.TaxpayerId,  case when 
//            (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
//         "   else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//     "  end  qaliq, "+
       
//     "  case when "+
//      "      (select top 1 morepayment from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
         
//      "      else (select top 1 morepayment from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//     "  end  artiqodeme,"+
//     "  case when (case when "+
//     "       (select top 1 RemainingDebt from Payments  p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) is null then 0 "+
//      "      else (select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) "+
//      " end=0) then 0 "+
//      " else "+
//      " DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID in (" + ddlvergi.SelectedValue.ToString() + ") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-11-15 00:00:00.000') )" +
//       "end as yenigday," +
//       "DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-11-15 00:00:00.000'))*" +
//       "(select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc)/1000 as yenifaiz," +
//       "(DATEDIFF(DAY,(select top 1 NowTime from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc),CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-11-15 00:00:00.000'))*" +
//        "(select top 1 RemainingDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc)/1000)" +
//        "+(select top 1 PercentDebt from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) as yenifaizqaliq," +
//       "(select top 1 sanction from Payments p where p.TaxpayerID=mt.TaxpayerID and TaxesPaymentID  in ("+ddlvergi.SelectedValue.ToString()+") order by PaymentID desc) as sanction" +
// " from CalcTaxes mt where mt.TaxpayerID=" + TaxpayerID + " and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " group by mt.TaxpayerId");

//        string vaxt1 = klas.getdatacell("select year(getdate()) vaxt ");
//        if (ddltediyyetarix.SelectedItem.ToString() != vaxt1)
//        {

//            //Response.Write(mebleg.Text +' '+ drqaliq1["qaliq"].ToString());
//            SqlConnection baglanx = klas.baglan();
//            SqlCommand cmdx = new SqlCommand(@"Insert into Payments (TaxpayerID,TaxesPaymentID,Operation,Amount,RemainingDebt,
//PercentDayCount,PercentCounted,PercentDebt,PaymentDocument,NowTime,MorePayment,Sanction) 
//values (@TaxpayerID,@TaxesPaymentID,@Operation,@Amount,@RemainingDebt,@PercentDayCount,@PercentCounted,@PercentDebt,@PaymentDocument,
//CONVERT(datetime, CONVERT(nvarchar(100)," + ddltediyyetarix.SelectedItem.ToString() + ")+'-11-15 00:00:00.000'), @MorePayment,@Sanction)", baglanx);
//            cmdx.Parameters.AddWithValue("TaxpayerID", TaxpayerID);
//            cmdx.Parameters.AddWithValue("TaxesPaymentID", ddlvergi.SelectedValue.ToString());

//            cmdx.Parameters.AddWithValue("Operation", 11);
//            float a = 0, art = 0;
//            float f = 0;
//            float s = 0;
//            float q = 0;
//            int d = 0;
//            float yf = 0;
//            float mebleq = 0;


//            //uc ile gore
//#region
//            DataTable region21 = klas.getdatatable(@"select *,year(GetDate()) il from (select distinct t.TaxpayerID,t.RegistrDate from 
//(     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
//union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty  where ExitDate is null
//union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
//union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
//union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand  where ExitDate is null
//union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null 
//) as t where TaxpayerID=" + TaxpayerID +
//          " group by t.TaxpayerID,t.RegistrDate,t.vergitype ) as t1 order by t1.TaxpayerID,t1.RegistrDate");


//            int bdate = 0, sdate = 0;
//            bdate = int.Parse(region21.Rows[0][1].ToString());
//            sdate = int.Parse(region21.Rows[0][2].ToString()) - 1;

//#endregion


           


//            if (drw1zx != null)
//            {
//                q = float.Parse(drw1zx["yarisi"].ToString());
//                mebleq = q;
//            }
//            if (drqaliq1 != null)
//            {
//                q = q + float.Parse(drqaliq1["qaliq"].ToString());

//                art = float.Parse(drqaliq1["artiqodeme"].ToString());
//                if (drqaliq1["yenifaizqaliq"].ToString() != "")
//                {
//                    f = float.Parse(drqaliq1["yenifaizqaliq"].ToString());
//                }
//                if (drqaliq1["yenigday"].ToString() != "")
//                {
//                    d = int.Parse(drqaliq1["yenigday"].ToString());
//                }
//                if (drqaliq1["yenifaiz"].ToString() != "")
//                {
//                    yf = float.Parse(drqaliq1["yenifaiz"].ToString());
//                }
//                if (drqaliq1["Sanction"].ToString() != "")
//                {
//                    s = float.Parse(drqaliq1["Sanction"].ToString());
//                }
//            }
           
//            a = 0 - q + art;


//            if (art >= q)
//            {
//                q = 0;
//                art = a;
//            }
//            else
//            {
//                art = 0;
//                q = q - art;
//            }



//            if (((sdate - bdate) >= 2) && (sdate.ToString() == ddltediyyetarix.SelectedItem.ToString()))
//            {
//                f = (q / 1000) * 365;
//                yf = 0;
//                d = 1095;
//            }
//            if (art > q)
//            {
//                if (art > f)
//                {
//                    art = art - f;
//                    f = 0;
//                }
//                else
//                {
//                    f = f - art;
//                    art = 0;
//                }

//                if (art > s)
//                {
//                    art = art - s;
//                    s = 0;
//                }
//                else
//                {
//                    s = s - art;
//                    art = 0;
//                }
//            }







//            if (0 >= q)
//            {

//                cmdx.Parameters.AddWithValue("RemainingDebt", int.Parse("0"));
//                cmdx.Parameters.AddWithValue("MorePayment", art);
//            }
//            else
//            {
//                a = q;
//                cmdx.Parameters.AddWithValue("RemainingDebt", a);
//                cmdx.Parameters.AddWithValue("MorePayment", int.Parse("0"));
//            }
//            cmdx.Parameters.AddWithValue("Sanction", s);
//            cmdx.Parameters.AddWithValue("Amount", mebleq);
//            cmdx.Parameters.AddWithValue("PercentDayCount", d);
//            cmdx.Parameters.AddWithValue("PercentCounted", yf);
//            cmdx.Parameters.AddWithValue("PercentDebt", f);
//            cmdx.Parameters.AddWithValue("PaymentDocument", "");
//            cmdx.ExecuteNonQuery();
//        }
//        Label3.Text = ddltediyyetarix.SelectedItem.ToString() + " üçun hesablama yerinə yetrildi!";
//        Label3.ForeColor = Color.Green;
//        Label3.Visible = true;
//   }


//    void emlak()
//    {
//        DataRow dr1 = klas.GetDataRow(@"select CalcID,TaxpayerID from CalcTaxes where TaxpayerID=" + TaxpayerID +
//            " and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " and TaxesType=1");
       
//        if (dr1 == null)
//        {
//            //Response.Write("1");
//            DataRow dr = klas.GetDataRow(@"select t.TaxpayerID,sum(t.mebleg) mebleg,t.vergitype from 
//                (     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
//                union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty  where ExitDate is null
//                union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
//                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
//                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand  where ExitDate is null
//                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null) as t
//                where t.TaxpayerID=" + TaxpayerID + " and t.RegistrDate<=" + ddltediyyetarix.SelectedItem.ToString() +
//                                    " and vergitype=1 group by t.TaxpayerID,t.vergitype");
//            SqlConnection baglan = klas.baglan();
//            if (dr != null)
//            {
//                //Response.Write("2");
               
//                SqlCommand cmd = new SqlCommand(@"insert into CalcTaxes (TaxpayerID,TaxesType,AmountTax,CalcYear) 
//                               Values (@TaxpayerID,@TaxesType,@AmountTax," + ddltediyyetarix.SelectedItem.ToString() + ")", baglan);

//                cmd.Parameters.AddWithValue("@TaxpayerID", TaxpayerID);
//                cmd.Parameters.AddWithValue("@TaxesType", dr["vergitype"].ToString());
//                cmd.Parameters.AddWithValue("@AmountTax", dr["mebleg"].ToString());
//                cmd.ExecuteNonQuery();
//            }

//        }
//        else
//        {
//            //Response.Write("3");
//            DataRow dr = klas.GetDataRow(@"select t.TaxpayerID,sum(t.mebleg) mebleg,t.vergitype from 
//                        (     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
//                        union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty where ExitDate is null
//                        union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
//                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
//                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand where ExitDate is null
//                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null) as t
//                        where t.TaxpayerID=" + TaxpayerID + " and t.RegistrDate<=" + ddltediyyetarix.SelectedItem.ToString() +
//                                           " and vergitype=1 group by t.TaxpayerID,t.vergitype");
//            SqlConnection baglan = klas.baglan();
//            if (dr != null)
//            {
//                //Response.Write("4");
//                SqlCommand cmd = new SqlCommand(@"update CalcTaxes set TaxpayerID=@TaxpayerID,TaxesType=@TaxesType,AmountTax=@AmountTax,CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " where CalcID=" + dr1["CalcID"].ToString(), baglan);

//                cmd.Parameters.AddWithValue("@TaxpayerID", TaxpayerID);
//                cmd.Parameters.AddWithValue("@TaxesType", dr["vergitype"].ToString());
//                cmd.Parameters.AddWithValue("@AmountTax", dr["mebleg"].ToString());
//                cmd.ExecuteNonQuery();
//            }
//        }

    }
    void torpaq()
    {

        DataRow dr1 = klas.GetDataRow(@"select CalcID,TaxpayerID from CalcTaxes where TaxpayerID=" + TaxpayerID +
             " and CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " and TaxesType=2");

        if (dr1 == null)
        {
            //Response.Write("1");
            DataRow dr = klas.GetDataRow(@"select t.TaxpayerID,sum(t.mebleg) mebleg,t.vergitype from 
                (     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
                union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty  where ExitDate is null
                union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand  where ExitDate is null
                union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null) as t
                where t.TaxpayerID=" + TaxpayerID + " and t.RegistrDate<=" + ddltediyyetarix.SelectedItem.ToString() +
                                    " and vergitype=2 group by t.TaxpayerID,t.vergitype");
            SqlConnection baglan = klas.baglan();
            if (dr != null)
            {
                //Response.Write("2");

                SqlCommand cmd = new SqlCommand(@"insert into CalcTaxes (TaxpayerID,TaxesType,AmountTax,CalcYear) 
                               Values (@TaxpayerID,@TaxesType,@AmountTax," + ddltediyyetarix.SelectedItem.ToString() + ")", baglan);

                cmd.Parameters.AddWithValue("@TaxpayerID", TaxpayerID);
                cmd.Parameters.AddWithValue("@TaxesType", dr["vergitype"].ToString());
                cmd.Parameters.AddWithValue("@AmountTax", dr["mebleg"].ToString());
                cmd.ExecuteNonQuery();
            }

        }
        else
        {
            //Response.Write("3");
            DataRow dr = klas.GetDataRow(@"select t.TaxpayerID,sum(t.mebleg) mebleg,t.vergitype from 
                        (     select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewLivingProperty where ExitDate is null
                        union select LivingAreaID,TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,1 vergitype from viewQLivingProperty  where ExitDate is null
                        union select TransportID LivingAreaID,TaxpayerID,6 LivingType,mebleg, year(RegistrDate) RegistrDate,1 vergitype from viewWaterAirTransport where ExitDate is null
                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewLivingLand where ExitDate is null
                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewQLivingLand where ExitDate is null
                        union select LivingAreaID, TaxpayerID,LivingType,mebleg,year(RegistrDate) RegistrDate,2 vergitype from ViewVillageLand where ExitDate is null) as t
                        where t.TaxpayerID=" + TaxpayerID + " and t.RegistrDate<=" + ddltediyyetarix.SelectedItem.ToString() +
                                           " and vergitype=2 group by t.TaxpayerID,t.vergitype");
            SqlConnection baglan = klas.baglan();
            if (dr != null)
            {
                //Response.Write("4");
                SqlCommand cmd = new SqlCommand(@"update CalcTaxes set TaxpayerID=@TaxpayerID,TaxesType=@TaxesType,AmountTax=@AmountTax,CalcYear=" + ddltediyyetarix.SelectedItem.ToString() + " where CalcID=" + dr1["CalcID"].ToString(), baglan);

                cmd.Parameters.AddWithValue("@TaxpayerID", TaxpayerID);
                cmd.Parameters.AddWithValue("@TaxesType", dr["vergitype"].ToString());
                cmd.Parameters.AddWithValue("@AmountTax", dr["mebleg"].ToString());
                cmd.ExecuteNonQuery();
            }
        }


    }

}