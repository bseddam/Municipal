using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Users_Municipincome : System.Web.UI.Page
{
    Class2 klas = new Class2(); static string prevPage = String.Empty; string islem; 
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            islem = Request.QueryString["islem"];
        }
        catch 
        { }
        if (!Page.IsPostBack)
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
            DataRow drxerc = klas.GetDataRow("select * from IncomeForYear where MunicipalID=" + MunicipalId + " order by IncomeID desc");
            if (drxerc != null)
            {
                lblqaliq0.Text = drxerc["lblqaliq0"].ToString();
                lbliane.Text = drxerc["lbliane"].ToString();
                lblumumigelir.Text = drxerc["lblumumigelir"].ToString();
                lbldotasiya.Text = drxerc["lbldotasiya"].ToString();
                lblumumixerc.Text = drxerc["lblumumixerc"].ToString();
                lblqaliq.Text = drxerc["lblqaliq"].ToString();
                lblfiziki.Text = drxerc["lblfiziki"].ToString();
                lblguzestli.Text=drxerc["lblguzestli"].ToString();
                lblguzestsiz.Text=drxerc["lblguzestsiz"].ToString();
                lblhuquqi.Text=drxerc["lblhuquqi"].ToString();
                lblqeydealmiw.Text=drxerc["lblqeydealmiw"].ToString();
                lblfizemlak.Text=drxerc["lblfizemlak"].ToString();
                lblfizemlak4.Text=drxerc["lblfizemlak4"].ToString();
                lblfizemlak0.Text=drxerc["lblfizemlak0"].ToString();
                lblfizemlak1.Text=drxerc["lblfizemlak1"].ToString();
                lblfizemlak2.Text=drxerc["lblfizemlak2"].ToString();
                lblfizemlak3.Text=drxerc["lblfizemlak3"].ToString();
                lblodeeml.Text=drxerc["lblodeeml"].ToString();
                lblodeeml1.Text=drxerc["lblodeeml1"].ToString();
                lblodeeml2.Text=drxerc["lblodeeml2"].ToString();
                lblcarieml.Text=drxerc["lblcarieml"].ToString();
                lbloteneml.Text=drxerc["lbloteneml"].ToString();
                lbltorpsayi.Text=drxerc["lbltorpsayi"].ToString();
                lbltorpsahe.Text=drxerc["lbltorpsahe"].ToString();
                lblheyet.Text=drxerc["lblheyet"].ToString();
                lblheyet1.Text=drxerc["lblheyet1"].ToString();
                lblheyet0.Text=drxerc["lblheyet0"].ToString();
                lblsahibkar.Text=drxerc["lblsahibkar"].ToString();
                lblsahibkar0.Text=drxerc["lblsahibkar0"].ToString();
                lblkendt.Text=drxerc["lblkendt"].ToString();
                lblkendt0.Text=drxerc["lblkendt0"].ToString();
                lblodtorp.Text=drxerc["lblodtorp"].ToString();
                lblcaritorp.Text=drxerc["lblcaritorp"].ToString();
                lblotencaritorp.Text=drxerc["lblotencaritorp"].ToString();
                lblmedsay.Text=drxerc["lblmedsay"].ToString();
                lblmedsay0.Text=drxerc["lblmedsay0"].ToString();
                lblmedkm.Text=drxerc["lblmedkm"].ToString();
                lblmedkm0.Text=drxerc["lblmedkm0"].ToString();
                medmebl.Text=drxerc["medmebl"].ToString();
                medmebl0.Text=drxerc["medmebl0"].ToString();
                menfsay.Text=drxerc["menfsay"].ToString();
                menfsay0.Text=drxerc["menfsay0"].ToString();
                menfmeb.Text=drxerc["menfmeb"].ToString();
                menfdax.Text=drxerc["menfdax"].ToString();
                menfdax0.Text=drxerc["menfdax0"].ToString();
                reksay.Text=drxerc["reksay"].ToString();
                rekolcusu.Text=drxerc["rekolcusu"].ToString();
                reksay0.Text=drxerc["reksay0"].ToString();
                rekolcusu0.Text=drxerc["rekolcusu0"].ToString();
                rekmebleg.Text=drxerc["rekmebleg"].ToString();
                rekmebleg0.Text=drxerc["rekmebleg0"].ToString();
                hotelsay.Text=drxerc["hotelsay"].ToString();
                hotelsay0.Text=drxerc["hotelsay0"].ToString();
                hoteladam.Text=drxerc["hoteladam"].ToString();
                hoteladam0.Text = drxerc["hoteladam0"].ToString();
                hotelmebl.Text=drxerc["hotelmebl"].ToString();
                hotelmebl0.Text=drxerc["hotelmebl0"].ToString();
                avtsay.Text=drxerc["avtsay"].ToString();
                avtsay0.Text=drxerc["avtsay0"].ToString();
                avttutum.Text=drxerc["avttutum"].ToString();
                avtpark.Text=drxerc["avtpark"].ToString();
                avtmebleg.Text=drxerc["avtmebleg"].ToString();
                avtmebleg0.Text=drxerc["avtmebleg0"].ToString();
                sexssay.Text=drxerc["sexssay"].ToString();
                sexssay0.Text=drxerc["sexssay0"].ToString();
                sexsmebl.Text=drxerc["sexsmebl"].ToString();
                sexsmebl0.Text=drxerc["sexsmebl0"].ToString();
                mulkmebl1.Text=drxerc["mulkmebl1"].ToString();
                mulkmebl0.Text=drxerc["mulkmebl0"].ToString();
                icaremebl1.Text=drxerc["icaremebl1"].ToString();
                icaremebl0.Text=drxerc["icaremebl0"].ToString();
            }

        }
    }
    protected void btnyaddasaxla_Click(object sender, EventArgs e)
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
        DataRow drxerc = klas.GetDataRow("select * from IncomeForYear where MunicipalID=" + MunicipalId);
        if (drxerc == null)
        {
            SqlConnection baglan = klas.baglan();
            SqlCommand cmd = new SqlCommand(@"Insert into IncomeForYear (MunicipalID,lblqaliq0,lbliane,lblumumigelir,lbldotasiya,lblumumixerc,lblqaliq,lblfiziki,lblguzestli,lblguzestsiz,lblhuquqi,lblqeydealmiw,
lblfizemlak,lblfizemlak4,lblfizemlak0,lblfizemlak1,lblfizemlak2,lblfizemlak3,lblodeeml
,lblodeeml1,lblodeeml2,lblcarieml,lbloteneml,lbltorpsayi,lbltorpsahe,lblheyet,lblheyet1,lblheyet0,lblsahibkar,lblsahibkar0,lblkendt,lblkendt0
,lblodtorp,lblcaritorp,lblotencaritorp,lblmedsay,lblmedsay0,lblmedkm,lblmedkm0,medmebl,medmebl0,menfsay,menfsay0,menfmeb,menfdax,menfdax0,reksay
,rekolcusu,reksay0,rekolcusu0,rekmebleg,rekmebleg0,hotelsay,hotelsay0,hoteladam,hoteladam0,hotelmebl,hotelmebl0,avtsay,avtsay0,avttutum,avtpark
,avtmebleg,avtmebleg0,sexssay,sexssay0,sexsmebl,sexsmebl0,mulkmebl1,mulkmebl0,icaremebl1,icaremebl0) values 
(@MunicipalID,@lblqaliq0,@lbliane,@lblumumigelir,@lbldotasiya,@lblumumixerc,@lblqaliq,@lblfiziki,@lblguzestli,@lblguzestsiz,@lblhuquqi,@lblqeydealmiw,@lblfizemlak,@lblfizemlak4,@lblfizemlak0,@lblfizemlak1,@lblfizemlak2,
@lblfizemlak3,@lblodeeml,@lblodeeml1,@lblodeeml2,@lblcarieml,@lbloteneml,@lbltorpsayi,@lbltorpsahe,@lblheyet,@lblheyet1,@lblheyet0,@lblsahibkar,
@lblsahibkar0,@lblkendt,@lblkendt0,@lblodtorp,@lblcaritorp,@lblotencaritorp,@lblmedsay,@lblmedsay0,@lblmedkm,@lblmedkm0,@medmebl,@medmebl0,@menfsay,
@menfsay0,@menfmeb,@menfdax,@menfdax0,@reksay,@rekolcusu,@reksay0,@rekolcusu0,@rekmebleg,@rekmebleg0,@hotelsay,@hotelsay0,@hoteladam,@hoteladam0,@hotelmebl,
@hotelmebl0,@avtsay,@avtsay0,@avttutum,@avtpark,@avtmebleg,@avtmebleg0,@sexssay,@sexssay0,@sexsmebl,@sexsmebl0,@mulkmebl1,@mulkmebl0,@icaremebl1,
@icaremebl0)", baglan);
            cmd.Parameters.Add("MunicipalID", MunicipalId);
            cmd.Parameters.Add("lblqaliq0", lblqaliq0.Text);
            cmd.Parameters.Add("lbliane", lbliane.Text);
            cmd.Parameters.Add("lblumumigelir", lblumumigelir.Text);
            cmd.Parameters.Add("lbldotasiya", lbldotasiya.Text);
            cmd.Parameters.Add("lblumumixerc", lblumumixerc.Text);
            cmd.Parameters.Add("lblqaliq", lblqaliq.Text);
            cmd.Parameters.Add("lblfiziki", lblfiziki.Text);
            cmd.Parameters.Add("lblguzestli", lblguzestli.Text);
            cmd.Parameters.Add("lblguzestsiz", lblguzestsiz.Text);
            cmd.Parameters.Add("lblhuquqi", lblhuquqi.Text);
            cmd.Parameters.Add("lblqeydealmiw", lblqeydealmiw.Text);
            cmd.Parameters.Add("lblfizemlak", lblfizemlak.Text);
            cmd.Parameters.Add("lblfizemlak4", lblfizemlak4.Text);
            cmd.Parameters.Add("lblfizemlak0", lblfizemlak0.Text);
            cmd.Parameters.Add("lblfizemlak1", lblfizemlak1.Text);
            cmd.Parameters.Add("lblfizemlak2", lblfizemlak2.Text);
            cmd.Parameters.Add("lblfizemlak3", lblfizemlak3.Text);
            cmd.Parameters.Add("lblodeeml", lblodeeml.Text);
            cmd.Parameters.Add("lblodeeml1", lblodeeml1.Text);
            cmd.Parameters.Add("lblodeeml2", lblodeeml2.Text);
            cmd.Parameters.Add("lblcarieml", lblcarieml.Text);
            cmd.Parameters.Add("lbloteneml", lbloteneml.Text);
            cmd.Parameters.Add("lbltorpsayi", lbltorpsayi.Text);
            cmd.Parameters.Add("lbltorpsahe", lbltorpsahe.Text);
            cmd.Parameters.Add("lblheyet", lblheyet.Text);
            cmd.Parameters.Add("lblheyet1", lblheyet1.Text);
            cmd.Parameters.Add("lblheyet0", lblheyet0.Text);
            cmd.Parameters.Add("lblsahibkar", lblsahibkar.Text);
            cmd.Parameters.Add("lblsahibkar0", lblsahibkar0.Text);
            cmd.Parameters.Add("lblkendt", lblkendt.Text);
            cmd.Parameters.Add("lblkendt0", lblkendt0.Text);
            cmd.Parameters.Add("lblodtorp", lblodtorp.Text);
            cmd.Parameters.Add("lblcaritorp", lblcaritorp.Text);
            cmd.Parameters.Add("lblotencaritorp", lblotencaritorp.Text);
            cmd.Parameters.Add("lblmedsay", lblmedsay.Text);
            cmd.Parameters.Add("lblmedsay0", lblmedsay0.Text);
            cmd.Parameters.Add("lblmedkm", lblmedkm.Text);
            cmd.Parameters.Add("lblmedkm0", lblmedkm0.Text);
            cmd.Parameters.Add("medmebl", medmebl.Text);
            cmd.Parameters.Add("medmebl0", medmebl0.Text);
            cmd.Parameters.Add("menfsay", menfsay.Text);
            cmd.Parameters.Add("menfsay0", menfsay0.Text);
            cmd.Parameters.Add("menfmeb", menfmeb.Text);
            cmd.Parameters.Add("menfdax", menfdax.Text);
            cmd.Parameters.Add("menfdax0", menfdax0.Text);
            cmd.Parameters.Add("reksay", reksay.Text);
            cmd.Parameters.Add("rekolcusu", rekolcusu.Text);
            cmd.Parameters.Add("reksay0", reksay0.Text);
            cmd.Parameters.Add("rekolcusu0", rekolcusu0.Text);
            cmd.Parameters.Add("rekmebleg", rekmebleg.Text);
            cmd.Parameters.Add("rekmebleg0", rekmebleg0.Text);
            cmd.Parameters.Add("hotelsay", hotelsay.Text);
            cmd.Parameters.Add("hotelsay0", hotelsay0.Text);
            cmd.Parameters.Add("hoteladam", hoteladam.Text);
            cmd.Parameters.Add("hoteladam0", hoteladam0.Text);
            cmd.Parameters.Add("hotelmebl", hotelmebl.Text);
            cmd.Parameters.Add("hotelmebl0", hotelmebl0.Text);
            cmd.Parameters.Add("avtsay", avtsay.Text);
            cmd.Parameters.Add("avtsay0", avtsay0.Text);
            cmd.Parameters.Add("avttutum", avttutum.Text);
            cmd.Parameters.Add("avtpark", avtpark.Text);
            cmd.Parameters.Add("avtmebleg", avtmebleg.Text);
            cmd.Parameters.Add("avtmebleg0", avtmebleg0.Text);
            cmd.Parameters.Add("sexssay", sexssay.Text);
            cmd.Parameters.Add("sexssay0", sexssay0.Text);
            cmd.Parameters.Add("sexsmebl", sexsmebl.Text);
            cmd.Parameters.Add("sexsmebl0", sexsmebl0.Text);
            cmd.Parameters.Add("mulkmebl1", mulkmebl1.Text);
            cmd.Parameters.Add("mulkmebl0", mulkmebl0.Text);
            cmd.Parameters.Add("icaremebl1", icaremebl1.Text);
            cmd.Parameters.Add("icaremebl0", icaremebl0.Text);
            //cmd.CommandTimeout = 300;
            //cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Connection.Close();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Municipincome.aspx");
        }
        else {
            SqlConnection baglan = klas.baglan();
            SqlCommand cmd = new SqlCommand(@"Update  IncomeForYear set lblqaliq0=@lblqaliq0,lbliane=@lbliane,lblumumigelir=@lblumumigelir,lbldotasiya=@lbldotasiya,lblumumixerc=@lblumumixerc,lblqaliq=@lblqaliq,lblfiziki=@lblfiziki,lblguzestli=@lblguzestli,lblguzestsiz=@lblguzestsiz,lblhuquqi=@lblhuquqi,lblqeydealmiw=@lblqeydealmiw,
lblfizemlak=@lblfizemlak,lblfizemlak4=@lblfizemlak4,lblfizemlak0=@lblfizemlak0,lblfizemlak1=@lblfizemlak1,lblfizemlak2=@lblfizemlak2,lblfizemlak3=@lblfizemlak3,lblodeeml=@lblodeeml
,lblodeeml1=@lblodeeml1,lblodeeml2=@lblodeeml2,lblcarieml=@lblcarieml,lbloteneml=@lbloteneml,lbltorpsayi=@lbltorpsayi,lbltorpsahe=@lbltorpsahe,lblheyet=@lblheyet,lblheyet1=@lblheyet1,lblheyet0=@lblheyet0,lblsahibkar=@lblsahibkar,lblsahibkar0=@lblsahibkar0,lblkendt=@lblkendt,lblkendt0=@lblkendt0
,lblodtorp=@lblodtorp,lblcaritorp=@lblcaritorp,lblotencaritorp=@lblotencaritorp,lblmedsay=@lblmedsay,lblmedsay0=@lblmedsay0,lblmedkm=@lblmedkm,lblmedkm0=@lblmedkm0,medmebl=@medmebl,medmebl0=@medmebl0,menfsay=@menfsay,menfsay0=@menfsay0,menfmeb=@menfmeb,menfdax=@menfdax,menfdax0=@menfdax0,reksay=@reksay
,rekolcusu=@rekolcusu,reksay0=@reksay0,rekolcusu0=@rekolcusu0,rekmebleg=@rekmebleg,rekmebleg0=@rekmebleg0,hotelsay=@hotelsay,hotelsay0=@hotelsay0,hoteladam=@hoteladam,hoteladam0=@hoteladam0,hotelmebl=@hotelmebl,hotelmebl0=@hotelmebl0,avtsay=@avtsay,avtsay0=@avtsay0,avttutum=@avttutum,avtpark=@avtpark
,avtmebleg=@avtmebleg,avtmebleg0=@avtmebleg0,sexssay=@sexssay,sexssay0=@sexssay0,sexsmebl=@sexsmebl,sexsmebl0=@sexsmebl0,mulkmebl1=@mulkmebl1,mulkmebl0=@mulkmebl0,icaremebl1=@icaremebl1,icaremebl0=@icaremebl0  where MunicipalID=" + MunicipalId, baglan);
            cmd.Parameters.Add("lblqaliq0", lblqaliq0.Text);
            cmd.Parameters.Add("lbliane", lbliane.Text);
            cmd.Parameters.Add("lblumumigelir", lblumumigelir.Text);
            cmd.Parameters.Add("lbldotasiya", lbldotasiya.Text);
            cmd.Parameters.Add("lblumumixerc", lblumumixerc.Text);
            cmd.Parameters.Add("lblqaliq", lblqaliq.Text);
            cmd.Parameters.Add("lblfiziki", lblfiziki.Text);
            cmd.Parameters.Add("lblguzestli", lblguzestli.Text);
            cmd.Parameters.Add("lblguzestsiz", lblguzestsiz.Text);
            cmd.Parameters.Add("lblhuquqi", lblhuquqi.Text);
            cmd.Parameters.Add("lblqeydealmiw", lblqeydealmiw.Text);
            cmd.Parameters.Add("lblfizemlak", lblfizemlak.Text);
            cmd.Parameters.Add("lblfizemlak4", lblfizemlak4.Text);
            cmd.Parameters.Add("lblfizemlak0", lblfizemlak0.Text);
            cmd.Parameters.Add("lblfizemlak1", lblfizemlak1.Text);
            cmd.Parameters.Add("lblfizemlak2", lblfizemlak2.Text);
            cmd.Parameters.Add("lblfizemlak3", lblfizemlak3.Text);
            cmd.Parameters.Add("lblodeeml", lblodeeml.Text);
            cmd.Parameters.Add("lblodeeml1", lblodeeml1.Text);
            cmd.Parameters.Add("lblodeeml2", lblodeeml2.Text);
            cmd.Parameters.Add("lblcarieml", lblcarieml.Text);
            cmd.Parameters.Add("lbloteneml", lbloteneml.Text);
            cmd.Parameters.Add("lbltorpsayi", lbltorpsayi.Text);
            cmd.Parameters.Add("lbltorpsahe", lbltorpsahe.Text);
            cmd.Parameters.Add("lblheyet", lblheyet.Text);
            cmd.Parameters.Add("lblheyet1", lblheyet1.Text);
            cmd.Parameters.Add("lblheyet0", lblheyet0.Text);
            cmd.Parameters.Add("lblsahibkar", lblsahibkar.Text);
            cmd.Parameters.Add("lblsahibkar0", lblsahibkar0.Text);
            cmd.Parameters.Add("lblkendt", lblkendt.Text);
            cmd.Parameters.Add("lblkendt0", lblkendt0.Text);
            cmd.Parameters.Add("lblodtorp", lblodtorp.Text);
            cmd.Parameters.Add("lblcaritorp", lblcaritorp.Text);
            cmd.Parameters.Add("lblotencaritorp", lblotencaritorp.Text);
            cmd.Parameters.Add("lblmedsay", lblmedsay.Text);
            cmd.Parameters.Add("lblmedsay0", lblmedsay0.Text);
            cmd.Parameters.Add("lblmedkm", lblmedkm.Text);
            cmd.Parameters.Add("lblmedkm0", lblmedkm0.Text);
            cmd.Parameters.Add("medmebl", medmebl.Text);
            cmd.Parameters.Add("medmebl0", medmebl0.Text);
            cmd.Parameters.Add("menfsay", menfsay.Text);
            cmd.Parameters.Add("menfsay0", menfsay0.Text);
            cmd.Parameters.Add("menfmeb", menfmeb.Text);
            cmd.Parameters.Add("menfdax", menfdax.Text);
            cmd.Parameters.Add("menfdax0", menfdax0.Text);
            cmd.Parameters.Add("reksay", reksay.Text);
            cmd.Parameters.Add("rekolcusu", rekolcusu.Text);
            cmd.Parameters.Add("reksay0", reksay0.Text);
            cmd.Parameters.Add("rekolcusu0", rekolcusu0.Text);
            cmd.Parameters.Add("rekmebleg", rekmebleg.Text);
            cmd.Parameters.Add("rekmebleg0", rekmebleg0.Text);
            cmd.Parameters.Add("hotelsay", hotelsay.Text);
            cmd.Parameters.Add("hotelsay0", hotelsay0.Text);
            cmd.Parameters.Add("hoteladam", hoteladam.Text);
            cmd.Parameters.Add("hoteladam0", hoteladam0.Text);
            cmd.Parameters.Add("hotelmebl", hotelmebl.Text);
            cmd.Parameters.Add("hotelmebl0", hotelmebl0.Text);
            cmd.Parameters.Add("avtsay", avtsay.Text);
            cmd.Parameters.Add("avtsay0", avtsay0.Text);
            cmd.Parameters.Add("avttutum", avttutum.Text);
            cmd.Parameters.Add("avtpark", avtpark.Text);
            cmd.Parameters.Add("avtmebleg", avtmebleg.Text);
            cmd.Parameters.Add("avtmebleg0", avtmebleg0.Text);
            cmd.Parameters.Add("sexssay", sexssay.Text);
            cmd.Parameters.Add("sexssay0", sexssay0.Text);
            cmd.Parameters.Add("sexsmebl", sexsmebl.Text);
            cmd.Parameters.Add("sexsmebl0", sexsmebl0.Text);
            cmd.Parameters.Add("mulkmebl1", mulkmebl1.Text);
            cmd.Parameters.Add("mulkmebl0", mulkmebl0.Text);
            cmd.Parameters.Add("icaremebl1", icaremebl1.Text);
            cmd.Parameters.Add("icaremebl0", icaremebl0.Text);
            //cmd.CommandTimeout = 300;
            //cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Connection.Close();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Municipincome.aspx");
        }
    }

}