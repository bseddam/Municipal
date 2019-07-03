using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class adminpanel_Calclastyears : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            iller();
            rayon();
            municipal();
            //trx();
        }
    }
    void iller()
    {
        ddlhesabatili.Items.Clear();
        int k = 0;
        string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
        for (var i = int.Parse(vaxt); i >= 2015; i--)
        {
            ddlhesabatili.Items.Insert(k, new ListItem("" + i + ""));
            k++;
        }
        ddlhesabatili.Items.Insert(0, new ListItem("Seçin", "-1"));
    }


    protected void btntediyye_Click(object sender, EventArgs e)
    {
        string MunicipalId = " "; string ray = " ";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
        }
        else
        {
            MunicipalId = " and t.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }
        if (MunicipalId != " " && ddlhesabatili.SelectedValue != "-1" && ddlbelediyye.SelectedValue != "-1" && ddlrayon.SelectedValue != "-1")
        {
            lblsms.Text = "";
           
      
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"declare @TaxpayerID numeric(18,0)
declare cursormunicipal cursor for

select distinct t.TaxpayerID from Taxpayer t inner join 
(
   select TaxpayerID,RegistrDate from viewLivingProperty where ExitDate is null 
   union select TaxpayerID,RegistrDate  from viewQLivingProperty  where ExitDate is null 
   union  select TaxpayerID,RegistrDate  from viewWaterAirTransport where ExitDate is null
   union select TaxpayerID,RegistrDate  from ViewLivingLand where ExitDate is null 
   union select TaxpayerID,RegistrDate  from ViewQLivingLand where ExitDate is null 
   union select TaxpayerID,RegistrDate from ViewVillageLand where ExitDate is null
)
 la on la.TaxpayerID=t.TaxpayerID left join Payments ps on t.TaxpayerID=ps.TaxpayerID
where fordelete=1 and Individual_Legal=1 and year(la.RegistrDate)<="+ddlhesabatili.SelectedItem.ToString()
+ MunicipalId + "  and t.TaxpayerID not in (" +
" select plk.TaxpayerID from " +
" (select distinct pfg.TaxpayerID,pfg.TaxesPaymentID  from Payments pfg inner join Taxpayer oo on oo.TaxpayerID=pfg.TaxpayerID " +
" where pfg.Operation=3 and pfg.NowTime=CONVERT(nvarchar(20)," + ddlhesabatili.SelectedItem.ToString()
+ ")+'-08-15 00:00:00.000' and t.municipalID=oo.municipalID) plk " +
" inner join  " +
" (select distinct pfg.TaxpayerID,pfg.TaxesPaymentID  from Payments pfg inner join Taxpayer oo on oo.TaxpayerID=pfg.TaxpayerID " +
" where pfg.Operation=2 and pfg.NowTime=CONVERT(nvarchar(20)," + ddlhesabatili.SelectedItem.ToString()
+ ")+'-11-15 00:00:00.000' and t.municipalID=oo.municipalID ) kls " +
" on plk.TaxpayerID=kls.TaxpayerID and plk.TaxesPaymentID=kls.TaxesPaymentID ) " +
" open cursormunicipal " +
" fetch next from cursormunicipal into @TaxpayerID " +
" while (@@FETCH_STATUS=0) " +
" begin  " +
" exec hesab08_11emlaktorpaq 1,@TaxpayerID,'08'," + ddlhesabatili.SelectedItem.ToString() +
" exec hesab08_11emlaktorpaq 1,@TaxpayerID,'11'," + ddlhesabatili.SelectedItem.ToString() +
" exec hesab08_11emlaktorpaq 2,@TaxpayerID,'08' ," + ddlhesabatili.SelectedItem.ToString() +
" exec hesab08_11emlaktorpaq 2,@TaxpayerID,'11' ," + ddlhesabatili.SelectedItem.ToString() +
" fetch next from cursormunicipal into @TaxpayerID " +
" end " +
" close cursormunicipal " +
" deallocate cursormunicipal ", baglan);
                cmd.CommandTimeout = 100000;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                cmd.Connection.Close();
                baglan.Close();
                baglan.Dispose();
                lblsms.Text = "Hesablama uğurla yerinə yetirildi";
                lblsms.ForeColor = Color.Green;
        }
        else
        {
            lblsms.Text = "Məlumat tam deyil";
            lblsms.ForeColor = Color.Red;
        }
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Seçin", "-1"));
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Seçin", "-1"));
    }
}