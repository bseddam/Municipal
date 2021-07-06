using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Juridical : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string islem; string TaxpayerID="";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
        //string script = "alert(\"Hello!\");";
        //ScriptManager.RegisterStartupScript(this, GetType(),
        //                      "ServerControlScript", script, true);
        try
        {
            islem = Request.QueryString["islem"];
            if (TaxpayerID == "")
            {
                if (Session["TaxpayerID"] != null)
                    TaxpayerID = Session["TaxpayerID"].ToString();

            }
            //if (string.IsNullOrEmpty(TaxpayerID))
            //{
            //    TaxpayerID = Session["TaxpayerID"].ToString();

            //}
            //TaxpayerID = Request.QueryString["TaxpayerID"];


        }
        catch (Exception)
        { }



        if (!Page.IsPostBack)
        {
            string vaxt = klas.getdatacell("SELECT CONVERT(VARCHAR(10),GETDATE(),104) vaxt");
            erizeqeydtarixi.Text = vaxt;
            prevPage = Request.Url.AbsoluteUri.ToString();
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }


            if (islem == "duzelis")
            {

                DataRow drodeyici = klas.GetDataRow("SELECT * from Taxpayer where TaxpayerID=" + TaxpayerID);
                erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());
                txtvergiod.Text = drodeyici["CompanyName"].ToString();
                huquqiunvan.Text = drodeyici["RegistrationAdress"].ToString();
                poctindex.Text = drodeyici["PostIndex"].ToString();
                dovletqeydtarix.Date = Convert.ToDateTime(drodeyici["RegistrLegaldate"].ToString()).Date; 
                voen.Text = drodeyici["VOEN"].ToString();
                soyadi.Text = drodeyici["SName"].ToString();
                adi.Text = drodeyici["Name"].ToString();
                ataadi.Text = drodeyici["FName"].ToString();
                if (drodeyici["Gender"].ToString() == "1")
                {
                    rdman.Checked = true;
                }
                else
                {
                    rdwoman.Checked = true;
                }

                email.Text = drodeyici["Email"].ToString();
                mobiltel.Text = drodeyici["Mobiltel"].ToString();
                iwtel.Text = drodeyici["Workltel"].ToString();
                evtel.Text = drodeyici["Hometel"].ToString();
                fax.Text = drodeyici["Fax"].ToString();
                //rd.Text = drodeyici["Concession"].ToString();

            }
            else if (islem == "baxis")
            {
                DataRow drodeyici = klas.GetDataRow("SELECT * from Taxpayer where TaxpayerID=" + TaxpayerID);
                erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());
                txtvergiod.Text = drodeyici["CompanyName"].ToString();
                huquqiunvan.Text = drodeyici["RegistrationAdress"].ToString();
                poctindex.Text = drodeyici["PostIndex"].ToString();
                dovletqeydtarix.Date = Convert.ToDateTime(drodeyici["RegistrLegaldate"].ToString()).Date; 
                voen.Text = drodeyici["VOEN"].ToString();
                soyadi.Text = drodeyici["SName"].ToString();
                adi.Text = drodeyici["Name"].ToString();
                ataadi.Text = drodeyici["FName"].ToString();
                if (drodeyici["Gender"].ToString() == "1")
                {
                    rdman.Checked = true;
                }
                else
                {
                    rdwoman.Checked = true;
                }
                email.Text = drodeyici["Email"].ToString();
                mobiltel.Text = drodeyici["Mobiltel"].ToString();
                iwtel.Text = drodeyici["Workltel"].ToString();
                evtel.Text = drodeyici["Hometel"].ToString();
                fax.Text = drodeyici["Fax"].ToString();
                txtvergiod.Enabled = false;
                huquqiunvan.Enabled = false;
                poctindex.Enabled = false;
                dovletqeydtarix.Enabled = false;
                voen.Enabled = false;
                soyadi.Enabled = false;
                adi.Enabled = false;
                ataadi.Enabled = false;
                email.Enabled = false;
                mobiltel.Enabled = false;
                iwtel.Enabled = false;
                evtel.Enabled = false;
                fax.Enabled = false;
                btnsave.Enabled = false;
                rdman.Enabled = false;
                rdwoman.Enabled = false;
            }
            else if (islem == "yeni") {
                btnyeni.BackColor = Color.Aqua;
            }
            else
            {
                txtvergiod.Enabled = false;
                huquqiunvan.Enabled = false;
                poctindex.Enabled = false;
                dovletqeydtarix.Enabled = false;
                voen.Enabled = false;
                soyadi.Enabled = false;
                adi.Enabled = false;
                ataadi.Enabled = false;
                email.Enabled = false;
                mobiltel.Enabled = false;
                iwtel.Enabled = false;
                evtel.Enabled = false;
                fax.Enabled = false;
                btnsave.Enabled = false;
                rdman.Enabled = false;
                rdwoman.Enabled = false;

                string MunicipalId = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();

                }


                DataRow drodeyici = klas.GetDataRow(@"SELECT * from Taxpayer where  MunicipalID=" + MunicipalId
                    + " and ForDelete=1 and Individual_Legal=2 order by Nowtime desc");
                if (drodeyici != null)
                {
                    erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());
                    txtvergiod.Text = drodeyici["CompanyName"].ToString();
                    huquqiunvan.Text = drodeyici["RegistrationAdress"].ToString();
                    poctindex.Text = drodeyici["PostIndex"].ToString();
                    dovletqeydtarix.Date = Convert.ToDateTime(drodeyici["RegistrLegaldate"].ToString()).Date; 
                    voen.Text = drodeyici["VOEN"].ToString();
                    soyadi.Text = drodeyici["SName"].ToString();
                    adi.Text = drodeyici["Name"].ToString();
                    ataadi.Text = drodeyici["FName"].ToString();
                    if (drodeyici["Gender"].ToString() == "1")
                    {
                        rdman.Checked = true;
                    }
                    else
                    {
                        rdwoman.Checked = true;
                    }
                    email.Text = drodeyici["Email"].ToString();
                    mobiltel.Text = drodeyici["Mobiltel"].ToString();
                    iwtel.Text = drodeyici["Workltel"].ToString();
                    evtel.Text = drodeyici["Hometel"].ToString();
                    fax.Text = drodeyici["Fax"].ToString();


                    txtvergiod.Enabled = false;
                    huquqiunvan.Enabled = false;
                    poctindex.Enabled = false;
                    dovletqeydtarix.Enabled = false;
                    voen.Enabled = false;
                    soyadi.Enabled = false;
                    adi.Enabled = false;
                    ataadi.Enabled = false;
                    email.Enabled = false;
                    mobiltel.Enabled = false;
                    iwtel.Enabled = false;
                    evtel.Enabled = false;
                    fax.Enabled = false;
                    btnsave.Enabled = false;
                    rdman.Enabled = false;
                    rdwoman.Enabled = false;
                }
            }
        
        }

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

        string MunicipalId = ""; string MunicipalName = ""; string BLDkodu = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
            BLDkodu = Municipal["Municipal_code"].ToString();
        }
        string YVOK = BLDkodu + "2" + voen.Text;

       if(islem=="duzelis")
       {
            DataRow drform = klas.GetDataRow(@"SELECT TaxpayerID from Taxpayer where TaxpayerID <>" + TaxpayerID + " and ForDelete=1 and VOEN='" + voen.Text + "' and MunicipalID="
                + MunicipalId);
            if (drform == null)
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Update Taxpayer set  Gender=@Gender,CompanyName=@CompanyName,
RegistrationAdress=@RegistrationAdress,PostIndex=@PostIndex,RegistrLegaldate=@RegistrLegaldate,VOEN=@VOEN,SName=@SName,Name=@Name,FName=@FName,YVOK=@YVOK,
Email=@Email,Mobiltel=@Mobiltel,Workltel=@Workltel,Hometel=@Hometel,Fax=@Fax,UpdateDate=@UpdateDate,Concession=1 where TaxpayerID=" + TaxpayerID, baglan);

                cmd.Parameters.AddWithValue("CompanyName", txtvergiod.Text);
                cmd.Parameters.AddWithValue("RegistrationAdress", huquqiunvan.Text);
                cmd.Parameters.AddWithValue("PostIndex", poctindex.Text);
                if (dovletqeydtarix.Text == "")
                {
                    cmd.Parameters.AddWithValue("RegistrLegaldate", dovletqeydtarix.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("RegistrLegaldate", dovletqeydtarix.Date);
                }
                cmd.Parameters.AddWithValue("VOEN", voen.Text);
                cmd.Parameters.AddWithValue("Gender", cins);
                cmd.Parameters.AddWithValue("SName", soyadi.Text);
                cmd.Parameters.AddWithValue("Name", adi.Text);
                cmd.Parameters.AddWithValue("FName", ataadi.Text);
                cmd.Parameters.AddWithValue("YVOK", YVOK);
                cmd.Parameters.AddWithValue("Email", email.Text);
                cmd.Parameters.AddWithValue("Mobiltel", mobiltel.Text);
                cmd.Parameters.AddWithValue("Workltel", iwtel.Text);
                cmd.Parameters.AddWithValue("Hometel", evtel.Text);
                cmd.Parameters.AddWithValue("Fax", fax.Text);
                string vaxt1 = klas.getdatacell("select getdate() as indikivaxt");
                cmd.Parameters.AddWithValue("UpdateDate", Convert.ToDateTime(vaxt1).ToString("yyyy-MM-dd"));
                cmd.ExecuteNonQuery();
                Response.Redirect("LegalUpdate.aspx?IndividualLegal=2");
            }
            else
            {
                lblBilgi.Text = "Bu vergi ödəyicisi qeydiyyatdan keçib";
            }
       }
       else if (islem == "yeni")
       {
           DataRow drform = klas.GetDataRow("SELECT TaxpayerID from Taxpayer where   ForDelete=1 and  VOEN='" + voen.Text + "' and MunicipalID=" + MunicipalId);
           if (drform == null)
           {

               SqlConnection baglan = klas.baglan();
               SqlCommand cmd = new SqlCommand(@"Insert into Taxpayer (Gender,MunicipalID,RegistrPetitondate,
CompanyName,RegistrationAdress,PostIndex,RegistrLegaldate,VOEN,SName,Name,FName,YVOK,Email,
Mobiltel,Workltel,Hometel,Fax,Individual_Legal,Concession) 
values(@Gender,@MunicipalID,getdate(),@CompanyName,@RegistrationAdress,@PostIndex,@RegistrLegaldate,
@VOEN,@SName,@Name,@FName,@YVOK,@Email,@Mobiltel,@Workltel,@Hometel,@Fax,@Individual_Legal,1)", baglan);
               cmd.Parameters.AddWithValue("MunicipalID", MunicipalId);
   


               if (erizeqeydtarixi.Text == "")
               {
                   string vaxt = klas.getdatacell("select getdate()  vaxt");
                   cmd.Parameters.AddWithValue("RegistrPetitondate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));
               }
               else
               {
                   cmd.Parameters.AddWithValue("RegistrPetitondate", erizeqeydtarixi.Text);
               }
               cmd.Parameters.AddWithValue("CompanyName", txtvergiod.Text);
               cmd.Parameters.AddWithValue("RegistrationAdress", huquqiunvan.Text);
               cmd.Parameters.AddWithValue("PostIndex", poctindex.Text);
               if (dovletqeydtarix.Text == "")
               {
                   cmd.Parameters.AddWithValue("RegistrLegaldate", dovletqeydtarix.Text);
               }
               else
               {
                   cmd.Parameters.AddWithValue("RegistrLegaldate", dovletqeydtarix.Date);
               }
               cmd.Parameters.AddWithValue("VOEN", voen.Text);
               cmd.Parameters.AddWithValue("Gender", cins);
               cmd.Parameters.AddWithValue("SName", soyadi.Text);
               cmd.Parameters.AddWithValue("Name", adi.Text);
               cmd.Parameters.AddWithValue("FName", ataadi.Text);
               cmd.Parameters.AddWithValue("YVOK", YVOK);
               cmd.Parameters.AddWithValue("Email", email.Text);
               cmd.Parameters.AddWithValue("Mobiltel", mobiltel.Text);
               cmd.Parameters.AddWithValue("Workltel", iwtel.Text);
               cmd.Parameters.AddWithValue("Hometel", evtel.Text);
               cmd.Parameters.AddWithValue("Fax", fax.Text);
               cmd.Parameters.AddWithValue("Individual_Legal", 2);
               cmd.ExecuteNonQuery();
               Response.Redirect(prevPage + "&islem=1");
           }
           else
           {
               lblBilgi.Text = "Bu vergi ödəyicisi qeydiyyatdan keçib";
           }
       }


    }
    protected void btnyeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("LegalUpdate.aspx?islem=yeni&IndividualLegal=2");
    }
}

   
    
