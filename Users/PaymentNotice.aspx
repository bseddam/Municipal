<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="PaymentNotice.aspx.cs" Inherits="Users_PaymentNotice" %>


<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlhtml.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title></title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <style type="text/css">
        p.MsoNormal {
            font-size: 11.0pt;
            font-family: "Times New Roman","sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }

        p.MsoListParagraph {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: .5in;
            margin-bottom: .0001pt;
            font-size: 11.0pt;
            font-family: "Times New Roman","sans-serif";
        }

        .auto-style3 {
            width: 167px;
        }

        .auto-style4 {
            width: 185px;
        }

        .auto-style5 {
            width: 198px;
        }

        .auto-style7 {
            width: 103px;
        }

        .auto-style8 {
            width: 167px;
            height: 44px;
        }

        .auto-style9 {
            width: 185px;
            height: 44px;
        }

        .auto-style10 {
            width: 198px;
            height: 44px;
        }

        .auto-style11 {
            width: 103px;
            height: 44px;
        }

        .auto-style12 {
            height: 44px;
        }

        .MsoListParagraph {
            width: 1006px;
        }

        .auto-style383 {
            float: left;
            width: 257px;
        }

        .auto-style384 {
            float: left;
            width: 122px;
        }
        .auto-style385 {
            float: left;
            width: 149px;
        }
        .auto-style386 {
            float: left;
            width: 258px;
        }
        </style>
    <%--        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <br />
    <br />

    <table class="nav-justified">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
            </td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;   </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;
            </td>
            <td class="auto-style5">&nbsp;
            </td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;   </td>
        </tr>
        <%-- <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">Tədiyə bildirişinin növü
                </td>
                <td class="auto-style5"><dx:ASPxComboBox ID="cmbtediyye" runat="server" OnSelectedIndexChanged="cmbtediyye_SelectedIndexChanged" AutoPostBack="True">
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;   </td>
            </tr>--%>
        <div id="pnlsanksiya" visible="false" runat="server">
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style9">Maliyyə sanksiyyası:
                </td>
                <td class="auto-style10">
                    <dx:ASPxTextBox ID="txtsanksiya" runat="server" Width="170px">
                        <ValidationSettings ValidationGroup="Group1">
                        </ValidationSettings>
                    </dx:ASPxTextBox>

                </td>
                <td class="auto-style11">
                    <dx:ASPxButton ID="btnsanksiya" runat="server" Text="Yadda saxla" ValidationGroup="Group1" OnClick="btnsanksiya_Click"></dx:ASPxButton>
                </td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtsanksiya" Display="Dynamic" ValidationGroup="Group1" Font-Bold="True" Font-Size="15pt"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="txtsanksiya" Display="Dynamic" ErrorMessage="*" Font-Bold="True" Font-Size="15pt" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" />
                </td>
            </tr>
        </div>
    </table>







    <div>&nbsp;</div>
    <asp:Panel ID="pnlhtml" runat="server">

        <div style="clear: both; width: 1004px;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1004px">
                <div style="float: left; width: 236px; font-weight: bold;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 194px; font-weight: bold; font-size: 15px;">Tədiyyə Bildirişi</div>
                <div style="float: left; width: 71px;">Seriya № </div>
                <div style="text-align: center; float: left; width: 179px; border-bottom: 1px solid #000;">
                    &nbsp;<asp:Label ID="lblseria" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>


        <div style="clear: both; width: 1009px;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1004px">
                <div style="float: left; width: 242px; font-weight: bold;">&nbsp;</div>
                <%-- <div style="text-align: center; float: left; width: 179px;">(<asp:Label ID="lbltorem" runat="server"></asp:Label>)</div>--%>
            </div>
        </div>
        <div style="clear: both; width: 1015px;"></div>
        <div>&nbsp;</div>




        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1006px">
                <div style="float: left; width: 27px; font-weight: bold;">1.</div>
                <div style="text-align: center; float: left; width: 600px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblbeladi" runat="server"></asp:Label>
                    &nbsp;
                </div>
                <div style="margin-left: 50px; text-align: center; float: left; width: 200px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblbeltel" runat="server"></asp:Label>
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="MsoListParagraph">
            <div style="text-align: center; float: left; width: 627px;">(bələdiyyənin adı)</div>
            <div style="margin-left: 50px; text-align: center; float: left; width: 200px;">(bələdiyyənin telefonu)</div>
        </div>
        <div style="clear: both; width: 1007px;"></div>
        <div>&nbsp;</div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">2.</div>
                <div style="text-align: center; float: left; width: 450px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lbladsoyad" runat="server"></asp:Label>
                    &nbsp;
                </div>
                <div style="margin-left: 50px; text-align: center; float: left; width: 350px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblodtel" runat="server"></asp:Label>
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="MsoListParagraph">
            <div style="text-align: center; float: left; width: 477px;">(vergi ödəyicisinin soyadı, adı, atasının adı)</div>
            <div style="margin-left: 50px; text-align: center; float: left; width: 350px;">(vergi ödəyicisinin telefonu)</div>
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">3.</div>
                <div style="text-align: center; float: left; width: 600px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblodunvan" runat="server"></asp:Label>
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="MsoListParagraph">
            <div style="text-align: center; float: left; width: 627px;">(vergi ödəyicisinin ünvanı)</div>
        </div>




        <div style="clear: both; width: 1014px;"></div>
        <div>&nbsp;</div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">4.</div>
                <div style="float: left; width: 250px;"><b>YVÖK</b> - yerli vergi ödəyicisinin kodu:</div>
                <div style="text-align: center; float: left; width: 444px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblyvok" runat="server" Font-Bold="true"></asp:Label>
                        &nbsp;</span>
                </div>

            </div>
        </div>



        <div style="clear: both; width: 1016px;"></div>
        <div>&nbsp;</div>
        <p class="MsoNormal" style="margin-right: -.25pt; line-height: 115%">
            <b><span lang="AZ-CYR" style="font-weight: bold;">5</span><span lang="AZ-LATIN">.</span></b><span lang="AZ-LATIN"> <b><span>&nbsp;</span>Sizə<span>&nbsp;&nbsp; </span>
                <asp:Label ID="trxili" runat="server"></asp:Label>
                &nbsp;&nbsp;ili üçün</b><span>&nbsp;&nbsp; </span><b><span>&nbsp;</span>Azərbaycan Respublikasının Vergi Məcəlləsinin</b></span>
        </p>




        <div style="clear: both;"></div>

        <div style="float: left; font-weight: bold; width: 72px;" lang="AZ-LATIN">
            198.1.1 –ci
        </div>

        <div style="float: left; width: 258px;" lang="AZ-LATIN">
            <span>&nbsp;&nbsp; </span>maddəsinə əsasən<b>&nbsp;&nbsp;&nbsp;&nbsp;əmlak vergisi </b>
        </div>
        <div style="float: left; text-align: center; border-bottom: 1px solid #000; width: 200px;" lang="AZ-LATIN">
            &nbsp;<asp:Label ID="lblevergi" runat="server"></asp:Label>
            &nbsp;

        </div>
        <div style="text-align: center; float: left; width: 54px;">
            &nbsp;manat
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>






        <div style="clear: both;"></div>

        <div style="float: left; font-weight: bold; width: 72px;" lang="AZ-LATIN">
            206.3 –cü
        </div>

        <div style="float: left; width: 258px;" lang="AZ-LATIN">
            <span>&nbsp;&nbsp; </span>maddəsinə əsasən<b>&nbsp;&nbsp;&nbsp;&nbsp;torpaq vergisi </b>
        </div>
        <div style="float: left; text-align: center; border-bottom: 1px solid #000; width: 200px;" lang="AZ-LATIN">
            &nbsp;<asp:Label ID="lbltvergi" runat="server"></asp:Label>
            &nbsp;

        </div>
        <div style="text-align: center; float: left; width: 155px;">
            &nbsp;manat hesablanmışdır.
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>




        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 25px; font-weight: bold;">6.</div>
                <div style="float: left; width: 195px;">
                    Verginin ödənilmə müddəti:
                </div>
                <div style="float: left; width: 180px">
                    <span>15.08.<asp:Label ID="lbltrx1" runat="server"></asp:Label>
                        &nbsp;tarixinədək</span>
                </div>
                <div style="text-align: center; float: left; width: 275px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lbltarixindenman" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>

        <div style="clear: both;"></div>
        <div>&nbsp;</div>






        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 25px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 195px;">
                    &nbsp;
                </div>
                <div style="float: left; width: 180px">
                    <span>15.11.<asp:Label ID="lbltrx2" runat="server"></asp:Label>
                        &nbsp;tarixinədək</span>
                </div>
                <div style="text-align: center; float: left; width: 275px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lbltarixedekman" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>




        <div style="clear: both;"></div>
        <div>&nbsp;</div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">7.</div>
                <div style="float: left; width: 205px;">Ötən dövrlər üzrə vergi borcu:</div>
                <div style="text-align: center; float: left; width: 444px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblborc" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">8.</div>
                <div style="float: left; width: 205px;">Faiz məbləği:</div>
                <div style="text-align: center; float: left; width: 444px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblfaizmeb" runat="server">0</asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">9.</div>
                <div style="float: left; width: 205px;">Maliyyə sanksiyyası:</div>
                <div style="text-align: center; float: left; width: 444px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblmaliyesanksiya" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>


        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">10.</div>
                <div style="float: left; width: 205px; font-weight: bold;">ÖDƏNİLƏCƏK MƏBLƏĞ:</div>
                <div style="text-align: center; float: left; width: 444px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblodcekmebleg" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>


        <div style="clear: both;"></div>
        

        <p class="MsoNormal" style="margin-right: -.25pt">
            <b><span lang="AZ-CYR">11. Vergi bələdiyyənin
            <asp:Label ID="bank" runat="server"></asp:Label>
                yerləşən VÖEN
            <asp:Label ID="voen" runat="server"></asp:Label>,
            <asp:Label ID="hesabn" runat="server"></asp:Label>
                №-li hesabına Hökumət Ödəniş Portalı üzərindən bank &nbsp;və poçt şöbələri, ödəniş terminalı vasit</span><span>ə</span><span lang="AZ-CYR">silə nağd,&nbsp;www.gpp.az&nbsp;saytından isə ödəniş kartları vasitəsilə ödənilməlidir.</span></b>
        </p>

        <p class="MsoNormal" style="margin-right: -.25pt">
            <b><span lang="AZ-LATIN">12.</span></b><span lang="AZ-LATIN">&nbsp; Vergi müəyyən edilmiş müddətdə ödənilmədikdə vergi məcəlləsinin 59.1-ci maddəsinə əsasən ödənmə müddətindən sonrakı hər bir ötmüş gün üçün ödənilməmiş vergi məbləğinin 0,1 %&nbsp; məbləğində faiz tutulacaq və maliyyə sanksiyyası tətbiq ediləcək.</span>
        </p>






        <div>&nbsp;</div>
        <div style="clear: both;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 220px;">
                    <asp:Label ID="mehsul" runat="server" Font-Bold="True"></asp:Label>&nbsp;
                </div>
                <div style="text-align: center; float: left; width: 280px; border-bottom: 1px solid #000;">
                    &nbsp;<span><asp:Label ID="lblsedradsoy" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="text-align: center; float: left; width: 40px;">&nbsp;</div>
                <div style="float: left; width: 100px; border-bottom: 1px solid #000;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 40px;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 100px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblsedrtarix" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
            </div>
        </div>



        <div style="clear: both;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 220px;">&nbsp;</div>
                <div style="float: left; width: 280px; text-align: center;">(soyadı, adı, atasının adı)&nbsp;</div>
                <div style="text-align: center; float: left; width: 40px;">&nbsp;</div>
                <div style="float: left; width: 100px; text-align: center;">(imza)</div>
                <div style="text-align: center; float: left; width: 40px;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 100px;">(tarix)</div>
            </div>
        </div>
        <div style="clear: both;"></div>
        

         <div>&nbsp;</div>
        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto">
            &nbsp;<span lang="AZ-CYR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;M. Y.<o:p></o:p></span>
        </p>
        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto">
            <span lang="AZ-CYR"><span>&nbsp;&nbsp;&nbsp; </span>-------------------------------------------------<span>&nbsp; </span>KƏSİLMƏ XƏTTİ<span>&nbsp; </span>--------------------------------------------------------</span>
        </p>


        <div style="clear: both;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1004px">
                <div style="float: left; width: 236px; font-weight: bold;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 194px; font-weight: bold; font-size: 13px;">Tədiyyə  bildirişinin kötüyü</div>
                <div style="float: left; width: 71px;">Seriya № </div>
                <div style="text-align: center; float: left; width: 179px; border-bottom: 1px solid #000;">
                    &nbsp;<asp:Label ID="seriakotuk" runat="server"></asp:Label>
                </div>
            </div>
        </div>



         <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 120px;"><b>Bələdiyyənin adı:</b></div>
                <div style="text-align: center; float: left; width: 150px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblbelediyyeadi" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 37px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 160px;"><b>Bələdiyyənin ünvanı:</b></div>
                  <div style="text-align: center; float: left; width:350px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblbelunvani" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
            </div>
        </div>


        <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 80px;"><b>YVÖK:</b></div>
                <div style="text-align: center; float: left; width: 150px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblyvok1" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
                <div style="float: left; width: 37px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 140px;"><b>Ödəyicinin ünvanı:</b></div>
                  <div style="text-align: center; float: left; width:410px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblodunvan1" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
            </div>
        </div>

                


        <div style="clear: both;"></div>
        <div>&nbsp;</div>


        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 44px; font-weight: bold;">MƏN</div>
                <div style="text-align: center; float: left; width: 608px; border-bottom: 1px solid #000;">
                    <span>
                        <asp:Label ID="lblmen" runat="server"></asp:Label>
                        &nbsp;</span>
                </div>
            </div>
        </div>
        <div style="clear: both;"></div>

        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 44px; font-weight: bold;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 608px;">
                    <span>(vergi ödəyicisinin soyadı, adı, atasının adı)
                        &nbsp;</span>
                </div>
            </div>
        </div>

        <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 137px;">
                    <asp:Label ID="lbltrxili2" runat="server"></asp:Label>
                    &nbsp;ili üçün
                </div>
                <div style="text-align: center; float: left; width: 516px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblhesmanat" runat="server"></asp:Label>
                    &nbsp;
                </div>
                <div style="float: left; width: 100px;">manat</div>
            </div>
        </div>

        <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 987px">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 173px;">məbləğində  hesablanmış</div>
                <div style="text-align: center; float: left; width: 361px; border-bottom: 1px solid #000;">
                    <asp:Label ID="lblvergiadi" runat="server"></asp:Label>
                    &nbsp;
                </div>
                <div style="float: left; width: 273px;">vergisinə aid tədiyə bildirişini aldım</div>
            </div>
        </div>

        <div style="clear: both;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR">
                <div style="float: left; width: 27px; font-weight: bold;">&nbsp;</div>
                <div style="float: left; width: 173px;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 356px;">(verginin adı)</div>
                <div style="float: left; width: 273px;">&nbsp;</div>
            </div>
        </div>



        <div style="clear: both;"></div>
        <div>&nbsp;</div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1011px">
                <div style="float: left; width: 24px;">&nbsp;</div>
                <div style="float: left; width: 235px; border-bottom: 1px solid #000;">&nbsp;&nbsp;</div>
                <div style="float: left; width: 63px;">&nbsp;</div>
                <div style="text-align: center; float: left; width: 173px; border-bottom: 1px solid #000;">
                    &nbsp;<asp:Label ID="lbltariximza" runat="server"></asp:Label>
                    &nbsp;
                </div>
                <div style="text-align: right; float: left; width: 148px;">Tel:&nbsp;&nbsp;&nbsp;&nbsp; </div>
                <div style="text-align: center; float: left; width: 245px; border-bottom: 1px solid #000;">
                    &nbsp;<asp:Label ID="lblodeyicitel" runat="server"></asp:Label>
                    &nbsp;
                </div>
            </div>
        </div>


        <div style="clear: both;"></div>
        <div class="MsoNormal">
            <div lang="AZ-CYR" style="width: 1011px">
                <div style="float: left; width: 24px;">&nbsp;</div>
                <div style="float: left; width: 235px; text-align: center;">(vergi ödəyicisinin imzası) </div>
                <div style="float: left; width: 63px;">&nbsp;</div>
                <div style="float: left; width: 173px; text-align: center;">(tarix)</div>
                <div style="text-align: right; float: left; width: 148px;">&nbsp; </div>
                <div style="float: left; width: 245px; text-align: center;">(vergi ödəyicisinin telefonu)</div>
            </div>
        </div>


    </asp:Panel>

    <div>&nbsp;</div>
    <div>&nbsp;</div>

</asp:Content>

