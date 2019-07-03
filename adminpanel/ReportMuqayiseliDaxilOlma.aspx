<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ReportMuqayiseliDaxilOlma.aspx.cs" Inherits="adminpanel_Income" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        p.MsoListParagraphCxSpFirst {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: .5in;
            margin-bottom: .0001pt;
            font-size: 12.0pt;
            font-family: "Arial","sans-serif";
        }

        p.MsoListParagraphCxSpMiddle {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: .5in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 12.0pt;
            font-family: "Arial","sans-serif";
        }

        p.MsoListParagraphCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: .5in;
            line-height: 115%;
            font-size: 12.0pt;
            font-family: "Arial","sans-serif";
        }

        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: "Arial","sans-serif";
        }

        p.MsoListParagraph {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: .5in;
            line-height: 115%;
            font-size: 12.0pt;
            font-family: "Arial","sans-serif";
        }

     
       
        .auto-style3
        {
            font-weight: bold;
            text-align: center;
        }
        .auto-style4
        {
            width: 32px;
        }

        .rmdo3x
        {
            width:100%;

        }
       
        .auto-style5
        {
            width: 100%;
            height: 95px;
        }
        .auto-style6
        {
            text-align: right;
            width: 459px;
        }
        .auto-style7
        {
            width: 459px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

    <br />


     <table class="auto-style5">
          <%--  <tr>
                <td class="rmdo8"></td>
                <td class="rmdo9">Rayon:</td>
                <td class="rmdo10">
                    <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="rmdo11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="rmdo12"></td>
                <td class="rmdo13">Bələdiyyə:</td>
                <td class="rmdo14">
                    <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="rmdo15"></td>
            </tr>--%>
            <tr>
                <td class="rmdo12"></td>
                <td class="auto-style6">Hesabat ili:</td>
                <td class="text-left">
                    <asp:DropDownList ID="cmbhesabatili" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="rmdo15"></td>
            </tr>
            <tr>
                <td class="rmdo12">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="text-left">
                    <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    <br />
    <div align="center">
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" OnClick="btnprint_Click" />
    </div>
    <br />
    <br />
    <div id="pnlhtml" runat="server" >
    <p align="center" class="MsoListParagraphCxSpFirst" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <b><span lang="AZ-LATIN">
            <asp:label runat="server" ID="LabelBashliq" text=""></asp:label>
        </span></b>
    </p>
    <p align="center" class="MsoListParagraphCxSpMiddle" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <b><span lang="AZ-LATIN"></span></b>
    </p>
    <p align="center" class="MsoListParagraphCxSpLast" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <a name="_GoBack"></a><span lang="AZ-LATIN"><span>&nbsp;</span></span>
    </p>

    <table align="center" border="1" cellpadding="0" cellspacing="0" class="rmdo16">
        <tr class="rmdo25">
            <td colspan="2" valign="top" class="auto-style4">
                <b>S/n</b></td>
            <td valign="top" class="text-center" valign="center">
                <b>Yerli vergi və örənişlər</b></td>
            <td valign="top" class="text-center" colspan="3">
               <b> Daxil olmuş vəsait (manatla)</b></td>
        </tr>
        <tr>
            <td valign="top" class="rmdo26" colspan="3">
                &nbsp;</td>
            <td valign="top" width="111" class="auto-style3">
                <span lang="AZ-LATIN" style="text-align:center">
            <asp:label runat="server" text="" ID="label1"></asp:label>
        </span>
            </td>
            <td valign="top" width="111" class="auto-style3">
                <span lang="AZ-LATIN">
            <asp:label runat="server" text="" ID="label2"></asp:label>
        </span>
            </td>
            <td valign="top" width="111" class="auto-style3">
                <span lang="AZ-LATIN">
            <asp:label runat="server" text="Fərq, %-lə" ID="label3"></asp:label>
        </span>
            </td>
        </tr>
        <tr>
            <td valign="top" class="rmdo26" colspan="3">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                  <b>  Yerli vergi və ödənişlər üzrə daxil olmaların cəmi:</b></p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblcemOtenIl" runat="server">0</asp:Label>
                    
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblCemBuIl" runat="server">0</asp:Label>
                    
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblCemFaiz" runat="server">0</asp:Label>
                    
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" class="rmdo17" colspan="6">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; text-align: center;">
                  <b>&nbsp;</b></p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    1</p>
            </td>
            <td colspan="2" valign="top" class="rmdo17">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    İlin əvvəlinə qalıq</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblQaliqOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblQaliqBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblQaliqFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" class="rmdo17" colspan="6">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; text-align: center;">
                  <b>  Vergilər</b></p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    1</p>
            </td>
            <td colspan="2" valign="top" class="rmdo17">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Torpaq vergisi</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTorpaqOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTorpaqBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTorpaqFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    2</p>
            </td>
            <td colspan="2" valign="top" class="rmdo27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Əmlak vergisi</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblEmlakOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblEmlakBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblEmlakFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    3</p>
            </td>
            <td colspan="2" valign="top" class="rmdo27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Mədən vergisi</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMedenOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMedenBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMedenFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    4</p>
            </td>
            <td colspan="2" valign="top" class="rmdo17">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Bələdiyyələrin hüquqi şəxslərinin mənfəət vergisi</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMenfeetOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMenfeetBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMenfeetFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td colspan="6" valign="top" class="rmdo19">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; font-weight: bold; text-align: center;">
                    Ödənişlər</p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    1</p>
            </td>
            <td colspan="2" valign="top" >
                   <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
   
                Küçə (divar) reklamının yerləşdirilməsi və yayımı üçün ödəniş</p></td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblReklamOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblReklamBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblReklamFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo28">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    2</p>
            </td>
            <td colspan="2" valign="top">
                   <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
   
                Stasionar və ya səyyar ticarət ictimai iaşə və digər xidmətlərə görə ödəniş
                       </p></td>
            <td valign="top" width="111" class="rmdo28">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTicaretOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTicaretBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblTicaretFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    3</p>
            </td>
            <td colspan="2" valign="top" class="rmdo17">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMehmanxanaOtenIl" runat="server">0</asp:Label>
                    </span>
                    
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMehmanxanaBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblMehmanxanaFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    4</p>
            </td>
            <td colspan="2" valign="top" class="rmdo27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblNeqliyyatOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblNeqliyyatBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblNeqliyyatFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    5</p>
            </td>
            <td colspan="2" valign="top" class="rmdo29">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsindən daxil olan ödəniş</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblBelediyyeOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblBelediyyeBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblBelediyyeFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    6</p>
            </td>
            <td colspan="2" valign="top" class="rmdo27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblicareOtenIl" runat="server" Text="0"></asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblicareBuIl" runat="server" Text="0"></asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblicareFaiz" runat="server" Text="0"></asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    7</p>
            </td>
            <td colspan="2" valign="top" class="rmdo29">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    İanələrdən daxilolmalar</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblIaneOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblIaneBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblIaneFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    8</p>
            </td>
            <td colspan="2" valign="top" class="rmdo29">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                   Dövlət tərəfindən verilən dotasiya</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblDotasiyaOtenIl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblDotasiyaBuIl" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblDotasiyaFaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    9</p>
            </td>
            <td colspan="2" valign="top" class="rmdo29">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    Sanksiyaya görə ödəniş</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblsanksiyaotenil" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblsanksiyabuil" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblsanksiyafaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        <tr>
            <td valign="top" width="34" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    10</p>
            </td>
            <td colspan="2" valign="top" class="rmdo29">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                   Digər gəlirlər</p>
            </td>
            <td valign="top" width="111" class="rmdo17">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lbldigerotenil" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lbldigerbuil" runat="server">0</asp:Label>
                    </span>
                </td>
            <td valign="top" width="111" class="text-center">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lbldigerfaiz" runat="server">0</asp:Label>
                    </span>
                </td>
        </tr>
        </table>
        </div>
    <p align="center" class="MsoNormal" style="text-align: center">
        <span lang="AZ-LATIN">
            
        &nbsp;
        </span>
    </p>
    <p align="center" class="MsoNormal" style="text-align: center">
        <span lang="AZ-LATIN">
            
        &nbsp;
        </span>
    </p>

    <div style="clear: both;"></div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>

</asp:Content>

