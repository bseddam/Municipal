using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepageii : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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

                    DataTable dt1 = klas.getdatatable(@"select '' sn, 
                                           N'  Cəmi ' fullname, 
                                           '' YVOK,
                                           '' CompanyName,
                                           '' ActivitieType,
                                           '' unvan,
                                           sum(c.Income) Income,
                                           Sum(c.Expense) Expense,
                                           SUM(c.Amount) as Amount,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                    from Taxpayer t inner join ProfitsTax p on p.TaxpayerID=t.TaxpayerID left join 
                                    CalcProfits c on c.ProfitsID=p.IncomeTaxID where t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId);
                  
                    DataListCem.DataSource = dt1;
                    DataListCem.DataBind();



                    DataTable dt = klas.getdatatable(@"select '' sn, 
                                       t.SName+' '+t.Name+' '+t.FName as fullname, 
                                       t.YVOK,
                                       p.CompanyName,
                                       p.ActivitieType,
                                       p.RegionName+', '+p.Village+', '+p.Street+', '+p.Home+', '+p.Flat as unvan,
                                       sum(c.Income) Income,
                                       Sum(c.Expense) Expense,
                                       SUM(c.Amount) as Amount,
                                       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                from Taxpayer t inner join ProfitsTax p on p.TaxpayerID=t.TaxpayerID left join CalcProfits c on c.ProfitsID=p.IncomeTaxID
                                 where t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId +
                    "group by t.SName+' '+t.Name+' '+t.FName, t.YVOK,p.CompanyName, p.ActivitieType, p.RegionName+', '+p.Village+', '+p.Street+', '+p.Home+', '+p.Flat order by sn,fullname ");
                    
                    DataListBaza.DataSource = dt;
                    DataListBaza.DataBind();
                }
            }
        }
    }


}