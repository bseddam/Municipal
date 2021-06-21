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

public partial class Users_Project : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; 
  
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
            TaxpayerID.Value = "";
            int k = 0;
            int vaxt =int.Parse(klas.getdatacell("select year(getdate()) vaxt "));
            for (var i = vaxt; i >= vaxt - 4; i--)
            {
                cmbil.Items.Insert(k, new ListEditItem("" + i + ""));
                k++;
            }
            cmbil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
            cmbil.SelectedIndex = 0;

            cmbyarimil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
            cmbyarimil.Items.Insert(1, new ListEditItem("1", "1"));
            cmbyarimil.Items.Insert(2, new ListEditItem("2", "2"));
            cmbyarimil.Items.Insert(3, new ListEditItem("3", "3"));
            cmbyarimil.Items.Insert(4, new ListEditItem("4", "4"));
            cmbyarimil.Items.Insert(5, new ListEditItem("5", "5"));
            cmbyarimil.Items.Insert(6, new ListEditItem("6", "6"));
            cmbyarimil.Items.Insert(7, new ListEditItem("7", "7"));
            cmbyarimil.Items.Insert(8, new ListEditItem("8", "8"));
            cmbyarimil.Items.Insert(9, new ListEditItem("9", "9"));
            cmbyarimil.Items.Insert(10, new ListEditItem("10", "10"));
            cmbyarimil.Items.Insert(11, new ListEditItem("11", "11"));
            cmbyarimil.Items.Insert(12, new ListEditItem("12", "12"));
            cmbyarimil.SelectedIndex = 0;
            sahe();


            

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
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select ExpensesYear from ExpensesProject Where ExpensesID=" + TaxpayerID.Value + @") 
            and UserID=" + Session["UserID"].ToString());
            if (icazever != null)
            {
                icaze = icazever["Icaze"].ToString();
            }

            if (icaze == "1")
            {

                DataRow drxerc = klas.GetDataRow("SELECT * from ExpensesProject where ExpensesID=" + TaxpayerID.Value);
                if (drxerc["ExpensesAreaID"].ToString() != "0")
                {
                    cmbsahe.Value = drxerc["ExpensesAreaID"].ToString();
                }
                else
                {
                    cmbsahe.Text = drxerc["ExpensesAreaName"].ToString();
                }


                tesviri.Text = drxerc["NoteText"].ToString();
                mebleg.Text = drxerc["Amount"].ToString();
                cmbil.Value = drxerc["ExpensesYear"].ToString();
                cmbyarimil.Value = drxerc["ExpensesHalfYear"].ToString();
                lblBilgi.Text = "";
            }
            else
            {
                lblBilgi.ForeColor = Color.Red;
                lblBilgi.Text = "Admin tərəfindən icazə verilmir.";
            }

        }
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        string lahiye = (sender as LinkButton).CommandArgument.ToString();

        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select ExpensesYear from ExpensesProject Where ExpensesID=" + lahiye + @") 
            and UserID=" + Session["UserID"].ToString());
        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }

        if (icaze == "1")
        {

            klas.cmd("Delete from ExpensesProject Where ExpensesID=" + lahiye);
            vizual();
            lblBilgi.Text = "";
        }
        else
        {
            lblBilgi.ForeColor = Color.Red;
            lblBilgi.Text = "Admin tərəfindən icazə verilmir.";
        }
    }
    void vizual()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; 
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from 
Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID 
Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }
        DataTable region2 = klas.getdatatable(@"select * from ExpensesProject where 
MunicipalID=" + MunicipalId + " and ExpensesType=2 order by NowTime desc");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();
    }
    void sahe()
    {
        DataTable region2 = klas.getdatatable(@"select ClassifID,ClassifName from 
List_classifications where ListID=9  order by sort");
        cmbsahe.TextField = "ClassifName";
        cmbsahe.ValueField = "ClassifID";
        cmbsahe.DataSource = region2;
        cmbsahe.DataBind();
        cmbsahe.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbsahe.SelectedIndex = 0;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string sa = "0";
        if (cmbsahe.SelectedItem != null)
        {
            sa = cmbsahe.SelectedItem.Value.ToString();
        }


        string sa2 = "0";
        if (cmbyarimil.SelectedItem != null)
        {
            sa2 = cmbyarimil.SelectedItem.Value.ToString();
        }
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID 
from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID 
Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }


        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join 
List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where year(getdate())>" 
+ cmbil.SelectedItem.Value.ToString() + " and UserID=" + Session["UserID"].ToString());

        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }
        if (icaze == "1")
        {
            if (string.IsNullOrEmpty(TaxpayerID.Value))
            {

                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into ExpensesProject (MunicipalID,ExpensesAreaID,ExpensesAreaName,
NoteText,Amount,ExpensesYear,ExpensesHalfYear,ExpensesType) values 
(@MunicipalID,@ExpensesAreaID,@ExpensesAreaName,@NoteText,@Amount,@ExpensesYear,@ExpensesHalfYear,@ExpensesType)", baglan);
                cmd.Parameters.AddWithValue("MunicipalID", MunicipalId);
                cmd.Parameters.AddWithValue("ExpensesAreaID", sa);
                cmd.Parameters.AddWithValue("ExpensesAreaName", cmbsahe.Text);
                cmd.Parameters.AddWithValue("NoteText", tesviri.Text);
                cmd.Parameters.AddWithValue("Amount", mebleg.Text);
                cmd.Parameters.AddWithValue("ExpensesYear", cmbil.Text);
                cmd.Parameters.AddWithValue("ExpensesHalfYear", sa2);
                cmd.Parameters.AddWithValue("ExpensesType", 2);
                cmd.ExecuteNonQuery();

                vizual();
                TaxpayerID.Value = "";
                Response.Redirect(prevPage);

            }
            else
            {




                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update ExpensesProject set  ExpensesAreaID=@ExpensesAreaID,ExpensesAreaName=@ExpensesAreaName,

NoteText=@NoteText,Amount=@Amount,ExpensesYear=@ExpensesYear,ExpensesHalfYear=@ExpensesHalfYear,UpdateDate=@UpdateDate 
where ExpensesID=" + TaxpayerID.Value, baglan);

                cmd.Parameters.AddWithValue("ExpensesAreaID", sa);
                cmd.Parameters.AddWithValue("ExpensesAreaName", cmbsahe.Text);
                cmd.Parameters.AddWithValue("NoteText", tesviri.Text);
                cmd.Parameters.AddWithValue("Amount", mebleg.Text);
                cmd.Parameters.AddWithValue("ExpensesYear", cmbil.Text);
                cmd.Parameters.AddWithValue("ExpensesHalfYear", sa2);
                string vaxt = klas.getdatacell("select getdate() as indikivaxt");
                cmd.Parameters.AddWithValue("UpdateDate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
                cmd.ExecuteNonQuery();
                vizual();
                TaxpayerID.Value = "";
                Response.Redirect("Project.aspx");

            }

        }
        else
        {
            lblBilgi.ForeColor = Color.Red;
            lblBilgi.Text = "Admin tərəfindən icazə verilmir.";
        }
    }
  
}