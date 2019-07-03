using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class adminpanel_UsedSystem : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; string islem; string TaxpayerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TaxpayerID = Request.QueryString["TaxpayerID"];
            islem = Request.QueryString["islem"];
        }
        catch (Exception)
        { }
        if (!Page.IsPostBack)
        {

            if (Session["UserID1"] == null)
            {
                Response.Redirect("EntryAdmin.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
            rayon();
            municipal();
            trx();
            vizual();
        }
    }
    void vizual()
    {
        if (Session["UserID1"] == null)
        {
            Response.Redirect("EntryAdmin.aspx");
        }
        string MunicipalId = ""; string ray = " "; string tarix;
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
        }
        else
        {
            MunicipalId = " and lcm.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }

        if (ddltarix.SelectedValue == "-1" || ddltarix.SelectedValue == "" || ddltarix.SelectedValue == null)
        {
            tarix = "  ";
        }
        else if (ddltarix.SelectedItem.ToString() == "Sistemə daxil olmayıb")
        {
            tarix = " and UsedSistem is null";
        }
        else
        {
            tarix = " and convert(nvarchar(10), UsedSistem, 104)='" + ddltarix.SelectedItem + "'";
        }
        DataTable region2 = klas.getdatatable(@"select case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName ,lcm.MunicipalName,Uname,
Passvord,u.UserID,lcm.MunicipalID,SName +' '+ u.Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name,VPN_IP ,
u.UsedSistem
 from Users u inner join List_classification_Municipal lcm on u.MunicipalID=lcm.MunicipalID
 inner join List_classification_Regions lr on lr.RegionsID=lcm.RegionID
 where 1=1 " + MunicipalId + ray + tarix + " order by RegionName,MunicipalName");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();

    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable(@"select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable(@"select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    void trx()
    {
        DataTable region2 = klas.getdatatable(@"select 
case when trx1 is null then N'Sistemə daxil olmayıb' else trx1 end trx1,trx from (
select distinct convert(date, UsedSistem) trx,convert(nvarchar(10), UsedSistem, 104) trx1  from Users 
) as c where 1=1 order by trx desc");
        ddltarix.DataTextField = "trx1";
        ddltarix.DataValueField = "trx1";
        ddltarix.DataSource = region2;
        ddltarix.DataBind();
        ddltarix.Items.Insert(0, new ListItem("Ümumi", "-1"));
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void axtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
}