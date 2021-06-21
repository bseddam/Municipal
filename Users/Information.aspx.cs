using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Information : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string islem; string TaxpayerID; string qeyd;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
        //string script = "alert(\"Hello!\");";
        //ScriptManager.RegisterStartupScript(this, GetType(),
        //                      "ServerControlScript", script, true);
        try
        {
            TaxpayerID = Request.QueryString["TaxpayerID"];
            islem = Request.QueryString["islem"];
            qeyd = Request.QueryString["qeyd"];
        }
        catch (Exception)
        { }
        if (!Page.IsPostBack)
        {
            prevPage = Request.Url.AbsoluteUri.ToString();
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            DataRow drusers = klas.GetDataRow(@"select *,m.MunicipalAdress MunicipalAdress1 
from Users u inner join List_classification_Municipal m on u.MunicipalID=m.MunicipalID
where UserID=" + Session["UserID"].ToString());




            txtiw.Text = drusers["Municipalphone"].ToString();
            txtbldunvan.Text = drusers["MunicipalAdress1"].ToString();


            txtvoen.Text = drusers["VOEN"].ToString();
            txthesabn.Text = drusers["AccountNumber"].ToString();
            txtbank.Text = drusers["Bank"].ToString();
            if (drusers["Status"] != null && drusers["Status"].ToString() != "")
            {
                ddlstatus.SelectedValue = drusers["Status"].ToString();
            }

            if (qeyd == "1")
            {
                lblBilgi.Text = "Dəyişiklik qeydə alındı.";
                lblBilgi.ForeColor = Color.Green;
            }
            status();

        }

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

    protected void btnsave_Click(object sender, EventArgs e)
    {


        HttpRequest request = base.Request;

        // Get UserHostAddress property.
        string useraddress = request.UserHostAddress;

        // Write to response.
        //base.Response.Write(useraddress);

        // Done.

        //string ipaddress = "";
        //ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        //if (ipaddress == "" || ipaddress == null)
        //    ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        //Response.Write(ipaddress +" " + address);

        //string localip = "?";
        //IPHostEntry host = Dns.GetHostEntry(Dns.GetHostName());
        //foreach (IPAddress ip in host.AddressList)
        //{
        //    if (ip.AddressFamily.ToString() == "InterNetwork")
        //    {
        //        localip = ip.ToString();
        //    }
        //}
        //Response.Write(localip);

        string macAddresses = "";
        foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
        {
            if (nic.OperationalStatus == OperationalStatus.Up)
            {
                macAddresses += nic.GetPhysicalAddress().ToString();
                break;
            }
        }
        //Response.Write(localip);

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; string MunicipalName = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u 
inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }






        SqlConnection baglan = klas.baglan();
        SqlCommand cmd1 = new SqlCommand(@"Update List_classification_Municipal 
set  Municipalphone=@Municipalphone,
MunicipalAdress=@MunicipalAdress,UpdateDate=getdate(),VOEN=@VOEN,AccountNumber=@AccountNumber,Bank=@Bank,Status=@Status
where MunicipalID=" + MunicipalId, baglan);

        cmd1.Parameters.AddWithValue("Municipalphone", txtiw.Text);
        cmd1.Parameters.AddWithValue("MunicipalAdress", txtbldunvan.Text);
        cmd1.Parameters.AddWithValue("VOEN", txtvoen.Text);
        cmd1.Parameters.AddWithValue("AccountNumber", txthesabn.Text);
        cmd1.Parameters.AddWithValue("Bank", txtbank.Text);
        cmd1.Parameters.AddWithValue("Status", ddlstatus.SelectedValue);
        cmd1.ExecuteNonQuery();

        Response.Redirect("Information.aspx?qeyd=1");

    }
}