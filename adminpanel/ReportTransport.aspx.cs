using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Users_Homepagefdhsa : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            selectTransport();
        }
    }

   
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }

    protected void selectTransport()
    {
        string MunicipalId = ""; string ray = " ";
        if (ddlbelediyye.SelectedValue == "-1" || ddlbelediyye.SelectedValue == "" || ddlbelediyye.SelectedValue == null)
        {
            MunicipalId = " ";
        }
        else
        {
            MunicipalId = " and t.MunicipalID=" + ddlbelediyye.SelectedValue;
        }
        if (ddlrayon.SelectedValue == "-1" || ddlrayon.SelectedValue == "" || ddlrayon.SelectedValue == null)
        {
            ray = "  ";
        }
        else
        {
            ray = " and lcm.RegionID=" + ddlrayon.SelectedValue;
        }
        DataTable dt1 = klas.getdatatable(@"select '' sn, 
                                           N'Cəmi' fullname, 
                                           '' YVOK,
                                           '' GraduationYear,
                                           '' MotorType,
                                           '' MotorSize,
                                           '' Price,
                                           sum(l.mebleg) mebleg,
                                           '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                    from Taxpayer t inner join viewWaterAirTransport l on t.TaxpayerID=l.TaxpayerID  
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1 and ExitDate is null " + MunicipalId + ray);
        
        DataListCem.DataSource = dt1;
        DataListCem.DataBind();

        //ROW_NUMBER() over(order by t.SName+' '+t.Name+' '+FName)

        DataTable dt = klas.getdatatable(@"select '' sn, 
                                       t.SName+' '+t.Name+' '+t.FName as fullname, 
                                       t.YVOK,
                                       l.GraduationYear,
                                       l.MotorType,
                                       case when l.MotorSize=0 then null else l.MotorSize end MotorSize,
                                       case when l.Price=0 then null else l.Price end Price,
                                       l.mebleg,
                                       '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix            
                                from Taxpayer t inner join viewWaterAirTransport l on t.TaxpayerID=l.TaxpayerID 
inner join List_classification_Municipal lcm on t.MunicipalID=lcm.MunicipalID where 1=1 and ExitDate is null " + MunicipalId + ray);
       
        DataListBaza.DataSource = dt;
        DataListBaza.DataBind();
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
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
    protected void btnhesab_Click(object sender, EventArgs e)
    {
        selectTransport();
    }
}