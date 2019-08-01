using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage1 : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            kk();
        }
    }


  void kk() {
      if (Session["UserID"] != null)
      {
          string MunicipalId = ""; string MunicipalName = "";
          DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
          if (Municipal != null)
          {
              MunicipalId = Municipal["MunicipalID"].ToString();
              MunicipalName = Municipal["MunicipalName"].ToString();
          }

          if (MunicipalId != "")
          {

              DataTable dt = klas.getdatatable(@"select '0' sn, 
       N'  Cəmi  ' fullname, 
       '' YVOK,
       '' Concession,
       sum(l.GeneralArea) GeneralArea,
       sum(l.DiffGeneralArea) DiffGeneralArea,
       '' ZonaFactor,
       '' TaxRate,
       sum(l.mebleg) mebleg,
       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix ,'' unvan 
from Taxpayer t inner join viewLivingProperty l on t.TaxpayerID=l.TaxpayerID 
where t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId +
@" union select '1' sn, 
t.SName+' '+t.Name+' '+t.FName as fullname, 
t.YVOK,
l.Concession,
l.GeneralArea,
l.DiffGeneralArea,
convert(nvarchar(50),cast(l.ZonaFactor as numeric(18,2))) ZonaFactor,
l.TaxRate,
l.mebleg,
'01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix  ,l.unvan 
from Taxpayer t inner join viewLivingProperty l on t.TaxpayerID=l.TaxpayerID 
where t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId +" order by sn,fullname");
             
              // dt = klas.tekrarlamax2("fullname", "YVOK","N",dt);
              GridView1.DataSource = dt;
              GridView1.DataBind();
          }
      }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        kk();
    }

}