using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Regster : System.Web.UI.Page
{
    Class2 klas = new Class2(); string qeyd;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            qeyd = Request.QueryString["qeyd"];
        }
        catch (Exception)
        {
            
            throw;
        }

        if (!Page.IsPostBack) {
            rayon();
            status();
            if (qeyd == "1")
            {
                Lblmessage.Text = "Qeydiyyatdan uğurla keçdiniz.";
            }
        }

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {

        HttpRequest request = base.Request;
        string useraddress = request.UserHostAddress;


        string macAddresses = "";
        foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
        {
            if (nic.OperationalStatus == OperationalStatus.Up)
            {
                macAddresses += nic.GetPhysicalAddress().ToString();
                break;
            }
        }

        DataRow dr = klas.GetDataRow("Select MunicipalID from Users where MunicipalID=" + ddlbelediyye.SelectedValue);



        SqlConnection baglan = klas.baglan();
        DataTable dt1 = new DataTable();
        SqlCommand cmd2 = new SqlCommand(@"Select MunicipalID from Users where Uname=@p1", baglan);
        cmd2.Parameters.AddWithValue("p1", txtlogin.Text);
        SqlDataAdapter dap1 = new SqlDataAdapter(cmd2);
        dap1.SelectCommand.CommandTimeout = 180;
        dap1.Fill(dt1);

        dap1.Dispose();



        DataRow dr2 = klas.GetDataRow("Select MunicipalID from Users where VPN_IP=N'" + useraddress + "'");

        if (ddlbelediyye.SelectedValue != "-1" && txtlogin.Text.Length <= 12 && txtpassvord.Text.Length <= 12 && txtlogin.Text.Length >= 6 && txtpassvord.Text.Length >= 6 && txtpassvord.Text == txtpassvord2.Text && dt1.Rows.Count == 0 && dr == null && dr2 == null)
        {
            int cins;
            if (rdman.Checked)
            {
                cins = 1;
            }
            else
            {
                cins = 2;
            }

            SqlCommand cmd = new SqlCommand(@"Insert into Users (Fname,MunicipalID,Name,Sname,Gender,UName,Passvord,Contactmobile,Email,VPN_IP,Comp_MAC) 
values(@Fname,@MunicipalID,@Name,@Sname,@Gender,@UName,@Passvord,@Contactmobile,@Email,@VPN_IP,@Comp_MAC)", baglan);
            cmd.Parameters.AddWithValue("MunicipalID", ddlbelediyye.SelectedValue);
            cmd.Parameters.AddWithValue("VPN_IP", useraddress);
            cmd.Parameters.AddWithValue("Comp_MAC", macAddresses);
            cmd.Parameters.AddWithValue("UName", txtlogin.Text);
            cmd.Parameters.AddWithValue("Name", txtname.Text);
            cmd.Parameters.AddWithValue("Sname", txtsname.Text);
            cmd.Parameters.AddWithValue("Fname", txtfname.Text);
            cmd.Parameters.AddWithValue("Contactmobile", txtcontact.Text);
            cmd.Parameters.AddWithValue("Email", txtemail.Text);
            cmd.Parameters.AddWithValue("Passvord", txtpassvord.Text);
            cmd.Parameters.AddWithValue("Gender", cins);
            cmd.ExecuteNonQuery();




            SqlCommand cmd1 = new SqlCommand(@"Update List_classification_Municipal set  Municipalphone=@Municipalphone,
MunicipalAdress=@MunicipalAdress,VOEN=@VOEN,AccountNumber=@AccountNumber,Bank=@Bank,Status=@Status 
where MunicipalID=" + ddlbelediyye.SelectedValue, baglan);
            cmd1.Parameters.AddWithValue("Municipalphone", txtiw.Text);
            cmd1.Parameters.AddWithValue("MunicipalAdress", txtbldunvan.Text);
            cmd1.Parameters.AddWithValue("VOEN", txtvoen.Text);
            cmd1.Parameters.AddWithValue("AccountNumber", txthesabn.Text);
            cmd1.Parameters.AddWithValue("Bank", txtbank.Text);
            cmd1.Parameters.AddWithValue("Status", ddlstatus.SelectedValue);
            cmd1.ExecuteNonQuery();
            Response.Redirect("Regster.aspx?qeyd=1");
        }
        else {
            if (ddlbelediyye.SelectedValue == "-1")
            {
                lblBilgi.Text = "Bələdiyyə seçilməyib";
            }
            else if (dr != null)
            {
                lblBilgi.Text = "Bu bələdiyyə qeydiyyatdan keçib.";
            }
            else if (dt1.Rows.Count != 0)
            {
                lblBilgi.Text = "Bu istifadəçi adı istifadə olunub. İstifadəçi adını dəyişməyiniz xahiş olunur.";
            }
            else if (dr2 != null)
            {
                lblBilgi.Text = "Bu İP ünvan qeydiyyatdan keçib. İP ünvanınız" + useraddress;
            }
            else {
                lblBilgi.Text = "İstifadəçi adı və ya şifrə yalnışdır.";
            }

        }
    }
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Seçin", "-1"));
    }

    void rayon()
    {
        DataTable region2 = klas.getdatatable("select RegionsID,CASE WHEN CityID = 2 THEN Name + ' ' + 'rayonu' WHEN CityID = 1 THEN Name + ' ' + N'şəhəri' END as Name from List_classification_Regions where ForDelete=1 order by Name");
        ddlrayon.DataTextField = "Name";
        ddlrayon.DataValueField = "RegionsID";
        ddlrayon.DataSource = region2;
        ddlrayon.DataBind();
        ddlrayon.Items.Insert(0, new ListItem("Seçin", "-1"));
    }
    void status()
    {
        DataTable region2 = klas.getdatatable("select * from List_classifications where ListID=12 order by sort");
        ddlstatus.DataTextField = "ClassifName";
        ddlstatus.DataValueField = "ClassifID";
        ddlstatus.DataSource = region2;
        ddlstatus.DataBind();
        ddlstatus.Items.Insert(0, new ListItem("Seçin", "-1"));
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
}