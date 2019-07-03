using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;

public partial class Users_UserMasterPage : System.Web.UI.MasterPage
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 129600;
        HttpContext.Current.Session.Timeout = 129600;
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["UserID"] == null || Session["passvord"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }

                SqlConnection baglan = klas.baglan();
                DataTable dt1 = new DataTable();
                SqlCommand cmd2 = new SqlCommand(@"Select * from Users Where passvord=@p2 and UserID=@p1  and status_users=0", baglan);
                cmd2.Parameters.AddWithValue("p1", Session["UserID"].ToString());
                cmd2.Parameters.AddWithValue("p2", Session["passvord"].ToString());
                SqlDataAdapter dap1 = new SqlDataAdapter(cmd2);
                dap1.SelectCommand.CommandTimeout = 180;
                dap1.Fill(dt1);
                dap1.Dispose();
                baglan.Close();
                baglan.Dispose();

                if (dt1.Rows.Count == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }

                DataRow drGiris = klas.GetDataRow(@"Select MunicipalName from Users u inner join List_classification_Municipal lm 
 on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (drGiris != null)
                {
                    lbladsoy.Text = drGiris["MunicipalName"].ToString();
                }
            }
            catch (Exception)
            {
                Response.Write("Yenidən daxil olun");
            }
        }
    }
    protected void btncixis_Click(object sender, EventArgs e)
    {
        //if (Session["UserID"] == null )
        //{
        //    Response.Redirect("~/Default.aspx");
        //}
        //SqlConnection baglan = klas.baglan();
        //SqlCommand cmd1 = new SqlCommand(@"Update Users set  UsedSistem=getdate() where UserID=" + Session["UserID"].ToString(), baglan);
        //cmd1.ExecuteNonQuery();
        
        FormsAuthentication.SignOut();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }
}
