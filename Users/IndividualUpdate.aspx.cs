using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.IO;

public partial class Users_Individual : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    Class2 klas = new Class2(); string islem; string TaxpayerID="";
    protected void Page_Load(object sender, EventArgs e)
    {
       

        try
        {
            islem = Request.QueryString["islem"];
            if (TaxpayerID == "")
            {
                if (Session["TaxpayerID"] != null)
                    TaxpayerID = Session["TaxpayerID"].ToString();

            }
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

            guzewt();
            if (islem == "duzelis")
            {
                DataRow drodeyici = klas.GetDataRow("sELECT * from Taxpayer where TaxpayerID=" + TaxpayerID);
                erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());
                soyadi.Text = drodeyici["SName"].ToString();
                adi.Text = drodeyici["Name"].ToString();
                ataadi.Text = drodeyici["FName"].ToString();
                vesnomre.Text = drodeyici["IDcardsNumber"].ToString();
                vespinkod.Text = drodeyici["Pincode"].ToString();
                vesverorqan.Text = drodeyici["IDcardsIssuing"].ToString();
                vesvertarix.Date = Convert.ToDateTime(drodeyici["IDcardsGiveDate"].ToString()).Date; 
    
                dogumyeri.Text = drodeyici["Birthplace"].ToString();
                dogumtarixi.Date = Convert.ToDateTime(drodeyici["BirthDate"].ToString()).Date; 
   
                milliyeti.Text = drodeyici["Nationality"].ToString();
                vetendasligi.Text = drodeyici["Citizenship"].ToString();
                if (drodeyici["Gender"].ToString() == "1")
                {
                    rdman.Checked = true;
                }
                else
                {
                    rdwoman.Checked = true;
                }

                poctindex.Text = drodeyici["PostIndex"].ToString();
                qeydiyyatadres.Text = drodeyici["RegistrationAdress"].ToString();
                faktikiadres.Text = drodeyici["ActualAdress"].ToString();
                email.Text = drodeyici["Email"].ToString();
                mobiltel.Text = drodeyici["Mobiltel"].ToString();
                iwtel.Text = drodeyici["Workltel"].ToString();
                evtel.Text = drodeyici["Hometel"].ToString();
                fax.Text = drodeyici["Fax"].ToString();
                //rd.Text = drodeyici["Concession"].ToString();

                if (drodeyici["Concession"].ToString() == "1")
                {
                    rdguzewtsiz.Checked = true;
                    rdguzewtli.Checked = false;
                    pnlguzewt.Visible = false;
                }
                else
                {
                    rdguzewtsiz.Checked = false;
                    rdguzewtli.Checked = true;
                    pnlguzewt.Visible = true;
                }
                
                guzvertewkilat.Text = drodeyici["ConcessionGiveOrgan"].ToString();
                if (drodeyici["ConcessionCauseID"].ToString() != "" && drodeyici["ConcessionCauseID"].ToString() != null)
                {
                    guzsebeb.Value = drodeyici["ConcessionCauseID"].ToString();
                }
                guzseriya.Text = drodeyici["ConcessionSeries"].ToString();
                guznomre.Text = drodeyici["ConcessionNumber"].ToString();
                guzverilme.Date = Convert.ToDateTime(drodeyici["ConcessionGiveDate"].ToString()).Date; 

            }
            else if(islem=="baxis"){

                soyadi.Enabled = false;
                adi.Enabled = false;
                ataadi.Enabled = false;
                vesnomre.Enabled = false;
                vespinkod.Enabled = false;
                vesverorqan.Enabled = false;
                vesvertarix.Enabled = false;
                dogumyeri.Enabled = false;
                dogumtarixi.Enabled = false;
                milliyeti.Enabled = false;
                vetendasligi.Enabled = false;
                rdman.Enabled = false;
                rdwoman.Enabled = false;
                poctindex.Enabled = false;
                qeydiyyatadres.Enabled = false;
                faktikiadres.Enabled = false;
                email.Enabled = false;
                mobiltel.Enabled = false;
                iwtel.Enabled = false;
                evtel.Enabled = false;
                fax.Enabled = false;
                //rd.Text = drodeyici["Concession"].ToString();

                rdguzewtsiz.Enabled = false;
                rdguzewtli.Enabled = false;
                guzvertewkilat.Enabled = false;
                guzsebeb.Enabled = false;
                guzseriya.Enabled = false;
                guznomre.Enabled = false;
                guzverilme.Enabled = false;

                btnsave.Enabled = false;
                DataRow drodeyici = klas.GetDataRow("SELECT * from Taxpayer where TaxpayerID=" + TaxpayerID);
                erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());

                soyadi.Text = drodeyici["SName"].ToString();
                adi.Text = drodeyici["Name"].ToString();
                ataadi.Text = drodeyici["FName"].ToString();
                vesnomre.Text = drodeyici["IDcardsNumber"].ToString();
                vespinkod.Text = drodeyici["Pincode"].ToString();
                vesverorqan.Text = drodeyici["IDcardsIssuing"].ToString();
                vesvertarix.Date = Convert.ToDateTime(drodeyici["IDcardsGiveDate"].ToString()).Date; 
                dogumyeri.Text = drodeyici["Birthplace"].ToString();
                dogumtarixi.Date = Convert.ToDateTime(drodeyici["BirthDate"].ToString()).Date; 
                milliyeti.Text = drodeyici["Nationality"].ToString();
                vetendasligi.Text = drodeyici["Citizenship"].ToString();
                if (drodeyici["Gender"].ToString() == "1")
                {
                    rdman.Checked = true;
                }
                else
                {
                    rdwoman.Checked = true;
                }

                poctindex.Text = drodeyici["PostIndex"].ToString();
                qeydiyyatadres.Text = drodeyici["RegistrationAdress"].ToString();
                faktikiadres.Text = drodeyici["ActualAdress"].ToString();
                email.Text = drodeyici["Email"].ToString();
                mobiltel.Text = drodeyici["Mobiltel"].ToString();
                iwtel.Text = drodeyici["Workltel"].ToString();
                evtel.Text = drodeyici["Hometel"].ToString();
                fax.Text = drodeyici["Fax"].ToString();
                //rd.Text = drodeyici["Concession"].ToString();

                if (drodeyici["Concession"].ToString() == "1")
                {
                    rdguzewtsiz.Checked = true;
                    rdguzewtli.Checked = false;
                    pnlguzewt.Visible = false;
                }
                else
                {
                    rdguzewtsiz.Checked = false;
                    rdguzewtli.Checked = true;
                    pnlguzewt.Visible = true;
                }

                guzvertewkilat.Text = drodeyici["ConcessionGiveOrgan"].ToString();
                if (drodeyici["ConcessionCauseID"].ToString() != "" && drodeyici["ConcessionCauseID"].ToString() != null)
                {
                    guzsebeb.Value = drodeyici["ConcessionCauseID"].ToString();
                }
                guzseriya.Text = drodeyici["ConcessionSeries"].ToString();
                guznomre.Text = drodeyici["ConcessionNumber"].ToString();
                guzverilme.Date = Convert.ToDateTime(drodeyici["ConcessionGiveDate"].ToString()).Date; 
            }
            else if (islem == "yeni") {
                btnyeni.BackColor = Color.Aqua;
            }
            else
            {
                soyadi.Enabled = false;
                adi.Enabled = false;
                ataadi.Enabled = false;
                vesnomre.Enabled = false;
                vespinkod.Enabled = false;
                vesverorqan.Enabled = false;
                vesvertarix.Enabled = false;
                dogumyeri.Enabled = false;
                dogumtarixi.Enabled = false;
                milliyeti.Enabled = false;
                vetendasligi.Enabled = false;
                rdman.Checked = false;
                rdman.Enabled = false;
                rdwoman.Enabled = false;
                poctindex.Enabled = false;
                qeydiyyatadres.Enabled = false;
                faktikiadres.Enabled = false;
                email.Enabled = false;
                mobiltel.Enabled = false;
                iwtel.Enabled = false;
                evtel.Enabled = false;
                fax.Enabled = false;
                //rd.Text = drodeyici["Concession"].ToString();
                rdguzewtsiz.Checked = false;
                rdguzewtsiz.Enabled = false;
                rdguzewtli.Enabled = false;
                guzvertewkilat.Enabled = false;
                guzsebeb.Enabled = false;
                guzseriya.Enabled = false;
                guznomre.Enabled = false;
                guzverilme.Enabled = false;

                btnsave.Enabled = false;




                string MunicipalId = "";
                DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
                if (Municipal != null)
                {
                    MunicipalId = Municipal["MunicipalID"].ToString();

                }


                DataRow drodeyici = klas.GetDataRow("SELECT * from Taxpayer where  MunicipalID=" + MunicipalId + " and ForDelete=1 and Individual_Legal=1 order by Nowtime desc");

                if (drodeyici != null)
                {
                    erizeqeydtarixi.Text = klas.tarixkesdatetime(drodeyici["RegistrPetitondate"].ToString());

                    soyadi.Text = drodeyici["SName"].ToString();
                    adi.Text = drodeyici["Name"].ToString();
                    ataadi.Text = drodeyici["FName"].ToString();
                    vesnomre.Text = drodeyici["IDcardsNumber"].ToString();
                    vespinkod.Text = drodeyici["Pincode"].ToString();
                    vesverorqan.Text = drodeyici["IDcardsIssuing"].ToString();
                    vesvertarix.Date = Convert.ToDateTime(drodeyici["IDcardsGiveDate"].ToString()).Date; 
                    dogumyeri.Text = drodeyici["Birthplace"].ToString();
                    dogumtarixi.Date = Convert.ToDateTime(drodeyici["BirthDate"].ToString()).Date; 
                    milliyeti.Text = drodeyici["Nationality"].ToString();
                    vetendasligi.Text = drodeyici["Citizenship"].ToString();
                    if (drodeyici["Gender"].ToString() == "1")
                    {
                        rdman.Checked = true;
                    }
                    else
                    {
                        rdwoman.Checked = true;
                    }

                    poctindex.Text = drodeyici["PostIndex"].ToString();
                    qeydiyyatadres.Text = drodeyici["RegistrationAdress"].ToString();
                    faktikiadres.Text = drodeyici["ActualAdress"].ToString();
                    email.Text = drodeyici["Email"].ToString();
                    mobiltel.Text = drodeyici["Mobiltel"].ToString();
                    iwtel.Text = drodeyici["Workltel"].ToString();
                    evtel.Text = drodeyici["Hometel"].ToString();
                    fax.Text = drodeyici["Fax"].ToString();
                    //rd.Text = drodeyici["Concession"].ToString();

                    if (drodeyici["Concession"].ToString() == "1")
                    {
                        rdguzewtsiz.Checked = true;
                        rdguzewtli.Checked = false;
                        pnlguzewt.Visible = false;
                    }
                    else
                    {
                        rdguzewtsiz.Checked = false;
                        rdguzewtli.Checked = true;
                        pnlguzewt.Visible = true;
                    }

                    guzvertewkilat.Text = drodeyici["ConcessionGiveOrgan"].ToString();
                    if (drodeyici["ConcessionCauseID"].ToString() != "" && drodeyici["ConcessionCauseID"].ToString() != null)
                    {
                        guzsebeb.Value = drodeyici["ConcessionCauseID"].ToString();
                    }
                    guzseriya.Text = drodeyici["ConcessionSeries"].ToString();
                    guznomre.Text = drodeyici["ConcessionNumber"].ToString();
                    guzverilme.Date = Convert.ToDateTime(drodeyici["ConcessionGiveDate"].ToString()).Date; 
                }
            }
        }
    }

    protected void DeleteRecord(object sender, EventArgs e)
    {
        string TaxpayerID = (sender as LinkButton).CommandArgument.ToString();
        klas.cmd("Update  Taxpayer set Fordelete=0 Where TaxpayerID=" + TaxpayerID);
        guzewt();
    }
    void guzewt()
    {
        DataTable meqsed = klas.getdatatable("Select ClassifID,ClassifName,ListID from List_classifications where ListID=1 order by sort");
        guzsebeb.TextField = "ClassifName";
        guzsebeb.ValueField = "ClassifID";
        guzsebeb.DataSource = meqsed;
        guzsebeb.DataBind();
        guzsebeb.Items.Insert(0, new ListEditItem("Seçin", "-1"));
        guzsebeb.SelectedIndex = 0;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

        int cins; int guzewt;
        if (rdman.Checked)
        {
            cins = 1;
        }
        else {
            cins = 2;
        }
        if (rdguzewtsiz.Checked)
        {
            guzewt = 1;
        }
        else {
            guzewt = 2;
        }

        string MunicipalId = ""; string MunicipalName = ""; string BLDkodu = "";
        DataRow Municipal = klas.GetDataRow(@"Select lm.MunicipalName,lm.MunicipalID,lm.Municipal_code from Users u inner join List_classification_Municipal lm on u.MunicipalID=lm.MunicipalID Where  UserID=" + Session["UserID"].ToString());
        if (Municipal != null)
        {
            MunicipalId = Municipal["MunicipalID"].ToString();
            MunicipalName = Municipal["MunicipalName"].ToString();
            BLDkodu = Municipal["Municipal_code"].ToString();
        }
        string YVOK = BLDkodu + "1" + vespinkod.Text;

        if (islem == "duzelis")
        {

            DataRow drform = klas.GetDataRow(@"SELECT TaxpayerID from Taxpayer where  TaxpayerID <>" + TaxpayerID + 
                "   and Pincode=N'" + vespinkod.Text + "' and MunicipalID="
                + MunicipalId);
            
            if (drform == null && klas.IsASCII(vespinkod.Text))
            {
            SqlConnection baglan = klas.baglan();
            SqlCommand cmd = new SqlCommand(@"Update Taxpayer set SName=@SName,Name=@Name,FName=@FName,
IDcardsNumber=@IDcardsNumber,Pincode=@Pincode,IDcardsIssuing=@IDcardsIssuing,IDcardsGiveDate=@IDcardsGiveDate,
Birthplace=@Birthplace,BirthDate=@BirthDate,Nationality=@Nationality,Citizenship=@Citizenship,Gender=@Gender,YVOK=@YVOK,PostIndex=@PostIndex,
RegistrationAdress=@RegistrationAdress,ActualAdress=@ActualAdress,Email=@Email,Mobiltel=@Mobiltel,Workltel=@Workltel,Hometel=@Hometel,Fax=@Fax,
Concession=@Concession,ConcessionGiveOrgan=@ConcessionGiveOrgan,ConcessionCauseID=@ConcessionCauseID,ConcessionCause=@ConcessionCause,
ConcessionSeries=@ConcessionSeries,ConcessionNumber=@ConcessionNumber,ConcessionGiveDate=@ConcessionGiveDate,
UpdateDate=@UpdateDate where TaxpayerID=" + TaxpayerID, baglan);


            cmd.Parameters.AddWithValue("SName", soyadi.Text);
            cmd.Parameters.AddWithValue("Name", adi.Text);
            cmd.Parameters.AddWithValue("FName", ataadi.Text);
            cmd.Parameters.AddWithValue("IDcardsNumber", vesnomre.Text);
            cmd.Parameters.AddWithValue("Pincode", vespinkod.Text);
            cmd.Parameters.AddWithValue("IDcardsIssuing", vesverorqan.Text);


            if (vesvertarix.Text == "")
            {
                cmd.Parameters.AddWithValue("IDcardsGiveDate", vesvertarix.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("IDcardsGiveDate", vesvertarix.Date);
            }


            cmd.Parameters.AddWithValue("Birthplace", dogumyeri.Text);
            if (dogumtarixi.Text == "")
            {
                cmd.Parameters.AddWithValue("BirthDate", dogumtarixi.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("BirthDate", dogumtarixi.Date);
            }
            cmd.Parameters.AddWithValue("Nationality", milliyeti.Text);
            cmd.Parameters.AddWithValue("Citizenship", vetendasligi.Text);
            cmd.Parameters.AddWithValue("Gender", cins);
            cmd.Parameters.AddWithValue("YVOK", YVOK);
            cmd.Parameters.AddWithValue("PostIndex", poctindex.Text);
            cmd.Parameters.AddWithValue("RegistrationAdress", qeydiyyatadres.Text);
            cmd.Parameters.AddWithValue("ActualAdress", faktikiadres.Text);
            cmd.Parameters.AddWithValue("Email", email.Text);
            cmd.Parameters.AddWithValue("Mobiltel", mobiltel.Text);
            cmd.Parameters.AddWithValue("Workltel", iwtel.Text);
            cmd.Parameters.AddWithValue("Hometel", evtel.Text);
            cmd.Parameters.AddWithValue("Fax", fax.Text);
            cmd.Parameters.AddWithValue("Concession", guzewt);
            if (guzewt == 2)
            {
                cmd.Parameters.AddWithValue("ConcessionCauseID", guzsebeb.Value);
                cmd.Parameters.AddWithValue("ConcessionCause", guzsebeb.SelectedItem.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("ConcessionCauseID", "0");
                cmd.Parameters.AddWithValue("ConcessionCause", "");
            }
            cmd.Parameters.AddWithValue("ConcessionGiveOrgan", guzvertewkilat.Text);


            cmd.Parameters.AddWithValue("ConcessionSeries", guzseriya.Text);
            cmd.Parameters.AddWithValue("ConcessionNumber", guznomre.Text);
            if (guzverilme.Text == "")
            {
                cmd.Parameters.AddWithValue("ConcessionGiveDate", guzverilme.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("ConcessionGiveDate", guzverilme.Date);
            }
           
            string vaxt1 = klas.getdatacell("select getdate() as indikivaxt");
            cmd.Parameters.AddWithValue("UpdateDate", Convert.ToDateTime(vaxt1).ToString("yyyy-MM-dd"));
            cmd.ExecuteNonQuery();
            Response.Redirect("IndividualUpdate.aspx?IndividualLegal=1");
            }
            else
            {
                if (!klas.IsASCII(vespinkod.Text))
                {
                    lblBilgi.Text = "Düzgün simvollardan istifadə etməmisiniz";
                }
                else
                { 
                lblBilgi.Text = "Bu vergi ödəyicisi qeydiyyatdan keçib";
                }
            }
        }
        else if (islem == "yeni") {

            DataRow drform = klas.GetDataRow("SELECT TaxpayerID from Taxpayer where Pincode=N'" + vespinkod.Text + "'   and MunicipalID=" + MunicipalId);
            if (drform == null && klas.IsASCII(vespinkod.Text))
            {
                SqlConnection baglan = klas.baglan();
                SqlCommand cmd = new SqlCommand(@"Insert into Taxpayer (MunicipalID,RegistrPetitondate,SName,Name,FName,IDcardsNumber,Pincode,
IDcardsIssuing,IDcardsGiveDate,Birthplace,BirthDate,Nationality,Citizenship,Gender,YVOK,PostIndex,RegistrationAdress,ActualAdress,Email,
Mobiltel,Workltel,Hometel,Fax,Concession,ConcessionGiveOrgan,ConcessionCauseID,ConcessionCause,ConcessionSeries,ConcessionNumber,
ConcessionGiveDate,Individual_Legal) 
values(@MunicipalID,@RegistrPetitondate,@SName,@Name,@FName,@IDcardsNumber,@Pincode,
@IDcardsIssuing,@IDcardsGiveDate,@Birthplace,@BirthDate,@Nationality,@Citizenship,@Gender,@YVOK,@PostIndex,@RegistrationAdress,@ActualAdress,
@Email,@Mobiltel,@Workltel,@Hometel,@Fax,@Concession,@ConcessionGiveOrgan,@ConcessionCauseID,@ConcessionCause,@ConcessionSeries,@ConcessionNumber,
@ConcessionGiveDate,@Individual_Legal)", baglan);
                cmd.Parameters.AddWithValue("MunicipalID", MunicipalId);

                string vaxt = klas.getdatacell("select getdate()  vaxt");

                cmd.Parameters.AddWithValue("RegistrPetitondate", Convert.ToDateTime(vaxt).ToString("yyyy-MM-dd"));


                cmd.Parameters.AddWithValue("SName", soyadi.Text);
                cmd.Parameters.AddWithValue("Name", adi.Text);
                cmd.Parameters.AddWithValue("FName", ataadi.Text);
                cmd.Parameters.AddWithValue("IDcardsNumber", vesnomre.Text);
                cmd.Parameters.AddWithValue("Pincode", vespinkod.Text);
                cmd.Parameters.AddWithValue("IDcardsIssuing", vesverorqan.Text);


                if (vesvertarix.Text == "")
                {
                    cmd.Parameters.AddWithValue("IDcardsGiveDate", vesvertarix.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("IDcardsGiveDate", vesvertarix.Date);
                }


                cmd.Parameters.AddWithValue("Birthplace", dogumyeri.Text);
                if (dogumtarixi.Text == "")
                {
                    cmd.Parameters.AddWithValue("BirthDate", dogumtarixi.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("BirthDate", dogumtarixi.Date);
                }
                cmd.Parameters.AddWithValue("Nationality", milliyeti.Text);
                cmd.Parameters.AddWithValue("Citizenship", vetendasligi.Text);
                cmd.Parameters.AddWithValue("Gender", cins);
                cmd.Parameters.AddWithValue("YVOK", YVOK);
                cmd.Parameters.AddWithValue("PostIndex", poctindex.Text);
                cmd.Parameters.AddWithValue("RegistrationAdress", qeydiyyatadres.Text);
                cmd.Parameters.AddWithValue("ActualAdress", faktikiadres.Text);
                cmd.Parameters.AddWithValue("Email", email.Text);
                cmd.Parameters.AddWithValue("Mobiltel", mobiltel.Text);
                cmd.Parameters.AddWithValue("Workltel", iwtel.Text);
                cmd.Parameters.AddWithValue("Hometel", evtel.Text);
                cmd.Parameters.AddWithValue("Fax", fax.Text);
                cmd.Parameters.AddWithValue("Concession", guzewt);
                if (guzewt == 2)
                {
                    cmd.Parameters.AddWithValue("ConcessionCauseID", guzsebeb.Value);
                    cmd.Parameters.AddWithValue("ConcessionCause", guzsebeb.SelectedItem.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("ConcessionCauseID", "0");
                    cmd.Parameters.AddWithValue("ConcessionCause", "");
                }
                cmd.Parameters.AddWithValue("ConcessionGiveOrgan", guzvertewkilat.Text);


                cmd.Parameters.AddWithValue("ConcessionSeries", guzseriya.Text);
                cmd.Parameters.AddWithValue("ConcessionNumber", guznomre.Text);
                if (guzverilme.Text == "")
                {
                    cmd.Parameters.AddWithValue("ConcessionGiveDate", guzverilme.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("ConcessionGiveDate", guzverilme.Date);
                }

                cmd.Parameters.AddWithValue("Individual_Legal", 1);
                cmd.ExecuteNonQuery();
                Response.Redirect(prevPage + "&islem=1");
            }
            else
            {
                if (klas.IsASCII(vespinkod.Text)==false)
                {
                    lblBilgi.Text = "Düzgün simvollardan istifadə etməmisiniz";
                }
                else
                {
                    lblBilgi.Text = "Bu vergi ödəyicisi qeydiyyatdan keçib";
                }
            }
        }

       
    }

    protected void rdguzewtsiz_CheckedChanged(object sender, EventArgs e)
    {
        if (rdguzewtsiz.Checked) {
            pnlguzewt.Visible = false;
            guzvertewkilat.Text = "";
            guzseriya.Text = "";
            guznomre.Text = "";
            guzverilme.Text = "";

            guzewt();
        }
    }
    protected void rdguzewtli_CheckedChanged(object sender, EventArgs e)
    {
        if (rdguzewtli.Checked)
        {
            pnlguzewt.Visible = true;
            guzvertewkilat.Text = "";
            guzseriya.Text = "";
            guznomre.Text = "";
            guzverilme.Text = "";
            guzewt();
        }
    }

    protected void btnyeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("IndividualUpdate.aspx?islem=yeni&IndividualLegal=1");
    }

   
}