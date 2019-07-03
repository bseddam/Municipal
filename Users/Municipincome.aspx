<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Municipincome.aspx.cs" Inherits="Users_Municipincome" %>

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
    <div align="center">
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
        <br />
    </div>
    <br />
    <div id="pnlhtml" runat="server" >
        <p align="center" class="MsoListParagraphCxSpFirst" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
            <b><span lang="AZ-LATIN">Bələdiyyələr tərəfindən yerli vergi və
        
        
        </span></b>
        </p>
        <p align="center" class="MsoListParagraphCxSpMiddle" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
            <b><span lang="AZ-LATIN">ödənişlərin yığılmasına dair məlumat</span></b>
        </p>
        <p align="center" class="MsoListParagraphCxSpLast" style="margin: 0in; margin-bottom: .0001pt; mso-add-space: auto; text-align: center; line-height: normal">
            <span lang="AZ-LATIN">&nbsp;</span>
        </p>
        <table align="center" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="7" valign="top" width="584">
                    <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        <b><span lang="AZ-LATIN">Ümumi məlumat:</span></b></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">01.01.2016-cı ilə qalıq (manat)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblqaliq0" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv75" runat="server" ControlToValidate="lblqaliq0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf8" runat="server" ControlToValidate="lblqaliq0" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">2016-cı ildə bələdiyyənin ümumu gəliri (dotasiya istisna olmaqla)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblumumigelir" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv70" runat="server" ControlToValidate="lblumumigelir" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf3" runat="server" ControlToValidate="lblumumigelir" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">Dövlət tərəfindən verilən dotasiya (manat)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lbldotasiya" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv71" runat="server" ControlToValidate="lbldotasiya" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf4" runat="server" ControlToValidate="lbldotasiya" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        İ<span lang="AZ-LATIN">anələrdən daxil olma (manat)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lbliane" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv74" runat="server" ControlToValidate="lbliane" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf7" runat="server" ControlToValidate="lbliane" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">2016-cı ildə bələdiyyənin ümumi xərci (manat)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblumumixerc" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv72" runat="server" ControlToValidate="lblumumixerc" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf5" runat="server" ControlToValidate="lblumumixerc" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">01.01.2017-ci ilə qalıq (manat)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblqaliq" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv73" runat="server" ControlToValidate="lblqaliq" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf6" runat="server" ControlToValidate="lblqaliq" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">Fiziki şəxslərdən qeydə alınmış tədiyyəçilərin sayı</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfiziki" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv7" runat="server" ControlToValidate="lblfiziki" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf1" runat="server" ControlToValidate="lblfiziki" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">Güzəştli tədiyyəçilərin sayı</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblguzestli" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv8" runat="server" ControlToValidate="lblguzestli" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                            <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="rf2" runat="server" ControlToValidate="lblguzestli" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">Güzəştsiz tədiyyəçilərin sayı</span></p>
                </td>
                <td valign="top" width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblguzestsiz" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv9" runat="server" ControlToValidate="lblguzestsiz" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                      <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator1" runat="server" ControlToValidate="lblguzestsiz" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
   
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
                        <span lang="AZ-LATIN">Hüquqi şəxslərdən qeydə alınmış tədiyyəçilərin sayı</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblhuquqi" runat="server" >0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv10" runat="server" ControlToValidate="lblhuquqi" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                          <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator2" runat="server" ControlToValidate="lblhuquqi" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
   
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
                        <span lang="AZ-LATIN">Qeydə alınmış tədiyyəçilərin ümumi sayı</span></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblqeydealmiw" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv11" runat="server" ControlToValidate="lblqeydealmiw" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                         <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator3" runat="server" ControlToValidate="lblqeydealmiw" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
    
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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə olan fiziki şəxslərə məxsus yaşayış və qeyri-yaşayış sahələri  üzrə əmlakın ümumi sahəsi (m<sup>2</sup>)</span></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv6" runat="server" ControlToValidate="lblfizemlak" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                         <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator4" runat="server" ControlToValidate="lblfizemlak" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
    
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə olan fiziki şəxslərə məxsus yaşayış və qeyri-yaşayış sahələri üzrə əmlakın sayı</span></p>
                </td>
                <td valign="top" width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak4" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv12" runat="server" ControlToValidate="lblfizemlak4" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                       <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator5" runat="server" ControlToValidate="lblfizemlak4" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
       
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak0" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv13" runat="server" ControlToValidate="lblfizemlak0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator6" runat="server" ControlToValidate="lblfizemlak0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">&nbsp;
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak1" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv14" runat="server" ControlToValidate="lblfizemlak1" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                          <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator7" runat="server" ControlToValidate="lblfizemlak1" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
                   
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak2" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv15" runat="server" ControlToValidate="lblfizemlak2" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator8" runat="server" ControlToValidate="lblfizemlak2" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
                   
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
                        <span lang="AZ-LATIN">&nbsp;
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
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                         <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblfizemlak3" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv16" runat="server" ControlToValidate="lblfizemlak3" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                         <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator9" runat="server" ControlToValidate="lblfizemlak3" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
  
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblodeeml" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv17" runat="server" ControlToValidate="lblodeeml" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator10" runat="server" ControlToValidate="lblodeeml" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
  
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblodeeml1" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv18" runat="server" ControlToValidate="lblodeeml1" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator11" runat="server" ControlToValidate="lblodeeml1" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
  
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
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblodeeml2" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv19" runat="server" ControlToValidate="lblodeeml2" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
                          <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator12" runat="server" ControlToValidate="lblodeeml2" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
  
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblcarieml" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv20" runat="server" ControlToValidate="lblcarieml" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                           <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator13" runat="server" ControlToValidate="lblcarieml" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
  
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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lbloteneml" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv21" runat="server" ControlToValidate="lbloteneml" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator14" runat="server" ControlToValidate="lbloteneml" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
    
                      </span>
                    </p>
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə mülkiyyətində və istifadədə olan torpaq sahələrinin ümumi ölçüsü (ha)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lbltorpsayi" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv22" runat="server" ControlToValidate="lbltorpsayi" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                         <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator15" runat="server" ControlToValidate="lbltorpsayi" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
    
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
                        <span lang="AZ-LATIN">Yaşayış sahələri üzrə fiziki şəxslərin mülkiyyətində və istifadəsində olan torpaq sahələrinin cəmi ölçüsü (ha)</span></p>
                </td>
                <td valign="top" width="111">
                        <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lbltorpsahe" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv23" runat="server" ControlToValidate="lbltorpsahe" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                       <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator16" runat="server" ControlToValidate="lbltorpsahe" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
      
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblheyet" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv24" runat="server" ControlToValidate="lblheyet" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator17" runat="server" ControlToValidate="lblheyet" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
        
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblheyet1" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv25" runat="server" ControlToValidate="lblheyet1" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                        <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator18" runat="server" ControlToValidate="lblheyet1" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
        
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
                        <span lang="AZ-LATIN">&nbsp;
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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblheyet0" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv26" runat="server" ControlToValidate="lblheyet0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                       <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator19" runat="server" ControlToValidate="lblheyet0" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
        
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
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblsahibkar" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv27" runat="server" ControlToValidate="lblsahibkar" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator20" runat="server" ControlToValidate="lblsahibkar" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
          
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
                        <span lang="AZ-LATIN">&nbsp;
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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblsahibkar0" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv28" runat="server" ControlToValidate="lblsahibkar0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator21" runat="server" ControlToValidate="lblsahibkar0" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />

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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblkendt" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv29" runat="server" ControlToValidate="lblkendt" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator22" runat="server" ControlToValidate="lblkendt" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />
                        
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
                        <span lang="AZ-LATIN">&nbsp;
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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                    <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblkendt0" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv30" runat="server" ControlToValidate="lblkendt0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator23" runat="server" ControlToValidate="lblkendt0" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />

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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblodtorp" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv31" runat="server" ControlToValidate="lblodtorp" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator24" runat="server" ControlToValidate="lblodtorp" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ</span></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblcaritorp" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv32" runat="server" ControlToValidate="lblcaritorp" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
 <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator25" runat="server" ControlToValidate="lblcaritorp" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblotencaritorp" runat="server">0</asp:TextBox>
                            <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv33" runat="server" ControlToValidate="lblotencaritorp" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator26" runat="server" ControlToValidate="lblotencaritorp" ErrorMessage="*"  ValidationGroup="Group1" Display="Dynamic" />

                          </span>
                    </p>
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə yerli əhəmiyyətli tikinti materiallarını hasil edən şəxslərin cəmi sayı</span></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblmedsay" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv34" runat="server" ControlToValidate="lblmedsay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator27" runat="server" ControlToValidate="lblmedsay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblmedsay0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv35" runat="server" ControlToValidate="lblmedsay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
 <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator28" runat="server" ControlToValidate="lblmedsay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblmedkm" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv36" runat="server" ControlToValidate="lblmedkm" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator29" runat="server" ControlToValidate="lblmedkm" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
               
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="lblmedkm0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv37" runat="server" ControlToValidate="lblmedkm0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator30" runat="server" ControlToValidate="lblmedkm0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
               
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="medmebl" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv38" runat="server" ControlToValidate="medmebl" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator31" runat="server" ControlToValidate="medmebl" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
               
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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="medmebl0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv39" runat="server" ControlToValidate="medmebl0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator32" runat="server" ControlToValidate="medmebl0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
               
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə bələdiyyə mülkiyyətində olan müəssisə və xidmət sahələrinin cəmi sayı</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="menfsay" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv40" runat="server" ControlToValidate="menfsay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
 <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator33" runat="server" ControlToValidate="menfsay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
              
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="menfsay0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv41" runat="server" ControlToValidate="menfsay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
 <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator34" runat="server" ControlToValidate="menfsay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
              
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə müəssisə və xidmət sahələri tərəfindən <span>&nbsp;</span>əldə olunmuş mənfəətin məbləği (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="menfmeb" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv42" runat="server" ControlToValidate="menfmeb" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
 <asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator35" runat="server" ControlToValidate="menfmeb" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
               
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="menfdax" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv43" runat="server" ControlToValidate="menfdax" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator36" runat="server" ControlToValidate="menfdax" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə vergi üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td valign="top" width="111">
                   <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="menfdax0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv44" runat="server" ControlToValidate="menfdax0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator37" runat="server" ControlToValidate="menfdax0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
         
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə bələdiyyə mülkiyyətində olan torpaq, bina və digər obyektlərdə yerləşdirilmiş reklam daşıyıcılarının</span></p>
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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <asp:TextBox style="text-align: center;float:left;width:117px;" ID="reksay" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv45" runat="server" ControlToValidate="reksay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator38" runat="server" ControlToValidate="reksay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">cəmi ölçüsü (m<sup>2</sup>)</span>
                    </p>
                </td>
                <td width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="rekolcusu" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv46" runat="server" ControlToValidate="rekolcusu" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator39" runat="server" ControlToValidate="rekolcusu" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="reksay0" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv47" runat="server" ControlToValidate="reksay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator40" runat="server" ControlToValidate="reksay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="rekolcusu0" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv48" runat="server" ControlToValidate="rekolcusu0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator41" runat="server" ControlToValidate="rekolcusu0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="rekmebleg" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv49" runat="server" ControlToValidate="rekmebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator42" runat="server" ControlToValidate="rekmebleg" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="rekmebleg0" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv50" runat="server" ControlToValidate="rekmebleg0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator43" runat="server" ControlToValidate="rekmebleg0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərin cəmi sayı</span></p>
                </td>
                <td valign="top" width="111">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                       <span lang="AZ-LATIN">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hotelsay" runat="server">0</asp:TextBox>
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv51" runat="server" ControlToValidate="hotelsay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator44" runat="server" ControlToValidate="hotelsay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hotelsay0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv52" runat="server" ControlToValidate="hotelsay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator45" runat="server" ControlToValidate="hotelsay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                       <span lang="AZ-LATIN">xidmət göstərilən günlərin sayı</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hoteladam" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv53" runat="server" ControlToValidate="hoteladam" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator46" runat="server" ControlToValidate="hoteladam" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                         <span lang="AZ-LATIN">xidmət göstərilən şəxslərin sayı</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hoteladam0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv76" runat="server" ControlToValidate="hoteladam0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator63" runat="server" ControlToValidate="hoteladam0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hotelmebl" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv54" runat="server" ControlToValidate="hotelmebl" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator47" runat="server" ControlToValidate="hotelmebl" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="hotelmebl0" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv55" runat="server" ControlToValidate="hotelmebl0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator48" runat="server" ControlToValidate="hotelmebl0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ərazidə ixtisaslaşdırılmış avtomobil dayanacaqlarının (yeraltı və yerüstü parkinqlər) sayı</span></p>
                </td>
                <td valign="top" width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                    <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avtsay" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv56" runat="server" ControlToValidate="avtsay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator49" runat="server" ControlToValidate="avtsay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                    <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avtsay0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv57" runat="server" ControlToValidate="avtsay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator50" runat="server" ControlToValidate="avtsay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avttutum" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv58" runat="server" ControlToValidate="avttutum" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator51" runat="server" ControlToValidate="avttutum" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">həmin dayanacaqlarda parklanmış nəqliyyat vasitələrinin sayı</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avtpark" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv59" runat="server" ControlToValidate="avtpark" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator52" runat="server" ControlToValidate="avtpark" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                      <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avtmebleg" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv60" runat="server" ControlToValidate="avtmebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator53" runat="server" ControlToValidate="avtmebleg" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="avtmebleg0" runat="server">0</asp:TextBox>
                       <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv61" runat="server" ControlToValidate="avtmebleg0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator54" runat="server" ControlToValidate="avtmebleg0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə <span>&nbsp;</span>ərazidə xidmət göstərən şəxslərin cəmi sayı</span></p>
                </td>
                <td valign="top" width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="sexssay" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv62" runat="server" ControlToValidate="sexssay" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator55" runat="server" ControlToValidate="sexssay" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="sexssay0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv63" runat="server" ControlToValidate="sexssay0" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator56" runat="server" ControlToValidate="sexssay0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />
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
                        <span lang="AZ-LATIN">31.12.2016-cı il tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="sexsmebl" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv64" runat="server" ControlToValidate="sexsmebl" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator57" runat="server" ControlToValidate="sexsmebl" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

                        </span>
                        </span>
                    </p>
                </td>
            </tr>
            <tr>
                <td valign="top" width="34">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        <span lang="AZ-LATIN">&nbsp;</span></p>
                </td>
                <td colspan="6" valign="top" width="550">
                    <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly">
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                    <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="sexsmebl0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv65" runat="server" ControlToValidate="sexsmebl0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator58" runat="server" ControlToValidate="sexsmebl0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="mulkmebl1" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv66" runat="server" ControlToValidate="mulkmebl1" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator59" runat="server" ControlToValidate="mulkmebl1" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                     <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="mulkmebl0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv67" runat="server" ControlToValidate="mulkmebl0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator60" runat="server" ControlToValidate="mulkmebl0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">&nbsp;
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
                        <span lang="AZ-LATIN">31.12.2016-cı il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                     <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="icaremebl1" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv68" runat="server" ControlToValidate="icaremebl1" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator61" runat="server" ControlToValidate="icaremebl1" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

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
                        <span lang="AZ-LATIN">31.12.2015-ci il&nbsp;tarixə ödəniş üzrə daxil olmuş məbləğ (manatla)</span></p>
                </td>
                <td width="111">
                      <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal; mso-element: frame; mso-element-frame-hspace: 9.0pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: 16.4pt; mso-element-top: .05pt; mso-height-rule: exactly; width: 156px;">
                    <span lang="RU">
                        <asp:TextBox style="text-align: center;float:left;width:117px;" ID="icaremebl0" runat="server">0</asp:TextBox>
                      <span lang="AZ-LATIN">
                           <asp:CompareValidator Style="float:left;font-size:17pt;" ID="cv69" runat="server" ControlToValidate="icaremebl0" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
<asp:RequiredFieldValidator Style="float:left;font-size:17pt;" ID="RequiredFieldValidator62" runat="server" ControlToValidate="icaremebl0" ErrorMessage="*" ValidationGroup="Group1" Display="Dynamic" />

                        </span>
                        </span>
                    </p>
                </td>
            </tr>
        </table>
    </div>
  
    <div align="center">
        <br />
    </div>
    <div style="clear: both;">
    </div>
    <div>
        &nbsp;</div>
    <div>
        &nbsp;</div>
    <div>
        &nbsp;</div>
    <div>
        &nbsp;</div>
    <div>
        &nbsp;</div>
</asp:Content>

