using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepage : System.Web.UI.Page
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
 
                  
            }
            
        }
    }
    protected int kdd=0;
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

    void kk()
    {
        string s = " ", f = " ", k = " "; string ray = " "; string fizhuq = " "; string fizhuq1 = " "; string fizhuq2 = " ";
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



        lb1.Font.Underline = false;
        lb2.Font.Underline = false;
        lb3.Font.Underline = false;
        lb4.Font.Underline = false;
        lb5.Font.Underline = false;
        lb6.Font.Underline = false;
        lb7.Font.Underline = false;


        int gelenx=1;
        if (Session["x"] != null)
        {
            gelenx = int.Parse(Session["x"].ToString());
        }


        if (gelenx == 1)
        {
            lb6.Enabled = false;
        }
        else {
            lb6.Enabled = true;
        }

        if (gelenx > 3)
        {
            lb1.Text = (gelenx - 2).ToString();
            lb2.Text = (gelenx - 1).ToString();
            lb3.Text = (gelenx).ToString();
            lb4.Text = (gelenx + 1).ToString();
            lb5.Text = (gelenx + 2).ToString();
        }
        else if (gelenx == 3)
        {
            lb1.Text = "1";
            lb2.Text = "2";
            lb3.Text = "3";
            lb4.Text = "4";
            lb5.Text = "5";
        }
        else if (gelenx == 2)
        {
            lb1.Text = "1";
            lb2.Text = "2";
            lb3.Text = "3";
            lb4.Text = "4";
            lb5.Text = "5";
            lb2.Font.Underline = true;
        }
        else if (gelenx == 1)
        {
            lb1.Text = "1";
            lb2.Text = "2";
            lb3.Text = "3";
            lb4.Text = "4";
            lb5.Text = "5";
            lb1.Font.Underline = true;
        }
        if (gelenx > 2)
        {
            lb3.Font.Underline = true;
        }

        int setrsayi =klas.ConvertInt(klas.getdatacell(@"select count(TaxpayerID) from Taxpayer where Fordelete=1"));

        int sehifelemek = 1000;
        if (setrsayi > gelenx * sehifelemek - sehifelemek)
        {

            if (setrsayi < gelenx * sehifelemek)
            {
                sehifelemek = sehifelemek - (sehifelemek * gelenx - setrsayi);
            }



            DataTable dt = klas.getdatatable(@"select * from (select top " + sehifelemek + " * from (Select top " +
                klas.ConvertString(sehifelemek * gelenx) + " t1.SName+' '+t1.Name+' '+t1.FName as fullname," +
    " t1.YVOK,t1.ActualAdress,'mobil: '+t1.Mobiltel+N'; iş: '+t1.Workltel+'; ev: '+t1.Hometel telefon," +
    " case when t1.Concession=1 then N'Yox' else N'hə' end Guzesht," +
    " convert(nvarchar,t1.RegistrPetitondate,104) RegistrPetitondate, t1.TaxpayerID,t1.MunicipalID,lcm.MunicipalName,case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName  from Taxpayer t1 " +
    " inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID " +
    " inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID where 1=1 and t1.Fordelete=1 " + s + ray + fizhuq +
    "  order by t1.TaxpayerID desc) as c order by TaxpayerID ) as cc order by TaxpayerID desc");
           
            DataListBaza.DataSource = dt;
            DataListBaza.DataBind();



            DataTable dt1 = klas.getdatatable(@"Select count(TaxpayerID) say,N'Yox: '+Convert(nvarchar,(Select count(TaxpayerID) cem from Taxpayer t1 inner join List_classification_Municipal lcm 
on t1.MunicipalID=lcm.MunicipalID where Concession=1 and t1.Fordelete=1 " + s + ray + fizhuq + ")) +'<br />'+  N'Hə: '+Convert(nvarchar,(Select count(TaxpayerID) cem from Taxpayer t2 " +
    " inner join List_classification_Municipal lcm on t2.MunicipalID=lcm.MunicipalID where Concession=2 and t2.Fordelete=1 " + f + ray + fizhuq1 + ")) heyox  from Taxpayer t " +
    " inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1  and t.Fordelete=1 " + k + ray + fizhuq2);
            
            DataListCem.DataSource = dt1;
            DataListCem.DataBind();
        }
        else
        {
            DataListBaza.DataSource = null;
            DataListBaza.DataBind();

            DataListCem.DataSource = null;
            DataListCem.DataBind();
        }
    }

    protected void lb1_Click(object sender, EventArgs e)
    {

        Session["x"] = int.Parse(lb1.Text);
        kk();

    }
    protected void lb2_Click(object sender, EventArgs e)
    {
        Session["x"] = int.Parse(lb2.Text);
        kk();

    }
    protected void lb3_Click(object sender, EventArgs e)
    {
        Session["x"] = int.Parse(lb3.Text);
        kk();

    }
    protected void lb4_Click(object sender, EventArgs e)
    {
        Session["x"] = int.Parse(lb4.Text);
        kk();

    }
    protected void lb5_Click(object sender, EventArgs e)
    {
        Session["x"] = int.Parse(lb5.Text);
        kk();

    }
    protected void lb6_Click(object sender, EventArgs e)
    {
        int oxlar = int.Parse(Session["x"].ToString());
        oxlar--;
        Session["x"] = oxlar;
        kk();

    }
    protected void lb7_Click(object sender, EventArgs e)
    {
        int oxlar = int.Parse(Session["x"].ToString());
        oxlar++;
        Session["x"] = oxlar;
        kk();
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void btnhesab_Click(object sender, EventArgs e)
    {
        naviqasiya.Visible = true;
        Session["x"] = 1;
        kk();

    }
}