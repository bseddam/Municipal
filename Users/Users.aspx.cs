using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.NetworkInformation;

public partial class Users_UsersForm : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string TaxpayerID; string qeyd;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TaxpayerID = Request.QueryString["TaxpayerID"];
            qeyd = Request.QueryString["qeyd"];
        }
        catch (Exception)
        {

        }
        if (!Page.IsPostBack)
        {
            prevPage = Request.Url.AbsoluteUri.ToString();
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }


            if (qeyd == "1")
            {
                lblBilgi.Text = "Dəyişiklik qeydə alındı.";
                lblBilgi.ForeColor = Color.Green;
            }
            chkbolmelerload();
        }
        vizual();
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        //componentsload();
        int id = int.Parse((sender as LinkButton).CommandArgument);

        DataRow druser = klas.GetDataRow(@"select * from Users where UserID=" + id);
        txtsname.Text = druser["Sname"].ToString();
        txtname.Text = druser["Name"].ToString();
        txtfname.Text = druser["Fname"].ToString();
        txtcontact.Text = druser["Contactmobile"].ToString();
        txtemail.Text = druser["Email"].ToString();
        txtlogin.Text = druser["Uname"].ToString();
        txtpassvord.Text = druser["Passvord"].ToString();
        txtpassvord2.Text = druser["Passvord"].ToString();
        if (druser["Gender"].ToString() == "1")
        {
            rdman.Checked = true;
        }
        else
        {
            rdwoman.Checked = true;
        }

        DataTable dt = klas.getdatatable("select * from Privilege where UserID=" + id);
        chkbolmeler.ClearSelection();
        for (int i = 0; i < chkbolmeler.Items.Count; i++)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (chkbolmeler.Items[i].Value == row["MenuID"].ToString())
                {
                    chkbolmeler.Items[i].Selected = true;
                }
            }

        }


        lblBilgi.Text = "";

        btnsave.CommandName = "update";
        btnsave.CommandArgument = id.ToString();

    }
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        if (Session["Status_Users"].ToString() == "1")
        {
            string _id = (sender as LinkButton).CommandArgument.ToString();
            klas.cmd(@"Delete p from Privilege p inner join users u on p.UserID=u.UserID 
where u.UserID<>" + Session["UserID"].ToString() + " and Status_users<>1 and p.userid=" + _id);
            klas.cmd("Delete from Users Where Status_users<>1 and UserID<>" +
            Session["UserID"].ToString() + " and UserID=" + _id);

            vizual();
            lblBilgi.Text = "";
        }

    }


    void chkbolmelerload()
    {
        DataTable region2 = klas.getdatatable(@"select * from List_classifications_Menu 
where ForDelete=1 order by MenuID");
        chkbolmeler.DataTextField = "MenuName";
        chkbolmeler.DataValueField = "MenuID";
        chkbolmeler.DataSource = region2;
        chkbolmeler.DataBind();
    }
    void vizual()
    {

        if (Session["UserID"] == null || Session["Status_Users"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u 
inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID 
Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }

        if (Session["Status_Users"].ToString() != "1")
        {
            chkbolmeler.Enabled = false;
            btnAdd.Enabled = false;
        }


        string Status_users = " ";
        if (Session["Status_Users"].ToString()=="2")
        {
            Status_users = " and Status_users=2 ";
        }
       

        DataTable region2 = klas.getdatatable(@"
select  UserID,MunicipalID,Name+' '+Sname+' '+Fname+ case when Gender=1 then N' oğlu' 
	  when Gender=2 then N' qızı' else ' qeyd edilməyib' end fullname
	  ,Contactmobile,Uname,Passvord,Contacthome,Email,Status_users,MenuActive 
  FROM Users where MunicipalID=" + MunicipalId + Status_users + "  order by NowTime desc");
        Repeater1.DataSource = region2;
        Repeater1.DataBind();

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



        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = "";
        string MunicipalName = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,
lm.Municipal_code from Users u inner join List_classification_Municipal lm on 
u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }



        SqlConnection baglan = klas.baglan();
        DataTable dt1 = new DataTable();

        if (btnsave.CommandName == "update")
        {
            SqlCommand cmd2 = new SqlCommand(@"Select MunicipalID from Users 
where Uname=@p1 and UserID<>" + btnsave.CommandArgument.ToString(), baglan);
            cmd2.Parameters.AddWithValue("p1", txtlogin.Text);

            SqlDataAdapter dap1 = new SqlDataAdapter(cmd2);
            dap1.SelectCommand.CommandTimeout = 180;
            dap1.Fill(dt1);
            dap1.Dispose();
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand(@"Select MunicipalID from Users 
where Uname=@p1 and UserID<>" + Session["UserID"], baglan);
            cmd2.Parameters.AddWithValue("p1", txtlogin.Text);

            SqlDataAdapter dap1 = new SqlDataAdapter(cmd2);
            dap1.SelectCommand.CommandTimeout = 180;
            dap1.Fill(dt1);
            dap1.Dispose();
        }



        if (dt1.Rows.Count == 0 && txtlogin.Text.Length <= 12 && txtpassvord.Text.Length <= 12 && txtlogin.Text.Length >= 6 && txtpassvord.Text.Length >= 6 && txtpassvord.Text == txtpassvord2.Text)
        {
            string menuactive = "";
            for (int i = 0; i < chkbolmeler.Items.Count; i++)
            {
                if (chkbolmeler.Items[i].Selected)
                {
                    menuactive = menuactive + chkbolmeler.Items[i].Text + ", ";
                }
            }
            if (menuactive.Length > 2)
            {
                menuactive = menuactive.Substring(0, menuactive.Length - 2);
            }
            int cins;
            if (rdman.Checked)
            {
                cins = 1;
            }
            else
            {
                cins = 2;
            }

            if (btnsave.CommandName == "update")
            {
                SqlCommand cmd = new SqlCommand(@"update Users set 
UName=@UName,VPN_IP=@VPN_IP,Name=@Name,Sname=@Sname,Fname=@Fname,Contactmobile=@Contactmobile
,Email=@Email,Passvord=@Passvord,Gender=@Gender,MenuActive=@MenuActive,UpdateDate=getdate() where UserID=@UserID", baglan);
                cmd.Parameters.AddWithValue("MunicipalID", MunicipalId);
                cmd.Parameters.AddWithValue("UserID", btnsave.CommandArgument.ToString());
                cmd.Parameters.AddWithValue("UName", txtlogin.Text);
                cmd.Parameters.AddWithValue("VPN_IP", useraddress);
                cmd.Parameters.AddWithValue("Name", txtname.Text);
                cmd.Parameters.AddWithValue("Sname", txtsname.Text);
                cmd.Parameters.AddWithValue("Fname", txtfname.Text);
                cmd.Parameters.AddWithValue("Contactmobile", txtcontact.Text);
                cmd.Parameters.AddWithValue("Email", txtemail.Text);
                cmd.Parameters.AddWithValue("Passvord", txtpassvord.Text);
                cmd.Parameters.AddWithValue("Gender", cins);
                cmd.Parameters.AddWithValue("MenuActive", menuactive);
                cmd.ExecuteNonQuery();





                klas.cmd(@"Delete p from Privilege p inner join users u on p.UserID=u.UserID 
where Status_users<>1 and p.userid=" + btnsave.CommandArgument.ToString());




                for (int i = 0; i < chkbolmeler.Items.Count; i++)
                {
                    if (chkbolmeler.Items[i].Selected)
                    {

                        SqlCommand cmd1 = new SqlCommand(@"insert into Privilege (MenuID,UserID) values(@MenuID,@UserID)", baglan);
                        cmd1.Parameters.AddWithValue("MenuID", chkbolmeler.Items[i].Value);
                        cmd1.Parameters.AddWithValue("UserID", btnsave.CommandArgument.ToString());
                        cmd1.ExecuteNonQuery();
                    }
                }
            }
            else
            {

                if (Session["Status_Users"].ToString() == "1")
                {
                    SqlCommand cmd = new SqlCommand(@"insert into Users 
(MunicipalID,Fname,Name,Sname,Gender,UName,Passvord,Contactmobile,Email,VPN_IP,MenuActive,Status_users) values 
(@MunicipalID,@Fname,@Name,@Sname,@Gender,@UName,@Passvord,@Contactmobile,@Email,@VPN_IP,@MenuActive,@Status_users) ", baglan);
                    cmd.Parameters.AddWithValue("MunicipalID", MunicipalId);
                    cmd.Parameters.AddWithValue("UName", txtlogin.Text);
                    cmd.Parameters.AddWithValue("VPN_IP", useraddress);
                    cmd.Parameters.AddWithValue("Name", txtname.Text);
                    cmd.Parameters.AddWithValue("Sname", txtsname.Text);
                    cmd.Parameters.AddWithValue("Fname", txtfname.Text);
                    cmd.Parameters.AddWithValue("Contactmobile", txtcontact.Text);
                    cmd.Parameters.AddWithValue("Email", txtemail.Text);
                    cmd.Parameters.AddWithValue("Passvord", txtpassvord.Text);
                    cmd.Parameters.AddWithValue("Status_users", 2);
                    cmd.Parameters.AddWithValue("Gender", cins);
                    cmd.Parameters.AddWithValue("MenuActive", menuactive);
                    cmd.ExecuteNonQuery();



                    string userid = klas.getdatacell(@"select max(userid) userid from users 
where MunicipalID=" + MunicipalId);



                    for (int i = 0; i < chkbolmeler.Items.Count; i++)
                    {
                        if (chkbolmeler.Items[i].Selected)
                        {

                            SqlCommand cmd1 = new SqlCommand(@"insert into Privilege (MenuID,UserID) values(@MenuID,@UserID)", baglan);
                            cmd1.Parameters.AddWithValue("MenuID", chkbolmeler.Items[i].Value);
                            cmd1.Parameters.AddWithValue("UserID", userid);
                            cmd1.ExecuteNonQuery();
                        }
                    }
                



                Response.Redirect("Users.aspx?qeyd=1");
                }
                else
                {

                    lblBilgi.Text = "Ancaq admin əlavə edə bilər.";
                    lblBilgi.ForeColor = Color.Red;
                }
            }
        }
        else
        {
            if (dt1.Rows.Count != 0)
            {
                lblBilgi.Text = "Bu istifadəçi adı istifadə olunub. İstifadəçi adını dəyişməyiniz xahiş olunur.";
                lblBilgi.ForeColor = Color.Red;
            }
            else
            {
                lblBilgi.Text = "İstifadəçi adı və ya şifrə yalnışdır.";
                lblBilgi.ForeColor = Color.Red;
            }
        }
    }
    void clearcomponents()
    {

        txtsname.Text = "";
        txtname.Text = "";
        txtfname.Text = "";
        txtcontact.Text = "";
        txtemail.Text = "";
        txtlogin.Text = "";
        txtpassvord.Text = "";
        txtpassvord2.Text = "";
        rdman.Checked = true;
        rdwoman.Checked = false;
        chkbolmeler.ClearSelection();
    }
    protected void LnkPnlMenu_Click(object sender, EventArgs e)
    {
        clearcomponents();
        LinkButton btn = sender as LinkButton;
        switch (btn.CommandArgument)
        {
            case "add":
                btnsave.CommandName = "insert";
                break;
        }
    }
}