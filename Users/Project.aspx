﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Users_Project" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 525px;
            height: 40px;
        }



        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }

            .modalPopup .header {
                background-color: #2FBDF1;
                height: 30px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 3px;
            }

            .modalPopup .yes, .modalPopup .no {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
            }

            .modalPopup .yes {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        .auto-style35 {
            width: 250px;
        }

        .auto-style38 {
            height: 40px;
            font-size: 30px;
            width: 240px;
        }

        .auto-style44 {
            height: 40px;
            width: 115px;
        }


        .auto-style46 {
            width: 130px;
            height: 40px;
        }

        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style47 {
            border-collapse: collapse;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial, sans-serif;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }

        .auto-style48 {
            width: 72px;
        }

        .auto-style49 {
            width: 73px;
        }

        .auto-style50 {
            width: 62px;
        }

        .auto-style51 {
            width: 145px;
        }

        .auto-style52 {
            height: 40px;
            width: 299px;
        }

        .auto-style53 {
            height: 40px;
            width: 316px;
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

    <div style="width: 1024px;">

        <asp:Panel ID="pnlumumi" runat="server">

            <div style="float: left; width: 100%;">
                <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>

                                <td class="auto-style52">
                                    <asp:HiddenField ID="TaxpayerID" runat="server" />
                                </td>

                                <td class="auto-style46">Layihənin adı</td>
                                <td class="auto-style35">

                                    <dx:ASPxComboBox ID="cmbsahe" Width="250px" runat="server">
                                    </dx:ASPxComboBox>


                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="cmbsahe" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style52">&nbsp;</td>

                                <td class="auto-style46">Təsviri</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="tesviri" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="tesviri" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style52">&nbsp;</td>

                                <td class="auto-style46">Məbləğ (manat)</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="mebleg" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mebleg" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="mebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                                    &nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style52">&nbsp;</td>

                                <td class="auto-style46">İl</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="cmbil" Width="250px" runat="server">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="cmbil" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style52">&nbsp;</td>

                                <td class="auto-style46">Ay</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="cmbyarimil" Width="250px" runat="server">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="cmbyarimil" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>
                            <%--                <tr>
                     
                    <td class="auto-style18">Yerli vergi ödəyicisinin kodu</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="yvok" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>--%>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <table>
                    <tr>

                        <td class="auto-style53"></td>

                        <td class="auto-style44"></td>
                        <td class="auto-style6">
                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblBilgi" runat="server" Font-Bold="True"></asp:Label>
                        </td>


                    </tr>
                </table>
                <br />
            </div>

        </asp:Panel>

        <div align="center">

            <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
            <br />
            <br />
        </div>


        <div id="pnlhtml" runat="server">
            <asp:Panel ID="pnltbl" runat="server">
                <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 1012px;">
                    <tr>
                        <td valign="top" class="auto-style50">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <b><span lang="AZ-LATIN">S/n</span><o:p></o:p>
                                </b>
                            </p>
                        </td>
                        <td valign="top" class="auto-style51">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <b><span>Layihənin adı</span><span lang="AZ-LATIN"><o:p></o:p>
                                </span></b>
                            </p>
                        </td>

                        <td valign="top" width="114">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <b><span>Təsviri</span><span lang="AZ-LATIN"><o:p></o:p>
                                </span></b>
                            </p>
                        </td>
                        <td valign="top" class="auto-style48">
                            <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                                <b><span>Məbləğ (manat)<o:p></o:p>
                                </span></b>
                            </p>
                        </td>
                        <td valign="top" class="auto-style49">
                            <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                                <b><span lang="AZ-LATIN">İl<o:p></o:p>
                                </span></b>
                            </p>
                        </td>
                        <td valign="top" width="72">
                            <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                                <b><span>Ay</span></b>
                            </p>
                        </td>

                        <td valign="top" width="72">
                            <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                                <b><span>Düzəliş</span></b>
                            </p>
                        </td>
                        <td valign="top" width="72">
                            <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                                <b><span>Sil</span></b>
                            </p>
                        </td>
                    </tr>
                    <asp:Repeater ID="Repeater1" OnItemCommand="repeattaxpayer" runat="server">
                        <ItemTemplate>


                            <tr>
                                <td valign="top" class="auto-style50">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Container.ItemIndex+1%>
                                        </span>
                                    </p>
                                </td>
                                <td valign="top" class="auto-style51">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("ExpensesAreaName")%>
                                        </span>
                                    </p>
                                </td>

                                <td valign="top" width="114">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <%#Eval("NoteText")%>
                                        </span>
                                    </p>
                                </td>
                                <td valign="top" class="auto-style48">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <span lang="AZ-LATIN"><%#Eval("Amount")%>
                                        </span>
                                    </p>
                                </td>
                                <td valign="top" class="auto-style49">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <span lang="AZ-LATIN"><%#Eval("ExpensesYear")%>
                                        </span>
                                    </p>
                                </td>
                                <td valign="top" width="72">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <span lang="AZ-LATIN"><%#Eval("ExpensesHalfYear")%>
                                        </span>
                                    </p>
                                </td>

                                <td valign="top" width="72">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="LinkButton8" runat="server" CommandName="duzelis" CommandArgument='<%# Eval("ExpensesID") %>'>Düzəliş</asp:LinkButton>


                                        </span>
                                    </p>
                                </td>
                                <td valign="top" width="72">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="lnkDelete" CommandName="deleteRow"
                                                CommandArgument='<%# Eval("ExpensesID") %>' OnClick="DeleteRecord"
                                                runat="server" Text="Sil"></asp:LinkButton>
                                            <cc1:ConfirmButtonExtender ID="cbe" runat="server" DisplayModalPopupID="mpe" TargetControlID="lnkDelete">
                                            </cc1:ConfirmButtonExtender>
                                            <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDelete"
                                                OkControlID="btnYes" CancelControlID="btnNo" BackgroundCssClass="modalBackground">
                                            </cc1:ModalPopupExtender>
                                            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                                                <div class="header">
                                                    Diqqətli olun.
                                                </div>
                                                <div class="body">
                                                    Silməyə əminsinizmi?
                                                </div>
                                                <div class="footer" align="right">
                                                    <asp:Button ID="btnYes" runat="server" Text="Bəli" CssClass="yes" />
                                                    <asp:Button ID="btnNo" runat="server" Text="Xeyr" CssClass="no" />
                                                </div>
                                            </asp:Panel>
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
</asp:Content>

