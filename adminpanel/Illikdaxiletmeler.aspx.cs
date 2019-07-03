using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_Illikdaxiletmeler : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            select1();
        }
    }

    protected void select1()
    {

        DataTable dt = klas.getdatatable(@"select lr.Name,lcm.MunicipalName,inc.* from IncomeForYear inc inner join List_classification_Municipal lcm on inc.MunicipalID=lcm.MunicipalID
inner join List_classification_Regions lr on lr.RegionsID=lcm.RegionID order by lr.Name,lcm.MunicipalName");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }



    protected void btnhesab_Click(object sender, EventArgs e)
    {
        select1();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        select1();
    }
}