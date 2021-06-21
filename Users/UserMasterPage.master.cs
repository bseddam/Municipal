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
        string surl = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
        if (!Page.IsPostBack)
        {
            //try
            //{
            if (Session["UserID"] == null || Session["passvord"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            SqlConnection baglan = klas.baglan();
            DataTable dt1 = new DataTable();
            SqlCommand cmd2 = new SqlCommand(@"Select MunicipalName,Status_users from Users u 
inner join List_classification_Municipal lm 
 on u.MunicipalID=lm.MunicipalID Where passvord=@p2 and UserID=@p1", baglan);
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


            if (dt1 != null)
            {
                lbladsoy.Text = dt1.Rows[0]["MunicipalName"].ToString();
            }
            if (dt1.Rows[0]["Status_users"].ToString() == "2")
            {
                //if (controlLink(surl))
                //{
                //    Response.Redirect("~/Default.aspx");
                //}

                if (!controlLink(surl))
                {
                    Response.Redirect("HomePage.aspx");
                }

                //}
                //catch (Exception)
                //{
                //    Response.Write("Yenidən daxil olun");
                //}
            }
        }
    }
    protected bool controlLink(string urls)
    {
        List<string> s = new List<string>();

        DataTable dt = klas.getdatatable(@"select MenuLink from List_classifications_Menu lm where  lm.MenuID not in (
select m.MenuID from Users u 
inner join Privilege p on u.UserID = p.UserID
inner join List_classifications_Menu m on p.MenuID = m.MenuID
where u.UserID=" + Session["UserID"].ToString()+")");
        foreach (DataRow row in dt.Rows)
        {
            string aa = row["MenuLink"].ToString();
            s.Add(aa);
        }



        bool b = true;
        foreach (string urls1 in s)
        {
            if (urls == urls1)
            {
                b = false;
                break;
            }
        }

        return b;
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
