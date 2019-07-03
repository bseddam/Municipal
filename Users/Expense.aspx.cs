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

public partial class Users_Expense : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; 
    

    protected void Page_Load(object sender, EventArgs e)
    {

       
        if (!Page.IsPostBack)
        {
            TaxpayerID.Value = "";
            xercemekhaqqitr.Visible = false;
            Panel1.Visible = false;
            xercumumi.Visible = true;
            pnltbl.Visible = true;

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            prevPage = Request.Url.AbsoluteUri.ToString();
          
            int k = 0;
            string vaxt = klas.getdatacell("select year(getdate()) vaxt ");
            for (var i = int.Parse(vaxt) ; i >= int.Parse(vaxt) - 3; i--)
            {
                cmbil.Items.Insert(k, new ListEditItem("" + i + ""));
                k++;
            }
            cmbil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
            cmbil.SelectedIndex = 0;

            yarimil();

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
                if (drxerc["ExpensesSubAreaID"].ToString() != "84")
                {
                    tesviri.Text = "";
                    txtishcisay.Text = "";
                    txthesemekhaqqi.Text = "";
                    txtdsmf.Text = "";
                    txtdsmf3.Text = "";
                    txtgelirvergisi.Text = "";
                    txthemkarlar.Text = "";
                    txtdiger.Text = "";
                    xercemekhaqqitr.Visible = false;
                    Panel1.Visible = false;
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
                    cmbyarimil.Value = drxerc["ExpensesHalfYear"].ToString();
                }
                else
                {
                    ayliq();
                    xercemekhaqqitr.Visible = true;
                    Panel1.Visible = true;
                    xercumumi.Visible = false;
                    pnltbl.Visible = false;

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
                    txthesemekhaqqi.Text = drxerc["Amount"].ToString();
                    txtishcisay.Text = drxerc["CountWorker"].ToString();
                    txtdsmf.Text = drxerc["DFMF22"].ToString();
                    txtdsmf3.Text = drxerc["DSMF3"].ToString();
                    txtgelirvergisi.Text = drxerc["IncomeTaxes14"].ToString();
                    txthemkarlar.Text = drxerc["Trades"].ToString();
                    txtdiger.Text = drxerc["Diger"].ToString();
                    cmbil.Value = drxerc["ExpensesYear"].ToString();
                    cmbyarimil.Value = drxerc["ExpensesHalfYear"].ToString();
                }
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
        string xerc = (sender as LinkButton).CommandArgument.ToString();
        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>(select ExpensesYear from ExpensesProject Where ExpensesID=" + xerc + @") 
            and UserID=" + Session["UserID"].ToString());
        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }

        if (icaze == "1")
        {
           
            klas.cmd("Delete from ExpensesProject Where ExpensesID=" + xerc);
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
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }
        string sa = "0";
        if (cmbxerc.SelectedItem != null)
        {
            sa = cmbxerc.SelectedItem.Value.ToString();
        }
        if (sa == "84")
        {
            DataTable region2 = klas.getdatatable(@"select * from ExpensesProject where  MunicipalID=" + MunicipalId + " and ExpensesType=1 and ExpensesTypeSub=1 order by NowTime desc");
            Repeater2.DataSource = region2;
            Repeater2.DataBind();
        }
        else
        {
            DataTable region2 = klas.getdatatable(@"select * from ExpensesProject where  MunicipalID=" + MunicipalId + " and ExpensesType=1 and ExpensesTypeSub is null order by NowTime desc");
            Repeater1.DataSource = region2;
            Repeater1.DataBind();
        }
    }
    void sahe()
    {
        
        DataTable region2 = klas.getdatatable("select ClassifID,ClassifName from List_classifications where ListID=8  order by sort");
        cmbsahe.TextField = "ClassifName";
        cmbsahe.ValueField = "ClassifID";
        cmbsahe.DataSource = region2;
        cmbsahe.DataBind();
        cmbsahe.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        cmbsahe.SelectedIndex = 0;
    }
    void yarimil()
    {

        cmbyarimil.Items.Clear();
        cmbyarimil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        for (var i = 1; i <= 12; i++)
        {
            cmbyarimil.Items.Insert(i, new ListEditItem("" + i + "", "" + i + ""));
        }
        cmbyarimil.SelectedIndex = 0;



        txtishcisay.Text = "";
        txthesemekhaqqi.Text = "";
        txtdsmf.Text = "";
        txtdsmf3.Text = "";
        txtgelirvergisi.Text = "";
        txthemkarlar.Text = "";
        txtdiger.Text = "";
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

        xercemekhaqqitr.Visible = true;
        Panel1.Visible = true;
        xercumumi.Visible = false;
        pnltbl.Visible = false;
    }
    

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
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }

        string icaze = "1";
        DataRow icazever = klas.GetDataRow(@"Select Icaze from Users u inner join List_classification_Municipal lm 
on u.MunicipalID=lm.MunicipalID Where year(getdate())>" + cmbil.SelectedItem.Value.ToString()+ " and UserID=" + Session["UserID"].ToString());
      
        if (icazever != null)
        {
            icaze = icazever["Icaze"].ToString();
        }
        if (icaze == "1")
        {
            if (string.IsNullOrEmpty(TaxpayerID.Value))
            {

                if (sa1 != "84")
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Insert into ExpensesProject (MunicipalID,ExpensesAreaID,ExpensesAreaName,ExpensesSubAreaID,
ExpensesSubAreaName,NoteText,Amount,ExpensesYear,ExpensesHalfYear,ExpensesType) values 
(@MunicipalID,@ExpensesAreaID,@ExpensesAreaName,@ExpensesSubAreaID,@ExpensesSubAreaName,@NoteText,@Amount,@ExpensesYear,@ExpensesHalfYear,
@ExpensesType)", baglan);
                    cmd.Parameters.Add("MunicipalID", MunicipalId);
                    cmd.Parameters.Add("ExpensesAreaID", sa);
                    cmd.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                    cmd.Parameters.Add("ExpensesSubAreaID", sa1);
                    cmd.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                    cmd.Parameters.Add("NoteText", tesviri.Text);
                    cmd.Parameters.Add("Amount", mebleg.Text);
                    cmd.Parameters.Add("ExpensesYear", cmbil.Text);
                    cmd.Parameters.Add("ExpensesHalfYear", sa2);
                    cmd.Parameters.Add("ExpensesType", 1);

                    cmd.ExecuteNonQuery();

                }
                else
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Insert into ExpensesProject (MunicipalID,ExpensesAreaID,ExpensesAreaName,ExpensesSubAreaID,
ExpensesSubAreaName,NoteText,Amount,ExpensesYear,ExpensesHalfYear,ExpensesType,CountWorker, DFMF22, DSMF3, IncomeTaxes14, Trades, Diger, ExpensesTypeSub) values 
(@MunicipalID,@ExpensesAreaID,@ExpensesAreaName,@ExpensesSubAreaID,@ExpensesSubAreaName,@NoteText,@Amount,@ExpensesYear,@ExpensesHalfYear,@ExpensesType,
@CountWorker, @DFMF22, @DSMF3, @IncomeTaxes14, @Trades, @Diger, @ExpensesTypeSub)", baglan);
                    cmd.Parameters.Add("MunicipalID", MunicipalId);
                    cmd.Parameters.Add("ExpensesAreaID", sa);
                    cmd.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                    cmd.Parameters.Add("ExpensesSubAreaID", sa1);
                    cmd.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                    cmd.Parameters.Add("NoteText", tesviri.Text);
                    cmd.Parameters.Add("Amount", txthesemekhaqqi.Text);
                    cmd.Parameters.Add("CountWorker", txtishcisay.Text);
                    cmd.Parameters.Add("DFMF22", txtdsmf.Text);
                    cmd.Parameters.Add("DSMF3", txtdsmf3.Text);
                    cmd.Parameters.Add("IncomeTaxes14", txtgelirvergisi.Text);
                    cmd.Parameters.Add("Trades", txthemkarlar.Text);
                    cmd.Parameters.Add("Diger", txtdiger.Text);
                    cmd.Parameters.Add("ExpensesTypeSub", 1);
                    cmd.Parameters.Add("ExpensesYear", cmbil.Text);
                    cmd.Parameters.Add("ExpensesHalfYear", sa2);
                    cmd.Parameters.Add("ExpensesType", 1);

                    cmd.ExecuteNonQuery();
                }



                TaxpayerID.Value = "";

                vizual();
                Response.Redirect(prevPage);

            }
            else
            {

                if (sa1 == "84")
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Update ExpensesProject set  MunicipalId=@MunicipalId,ExpensesAreaID=@ExpensesAreaID,ExpensesAreaName=@ExpensesAreaName,
ExpensesSubAreaID=@ExpensesSubAreaID,ExpensesSubAreaName=@ExpensesSubAreaName,
NoteText=@NoteText,Amount=@Amount,ExpensesYear=@ExpensesYear,ExpensesHalfYear=@ExpensesHalfYear,
UpdateDate=@UpdateDate,CountWorker=@CountWorker, DFMF22=@DFMF22, DSMF3=@DSMF3, IncomeTaxes14=@IncomeTaxes14, Trades=@Trades, Diger=@Diger, ExpensesTypeSub=@ExpensesTypeSub 
where ExpensesID=" + TaxpayerID.Value, baglan);
                    cmd.Parameters.Add("MunicipalID", MunicipalId);
                    cmd.Parameters.Add("ExpensesAreaID", sa);
                    cmd.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                    cmd.Parameters.Add("ExpensesSubAreaID", sa1);
                    cmd.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                    cmd.Parameters.Add("NoteText", tesviri.Text);
                    cmd.Parameters.Add("Amount", txthesemekhaqqi.Text);
                    cmd.Parameters.Add("CountWorker", txtishcisay.Text);
                    cmd.Parameters.Add("DFMF22", txtdsmf.Text);
                    cmd.Parameters.Add("DSMF3", txtdsmf3.Text);
                    cmd.Parameters.Add("IncomeTaxes14", txtgelirvergisi.Text);
                    cmd.Parameters.Add("Trades", txthemkarlar.Text);
                    cmd.Parameters.Add("Diger", txtdiger.Text);
                    cmd.Parameters.Add("ExpensesTypeSub", 1);
                    cmd.Parameters.Add("ExpensesYear", cmbil.Text);
                    cmd.Parameters.Add("ExpensesHalfYear", sa2);
                    string vaxt = klas.getdatacell("select getdate() as indikivaxt");
                    cmd.Parameters.Add("UpdateDate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
                    cmd.ExecuteNonQuery();


                    TaxpayerID.Value = "";
                    vizual();
                    //clearcomponenet();
                    //islem = "";
                    Response.Redirect("Expense.aspx");
                }
                else
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Update ExpensesProject set  MunicipalId=@MunicipalId,ExpensesAreaID=@ExpensesAreaID,ExpensesAreaName=@ExpensesAreaName,
ExpensesSubAreaID=@ExpensesSubAreaID,ExpensesSubAreaName=@ExpensesSubAreaName,
NoteText=@NoteText,Amount=@Amount,ExpensesYear=@ExpensesYear,ExpensesHalfYear=@ExpensesHalfYear,UpdateDate=@UpdateDate 
where ExpensesID=" + TaxpayerID.Value, baglan);
                    cmd.Parameters.Add("MunicipalID", MunicipalId);
                    cmd.Parameters.Add("ExpensesAreaID", sa);
                    cmd.Parameters.Add("ExpensesAreaName", cmbsahe.Text);
                    cmd.Parameters.Add("ExpensesSubAreaID", sa1);
                    cmd.Parameters.Add("ExpensesSubAreaName", cmbxerc.Text);
                    cmd.Parameters.Add("NoteText", tesviri.Text);
                    cmd.Parameters.Add("Amount", mebleg.Text);
                    cmd.Parameters.Add("ExpensesYear", cmbil.Text);
                    cmd.Parameters.Add("ExpensesHalfYear", sa2);
                    string vaxt = klas.getdatacell("select getdate() as indikivaxt");
                    cmd.Parameters.Add("UpdateDate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
                    cmd.ExecuteNonQuery();


                    TaxpayerID.Value = "";
                    vizual();
                    //clearcomponenet();
                    //islem = "";
                    Response.Redirect("Expense.aspx");
                }

            }

        }
        else
        {
            lblBilgi.ForeColor = Color.Red;
            lblBilgi.Text = "Admin tərəfindən icazə verilmir.";
        }
    }
    protected void clearcomponenet()
    {
        cmbsahe.SelectedIndex = 0;

        cmbxerc.Items.Clear();
        cmbxerc.SelectedIndex = -1;
        tesviri.Text = "";
        txtishcisay.Text = "";
        txthesemekhaqqi.Text = "";
        txtdsmf.Text = "";
        txtdsmf3.Text = "";
        txtgelirvergisi.Text = "";
        txthemkarlar.Text = "";
        txtdiger.Text = "";
        cmbil.SelectedIndex = 0;
        cmbyarimil.SelectedIndex = 0;


    }
    protected void cmbsahe_SelectedIndexChanged(object sender, EventArgs e)
    {
        tesviri.Text = "";
        txtishcisay.Text = "";
        txthesemekhaqqi.Text = "";
        txtdsmf.Text = "";
        txtdsmf3.Text = "";
        txtgelirvergisi.Text = "";
        txthemkarlar.Text = "";
        txtdiger.Text = "";
        xercemekhaqqitr.Visible = false;
        Panel1.Visible = false;
        xercumumi.Visible = true;
        pnltbl.Visible = true;
        xerc();
    }
    protected void cmbxerc_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sa = "0";
        if (cmbxerc.SelectedItem != null)
        {
            sa = cmbxerc.SelectedItem.Value.ToString();
        }
        if (sa == "84")
        {
            ayliq();
        }
        else
        {
            yarimil();
        }
    }
}