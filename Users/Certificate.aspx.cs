using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;

public partial class Users_Certificate : System.Web.UI.Page
{
    Class2 klas = new Class2();  string TaxpayerID; static string prevPage = String.Empty; 
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

                DataRow drtediyye1 = klas.GetDataRow(@"select 
SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name,StatusPositionName  from Structure as st
inner join List_classification_Municipal as lm on st.MunicipalID=lm.MunicipalID   where st.MunicipalID =" + MunicipalId + " and Charge=1");
                if (drtediyye1 != null)
                {
                    mehsul.Text = drtediyye1["StatusPositionName"].ToString();
                    lblsedr.Text = drtediyye1["Name"].ToString();
                    //string indikivaxt = klas.getdatacell("SELECT GETDATE() as indikivaxt");
                    //lblsedrtarix.Text = klas.tarixkesdatetime(indikivaxt);
                }

                DataRow drtediyye = klas.GetDataRow(@"select case when tx.Individual_Legal=1 then N'fiziki'
when tx.Individual_Legal=2 then N'hüquqi' end Individual_Legal,lm.MunicipalName,
lm.Municipalphone,tx.Mobiltel,case when tx.Individual_Legal=1 then tx.ActualAdress
when tx.Individual_Legal=2 then tx.RegistrationAdress end ActualAdress,tx.YVOK,lm.MunicipalAdress,
Name,SName,FName  from Taxpayer as tx
inner join List_classification_Municipal as lm
on tx.MunicipalID=lm.MunicipalID  where tx.TaxpayerID =" + TaxpayerID);
                if (drtediyye != null)
                {
                    lblataadi.Text = drtediyye["FName"].ToString();
                    lblsoyad.Text = drtediyye["SName"].ToString();
                    lblad.Text = drtediyye["Name"].ToString();
                    lblyvok.Text = drtediyye["YVOK"].ToString();
                    lblunvan.Text = drtediyye["ActualAdress"].ToString();
                    lblsexs.Text = drtediyye["Individual_Legal"].ToString();
                    lblbel.Text = drtediyye["MunicipalName"].ToString();
                   
                }
                lblgun.Text = klas.getdatacell(@"select day(GETDATE())");
                lblay.Text = klas.getdatacell(@"select month(GETDATE())");
                lblil.Text = klas.getdatacell(@"select year(GETDATE())");
            }
            
        }
    }


  
}