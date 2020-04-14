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

public partial class Users_Member : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string islem; 
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
        //string script = "alert(\"Hello!\");";
        //ScriptManager.RegisterStartupScript(this, GetType(),
        //                      "ServerControlScript", script, true);
        try
        {
            
            islem = Request.QueryString["islem"];
        }
        catch (Exception)
        { }
        if (!Page.IsPostBack)
        {
            TaxpayerID.Value = "";
            prevPage = Request.Url.AbsoluteUri.ToString();
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            vizual();
            vezife();
            partiya();
            tehsil();
            mesulsexs();
           

 
        }

    }
    protected void repeattaxpayer(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "duzelis")
        {
            TaxpayerID.Value = e.CommandArgument.ToString();
            RequiredFieldValidator1.Visible = false;
            DataRow drodeyici = klas.GetDataRow("SELECT * from Structure where StructureID=" + TaxpayerID.Value);
            soyadi.Text = drodeyici["SName"].ToString();
            adi.Text = drodeyici["Name"].ToString();
            ataadi.Text = drodeyici["FName"].ToString();
            ddlvezife.Value = drodeyici["StatusPositionID"].ToString();
            if (drodeyici["Gender"].ToString() == "1")
            {
                rdman.Checked = true;
            }
            else
            {
                rdwoman.Checked = true;
            }

            qeydiyyatadres.Text = drodeyici["Adress"].ToString();
            email.Text = drodeyici["Email"].ToString();
            mobiltel.Text = drodeyici["Mobiltel"].ToString();
            ddlpartiya.Value = drodeyici["PartyID"].ToString();
            cmbtevellud.Date = Convert.ToDateTime(drodeyici["BirthDate"].ToString()).Date;
            txtmilliyyet.Text = drodeyici["Nationality"].ToString();
            ddltehsil.Value = drodeyici["EducationID"].ToString();
        }
    }

    protected void DeleteRecord(object sender, EventArgs e)
    {
        string uvz = (sender as LinkButton).CommandArgument.ToString();
        string resimadi1 = klas.getdatacell("SELECT Photo from Structure where StructureID=" + uvz);
        klas.cmd("Update  Structure set ForDelete=0 Where StructureID=" + uvz);

        FileInfo fisilinecek = new FileInfo(Server.MapPath(resimadi1));
        fisilinecek.Delete();
        vizual();
    }
   
    void vizual()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; string MunicipalName = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }
        DataTable region2 = klas.getdatatable(@"select SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name
,StatusPositionName,Photo,Signature,StructureID,case when Charge=1 then N'Məsul şəxs' else '' end Charge
from Structure where ForDelete=1 and MunicipalID=" + MunicipalId + "  order by NowTime desc");
        DataList1.DataSource = region2;
        DataList1.DataBind();
    }
    void mesulsexs()
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        string MunicipalId = ""; 
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalID from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        }
        DataTable meqsed = klas.getdatatable(@"select SName +' '+ Name +' '+FName+case when Gender=1 then N' oğlu' when Gender=2 then N' qızı' end as Name
,StatusPositionName,StructureID 
from Structure where ForDelete=1 and MunicipalID=" + MunicipalId);
        ddlmehsul.Items.Clear();
        ddlmehsul.TextField = "Name";
        ddlmehsul.ValueField = "StructureID";
        ddlmehsul.DataSource = meqsed;
        ddlmehsul.DataBind();
        ddlmehsul.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        ddlmehsul.SelectedIndex = 0;
    }
    void vezife()
    {
        DataTable meqsed = klas.getdatatable("select ClassifID,ClassifName,ListID from List_classifications where ListID=4 order by sort");
        ddlvezife.Items.Clear();
        ddlvezife.TextField = "ClassifName";
        ddlvezife.ValueField = "ClassifID";
        ddlvezife.DataSource = meqsed;
        ddlvezife.DataBind();
        ddlvezife.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        ddlvezife.SelectedIndex = 0;
        //ddlvezife.Items.Insert(0, new ListItem("Seçin", "0"));
    }
    void partiya()
    {
        DataTable meqsed = klas.getdatatable("select ClassifID,ClassifName,ListID from List_classifications where ListID=10 order by sort");
        ddlpartiya.Items.Clear();
        ddlpartiya.TextField = "ClassifName";
        ddlpartiya.ValueField = "ClassifID";
        ddlpartiya.DataSource = meqsed;
        ddlpartiya.DataBind();
        ddlpartiya.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        ddlpartiya.SelectedIndex = 0;
    }
    void tehsil()
    {
        DataTable meqsed = klas.getdatatable("select ClassifID,ClassifName,ListID from List_classifications where ListID=11 order by sort");
        ddltehsil.Items.Clear();
        ddltehsil.TextField = "ClassifName";
        ddltehsil.ValueField = "ClassifID";
        ddltehsil.DataSource = meqsed;
        ddltehsil.DataBind();
        ddltehsil.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        ddltehsil.SelectedIndex = 0;
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
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
     

        string MunicipalId = ""; string MunicipalName = ""; 
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
        }


        if (string.IsNullOrEmpty(TaxpayerID.Value))
        {
                string uzanti = Path.GetExtension(fufoto.PostedFile.FileName);
                if (fufoto.HasFile && (uzanti == ".jpeg" || uzanti == ".jpg" || uzanti == ".png" || uzanti == ".JPEG" || uzanti == ".JPG" || uzanti == ".PNG"))
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Insert into Structure (StatusPositionID,MunicipalID,MunicipalName,SName,Name,FName,
StatusPositionName,Gender,Adress,Mobiltel,Email,PartyID,Party,BirthDate,Nationality,EducationID,Education) 
values(@StatusPositionID,@MunicipalID,@MunicipalName,@SName,@Name,@FName,@StatusPositionName,@Gender,@Adress,@Mobiltel,@Email,@PartyID,@Party,
@BirthDate,@Nationality,@EducationID,@Education)", baglan);
                    cmd.Parameters.Add("MunicipalID", MunicipalId);
                    cmd.Parameters.Add("MunicipalName", MunicipalName);
                    cmd.Parameters.Add("StatusPositionID", ddlvezife.Value);
                    cmd.Parameters.Add("SName", soyadi.Text);
                    cmd.Parameters.Add("Name", adi.Text);
                    cmd.Parameters.Add("FName", ataadi.Text);
                    cmd.Parameters.Add("StatusPositionName", ddlvezife.SelectedItem.ToString());
                    cmd.Parameters.Add("Gender", cins);
                    cmd.Parameters.Add("Adress", qeydiyyatadres.Text);
                    cmd.Parameters.Add("Mobiltel", mobiltel.Text);
                    cmd.Parameters.Add("Email", email.Text);
                    cmd.Parameters.Add("PartyID", ddlpartiya.Value);
                    cmd.Parameters.Add("Party", ddlpartiya.SelectedItem.ToString());
                    cmd.Parameters.Add("BirthDate", cmbtevellud.Date);
                    cmd.Parameters.Add("Nationality", txtmilliyyet.Text);
                    cmd.Parameters.Add("EducationID", ddltehsil.Value);
                    cmd.Parameters.Add("Education", ddltehsil.SelectedItem.ToString());
                    cmd.ExecuteNonQuery();




                    DataRow drxerc = klas.GetDataRow("SELECT StructureID,MunicipalID from Structure where MunicipalID=" + MunicipalId + " order by StructureID desc");
                    string resimadi = "Foto/" + drxerc["StructureID"].ToString() + uzanti;
                    string folder = Server.MapPath("Foto/");
                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }
                    fufoto.SaveAs(Server.MapPath(resimadi));

                    SqlCommand cmd1 = new SqlCommand(@"Update   Structure set Photo=@Photo where MunicipalID=" + MunicipalId + " and StructureID=" + drxerc["StructureID"].ToString(), baglan);
                    cmd1.Parameters.Add("Photo", resimadi);
                    cmd1.ExecuteNonQuery();

                    //vizual();
                    TaxpayerID.Value = "";
                    Response.Redirect(prevPage);
                }
                else
                {
                    lblBilgi.Text = "Şəkil formatı düz deyil";
                }

        }
        else
        {

            string uzanti = Path.GetExtension(fufoto.PostedFile.FileName);
            string resimadi1 = "";

            if (fufoto.HasFile)
            {
                string folder = Server.MapPath("Foto/");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                DataRow drxerc = klas.GetDataRow("SELECT StructureID,MunicipalID from Structure where StructureID=" + TaxpayerID.Value + " order by StructureID desc");
                resimadi1 = "Foto/" + drxerc["StructureID"].ToString() + uzanti;
                fufoto.SaveAs(Server.MapPath(resimadi1));
            }
            else
            {
                resimadi1 = klas.getdatacell("select Photo from Structure where StructureID=" + TaxpayerID.Value);
            }

             
                if (uzanti == ".jpeg" || uzanti == ".jpg" || uzanti == ".png" || uzanti == ".JPEG" || uzanti == ".JPG" || uzanti == ".PNG" || uzanti == "")
                {
                    SqlConnection baglan = klas.baglan();
                    SqlCommand cmd = new SqlCommand(@"Update Structure set  SName=@SName,Name=@Name,FName=@FName,
Gender=@Gender,Adress=@Adress,Email=@Email,Mobiltel=@Mobiltel,StatusPositionName=@StatusPositionName,
StatusPositionID=@StatusPositionID,PartyID=@PartyID,Party=@Party,BirthDate=@BirthDate,Nationality=@Nationality,EducationID=@EducationID,
Education=@Education,Photo=@Photo,UpdateDate=@UpdateDate where StructureID=" + TaxpayerID.Value, baglan);
                    cmd.Parameters.Add("StatusPositionID", ddlvezife.Value);
                    cmd.Parameters.Add("SName", soyadi.Text);
                    cmd.Parameters.Add("Name", adi.Text);
                    cmd.Parameters.Add("FName", ataadi.Text);
                    cmd.Parameters.Add("StatusPositionName", ddlvezife.SelectedItem.ToString());
                    cmd.Parameters.Add("Gender", cins);
                    cmd.Parameters.Add("Adress", qeydiyyatadres.Text);
                    cmd.Parameters.Add("Mobiltel", mobiltel.Text);
                    cmd.Parameters.Add("Email", email.Text);
                    cmd.Parameters.Add("PartyID", ddlpartiya.Value);
                    cmd.Parameters.Add("Party", ddlpartiya.SelectedItem.ToString());
                    cmd.Parameters.Add("BirthDate", cmbtevellud.Date);
                    cmd.Parameters.Add("Nationality", txtmilliyyet.Text);
                    cmd.Parameters.Add("EducationID", ddltehsil.Value);
                    cmd.Parameters.Add("Education", ddltehsil.SelectedItem.ToString());
                    cmd.Parameters.Add("Photo", resimadi1);
                    string vaxt = klas.getdatacell("select getdate() as indikivaxt");
                    cmd.Parameters.Add("UpdateDate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
                    cmd.ExecuteNonQuery();
                    TaxpayerID.Value = "";
                    Response.Redirect("Member.aspx");
                }
                else
                {
                    lblBilgi.Text = "Şəkil formatı düz deyil";
                }
        }


    }

    protected void btnmehsul_Click(object sender, EventArgs e)
    {

        string MunicipalId = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
        } 
        
        SqlConnection baglan = klas.baglan();
        SqlCommand cmd1 = new SqlCommand(@"Update Structure set  Charge=@Charge where MunicipalID=" + MunicipalId, baglan);
        cmd1.Parameters.Add("Charge", int.Parse("0"));
        cmd1.ExecuteNonQuery();

        SqlCommand cmd = new SqlCommand(@"Update Structure set  Charge=@Charge where StructureID=" + ddlmehsul.Value, baglan);
        cmd.Parameters.Add("Charge", int.Parse("1"));
        cmd.ExecuteNonQuery();
        vizual();
        Response.Redirect(prevPage);
    }
}