<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Expencere.aspx.cs" Inherits="adminpanel_Reports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: "Arial","sans-serif";
        }

        .auto-style1 {
            width: 619px;
        }

        .auto-style3x {
            width: 100%;
        }

        .auto-style8 {
            width: 378px;
            height: 42px;
        }

        .auto-style9 {
            width: 100px;
            height: 42px;
        }

        .auto-style10 {
            width: 205px;
            height: 42px;
        }

        .auto-style11 {
            height: 42px;
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
    <div>

        <table class="auto-style3x">
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style9">Rayon:</td>
                <td class="auto-style10">
                    <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Bələdiyyə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Hesabatili:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbhesabatili" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="cmbhesabatayi1" runat="server">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="cmbhesabatayi2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Sahə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbsahe" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="cmbsahe_SelectedIndexChanged1">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Təyinatı üzrə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbxerc" runat="server" Width="200px">
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
            <br />
            <br />
        </div>


        <div id="pnlhtml" runat="server">
            <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: left; line-height: normal; text-align: center; width: 1017px;">
                <b><span lang="AZ-LATIN">&nbsp; Bələdiyyələrin gəlirləri və xərcləri barədə müfəssəl məlumat</span></b>
            </p>
            <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                <span lang="AZ-LATIN">
                    <o:p>&nbsp;</o:p>
                </span>
            </p>
            <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <b><span lang="AZ-LATIN">Şəhər, rayonun adı</span></b>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;<asp:Label ID="lblrayon" runat="server"></asp:Label>
                    </o:p>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <b><span lang="AZ-LATIN">Bələdiyyənin adı</span></b>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;<asp:Label ID="lblbeladi" runat="server"></asp:Label>
                    </o:p>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <asp:Label ID="trx4" runat="server"></asp:Label>
                                ili üzrə bələdiyyənin ümumi gəliri (manat)</span></p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">&nbsp;<asp:Label ID="umumigelir" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                            </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                
                                o cümlədən</span></p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">&nbsp;</span></p>
                    </td>
                            </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">01.01.<asp:Label ID="trx2" runat="server"></asp:Label>
                                qalıq (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p><asp:Label ID="lblqaliq" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <asp:Label ID="trx" runat="server"></asp:Label>
                                ili üzrə vergi və ödənişlərdən daxil olma (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">&nbsp;<asp:Label ID="gelir" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">Dövlət tərəfindən verilən dotasiya (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p><asp:Label ID="dotasiya" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">İanələrdən daxil olma (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p><asp:Label ID="iane" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">Digər gəlirlər (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p><asp:Label ID="lbldiger" runat="server"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <asp:Label ID="trx1" runat="server"></asp:Label>
                                ili üzrə bələdiyyənin ümumi xərci (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;<asp:Label ID="lblxerc" runat="server"></asp:Label>
                    </o:p>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" width="396">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <asp:Label ID="trx3" runat="server"></asp:Label>
                                ili üzrə bələdiyyənin layihələri (manat)</span>
                        </p>
                    </td>
                    <td colspan="4" valign="top" width="322">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-LATIN">
                                <o:p>&nbsp;<asp:Label ID="lbllayihe" runat="server"></asp:Label>
                    </o:p>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" valign="top" width="718">
                        <p align="center" class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: -2.4pt; margin-bottom: .0001pt; text-align: center; line-height: normal">
                            <b><span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p>
                            </span></b>
                        </p>
                        <p align="center" class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: -2.4pt; margin-bottom: .0001pt; text-align: center; line-height: normal">
                            <b><span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p>
                            </span></b>
                        </p>
                        <p align="center" class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: -2.4pt; margin-bottom: .0001pt; text-align: center; line-height: normal">
                            <b><span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p>
                            </span></b>
                        </p>
                        <p align="center" class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: -2.4pt; margin-bottom: .0001pt; text-align: center; line-height: normal">
                            <b><span lang="AZ-LATIN">
                                <o:p>&nbsp;</o:p>
                            </span></b>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="34">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                            <b><span lang="AZ-LATIN">S/n</span></b>
                        </p>
                    </td>
                    <td width="143">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Rayon</span></b>
                        </p>
                    </td>
                    <td width="143">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Bələdiyyə</span></b>
                        </p>
                    </td>
                    <td width="143">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Xərclər (sahə üzrə)</span></b>
                        </p>
                    </td>
                    <td width="67">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Manat</span></b>
                        </p>
                    </td>
                    <td width="170">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Xərclər (təyinatı üzrə)</span></b>
                        </p>
                    </td>
                    <%--                    <td width="66">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Manat</span></b>
                        </p>
                    </td>--%>

                    <td width="64">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Manat</span></b>
                        </p>
                    </td>
                    <td width="174">
                        <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                            <b><span lang="AZ-LATIN">Xərclərin müfəssəl təsviri</span></b>
                        </p>
                    </td>
                </tr>

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>


                        <tr>
                            <td valign="top" width="34">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Container.ItemIndex+1 %></span>
                                </p>
                            </td>
                            <td valign="top" width="143">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Eval("Name")%></span>
                                </p>
                            </td>
                            <td valign="top" width="143">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Eval("Municipalname")%></span>
                                </p>
                            </td>
                            <td valign="top" width="143">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Eval("ExpensesAreaName")%></span>
                                </p>
                            </td>
                            <td valign="top" width="67">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                                    <span lang="AZ-LATIN"><%#Eval("sahe")%></span>
                                </p>
                            </td>
                            <td valign="top" width="170">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Eval("ExpensesSubAreaName")%></span>
                                </p>
                            </td>
                            <%--                            <td valign="top" width="66">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                                    <span lang="AZ-LATIN"><%#Eval("teyinat")%></span>
                                </p>
                            </td>--%>

                            <td valign="top" width="64">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; text-align: center;">
                                    <span lang="AZ-LATIN"><%#Eval("ayri")%></span>
                                </p>
                            </td>
                            <td valign="top" width="174">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN"><%#Eval("NoteText")%></span>
                                </p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>

