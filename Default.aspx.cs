using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

public partial class _Default : System.Web.UI.Page
{
    Class2 klas = new Class2();
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
        HttpRequest request = base.Request;

        string useraddress = request.UserHostAddress;

        string macAddresses = "";
        foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
        {
            if (nic.OperationalStatus == OperationalStatus.Up)
            {
                macAddresses += nic.GetPhysicalAddress().ToString();
                break;
            }
        }



        SqlConnection baglan = klas.baglan();
        DataTable dt1 = new DataTable();
        SqlCommand cmd2 = new SqlCommand(@"Select * from Users Where passvord=@p2 and Uname=@p1 ", baglan);
        cmd2.Parameters.AddWithValue("p1", txtlogin.Text);
        cmd2.Parameters.AddWithValue("p2", txtparol.Text);
        SqlDataAdapter dap1 = new SqlDataAdapter(cmd2);
        dap1.Fill(dt1);
       
        if (dt1.Rows.Count != 0)
        {
            SqlCommand cmd1 = new SqlCommand(@"Update Users set  UsedSistem=getdate() where UserID=" + dt1.Rows[0]["UserID"].ToString(), baglan);
            cmd1.ExecuteNonQuery();

            Session["UserID"] = dt1.Rows[0]["UserID"].ToString();
            Session["passvord"] = dt1.Rows[0]["passvord"].ToString();
            Session["Status_Users"]= dt1.Rows[0]["Status_Users"].ToString();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Users/Homepage.aspx", true);
        }
        else
        {

            if (dt1.Rows.Count == 0)
            {
                lblBilgi.Text = "İsfifadəçi adı və ya şifrə yalnışdır!";
            }
            else {
                lblBilgi.Text = "İP ünvan yalnışdır. Sizin İP ünvan "+useraddress;
              
            }
           
        }
    }
}