using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepageasdfg : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserID1"] != null)
            {
                rayon();
                municipal();
             //   kk();
                  
            }
            
        }
    }



    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue.ToString() + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void kk() {
        string s = " ", f = " ", k = " ", ray = " ", fizhuq = " ", fizhuq1 = " ", fizhuq2 = " ", yvok = " ", yvok1 = " ", yvok2 = " ",ad=" "
            , ad1 = " ", ad2 = " ", soyad = " ", soyad1 = " ", soyad2 = " ", ataadi = " ", ataadi1 = " ", ataadi2=" ";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            s = " ";
            f = " ";
            k = " ";
        }
        else {
            s = " and t1.MunicipalID=" + ddlbelediyye.SelectedValue;
            f = " and t2.MunicipalID=" + ddlbelediyye.SelectedValue ;
            k = " and t.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }

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


        DataTable dt = klas.getdatatable(@"Select '' TaxpayerID,'0' sn,'' RegionName ,'' MunicipalName,convert(nvarchar(50),count(TaxpayerID)) fullname,N'Yox: '+Convert(nvarchar(50),(Select count(TaxpayerID) cem from Taxpayer t1 inner join List_classification_Municipal lcm 
on t1.MunicipalID=lcm.MunicipalID where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Concession=1   " + s + ray+ fizhuq +yvok +ad+soyad+ataadi + ")) +' '+  N'Hə: '+Convert(nvarchar(50),(Select count(TaxpayerID) cem from Taxpayer t2 " +
" inner join List_classification_Municipal lcm on t2.MunicipalID=lcm.MunicipalID where 1=1 and (t2.fordelete=1 or t2.fordelete is null) and t2.Concession=2  and t2.Individual_Legal=1 " + f + ray + fizhuq1 + yvok1 + ad1 + soyad1 + ataadi1 + ")) Guzesht  , '' ActualAdress,'' telefon,'' YVOK ,'' RegistrPetitondate  from Taxpayer t " +
" inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1 and (t.fordelete=1 or t.fordelete is null) " + k + ray + fizhuq2 + yvok2 + ad2 + soyad2 + ataadi2 +
" union Select convert(nvarchar(20),TaxpayerID),'1' sn, " +
" case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName,lcm.MunicipalName," +
" t1.SName+' '+t1.Name+' '+t1.FName as fullname, " +
" case when t1.Concession=1 then N'Yox' else N'Hə' end Guzesht,t1.ActualAdress,'mobil: '+t1.Mobiltel+N'; iş: '+t1.Workltel+'; ev: '+t1.Hometel telefon, " +
" t1.YVOK, " +
"   convert(nvarchar(15),t1.RegistrPetitondate,104) RegistrPetitondate  from Taxpayer t1 " +
" inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID " +
" inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID " +
"  where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + s + ray + fizhuq +yvok +ad+soyad+ataadi+" order by sn,fullname");

        GridView1.DataSource = dt;
        GridView1.DataBind();

        
    }

    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
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