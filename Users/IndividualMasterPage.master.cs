using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;



public partial class Users_MasterPage : System.Web.UI.MasterPage
{
    Class2 klas = new Class2(); string IndividualLegal="";
  
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!Page.IsPostBack)
        {
            try
            {
                IndividualLegal = Request.QueryString["IndividualLegal"];
                if (Session["UserID"] == null || Session["passvord"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
              
            }
            catch (Exception)
            {
                Response.Write("Yenidən daxil olun");
            }
            lblindividuallegal.Text = IndividualLegal;
            if (IndividualLegal == "1") {
                lblsehife.Text = "IndividualUpdate";
            }
            else if (IndividualLegal == "2")
            {
                lblsehife.Text = "LegalUpdate";
            }

            if (IndividualLegal != "")
            {

                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
                string MunicipalId = ""; string MunicipalName = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();
                    MunicipalName = Municipal["MunicipalName"].ToString();
                }

                if ( Session["ActualAdress"]!=null && Session["yvoksearch"] != null && Session["Soyadsearch"] != null && Session["adsearch"] != null && Session["ataadisearch"] != null)
                {
                    txtyvok.Text = Session["yvoksearch"].ToString();
                    txtsoyad.Text = Session["Soyadsearch"].ToString();
                    txtad.Text = Session["adsearch"].ToString();
                    txtataadi.Text = Session["ataadisearch"].ToString();
                    txtunvan.Text = Session["ActualAdress"].ToString();
                }


                vizual("top 10");


                Session["yvoksearch"] = txtyvok.Text.Trim();
                Session["Soyadsearch"] = txtsoyad.Text.Trim();
                Session["adsearch"] = txtad.Text.Trim();
                Session["ataadisearch"] = txtataadi.Text.Trim();
                Session["ActualAdress"] = txtunvan.Text.Trim();
            }
        }
    }
    protected void repeattaxpayer(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Vergiobyekt")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("GeneralTaxes.aspx?islem=generaltax&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "Tediyyebildiris")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("PaymentNotice.aspx?islem=PaymentNotice&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "sehadetname")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("Certificate.aspx?islem=Certificate&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "sexsihesab")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("Personalacc.aspx?islem=Personalacc&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "hesablama")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("Calculation.aspx?islem=calc&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "odenis")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect("Payment.aspx?islem=odenis&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "baxis")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect(lblsehife.Text + ".aspx?islem=baxis&IndividualLegal=" + lblindividuallegal.Text);
        }
        if (e.CommandName == "duzelis")
        {
            Session["TaxpayerID"] = e.CommandArgument.ToString();
            Response.Redirect(lblsehife.Text + ".aspx?islem=duzelis&IndividualLegal=" + lblindividuallegal.Text);
        }
        
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        string TaxpayerID1 = (sender as LinkButton).CommandArgument.ToString();
        if (klas.getdatatable(@"select TaxpayerID from Payments where TaxpayerID=" 
+ TaxpayerID1 + " and amount<>0 and Operation=10").Rows.Count == 0)
        {

            klas.cmd(@"Update Taxpayer set Fordelete=0,FordeleteTime=getdate() Where TaxpayerID=" 
+ TaxpayerID1);
            if (IndividualLegal != "")
            {
                vizual("");
            }
            Response.Redirect(lblsehife.Text + ".aspx?IndividualLegal=" + lblindividuallegal.Text);
        }
        else
        {
            Class2.MsgBox("Bu vergi odəyicisinə məxsus sistemə odəniş daxil edilmişdir.", Page);
        }
    }
    void vizual(string top10)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; string MunicipalName = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }

        string  yvok = " ", yvok1 = " ", yvok2 = " ", ad = " "
, ad1 = " ", ad2 = " ", soyad = " ", soyad1 = " ", soyad2 = " ", ataadi = " ", ataadi1 = " ", ataadi2 = " ",unvan=" ";




        if (txtyvok.Text == " " || txtyvok.Text == "" || txtyvok.Text == null)
        {
            yvok = "  ";
            yvok1 = "  ";
            yvok2 = "  ";
        }
        else
        {
            yvok = "  and t1.YVOK like N'%" + txtyvok.Text + "%'";
            yvok1 = "  and t2.YVOK like N'%" + txtyvok.Text + "%'";
            yvok2 = "  and t.YVOK like N'%" + txtyvok.Text + "%'";
        }

        if (txtad.Text == " " || txtad.Text == "" || txtad.Text == null)
        {
            ad = "  ";
            ad1 = "  ";
            ad2 = "  ";
        }
        else
        {
            ad = "  and t1.Name like N'%" + txtad.Text + "%'";
            ad1 = "  and t2.Name like N'%" + txtad.Text + "%'";
            ad2 = "  and t.Name like N'%" + txtad.Text + "%'";
        }

        if (txtsoyad.Text == " " || txtsoyad.Text == "" || txtsoyad.Text == null)
        {
            soyad = "  ";
            soyad1 = "  ";
            soyad2 = "  ";
        }
        else
        {
            soyad = "  and t1.SName like N'%" + txtsoyad.Text + "%'";
            soyad1 = "  and t2.SName like N'%" + txtsoyad.Text + "%'";
            soyad2 = "  and t.SName like N'%" + txtsoyad.Text + "%'";
        }

        if (txtataadi.Text == " " || txtataadi.Text == "" || txtataadi.Text == null)
        {
            ataadi = "  ";
            ataadi1 = "  ";
            ataadi2 = "  ";
        }
        else
        {
            ataadi = "   and t1.FName like N'%" + txtataadi.Text + "%'";
            ataadi1 = "   and t2.FName like N'%" + txtataadi.Text + "%'";
            ataadi2 = " and t.FName like N'%" + txtataadi.Text + "%'";
        }

        if (txtunvan.Text == " " || txtunvan.Text == "" || txtunvan.Text == null)
        {
            unvan = "  ";

        }
        else
        {
            unvan = "   and t1.ActualAdress like N'%" + txtunvan.Text + "%'";
        }




        DataTable region2 = klas.getdatatable(@"select "+top10+@" case 
when Individual_Legal=1 then SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end
when Individual_Legal=2 then CompanyName
end as Name222,Fordelete,Individual_Legal,MunicipalID,NowTime,Name Name1,SName,FName,
YVOK,VOEN,TaxpayerID from Taxpayer t1   where Individual_Legal=" + lblindividuallegal.Text + " and Fordelete=1 and MunicipalID="  +MunicipalId 
  + yvok + ad + soyad + ataadi +unvan+ "  order by NowTime desc");
        DataList1.DataSource = region2;
        DataList1.DataBind();


//        if (Session["UserID"] == null )
//        {
//            Response.Redirect("~/Default.aspx");
//        }
//        string MunicipalId = ""; string MunicipalName = "";
//        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID="+ Session["UserID"].ToString()); 
//        if (Municipal != null)
//        {
//            MunicipalId = Municipal["MunicipalID"].ToString();
//            MunicipalName = Municipal["MunicipalName"].ToString();
//        }
//        DataTable region2 = klas.getdatatable(@"select 
//case 
//when Individual_Legal=1 then SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end
//when Individual_Legal=2 then CompanyName
//end as Name,
//YVOK,VOEN,TaxpayerID from Taxpayer  where Individual_Legal=" + lblindividuallegal.Text + " and Fordelete=1 and MunicipalID=" + MunicipalId + " order by NowTime desc");
//        DataList1.DataSource = region2;
//        DataList1.DataBind();
    }
    protected void btnaxtar_Click(object sender, EventArgs e)
    {
        Session["yvoksearch"] = txtyvok.Text.Trim();
        Session["Soyadsearch"] = txtsoyad.Text.Trim();
        Session["adsearch"] = txtad.Text.Trim();
        Session["ataadisearch"] = txtataadi.Text.Trim();
        Session["ActualAdress"] = txtunvan.Text.Trim();
        vizual("");
    }
}
