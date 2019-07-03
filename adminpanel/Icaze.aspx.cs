using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_Icaze : System.Web.UI.Page
{
    Class2 klas = new Class2(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            //vizual();
        }
    }
    void rayon()
    {
        DataTable region2 = klas.getdatatable(@"select RegionsID,case when CityID = 2 then Name + ' ' + 'rayonu' 
when CityID = 1 THEN Name + ' ' + N'şəhəri' end as Name from List_classification_Regions where ForDelete=1 order by Name");
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
        ddlrayon.SelectedValue.ToString();
        ddlbelediyye.SelectedValue.ToString();

        string rayon, belediyye,icaze;
        if (ddlrayon.SelectedValue == "-1")
        {
            rayon = " ";
        }
        else 
        {
            rayon = " and RegionID=" + ddlrayon.SelectedValue;
        }
        if (ddlbelediyye.SelectedValue == "-1")
        {
            belediyye = " ";
        }
        else
        {
            belediyye = " and MunicipalID=" + ddlbelediyye.SelectedValue;
        }


        SqlConnection baglan = klas.baglan();
        SqlCommand cmd = new SqlCommand(@"Update List_classification_Municipal set  Icaze=@Icaze where 1=1 "+rayon+belediyye, baglan);
        cmd.Parameters.Add("Icaze",ddlicaze.SelectedValue);
        cmd.ExecuteNonQuery();
        Class2.MsgBox("Əməliyyat yerinə yetirildi.", Page);
    }
}