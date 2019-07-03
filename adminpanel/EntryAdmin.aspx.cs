using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data.SqlClient;

public partial class adminpanel_EntryAdmin : System.Web.UI.Page
{
    Class2 klas = new Class2();
    seo klass = new seo();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtlogin.Focus();
        string localip = "?";
        IPHostEntry host = Dns.GetHostEntry(Dns.GetHostName());
        foreach (IPAddress ip in host.AddressList)
        {
            if (ip.AddressFamily.ToString() == "InterNetwork")
            {
                localip = ip.ToString();
            }
        }
        //if (localip == "192.168.150.17")
        //{
        //    Session["UserID1"] = "000";
        //    Session["passvord1"] = "000";
        //    Response.Redirect("Hesabatlar.aspx?islem1=1", true);
        //}
        //else if (localip == "192.168.150.77")
        //{
        //    Session["UserID1"] = "000";
        //    Session["passvord1"] = "000";
        //    Response.Redirect("Hesabatlar.aspx?islem1=1", true);
        //}
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Page.IsPostBack == false)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Session.Clear();
        }
    }
    protected void btnGiris_Click(object sender, EventArgs e)
    {
        DataRow drGiris1 = klas.GetDataRow("Select * from Users Where MunicipalID=0 and passvord='" + seo.temizle(txtparol.Text) + "' and Uname='" + seo.temizle(txtlogin.Text) + "' and (status_users=1 or status_users=2)");
        if (drGiris1 != null)
        {
            Session["UserID1"] = drGiris1["UserID"].ToString();
            Session["passvord1"] = drGiris1["passvord"].ToString();
            Response.Redirect("Home.aspx", true);
        }
        else
            lblBilgi.Text = "Şifrə yalnışdır!";
    }
}