using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;

public partial class Users_MembershipFees : System.Web.UI.Page
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

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();

            int k = 0;
            string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
            for (var i = int.Parse(vaxt); i >= int.Parse(vaxt) - 3; i--)
            {
                cmbil.Items.Insert(k, new ListEditItem("" + i + ""));
                k++;
            }
            cmbil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
            cmbil.SelectedIndex = 0;





            if (islem == "duzelis")
            {


                DataRow drxerc = klas.GetDataRow("SELECT * from MembershipFees where MembershipFeesID=" + TaxpayerID);
                if (drxerc != null)
                {
                    ehalininsayi.Text = drxerc["RemainingDebt"].ToString();
                    mebleg.Text = drxerc["Amount"].ToString();
                    cmbil.Value = drxerc["MembershipFeesYear"].ToString(); ;
                }
            }

        }
        vizual();
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        string TaxpayerID = (sender as LinkButton).CommandArgument.ToString();
        klas.cmd("Delete from MembershipFees Where MembershipFeesID=" + TaxpayerID);
        vizual();
    }
    void vizual()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u 
inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }

        DataTable region2 = klas.getdatatable(@"select * from MembershipFees where  MunicipalID=" + MunicipalId + "  order by NowTime desc");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();
        
    }
   
    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u 
inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }

        if (islem != "duzelis")
        {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into MembershipFees (MunicipalID,RemainingDebt,Amount,MembershipFeesYear) 
values (@MunicipalID,@RemainingDebt,@Amount,@MembershipFeesYear)", baglan);
                cmd.Parameters.Add("MunicipalID", MunicipalId);
                cmd.Parameters.Add("RemainingDebt", ehalininsayi.Text);
                cmd.Parameters.Add("Amount", mebleg.Text);
                cmd.Parameters.Add("MembershipFeesYear", cmbil.Text);
                cmd.ExecuteNonQuery();


            vizual();
            Response.Redirect(prevPage);

        }
        else
        {

                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update MembershipFees set  RemainingDebt=@RemainingDebt,Amount=@Amount,
MembershipFeesYear=@MembershipFeesYear,UpdateDate=getdate()   where MembershipFeesID=" + TaxpayerID, baglan);
                cmd.Parameters.Add("RemainingDebt", ehalininsayi.Text);
                cmd.Parameters.Add("Amount", mebleg.Text);
                cmd.Parameters.Add("MembershipFeesYear", cmbil.Text);
                cmd.ExecuteNonQuery();
                vizual();
                //clearcomponenet();
                //islem = "";
                Response.Redirect("MembershipFees.aspx");
            

        }

    }

}