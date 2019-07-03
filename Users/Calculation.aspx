<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="Calculation.aspx.cs" Inherits="Users_Calculation" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 300px;
        }

        .auto-style5 {
            width: 184px;
        }

        .auto-style6 {
            width: 305px;
        }

        .auto-style7 {
            width: 20px;
        }

        .auto-style8 {
            width: 299px;
        }

        .auto-style9 {
            width: 292px;
        }

        .auto-style10 {
            width: 288px;
        }

        .auto-style11 {
            width: 103px;
        }

        .auto-style55 {
            width: 164px;
        }

        .auto-style56 {
            width: 226px;
        }
        .auto-style383 {
            width: 682px;
            height: 58px;
        }
    </style>

    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <table>
        <tr>
            <td class="auto-style56">&nbsp;</td>
            <td>Vergi ödəyicisi :&nbsp;
            </td>
            <td class="auto-style55">
                <dx:ASPxLabel ID="LBTaxPayerName" runat="server" Text="" Font-Bold="True"></dx:ASPxLabel>

            </td>
            <td>YVÖK :&nbsp;
            </td>
            <td>
                <dx:ASPxLabel ID="YVOK" runat="server" Text="" Width="150px" Font-Bold="True"></dx:ASPxLabel>
            </td>
            <td>VÖEN :&nbsp;
            </td>
            <td>
                <dx:ASPxLabel ID="VOEN" runat="server" Text="" Width="150px" Font-Bold="True"></dx:ASPxLabel>
            </td>
        </tr>

    </table>
    <br />
    <table class="nav-justified">
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlvergi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlvergi_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;     </td>
        </tr>
    </table>









    <div id="pnlemlak" visible="false" runat="server">
        <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">

            <asp:Label ID="lblnamevergi" runat="server" Text=""></asp:Label>nin hesablanması
        </div>
        <div id="pnltedhesili" visible="true" runat="server">
            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style11">Hesabat ili</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="ddltediyyetarix" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style11">Hesablama vaxti</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="ddlhesvaxti" runat="server">
                                        <asp:ListItem Value="-1">Seçin</asp:ListItem>
                                        <asp:ListItem Value="1">15 avqust</asp:ListItem>
                                        <asp:ListItem Value="2">15 noyabr</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btntediyye" runat="server" CssClass="btn btn-success" OnClick="btntediyye_Click" ValidationGroup="Group1" Text="Hesabla" Width="120px" />

                        </td>
                        <td class="auto-style383">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </div>















    <div id="Pnlmenfeet" visible="false" runat="server">
        <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
            Mənfəət vergisinin hesablanması
        </div>
        <div id="pnlmenf" visible="false" runat="server">
            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat ili</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="ddlmenfeetil" runat="server" Width="200px">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="ddlmenfeetil" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Font-Size="17px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat ili ərzində gəlir (man.) </td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="txtmenfeetgelir" runat="server" Width="200px"></asp:TextBox>
                                    &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmenfeetgelir" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" Font-Size="17px"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtmenfeetgelir" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" Font-Size="17px" />
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat ili ərzində çəkilən xərc (man)</td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="txtmenfeetxerc" runat="server" Width="200px"></asp:TextBox>
                                    &nbsp; 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmenfeetxerc" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" Font-Size="17px"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtmenfeetxerc" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" Font-Size="17px" />
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btnmenfeeti" runat="server" CssClass="btn btn-success" OnClick="btnmenfeeti_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />

                        </td>
                        <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblmenfeet" runat="server"></asp:Label>
                            &nbsp;
                        <asp:Label ID="lblmenfgizle" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lblmenfyoxla" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">
            <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                <tr>
                    <td style="text-align: center;" valign="center" class="auto-style7"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                    <td style="text-align: center;" valign="center" class="auto-style8"><b><span lang="AZ-LATIN">Qeydiyyat kodu</span></td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müəssisənin adı</span></b></td>
                    <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Hesabat ili</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesabat ili ərzində  gəlir (man.)</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesabat ili ərzində çəkilən xərc (man.)</span></b> </td>
                    <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Məbləğ(man.)</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yeni hesablama</span></b></td>
                    <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                    <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                </tr>
                <asp:Repeater ID="rpmenfeet" runat="server" OnItemCommand="rpmenfeet_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="auto-style7" valign="top">
                                <p class="MsoNormal">
                                    <%#Container.ItemIndex+1%>1
                                </p>
                            </td>
                            <td class="auto-style8" valign="top">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("IncomeTaxID")%></span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("CompanyName")%>
                                       
                                    </span>
                                </p>
                            </td>

                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("CalcYear")%>          
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Income1")%>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Expense1")%>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Amount")%>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("IncomeTaxID") %>' CommandName="newrownmenfeet">Yeni hesablama</asp:LinkButton>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="60">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="UpdateMeden" runat="server" CommandArgument='<%# Eval("CalcProfitsID") %>' CommandName="Updaterownmenfeet">Dəyiş</asp:LinkButton>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="30">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="deleteMeden1" runat="server" CommandArgument='<%# Eval("CalcProfitsID") %>' CommandName="deleterowmenfeet">Sil</asp:LinkButton>

                                    </span>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

        </div>
    </div>





















    <div id="DivMain" visible="false" runat="server">
        <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
            Mədən vergisinin hesablanması
        </div>
        <div id="submain" runat="server">

            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style5">Hesabat ili</td>
                                <td>
                                    <asp:DropDownList ID="DDLMedenYear" runat="server" Width="120">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style5">Hesabat ayı</td>
                                <td>
                                    <asp:DropDownList ID="DDLMedenMonth" runat="server" Width="120">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style5">Hasilatın həcmi (kub metr)</td>
                                <td>
                                    <asp:TextBox ID="txtMedenSize" runat="server" Width="120"></asp:TextBox>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="BtnMedenNew" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Təsdiqlə" Width="120px" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LBMSGMeden" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="IDLBMeden" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="IDInsertUpdate" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="height: auto; width: 100%; background-color: white;">
            <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                <tr>
                    <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                    <td style="text-align: center;" valign="center" width="178"><b><span lang="AZ-LATIN">Qeydiyyat kodu<p></p>
                    </span></td>
                    <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Tikinti materiallarının növü</span></b> </td>
                    <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Yerləşdiyi yer</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesabat ili</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesabat ayı</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hasilatın həcmi (kub metr)</span></b> </td>
                    <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış vergi məbləği (manat)</span></b> </td>
                    <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Yeni hesablama</span></b> </td>
                    <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                    <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                </tr>
                <asp:Repeater ID="DataListMeden" runat="server" OnItemCommand="DataListMeden_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="auto-style24" valign="top" width="178">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <p><%#Eval("sn")%></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("MineID")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("RegistrDate1")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("MineType")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("MinePositionArea")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("unvan")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("CalcYear")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("CalcMonth")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Productionsize")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="113">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Amount")%>
                                        <p></p>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="60">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="NewMeden" runat="server" CommandArgument='<%# Eval("MineID") %>' CommandName="NewrowMeden">Yeni hesablama</asp:LinkButton>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="60">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="UpdateMeden" runat="server" CommandArgument='<%# Eval("CalcMineID") %>' CommandName="UpdaterowMeden">Düzəliş</asp:LinkButton>
                                    </span>
                                </p>
                            </td>
                            <td class="auto-style24" valign="top" width="30">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="deleteMeden" runat="server" CommandArgument='<%# Eval("CalcMineID") %>' CommandName="deleterowMeden">Sil</asp:LinkButton>
                                        <asp:Panel ID="pnlPopup1" runat="server" CssClass="modalPopup" Style="display: none">
                                            <div class="header">
                                                Diqqətli olun.
                                            </div>
                                            <div class="body">
                                                Silməyə əminsinizmi?
                                            </div>
                                            <div align="right" class="footer">
                                                <asp:Button ID="btnYes1" runat="server" CssClass="yes" Text="Bəli" />
                                                <asp:Button ID="btnNo1" runat="server" CssClass="no" Text="Xeyr" />
                                            </div>
                                        </asp:Panel>
                                        </o:p>
                                    </span>
                                </p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>





    <div id="DivCar" visible="false" runat="server">
        <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
            Avtomobil dayanacağı ödənişinin hesablanması
        </div>
        <div id="subdivCar" runat="server">
            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat dövrünün başlama tarixi</td>
                                <td>
                                    <dx:ASPxDateEdit ID="DECarStopDate1" runat="server"></dx:ASPxDateEdit>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat dövrünün bitmə tarixi</td>
                                <td>
                                    <dx:ASPxDateEdit ID="DECarStopDate2" runat="server"></dx:ASPxDateEdit>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Nəqliyyat vasitəsinin sayı</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCarCount" runat="server" Width="170px"></dx:ASPxTextBox>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Ödəniş dərəcəsi</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCardigre" runat="server" Width="170px"></dx:ASPxTextBox>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" OnClick="Button3_Click" ValidationGroup="Group1" Text="Təsdiqlə" Width="120px" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="IDLbCarStop" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LBMsgCarStop" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LBCarInsertUpdate" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div id="div10" style="height: auto; width: 100%; background-color: white;">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                    <tr>
                        <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                        <td style="text-align: center;" valign="center" width="178"><b><span lang="AZ-LATIN">Qeydiyyat kodu<p></p>
                        </span></td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Dayanacağın növü</span></b> </td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Ünvanı</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Dayanacağın sahəsi (kv.m.)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Tutumu (avtomobil sayı)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstəril - məsinin başlanma - dayandırılma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Hesabat dövrü</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Nəqliyyat vasıtə - sinin sayı</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Bir nəqliyyat vasitəsi üçün ödəniş dərəcəsi (sutkada)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Hesab - lanmış  məbləq (manat) </span></b></td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Yeni hesablama</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                        <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                    </tr>
                    <asp:Repeater ID="DataListCarStop" runat="server" OnItemCommand="DateListCarStop_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="auto-style24" valign="top" width="178">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <p><%#Eval("sn")%></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CarID")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("RegisterDate")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CarStopType1")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("unvan")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("StopArea")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CarCount")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("ServiceDate2")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Period")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CarCount1")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Degree")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Amount")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="NewCarStop" runat="server" CommandArgument='<%# Eval("CarID") %>' CommandName="NewrowCarStop">Yeni hesablama</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="UpdateCarStop" runat="server" CommandArgument='<%# Eval("CalcCarStopID") %>' CommandName="UpdaterowCarStop">Dəyiş</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="30">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="deleteCarStop" runat="server" CommandArgument='<%# Eval("CalcCarStopID") %>' CommandName="deleterowCarStop">Sil</asp:LinkButton>
                                            <asp:Panel ID="pnlPopup1" runat="server" CssClass="modalPopup" Style="display: none">
                                                <div class="header">
                                                    Diqqətli olun.
                                                </div>
                                                <div class="body">
                                                    Silməyə əminsinizmi?
                                                </div>
                                                <div align="right" class="footer">
                                                    <asp:Button ID="btnYes1" runat="server" CssClass="yes" Text="Bəli" />
                                                    <asp:Button ID="btnNo1" runat="server" CssClass="no" Text="Xeyr" />
                                                </div>
                                            </asp:Panel>
                                            </o:p>
                                        </span>
                                    </p>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </asp:Panel>

        </div>
    </div>



    <div id="Div3" visible="false" runat="server">
        <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
            Mehmanxana, sanatoriya-kurort, turizm xidməti göstərən müəssisənin ödənişinin hesablanması
        </div>
        <div id="DivHotel" runat="server">
            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat ili</td>
                                <td>
                                    <asp:DropDownList ID="DDLhotelYear" runat="server" Width="150">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Hesabat ayı</td>
                                <td>
                                    <asp:DropDownList ID="DDLhotelMonth" runat="server" Width="150">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Sutkada xidmət göstərilən şəxslərin sayı<br />
                                    (1 ay ərzində)</td>
                                <td>
                                    <asp:TextBox ID="txtHotelcountPerson" runat="server" Width="150"></asp:TextBox>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style4">Bir şəxs üçün ödəniş dərəcəsi (manat)</td>
                                <td>
                                    <asp:TextBox ID="txthotelFactor" runat="server" Width="150"></asp:TextBox>
                                    &nbsp;</td>
                            </tr>
                        </table>

                    </td>
                </tr>



                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btnHotel" runat="server" CssClass="btn btn-success" OnClick="btnHotel_Click" ValidationGroup="Group1" Text="Təsdiqlə" Width="120px" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LBHotelMSG" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lbIDHotel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LbHotelInsertUpdate" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal">
                <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                    <tr>
                        <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                        <td style="text-align: center;" valign="center" width="178"><b><span lang="AZ-LATIN">Qeydiyyat kodu<p></p>
                        </span></td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müəssisənin növü</span></b> </td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Müəssisənin adı</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstəril - məsinin başlanma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstəril - məsinin dayandırılma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesab - lanma ili</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesab - lanma ayı</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstərilən şəxslərin sayı (1 ay ərzində)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Bir şəxs üçün ödəniş dərəcəsi (manat)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış aylıq məbləq (manat)</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Yeni hesablama</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                        <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                    </tr>
                    <asp:Repeater ID="DataListHotel" runat="server" OnItemCommand="DataListHotel_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="auto-style24" valign="top" width="178">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <p><%#Eval("sn")%></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("HotelID")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("RegistrDate")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("HotelType")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("HotelName")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("ServiceBeginDate")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("ServiceEndDate")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CalcYear")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("CalcMonth")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("PersonCount")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Degree")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Amount")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="NewHotel" runat="server" CommandArgument='<%# Eval("HotelID") %>' CommandName="NewrowHotel">Yeni hesablama</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="UpdateHotel" runat="server" CommandArgument='<%# Eval("CalcHotelID") %>' CommandName="UpdaterowHotel">Dəyiş</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="30">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="deleteHotel" runat="server" CommandArgument='<%# Eval("CalcHotelID") %>' CommandName="deleterowHotel">Sil</asp:LinkButton>
                                            <asp:Panel ID="pnlPopup1" runat="server" CssClass="modalPopup" Style="display: none">
                                                <div class="header">
                                                    Diqqətli olun.
                                                </div>
                                                <div class="body">
                                                    Silməyə əminsinizmi?
                                                </div>
                                                <div align="right" class="footer">
                                                    <asp:Button ID="btnYes1" runat="server" CssClass="yes" Text="Bəli" />
                                                    <asp:Button ID="btnNo1" runat="server" CssClass="no" Text="Xeyr" />
                                                </div>
                                            </asp:Panel>
                                            </o:p>
                                        </span>
                                    </p>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </asp:Panel>
        </div>
    </div>
    <%#Eval("IncomeTaxID")%>
</asp:Content>

