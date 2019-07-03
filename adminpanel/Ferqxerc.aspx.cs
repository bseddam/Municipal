using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_Ferqxerc : System.Web.UI.Page
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

        DataTable dt = klas.getdatatable(@"select lr.Name,lcm.MunicipalName,lblumumixerc,tesn.mebleg,cast(lblumumixerc-tesn.mebleg as numeric(18,2)) ferq
--,cast(Sum(lblumumixerc) as numeric(18,2)) mebleg 
from IncomeForYear inc
inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner join List_classification_Regions lr on lcm.RegionID=lr.RegionsID
inner join (select MunicipalID,sum(Amount) mebleg from ExpensesProjectIllik where ExpensesYear=2016 group by MunicipalID) tesn
on lcm.MunicipalID=tesn.MunicipalID
order by lr.Name,lcm.MunicipalName");

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }



    protected void btnhesab_Click(object sender, EventArgs e)
    {
        select1();
    }
   
}