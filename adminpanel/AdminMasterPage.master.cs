using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_AdminMasterPage : System.Web.UI.MasterPage
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 129600;
        HttpContext.Current.Session.Timeout = 129600;
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        string surl = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["UserID1"] == null || Session["passvord1"] == null)
                {
                    Response.Redirect("EntryAdmin.aspx");
                }
                DataRow drGiris1 = klas.GetDataRow(@"Select * from Users Where MunicipalID=0 and UserID='" + Session["UserID1"].ToString() + "'and passvord=N'" + Session["passvord1"].ToString() + "' and (status_users=1 or status_users=2)");
                if (drGiris1 == null)
                {
                    Response.Redirect("EntryAdmin.aspx");
                }
                //DataRow drGiris = klas.GetDataRow(@"Select MunicipalName from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID1"].ToString());
                //if (drGiris != null)
                //{
                //    lbladsoy.Text = drGiris["MunicipalName"].ToString();
                //}

                if (drGiris1["Status_users"].ToString() == "2")
                {
                    if (!controlLink(surl))
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
            }
            catch (Exception)
            {
                Response.Write("Yenidən daxil olun");
            }
        }
    }
    protected bool controlLink(string urls)
    {
        List<string> s = new List<string>();
        s.Add("Home.aspx");
        s.Add("Expencere.aspx");
        s.Add("MunicipalGeneraldebt.aspx");
        s.Add("Statistiks.aspx");
        s.Add("RepPayment.aspx");
        s.Add("ReportTaxpayer.aspx");
        s.Add("ReportlivingArea.aspx");
        s.Add("ReportNoLivingArea.aspx");
        s.Add("ReportTransport.aspx");
        s.Add("ReportLivingLand.aspx");
        s.Add("ReportNoLivingLand.aspx");
        s.Add("ReportVillageLand.aspx");
        s.Add("ReportMine.aspx");
        s.Add("ReportProfits.aspx");
        s.Add("ReportPayments.aspx");
        bool b = false;
        foreach (string urls1 in s)
        {
            if (urls == urls1)
            {
                b = true;
                break;
            }
        }

        return b;
    }
    protected void btncixis_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("EntryAdmin.aspx");
    }
}
