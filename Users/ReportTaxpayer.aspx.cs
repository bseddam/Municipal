using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage43 : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
        }
    }



    void kk()
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

              
                string  fizhuq = " ", fizhuq1 = " ", fizhuq2 = " ", yvok = " ", yvok1 = " ", yvok2 = " ", ad = " "
            , ad1 = " ", ad2 = " ", soyad = " ", soyad1 = " ", soyad2 = " ", ataadi = " ", ataadi1 = " ", ataadi2 = " ";



                if (ddlfizhuq.SelectedValue == "-1" || ddlfizhuq.SelectedValue == "" || ddlfizhuq.SelectedValue == null)
                {
                    fizhuq = "  ";
                    fizhuq1 = "  ";
                    fizhuq2 = "  ";
                }
                else
                {
                    fizhuq = " and t1.Individual_Legal=" + ddlfizhuq.SelectedValue;
                    fizhuq1 = " and t2.Individual_Legal=" + ddlfizhuq.SelectedValue;
                    fizhuq2 = " and t.Individual_Legal=" + ddlfizhuq.SelectedValue;
                }
                if (txtyvok.Text == " " || txtyvok.Text == "" || txtyvok.Text == null)
                {
                    yvok = "  ";
                    yvok1 = "  ";
                    yvok2 = "  ";
                }
                else
                {
                    yvok = "  and t1.YVOK like '%" + txtyvok.Text + "%'";
                    yvok1 = "  and t2.YVOK like '%" + txtyvok.Text + "%'";
                    yvok2 = "  and t.YVOK like '%" + txtyvok.Text + "%'";
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
                string unvan = "  ";
                string unvan1 = "  ";
                string unvan2 = "  ";
                if (txtunvan.Text == "" || txtunvan.Text == null)
                {
                    unvan = "  ";
                    unvan1 = "  ";
                    unvan2 = "  ";
                }
                else
                {
                    unvan = " and t1.ActualAdress like N'%" + txtunvan.Text + "%'";
                    unvan1 = " and t2.ActualAdress like N'%" + txtunvan.Text + "%'";
                    unvan2 = " and t.ActualAdress like N'%" + txtunvan.Text+"%'";
                }

                DataTable dt = klas.getdatatable(@"Select '' TaxpayerID,'0' sn,'' RegionName ,'' MunicipalName,convert(nvarchar(50),count(TaxpayerID)) fullname,N'Yox: '+Convert(nvarchar(50),(Select count(TaxpayerID) cem from Taxpayer t1 inner join List_classification_Municipal lcm 
on t1.MunicipalID=lcm.MunicipalID where Concession=1 and t1.Fordelete<>0  and t1.MunicipalID="+MunicipalId + fizhuq + yvok + ad + soyad + ataadi+unvan + ")) +' '+  N'Hə: '+Convert(nvarchar(50),(Select count(TaxpayerID) cem from Taxpayer t2 " +
        " inner join List_classification_Municipal lcm on t2.MunicipalID=lcm.MunicipalID where Concession=2 and t2.Fordelete<>0 and t2.MunicipalID=" + MunicipalId + fizhuq1 + yvok1 + ad1 + soyad1 + ataadi1 + unvan1 +")) Guzesht  , '' ActualAdress,'' telefon,'' YVOK ,'' RegistrPetitondate  from Taxpayer t " +
        " inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1  and t.Fordelete<>0 and t.MunicipalID=" + MunicipalId + fizhuq2 + yvok2 + ad2 + soyad2 + ataadi2 + unvan2 +
        " union Select convert(nvarchar(20),TaxpayerID),'1' sn, " +
        " case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName,lcm.MunicipalName," +
        " t1.SName+' '+t1.Name+' '+t1.FName as fullname, " +
        " case when t1.Concession=1 then N'Yox' else N'Hə' end Guzesht,t1.ActualAdress,'mobil: '+t1.Mobiltel+N'; iş: '+t1.Workltel+'; ev: '+t1.Hometel telefon, " +
        " t1.YVOK, " +
        "   convert(nvarchar(15),t1.RegistrPetitondate,104) RegistrPetitondate  from Taxpayer t1 " +
        " inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID " +
        " inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " +
        "  where 1=1 and t1.Fordelete<>0 and t1.MunicipalID=" + MunicipalId + fizhuq + yvok + ad + soyad + ataadi+unvan + " order by sn,fullname");

                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
        }
    }



    protected void btnhesab_Click(object sender, EventArgs e)
    {
        kk();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        kk();
    }
}