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
        //
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                string MunicipalId = ""; string MunicipalName = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();
                    MunicipalName = Municipal["MunicipalName"].ToString();
                }
                if (MunicipalId != "")
                {
                    DataTable dt = new DataTable();
                    string sqlstring = @"Select ROW_NUMBER() over(order by t.SName+' '+t.Name+' '+t.FName+' '+ case when t.Gender=1 then N'oğlu' else N'Qızı' end,n,sn) sn1,'' sn2,
 t.TaxpayerID,t.SName+' '+t.Name+' '+t.FName+' '+ case when t.Gender=1 then N'oğlu' else N'Qızı' end fullname, t.YVOK,b.*
from Taxpayer t  left join viewbldbaza b on t.TaxpayerID=b.TaxpayerID where t.MunicipalID=" + MunicipalId;
                    SqlDataAdapter dap = new SqlDataAdapter(sqlstring, klas.baglan());
                    dap.SelectCommand.CommandTimeout = 180;
                    dap.Fill(dt);
                    dt = klas.tekrarlamax2("fullname", "YVOK", "N", dt);
                    DataListBaza.DataSource = dt;
                    DataListBaza.DataBind();
                }
            }
        }
    }

    protected void btnGiris_Click(object sender, EventArgs e)
    {

    }
    protected void OnMenuItemDataBound(object sender, MenuEventArgs e)
    {
        if (SiteMap.CurrentNode != null)
        {
            if (e.Item.Text == SiteMap.CurrentNode.Title)
            {
                if (e.Item.Parent != null)
                {
                    e.Item.Parent.Selected = true;
                }
                else
                {
                    e.Item.Selected = true;
                }
            }
        }
    }
}