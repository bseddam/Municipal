using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://10.10.192.1/Service.asmx")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]

public class Service : System.Web.Services.WebService
{
    public Service ()
    {

      //  Uncomment the following line if using designed components 
      //  InitializeComponent(); 
    }
   
    [WebMethod]
    public DataTable GetPaymentList(string yvok, string passwordbld)
    {
        if (passwordbld == "=Bld2016dlB+")
        {
            Class2 conn = new Class2();
            yvok = seo.temizle(yvok);
            DataRow dr = conn.GetDataRow(@"Select * from taxpayer where YVOK = '" + yvok + "'");
            if (dr != null)
            {
                string taxpayerID = dr["TaxpayerID"].ToString();
                MethotAll municipal = new MethotAll();

                //  DataTable dt = new DataTable();
                // dt = municipal.GetTaxesObjects(taxpayerID);
                if (municipal.GetTaxesObjects(taxpayerID) != null)
                {
                    return municipal.GetTaxesObjects(taxpayerID);
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
        else
        {
            return null;
        }
    }
    [WebMethod]
    public DataTable GetPaymentListPincode(string Pincode, string passwordbld)
    {
        if (passwordbld == "=Bld2016dlB+")
        {
            Class2 conn = new Class2();
            Pincode = seo.temizle(Pincode);
            DataTable dt = conn.getdatatable(@"Select * from taxpayer where Pincode = '" + Pincode + "' order by MunicipalName desc");
            DataTable dt2 = new DataTable();
            int i = 0;
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string taxpayerID = dr["TaxpayerID"].ToString();
                    MethotAll municipal = new MethotAll();

                    DataTable dt1 = new DataTable();
                    // dt = municipal.GetTaxesObjects(taxpayerID);
                    if (municipal.GetTaxesObjects(taxpayerID) != null)
                    {
                        dt1 = municipal.GetTaxesObjects(taxpayerID);
                        i++;
                        if (i == 1)
                        {
                            dt2 = dt1;
                        }
                    }
                    else
                    {
                        dt1 = null;
                    }


                    if (i > 1)
                    {
                        if (dt1 != null)
                        {
                            
                            for (int j = 0; j < dt1.Rows.Count;j++ )
                            {
                                DataRow dr1 = dt2.NewRow();
                                dr1["RayonID"] = dt1.Rows[j]["RayonID"].ToString();
                                dr1["BelediyyeID"] = dt1.Rows[j]["BelediyyeID"].ToString();
                                dr1["RayonSheher"] = dt1.Rows[j]["RayonSheher"].ToString();
                                dr1["Belediyye"] = dt1.Rows[j]["Belediyye"].ToString();
                                dr1["OdeyiciID"] = dt1.Rows[j]["OdeyiciID"].ToString();
                                dr1["OdeyiciAdi"] = dt1.Rows[j]["OdeyiciAdi"].ToString();
                                dr1["VergiTipi"] = dt1.Rows[j]["VergiTipi"].ToString();
                                dr1["VergiAdi"] = dt1.Rows[j]["VergiAdi"].ToString();
                                dr1["Mebleg"] = dt1.Rows[j]["Mebleg"].ToString();
                                dr1["HesabNomresi"] = dt1.Rows[j]["HesabNomresi"].ToString();
                                dr1["BankAdi"] = dt1.Rows[j]["BankAdi"].ToString();
                                dt2.Rows.Add(dr1);
                            }
                        }
                    }
                }
                return dt2;
            }
            else
            {
                return null;
            }
            
        }
        else
        {
            return null;
        }
    }
    [WebMethod]
    public bool SendPayForInsert(string OdeyiciID, string VergiTipi, string Mebleg, string passwordbld)
    {
        MethotAll municipal = new MethotAll();
        try
        {
            if (passwordbld == "=Bld2016dlB+")
            {
                municipal.InserTaxes(OdeyiciID, VergiTipi, Mebleg);
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    public object AuthenticationInformation { get; set; }
}