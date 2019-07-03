using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage69 : System.Web.UI.Page
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
                                           N'Cəmi' fullname, 
                                           '' YVOK,
                                           '' GraduationYear,
                                           '' MotorType,
                                           '' MotorSize,
                                           '' Price,
                                           sum(l.mebleg) mebleg,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                    from Taxpayer t inner join viewWaterAirTransport l on t.TaxpayerID=l.TaxpayerID  
where t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId);
                  
                    DataListCem.DataSource = dt1;
                    DataListCem.DataBind();



                    DataTable dt = klas.getdatatable(@"select '' sn, 
                                       t.SName+' '+t.Name+' '+t.FName as fullname, 
                                       t.YVOK,
                                       l.GraduationYear,
                                       l.MotorType,
                                       case when l.MotorSize=0 then null else l.MotorSize end MotorSize,
                                       case when l.Price=0 then null else l.Price end Price,
                                       l.mebleg,
                                       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                from Taxpayer t inner join viewWaterAirTransport l on t.TaxpayerID=l.TaxpayerID where 
t.fordelete=1 and ExitDate is null and t.MunicipalID=" + MunicipalId+" order by sn,fullname ");
                    
                    DataListBaza.DataSource = dt;
                    DataListBaza.DataBind();
                }
            }
        }
    }

    protected void btnGiris_Click(object sender, EventArgs e)
    {

    }
    protected void OnMenuItemDataBound(object sender, MenuEventArgs e)
    {
        if (SiteMap.CurrentNode != null)
        {
            if (e.Item.Text == SiteMap.CurrentNode.Title)
            {
                if (e.Item.Parent != null)
                {
                    e.Item.Parent.Selected = true;
                }
                else
                {
                    e.Item.Selected = true;
                }
            }
        }
    }
}