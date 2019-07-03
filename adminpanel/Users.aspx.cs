using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class adminpanel_Users : System.Web.UI.Page
{
     Class2 klas = new Class2(); static string prevPage = String.Empty; string islem; string TaxpayerID;
     protected void Page_Load(object sender, EventArgs e)
     {
         try
         {
             TaxpayerID = Request.QueryString["TaxpayerID"];
             islem = Request.QueryString["islem"];
         }
         catch (Exception)
         { }
         if (!Page.IsPostBack)
         {

             if (Session["UserID1"]  == null)
             {
                 Response.Redirect("EntryAdmin.aspx");
             }
             prevPage = Request.Url.AbsoluteUri.ToString();
             vizual();
         }
     }
     void vizual()
     {
         if (Session["UserID1"] == null)
         {
             Response.Redirect("EntryAdmin.aspx");
         }

         DataTable region2 = klas.getdatatable(@"select case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName ,lm.MunicipalName,Uname,
Passvord,u.UserID,lm.MunicipalID,SName +' '+ u.Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name,VPN_IP 
 from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID
 inner join List_classification_Regions lr on lr.RegionsID=lm.RegionID
 order by RegionName,MunicipalName");
             Repeater1.DataSource = region2;
             Repeater1.DataBind();
         
     }
}