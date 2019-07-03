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
            selectpeymants();
            
        }
    }
    protected void selectpeymants()
    {
        if (Session["UserID"] != null)
        {
            string MunicipalId = ""; string MunicipalName = ""; string odeniw = " ";
            DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
            if (Municipal != null)
            {
                MunicipalId = Municipal["MunicipalID"].ToString();
                MunicipalName = Municipal["MunicipalName"].ToString();
            }

            if (ddlodeniw.SelectedValue == "-1" || ddlodeniw.SelectedValue == "" || ddlodeniw.SelectedValue == null)
            {
                odeniw = "  ";
            }
            else
            {
                odeniw = " and vpb.id=" + ddlodeniw.SelectedValue;
            }
            DataTable dt = klas.getdatatable(@"select '0' sn,N'  Cəmi ' fullname,'' YVOK, '' nametype,'' id,cast(sum(Mebleg) as numeric(15,2)) Mebleg, '01.01.'+CAST((YEAR(getdate())+1) as varchar) Tarix from ViewPaymentBaza vpb 
  where 1=1 and vpb.MunicipalID=" + MunicipalId + odeniw +
    " union  select '1' sn, fullname,YVOK,nametype,id,cast(Mebleg as numeric(15,2)) Mebleg,Tarix from ViewPaymentBaza vpb " +
    "  where 1=1 and vpb.MunicipalID=" + MunicipalId + odeniw + " order by sn,fullname");
            GridView1.DataSource = dt;
            GridView1.DataBind();

          
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        selectpeymants();
    }

    protected void ddlodeniw_SelectedIndexChanged(object sender, EventArgs e)
    {
        selectpeymants();
    }
}