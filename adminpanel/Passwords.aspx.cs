using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class adminpanel_Users : System.Web.UI.Page
{
    Class2 klas = new Class2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rayon();
            municipal();
            users();
        }
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
    void municipal()
    {
        DataTable region2 = klas.getdatatable("select MunicipalID,MunicipalName from List_classification_Municipal where RegionID=" + ddlrayon.SelectedValue + "  order by MunicipalName");
        ddlbelediyye.DataTextField = "MunicipalName";
        ddlbelediyye.DataValueField = "MunicipalID";
        ddlbelediyye.DataSource = region2;
        ddlbelediyye.DataBind();
        ddlbelediyye.Items.Insert(0, new ListItem("Seçin", "-1"));
    }
    void users()
    {
        DataTable region2 = klas.getdatatable(@"select UserID, case when Sname is null then Name 
else Name+' '+Sname end as Name,Fname,status_users from Users where (status_users=1 or status_users=0) and MunicipalID=" + ddlbelediyye.SelectedValue);
        ddlistifadeci.DataTextField = "Name";
        ddlistifadeci.DataValueField = "UserID";
        ddlistifadeci.DataSource = region2;
        ddlistifadeci.DataBind();
        ddlistifadeci.Items.Insert(0, new ListItem("Seçin", "0"));
    }
    protected void ddlrayon_SelectedIndexChanged(object sender, EventArgs e)
    {
        municipal();
    }
    protected void ddlbelediyye_SelectedIndexChanged(object sender, EventArgs e)
    {
        users();
    }
    protected void ddlistifadeci_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlistifadeci.SelectedValue != "0")
        {
            DataRow region2 = klas.GetDataRow("Select * from Users where UserID=" + ddlistifadeci.SelectedValue);
            txtkohneparol.Text = region2["passvord"].ToString();
            txtlogin.Text = region2["Uname"].ToString();
        }
        else
        {
            txtkohneparol.Text = "";
            txtlogin.Text = "";
            txtyeniparol.Text = "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlistifadeci.SelectedValue != "0")
        {
           // DataRow region2 = klas.GetDataRow("Select passvord from Users where passvord='" + txtyeniparol.Text+"'");
            if (ddlistifadeci.SelectedValue != "0" && txtyeniparol.Text != "" )
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("Update Users Set passvord=@passvord Where UserID=" + ddlistifadeci.SelectedValue, baglanti);
                cmd.Parameters.AddWithValue("passvord", txtyeniparol.Text);
                cmd.ExecuteNonQuery();
                lblmessage.Text = "Parol dəyişikliyi qeydə alındı.   Yeni parol: " + txtyeniparol.Text;
                lblmessage.ForeColor = Color.Green;
                txtkohneparol.Text = "";
                txtyeniparol.Text = "";
                users();
                ddlistifadeci.Items.Insert(0, new ListItem("Seçin", "0"));
                baglanti.Close();
                baglanti.Dispose();
                Response.Redirect("Passwords.aspx");
            }
            else
            {
               
                if (txtyeniparol.Text == "")
                {
                    lblmessage.Text = "Yeni parol boş ola bilməz";
                    lblmessage.ForeColor = Color.Red;
                }
            }
        }
        else
        {
            lblmessage.Text = "İstifadəçi seçilməyib";
            lblmessage.ForeColor = Color.Red;
        }
    }
   
}