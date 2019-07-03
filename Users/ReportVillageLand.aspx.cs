using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage232 : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            kk();
        }
    }
    protected void kk()
    {
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

                DataTable dt =klas.getdatatable(@"select '0' sn, 
                                           N'Cəmi' fullname, 
                                           '' YVOK,
                                           '' Name,
                                           '' Concession1,
                                           '' QualityGroup,
                                           '' ConditionalPoints,
                                           sum(l.GeneralArea) GeneralArea,
                                           sum(l.mebleg) mebleg,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
from Taxpayer t inner join ViewVillageLand l on t.TaxpayerID=l.TaxpayerID  
where t.fordelete=1 and (l.TypeUseLand=1 or l.TypeUseLand=2) and ExitDate is null and t.MunicipalID=" + MunicipalId +
                              " union select '1' sn, "+
                              "  t.SName+' '+t.Name+' '+t.FName as fullname, "+
                              "  t.YVOK,"+
                              "   l.Name, "+
                              "   l.Concession1, "+
                              "  l.QualityGroup, "+
                              "   l.ConditionalPoints, "+
                              "   l.GeneralArea, "+
                              "   l.mebleg, "+
                              "   '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix "+
                              "   from Taxpayer t inner join ViewVillageLand l on t.TaxpayerID=l.TaxpayerID   " +
" where t.fordelete=1 and (l.TypeUseLand=1 or l.TypeUseLand=2) and ExitDate is null and t.MunicipalID=" + MunicipalId + " order by sn,fullname ");

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