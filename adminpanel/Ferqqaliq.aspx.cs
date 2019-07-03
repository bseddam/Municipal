using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminpanel_Ferqqaliq : System.Web.UI.Page
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

        DataTable dt = klas.getdatatable(@"select lr.Name,lcm.MunicipalName,cast(case when lblumumigelir is null then 0 else lblumumigelir end+
case when lbldotasiya is null then 0 else lbldotasiya end +
case when lbliane is null then 0 else lbliane end+
case when lblqaliq0 is null then 0 else lblqaliq0 end - lblumumixerc as numeric(18,2)) yaranmiwqaliq,

cast(case when lblqaliq is null then 0 else lblqaliq end as numeric(18,2)) belediyyeqeydetdiyi,

cast(case when lblumumigelir is null then 0 else lblumumigelir end+
case when lbldotasiya is null then 0 else lbldotasiya end +
case when lbliane is null then 0 else lbliane end+
case when lblqaliq0 is null then 0 else lblqaliq0 end - lblumumixerc -
case when lblqaliq is null then 0 else lblqaliq end as numeric(18,2)) ferq

 from 
IncomeForYear inc inner join List_classification_Municipal lcm on lcm.MunicipalID=inc.MunicipalID
inner  join List_classification_Regions lr on lcm.RegionID=lr.RegionsID order by lr.Name,lcm.MunicipalName");

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }



    protected void btnhesab_Click(object sender, EventArgs e)
    {
        select1();
    }

}