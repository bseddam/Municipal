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

public partial class Users_Expense : System.Web.UI.Page
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
            xercemekhaqqitr.Visible = false;
            xercumumi.Visible = true;
            pnltbl.Visible = true;

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();

            il();

          //  yarimil();

            sahe();
          

            if (islem == "duzelis")
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
                DataRow drxerc = klas.GetDataRow(@"SELECT * from ExpensesProjectIllik e1 
                inner join ExpensesFundsAllocated e2 on e2.SubID=e1.ExpensesSubAreaID and e2.reportyear=e1.ExpensesYear 
and e1.MunicipalID=e2.MunicipalID where ExpensesID=" + TaxpayerID + " and e1.MunicipalID=" + MunicipalId);

                        xercemekhaqqitr.Visible = false;
                        xercumumi.Visible = true;
                        pnltbl.Visible = true;

                    if (drxerc["ExpensesAreaID"].ToString() != "0")
                    {
                        cmbsahe.Value = drxerc["ExpensesAreaID"].ToString();
                    }
                    else
                    {
                        cmbsahe.Text = drxerc["ExpensesAreaName"].ToString();
                    }
                    xerc();
                    if (drxerc["ExpensesSubAreaID"].ToString() != "0")
                    {
                        cmbxerc.Value = drxerc["ExpensesSubAreaID"].ToString();
                    }
                    else
                    {
                        cmbxerc.Text = drxerc["ExpensesSubAreaName"].ToString();
                    }
                    tesviri.Text = drxerc["NoteText"].ToString();
                    mebleg.Text = drxerc["Amount"].ToString();
                    cmbil.Value = drxerc["ExpensesYear"].ToString();
                    txtAyrilmishVesait.Text = drxerc["FundsAllocated"].ToString();
                    mebleg.Text = drxerc["Amount"].ToString();
                }
            
   
        }
        vizual();
    }
    void il()
    {
        cmbil.Items.Clear();
        int k = 0;
        string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
        for (var i = int.Parse(vaxt); i >= int.Parse(vaxt) - 3; i--)
        {
            cmbil.Items.Insert(k, new ListEditItem("" + i + ""));
            k++;
        }
        cmbil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbil.SelectedIndex = 0;
    }
    void runi()
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
        if (cmbil.SelectedItem.Value != "-1" && cmbxerc.SelectedItem.Value != "-1" && cmbsahe.SelectedItem.Value != "-1")
        {
            DataRow dr = klas.GetDataRow("Select * from ExpensesFundsAllocated where SubId="
                   + cmbxerc.SelectedItem.Value.ToString() + " and ReportYear=" + cmbil.Text + " and MunicipalID=" + MunicipalId);

            if (dr != null)
            {
                txtAyrilmishVesait.Text = dr["FundsAllocated"].ToString();
            }
            else
            {
                txtAyrilmishVesait.Text = "0";
            }
        }
    }
    protected void DeleteRecord(object sender, EventArgs e)
    {
        string TaxpayerID = (sender as LinkButton).CommandArgument.ToString();
        klas.cmd("Delete from ExpensesProjectIllik Where ExpensesID=" + TaxpayerID);
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
        string sa = "0";
        if (cmbxerc.SelectedItem != null)
        {
            sa = cmbxerc.SelectedItem.Value.ToString();
        }

        DataTable region2 = klas.getdatatable(@"select * from ExpensesProjectIllik e1 full outer join ExpensesFundsAllocated e2  
on e2.SubID=e1.ExpensesSubAreaID and e2.reportyear=e1.ExpensesYear 
and e1.MunicipalID=e2.MunicipalID where  e1.MunicipalID=" + MunicipalId + 
    " and e1.ExpensesType=1 and e1.ExpensesTypeSub is null order by NowTime desc");
            Repeater1.DataSource = region2;
            Repeater1.DataBind();
        
    }
    void sahe()
    {
        
        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=300  order by sort");
        cmbsahe.TextField = "ClassifName";
        cmbsahe.ValueField = "ClassifID";
        cmbsahe.DataSource = region2;
        cmbsahe.DataBind();
        cmbsahe.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbsahe.SelectedIndex = 0;
    }
   /* void yarimil()
    {
        cmbyarimil.Items.Clear();
        cmbyarimil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbyarimil.Items.Insert(1, new ListEditItem("I yarım il", "1"));
        cmbyarimil.Items.Insert(2, new ListEditItem("II yarım il", "2"));
        cmbyarimil.SelectedIndex = 0;
        lblyarimilay.Text = "Yarım il";

        xercemekhaqqitr.Visible = false;
        Panel1.Visible = false;
        xercumumi.Visible = true;
        pnltbl.Visible = true;
    }
    void ayliq()
    {
        cmbyarimil.Items.Clear();
        cmbyarimil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        for (var i = 1; i <= 12; i++)
        {
            cmbyarimil.Items.Insert(i, new ListEditItem(i.ToString(), i));
        }
        cmbyarimil.SelectedIndex = 0;
        lblyarimilay.Text = "Ay";

        xercemekhaqqitr.Visible = true;
        Panel1.Visible = true;
        xercumumi.Visible = false;
        pnltbl.Visible = false;
    }
    */

    void xerc()
    {
        string sa="0";
        if (cmbsahe.SelectedItem != null)
        {
            sa = cmbsahe.SelectedItem.Value.ToString();

        }


        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=" + sa + "  order by sort");
        cmbxerc.TextField = "ClassifName";
        cmbxerc.ValueField = "ClassifID";
        cmbxerc.DataSource = region2;
        cmbxerc.DataBind();
        if(region2.Rows.Count!=0)
        cmbxerc.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbxerc.SelectedIndex = 0;
   
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string sa = "0";
        if (cmbsahe.SelectedItem != null)
        {
            sa = cmbsahe.SelectedItem.Value.ToString();
        }
        string sa1 = "0";
        if (cmbxerc.SelectedItem != null)
        {
            sa1 = cmbxerc.SelectedItem.Value.ToString();
        }
       
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
            DataRow dr = klas.GetDataRow("Select * from ExpensesFundsAllocated where SubId=" + sa1 + " and ReportYear=" + cmbil.Text+" and MunicipalID="+MunicipalId);
            if (dr != null)
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update ExpensesFundsAllocated set FundsAllocated=@FundsAllocated where SubId=@SubId and ReportYear=@ReportYear and MunicipalID="+MunicipalId, baglan);
                cmd.Parameters.Add("SubId", sa1);
                cmd.Parameters.Add("FundsAllocated", txtAyrilmishVesait.Text);
                cmd.Parameters.Add("ReportYear", cmbil.Text);
                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert Into ExpensesFundsAllocated (MunicipalID,SubId,ReportYear,FundsAllocated) Values(@MunicipalID,@SubId,@ReportYear,@FundsAllocated)", baglan);
                cmd.Parameters.Add("MunicipalID", MunicipalId);
                cmd.Parameters.Add("SubId", sa1);
                cmd.Parameters.Add("FundsAllocated", txtAyrilmishVesait.Text);
                cmd.Parameters.Add("ReportYear", cmbil.Text);
                cmd.ExecuteNonQuery();
            }

                SqlConnection baglan1 = klas.baglan();
                SqlCommand cmd1 = new SqlCommand(@"Insert into ExpensesProjectIllik (MunicipalID,ExpensesAreaID,ExpensesAreaName,ExpensesSubAreaID,
ExpensesSubAreaName,NoteText,Amount,ExpensesYear,ExpensesType) values 
(@MunicipalID,@ExpensesAreaID,@ExpensesAreaName,@ExpensesSubAreaID,@ExpensesSubAreaName,@NoteText,@Amount,@ExpensesYear,@ExpensesType)", baglan1);
                cmd1.Parameters.Add("MunicipalID", MunicipalId);
                cmd1.Parameters.Add("ExpensesAreaID", sa);
                cmd1.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                cmd1.Parameters.Add("ExpensesSubAreaID", sa1);
                cmd1.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                cmd1.Parameters.Add("NoteText", tesviri.Text);
                cmd1.Parameters.Add("Amount", mebleg.Text);
                cmd1.Parameters.Add("ExpensesYear", cmbil.Text);
                cmd1.Parameters.Add("ExpensesType", 1);
                cmd1.ExecuteNonQuery();       
              
                 vizual();
                 Response.Redirect("Expenseillik.aspx");  
            
        }
        else
        {
            DataRow dr = klas.GetDataRow("Select * from ExpensesFundsAllocated where SubId=" + sa1 + " and ReportYear=" + cmbil.Text + " and MunicipalID=" + MunicipalId);
            if (dr != null)
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update ExpensesFundsAllocated set FundsAllocated=@FundsAllocated where SubId=@SubId and ReportYear=@ReportYear and MunicipalID="+MunicipalId, baglan);
                cmd.Parameters.Add("SubId", sa1);
                cmd.Parameters.Add("FundsAllocated", txtAyrilmishVesait.Text);
                cmd.Parameters.Add("ReportYear", cmbil.Text);
                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert Into ExpensesFundsAllocated (MunicipalID,SubId,ReportYear,FundsAllocated) Values(@MunicipalID,@SubId,@ReportYear,@FundsAllocated)", baglan);
                cmd.Parameters.Add("MunicipalID", MunicipalId);
                cmd.Parameters.Add("SubId", sa1);
                cmd.Parameters.Add("FundsAllocated", txtAyrilmishVesait.Text);
                cmd.Parameters.Add("ReportYear", cmbil.Text);
                cmd.ExecuteNonQuery();
            }
                SqlConnection baglan2 = klas.baglan();
                SqlCommand cmd2 = new SqlCommand(@"Update ExpensesProjectIllik set  ExpensesAreaID=@ExpensesAreaID,ExpensesAreaName=@ExpensesAreaName,
ExpensesSubAreaID=@ExpensesSubAreaID,ExpensesSubAreaName=@ExpensesSubAreaName,
NoteText=@NoteText,Amount=@Amount,ExpensesYear=@ExpensesYear,UpdateDate=@UpdateDate 
where ExpensesID=" + TaxpayerID, baglan2);
                cmd2.Parameters.Add("ExpensesAreaID", sa);
                cmd2.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                cmd2.Parameters.Add("ExpensesSubAreaID", sa1);
                cmd2.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                cmd2.Parameters.Add("NoteText", tesviri.Text);
                cmd2.Parameters.Add("Amount", mebleg.Text);
                cmd2.Parameters.Add("ExpensesYear", cmbil.Text);
                string vaxt = klas.getdatacell("select getdate() as indikivaxt");
                cmd2.Parameters.Add("UpdateDate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
                cmd2.ExecuteNonQuery();
                vizual();
                //clearcomponenet();
                //islem = "";
                Response.Redirect("Expenseillik.aspx");          
         
        }
        
    }
    protected void clearcomponenet()
    {
        cmbsahe.SelectedIndex = 0;

        cmbxerc.Items.Clear();
        cmbxerc.SelectedIndex = -1;
        tesviri.Text = "";
        cmbil.SelectedIndex = 0;
        mebleg.Text = "";
        txtAyrilmishVesait.Text = "";
    }
    protected void cmbsahe_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtAyrilmishVesait.Text = "";
        xercemekhaqqitr.Visible = false;
        xercumumi.Visible = true;
        pnltbl.Visible = true;
        xerc();
        il();
        runi();
    }
    protected void cmbxerc_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtAyrilmishVesait.Text = "";
        string sa = "0";
        if (cmbxerc.SelectedItem != null)
        {
            sa = cmbxerc.SelectedItem.Value.ToString();           
        }
        il();
        runi();
    }
    protected void cmbil_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtAyrilmishVesait.Text = "";
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
        runi();
    }
}