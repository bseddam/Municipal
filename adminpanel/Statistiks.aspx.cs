using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class adminpanel_Statistiks : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; 
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            if (Session["UserID1"] == null)
            {
                Response.Redirect("EntryAdmin.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
            rayon();
            municipal();
          //  vizual();
        }
    }
    void vizual()
    {
        if (Session["UserID1"] == null)
        {
            Response.Redirect("EntryAdmin.aspx");
        }
        string MunicipalId = ""; string ray = " "; 
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

        lblrayon.Text = klas.getdatacell(@"select  
count( distinct lr.RegionsID) from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + MunicipalId + ray + "");

        lblbel.Text = klas.getdatacell(@" select  
count (distinct lcm.MunicipalID) from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + MunicipalId + ray + "");

        fiz.Text = klas.getdatacell(@" select  count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Individual_Legal=1  " + MunicipalId + ray + "");

        huq.Text = klas.getdatacell(@" select  count(*) sayhuquqi  from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Individual_Legal=2 " + MunicipalId + ray + "");

        guzeshtli.Text = klas.getdatacell(@"select  Count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Concession=2  and t1.Individual_Legal=1   " + MunicipalId + ray + "");

        guzeshtsiz.Text = klas.getdatacell(@"select  Count(*) sayfiziki from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) and t1.Concession=1   " + MunicipalId + ray + "");



        cem.Text = klas.getdatacell(@" select  Count(*) cem from Taxpayer t1 
inner join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1 and (t1.fordelete=1 or t1.fordelete is null) " + MunicipalId + ray + "");





        DataTable dt = klas.getdatatable(@"select  case when lr.CityID=2 then lr.Name+N' rayonu' when CityID=1 then lr.Name+N' şəhəri' end as RegionName,lcm.MunicipalName,
lr.RegionsID,lcm.MunicipalID,
SUM(case when t1.Individual_Legal=1 and  (t1.fordelete=1 or t1.fordelete is null)  then 1 else 0 end) sayfiziki,
SUM(case when t1.Individual_Legal=2 and  (t1.fordelete=1 or t1.fordelete is null)  then 1 else 0 end) sayhuquqi,
SUM(case when t1.Concession=2 and (t1.fordelete=1 or t1.fordelete is null) then 1 else 0 end) guzeshtli,
SUM(case when t1.Concession=1 and (t1.fordelete=1 or t1.fordelete is null) then 1 else 0 end) guzeshtsiz,
SUM(case when t1.Individual_Legal=1 and  (t1.fordelete=1 or t1.fordelete is null) then 1 else 0 end)+
SUM(case when t1.Individual_Legal=2 and  (t1.fordelete=1 or t1.fordelete is null)  then 1 else 0 end) cem from Taxpayer t1 
right join List_classification_Municipal lcm on t1.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
where 1=1  " + MunicipalId + ray 
  + " group by lr.CityID,lr.Name,lr.RegionsID,lcm.MunicipalID,lcm.MunicipalName order by lr.Name,lcm.MunicipalName");
      
        Repeater1.DataSource = dt;
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
  
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void axtar_Click(object sender, EventArgs e)
    {
        vizual();
    }
}