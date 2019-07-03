<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="MunicipalIncome.aspx.cs" Inherits="Users_MunicipalIncome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

     
        .auto-style3x {
            width: 100%;
        }

        .auto-style12 {
            width: 378px;
            height: 43px;
        }

        .auto-style13 {
            width: 100px;
            height: 43px;
        }

        .auto-style14 {
            width: 205px;
            height: 43px;
        }

        .auto-style15 {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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


     <table class="auto-style3x">
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Hesabat ili:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbhesabatili" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">
                    <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    <br />
    <div align="center">
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>
    <br />
    <br />
    <div id="pnlhtml" runat="server" >
    <p align="center" class="MsoListParagraphCxSpFirst" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <b><span lang="AZ-LATIN">Bələdiyyə tərəfindən yerli vergi və
        
        
        </span></b>
    </p>
    <p align="center" class="MsoListParagraphCxSpMiddle" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <b><span lang="AZ-LATIN">ödənişlərin yığılmasına dair məlumat</span></b></p>
    <p align="center" class="MsoListParagraphCxSpLast" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
        <a name="_GoBack"></a><span lang="AZ-LATIN"><span>&nbsp;</span></span>
    </p>

    <table align="center" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Ümumi məlumat:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Rayonların sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                     <span lang="AZ-LATIN"><asp:Label ID="lblrayonsay" runat="server">0</asp:Label></span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Bələdiyyənin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblbelsay" runat="server">0</asp:Label>
                    
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    -</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Fiziki və hüquqi şəxslərdən qeydə alınmış tədiyyəçilərin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblqeydealmiw" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    o cümlədən</p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Hüquqi şəxslərin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblhuquqi" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Fiziki şəxslərin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfiziki" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Güzəştli tədiyyəçilərin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblguzestli" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN"> Güzəştsiz tədiyyəçilərin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblguzestsiz" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Fiziki şəxslərdən əmlak vergisi üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə olan fiziki şəxslərə məxsus yaşayış və qeyri-yaşayış sahələri  üzrə əmlakın ümumi sahəsi (m<sup>2</sup>)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx29" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə olan fiziki şəxslərə məxsus yaşayış və qeyri-yaşayış sahələri üzrə əmlakın sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak4" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">o cümlədən</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Yaşayış sahələri üzrə əmlakın ümumi sahəsi</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
            <td colspan="3" valign="top" width="26">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td valign="top" width="501">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak1" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Qeyri-yaşayış sahələri üzrə əmlakın ümumi sahəsi</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak2" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
            <td colspan="3" valign="top" width="26">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td valign="top" width="501">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblfizemlak3" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Uçota götürülmüş vergi ödəyicilərinin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblodeeml" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
          <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">yaşayış sahəsi üzrə</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblodeeml1" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="2" valign="top" width="23">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="4" valign="top" width="527">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">qeyri yaşayış sahəsi üzrə</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblodeeml2" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
          <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx1" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblcarieml" runat="server">0</asp:Label>
                    
                    </span></p>
            </td>
        </tr>
          <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx2" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lbloteneml" runat="server">0</asp:Label>
                    </span></p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Fiziki şəxslərdən torpaq vergisi üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span></p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx0" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə mülkiyyətində və istifadədə olan torpaq sahələrinin ümumi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <asp:Label ID="lbltorpsayi" runat="server">0</asp:Label>
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Yaşayış sahələri üzrə fiziki şəxslərin mülkiyyətində və istifadəsində olan torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lbltorpsahe" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">o cümlədən</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">fiziki şəxslərin mülkiyyətində olan həyətyanı torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblheyet" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">fiziki şəxslərin istifadəsində olan həyatyanı torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblheyet1" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
            <td colspan="2" valign="top" width="24">
                <p class="MsoNormal" style="margin-top: 0in; margin-right: 1.35pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td valign="top" width="501">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblheyet0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">sahibkarlıq məqsədi ilə istifadə olunan torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblsahibkar" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" width="25">
                <p class="MsoListParagraph" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
            <td colspan="2" valign="top" width="24">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td valign="top" width="501">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblsahibkar0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" width="524">
                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.1pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">kənd təsərrüfatı məqsədi ilə istifadə olunan torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblkendt" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
            <td colspan="2" valign="top" width="24">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td valign="top" width="501">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur (ha)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblkendt0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">Uçota götürülmüş vergi ödəyicilərinin sayı</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblodtorp" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
          <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx22" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblcaritorp" runat="server">0</asp:Label>
                    
                    </span></p>
            </td>
        </tr>
          <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx23" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblotencaritorp" runat="server">0</asp:Label>
                    </span></p>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Yerli əhəmiyyətli tikinti materialları üzrə mədən vergisi üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx3" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə yerli əhəmiyyətli tikinti materiallarını hasil edən şəxslərin cəmi sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblmedsay" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="4" valign="top" width="27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="2" valign="top" width="522">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan uçota götürülmüşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblmedsay0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">yerli əhəmiyyətli tikinti materiallarının hasil edilmiş həcmi (kubmetr)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblmedkm" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan vergiyə cəlb olunmuşdur (kubmetr)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="lblmedkm0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx4" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="medmebl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx5" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="medmebl0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoListParagraph" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Bələdiyyə mülkiyyətində olan hüquqi şəxslərin mənfəət vergisi üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx6" runat="server"></asp:Label>
                        &nbsp;tarixə bələdiyyə mülkiyyətində olan müəssisə və xidmət sahələrinin cəmi sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="menfsay" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td valign="top" width="21">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="5" valign="top" width="528">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">o cümlədən fəaliyyət göstərən müəssisələrin və xidmət sahələrinin sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="menfsay0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx7" runat="server"></asp:Label>
                        &nbsp;tarixə müəssisə və xidmət sahələri tərəfindən <span>&nbsp;</span>əldə olunmuş mənfəətin məbləği (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="menfmeb" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx8" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="menfdax" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx9" runat="server"></asp:Label>
                        &nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="menfdax0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Küçə (divar) reklamının yayımı üçün ödəniş:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx10" runat="server"></asp:Label>
                        &nbsp;tarixə bələdiyyə mülkiyyətində olan torpaq, bina və digər obyektlərdə yerləşdirilmiş reklam daşıyıcılarının</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">cəmi sayı</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <asp:Label ID="reksay" runat="server">0</asp:Label>
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">cəmi ölçüsü (m<sup>2</sup>)</span>
                </p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="RU">
                        
                    <asp:Label ID="rekolcusu" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="4" valign="top" width="27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="2" valign="top" width="522">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">ödənişə cəlb olunmuş reklam daşıyıcılarının sayı</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <asp:Label ID="reksay0" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="4" valign="top" width="27">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="2" valign="top" width="522">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">ödənişə cəlb olunmuş reklam daşıyıcılarının ölçüsü (m<sup>2</sup>)</span>
                </p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="rekolcusu0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx11" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="rekmebleg" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx12" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="rekmebleg0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx13" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərin cəmi sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
               
                    <asp:Label ID="hotelsay" runat="server">0</asp:Label>
                
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="4" valign="top" width="27">
                <p class="MsoNormal" style="margin-top: 0in; margin-right: 5.65pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="2" valign="top" width="522">
                <p class="MsoNormal" style="margin-top: 0in; margin-right: 5.65pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan ödənişə cəlb olunmuşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="hotelsay0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">ərazidə gecələmələrin cəmi sayı (adam gecə)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="hoteladam" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                </p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx14" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="hotelmebl" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                </p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx15" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    
                    <span lang="RU">
                    <asp:Label ID="hotelmebl0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                </p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx16" runat="server"></asp:Label>
                        &nbsp;tarixə ərazidə ixtisaslaşdırılmış avtomobil dayanacaqlarının (yeraltı və yerüstü parkinqlər) sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="avtsay" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan ödənişə cəlb olunmuşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="avtsay0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">həmin dayanacaqların tutumu (avtomobillərin sayı)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="RU">
                        
                    <asp:Label ID="avttutum" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">həmin dayanacaqlarda parklanmış nəqliyyat vasitələrinin sayı</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="RU">
                        
                    <asp:Label ID="avtpark" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx17" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="avtmebleg" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx18" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="avtmebleg0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Stasionar və ya səyyar ticarət, ictimai iaşə və digər xidmətlərə görə ödəniş üzrə:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx19" runat="server"></asp:Label>
                        &nbsp;tarixə <span>&nbsp;</span>ərazidə xidmət göstərən şəxslərin cəmi sayı</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="sexssay" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="3" valign="top" width="25">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">-</span>
                </p>
            </td>
            <td colspan="3" valign="top" width="524">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">onlardan <span>&nbsp;</span>ödənişə cəlb olunmuşdur</span></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="sexssay0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx20" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="sexsmebl" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        &nbsp;</span></p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx21" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="sexsmebl0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsinə görə ödəniş:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx25" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="mulkmebl1" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx26" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="mulkmebl0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx27" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="icaremebl1" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx28" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    <span lang="RU">
                    <asp:Label ID="icaremebl0" runat="server">0</asp:Label>
                    </span>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="7" valign="top" width="584">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <b><span lang="AZ-LATIN">Sanksiyaya görə ödəniş:</span></b></p>
            </td>
            <td valign="top" width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">
                        
                    &nbsp;
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx30" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        
                    <span lang="RU">
                    <asp:Label ID="sankmebl" runat="server">0</asp:Label>
                    </span>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="34">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    &nbsp;</p>
            </td>
            <td colspan="6" valign="top" width="550">
                <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                    <span lang="AZ-LATIN">31.12.<asp:Label ID="lbltrx31" runat="server"></asp:Label>
                        &nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
            </td>
            <td width="111">
                <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        
                    <span lang="RU">
                    <asp:Label ID="sankmebl0" runat="server">0</asp:Label>
                    </span>
                </p>
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

