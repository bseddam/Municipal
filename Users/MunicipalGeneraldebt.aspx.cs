using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Users_Homepage : System.Web.UI.Page
{
    Class2 klas = new Class2();
    string MunicipalId = ""; string MunicipalName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                xx();
                //selectTaxesObject();
            }
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

        }
    }
    void xx()
    {
        DataTable dtiller = klas.getdatatable(@"select distinct txl.TaxesPaymentID,case when txl.TaxesPaymentID in(1,3,6) then N'Əmlak vergisi' when txl.TaxesPaymentID in(2,4,5) then N'Torpaq vergisi' else  
TaxesPaymentTypeName end TaxesPaymentTypeName
 from Taxpayer t inner join Payments p on t.TaxpayerID=p.TaxpayerID
                                           inner join TaxesPaymentList txl on txl.TaxesPaymentID=p.TaxesPaymentID");
        vergiadi.DataTextField = "TaxesPaymentTypeName";
        vergiadi.DataValueField = "TaxesPaymentID";
        vergiadi.DataSource = dtiller;
        vergiadi.DataBind();
        vergiadi.Items.Insert(0, new ListItem("Ümumi", "-1"));
        vergiadi.SelectedValue = "-1";
    }


    protected void selectTaxesObject()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

        string odeniwnov = " ";

        if (vergiadi.SelectedValue == "-1" || vergiadi.SelectedValue == "" || vergiadi.SelectedValue == null)
        {
            odeniwnov = "  ";
        }
        else
        {
            odeniwnov = " and TaxesPaymentID=" + vergiadi.SelectedValue;
        }

        string unvan = " ";

        if (txtunvan.Text == "" || txtunvan.Text == null)
        {
            unvan = "  ";
        }
        else
        {
            unvan = " and ActualAdress like N'%" + txtunvan.Text+"%'";
        }


        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u 
inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }
        if (MunicipalId != "")
        {

            DataTable dt = klas.getdatatable(@"Select '0' sn,N'Cəmi' fullname,'' YVOK,'' Mobiltel, cast(sum(Payment) as numeric(18,2))  Payment,
'' TaxesPaymentTypeName, '' ActualAdress from viewdepts where  MunicipalID=" + MunicipalId + odeniwnov+ unvan +
" union   SELECT '1' sn, fullname, YVOK, Mobiltel,  Payment, TaxesPaymentTypeName, ActualAdress FROM   viewdepts  " +
" where MunicipalID=" + MunicipalId + odeniwnov+ unvan + " order by sn,fullname");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        selectTaxesObject();
    }
    protected void Btnhesabat_Click(object sender, EventArgs e)
    {
        selectTaxesObject();
    }
}