using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using System.IO;
using System.Drawing;

public partial class Users_Dotation : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; string islem; string DotationType;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DotationType = Request.QueryString["DotationType"];
            if (DotationType == "3") 
            {
                btnsave.Enabled = false;
            }
            //islem = Request.QueryString["islem"];
        }
        catch (Exception)
        { }
        if (!Page.IsPostBack)
        {
            TaxpayerID.Value = "";
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
        }
        vizual();
    }
    protected void repeattaxpayer(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "duzelis")
        {
            TaxpayerID.Value = e.CommandArgument.ToString();
            
            string icaze = "1";
            DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select year(DotationGiveDate) from Dotation Where DotationID=" + TaxpayerID.Value + @") 
            and UserID=" + Session["UserID"].ToString());
            if (icazever != null)
            {
                icaze = icazever["Icaze"].ToString();
            }

            if (icaze == "1")
            {
                
                DataRow drxerc = klas.GetDataRow("SELECT * from Dotation where  DotationID=" + TaxpayerID.Value);
                tesviri.Text = drxerc["DotationName"].ToString();
                mebleg.Text = drxerc["Amount"].ToString();
                dotvertarix.Date = Convert.ToDateTime(drxerc["DotationGiveDate"].ToString()).Date;
                msg.Text = "";
            }

            else
            {
                msg.ForeColor = Color.Red;
                msg.Text = "Admin tərəfindən icazə verilmir.";
            }
        }
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        string TaxpayerID1 = (sender as LinkButton).CommandArgument.ToString();   
        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select year(DotationGiveDate) from Dotation Where DotationID=" + TaxpayerID1 + @") 
            and UserID=" + Session["UserID"].ToString());
        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }

        if (icaze == "1")
        {
            klas.cmd("Delete from Dotation Where DotationID=" + TaxpayerID1);
            vizual();
            msg.Text = "";
        }
        else
        {
            msg.ForeColor = Color.Red;
            msg.Text = "Admin tərəfindən icazə verilmir.";
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }




        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>" + dotvertarix.Date.Year + " and UserID=" + Session["UserID"].ToString());

        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }

        if (icaze == "1")
        {

            if (string.IsNullOrEmpty(TaxpayerID.Value) && DotationType != null && DotationType != "")
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into Dotation (MunicipalID,DotationName,Amount,Dotationtype,DotationGiveDate) values 
(@MunicipalID,@DotationName,@Amount,@Dotationtype,@DotationGiveDate)", baglan);
                cmd.Parameters.Add("MunicipalID", MunicipalId);
                cmd.Parameters.Add("DotationName", tesviri.Text);
                cmd.Parameters.Add("Amount", mebleg.Text);
                cmd.Parameters.Add("Dotationtype", DotationType);

                if (dotvertarix.Text == "")
                {
                    cmd.Parameters.Add("DotationGiveDate", dotvertarix.Text);
                }
                else
                {
                    cmd.Parameters.Add("DotationGiveDate", dotvertarix.Date);
                }

                cmd.ExecuteNonQuery();

                TaxpayerID.Value = "";
                vizual();
                Response.Redirect("Dotation.aspx?DotationType=" + DotationType);
            }
            else
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update Dotation set  DotationName=@DotationName,Amount=@Amount,
DotationGiveDate=@DotationGiveDate where DotationID=" + TaxpayerID.Value, baglan);
                cmd.Parameters.Add("DotationName", tesviri.Text);
                cmd.Parameters.Add("Amount", mebleg.Text);
                if (dotvertarix.Text == "")
                {
                    cmd.Parameters.Add("DotationGiveDate", dotvertarix.Text);
                }
                else
                {
                    cmd.Parameters.Add("DotationGiveDate", dotvertarix.Date);
                }

                cmd.ExecuteNonQuery();


                TaxpayerID.Value = "";
                vizual();

                //clearcomponenet();
                //islem = "";
                Response.Redirect("Dotation.aspx?DotationType=" + DotationType);
            }
        }

        else
        {
            msg.ForeColor = Color.Red;
            msg.Text = "Admin tərəfindən icazə verilmir.";
        }
    }
    void vizual()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }
        if (DotationType == "1")
        {
            lbltype.Text = "Dotasiyanın verilmə tarixi";
            lbltype0.Text = "Dotasiyanın verilmə tarixi";
        }
        else  if (DotationType == "2")
        {
            lbltype.Text = "İanənin verilmə tarixi";
            lbltype0.Text = "İanənin verilmə tarixi";
        }
        else if (DotationType == "3")
        {
            lbltype.Text = "Digər gəlirin tarixi";
            lbltype0.Text = "Digər gəlirin tarixi";
        }


        DataTable region2 = klas.getdatatable(@"select * from Dotation where Dotationtype=" + DotationType +
            " and  MunicipalID=" + MunicipalId + "  and ExitDate is null order by NowTime desc");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();
        
    }
}