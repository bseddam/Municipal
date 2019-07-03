<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Users_Payment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .auto-style6 {
            width: 514px;
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

        .auto-style22 {
            height: 40px;
            width: 244px;
        }

        .auto-style35 {
            width: 250px;
        }

        .auto-style38 {
            height: 40px;
            font-size: 30px;
            width: 240px;
        }

        .auto-style43 {
            height: 40px;
            width: 228px;
        }

        .auto-style44 {
            height: 40px;
            width: 166px;
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
            width: 173px;
        }

        .auto-style48 {
            width: 174px;
        }

        .auto-style50 {
            width: 131px;
        }

        .auto-style52 {
            width: 124px;
        }

        .auto-style53 {
            width: 276px;
        }

        .auto-style54 {
            width: 183px;
            height: 40px;
        }

        .auto-style55 {
            width: 164px;
        }

        .auto-style56 {
            width: 226px;
        }
    </style>


    <div style="width: 1024px;">
                                     
                   
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate>

                          
        <asp:Panel ID="pnlumumi" runat="server">

            <div style="float: left; width: 100%;">
                <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
                    <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
                </div>

                <div style="width: 100%; height: 20px;">
                    <b>
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
                    </b>

                </div>
                <table>

                    <tr>
                        <td class="auto-style43">&nbsp;</td>
                        <td class="auto-style54">Vergi və ödəniş</td>
                        <td class="auto-style35">
                            <dx:ASPxComboBox ID="cmbvergi" runat="server" ValueType="System.String" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="cmbvergi_SelectedIndexChanged">
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style38">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="cmbvergi" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td class="auto-style43">&nbsp;</td>
                        <td class="auto-style54">Ümumi yekun borc (manatla)</td>
                        <td class="auto-style35">
                            <asp:TextBox ID="qaliqborc" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="auto-style38">&nbsp;</td>
                    </tr>
                    <tr>

                        <td class="auto-style43">&nbsp;</td>

                        <td class="auto-style54">Ödənilən məbləğ (manat)</td>
                        <td class="auto-style35">
                            <asp:TextBox ID="mebleg" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style38">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mebleg" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="mebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                            &nbsp;</td>
                    </tr>
                    <tr>

                        <td class="auto-style43">&nbsp;</td>

                        <td class="auto-style54">Ödəniş sənədin nömrəsi</td>
                        <td class="auto-style35">
                            <asp:TextBox ID="txtsened" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style38">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsened" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>

                        <td class="auto-style43">&nbsp;</td>

                        <td class="auto-style54">Ödəmə tarixi</td>
                        <td class="auto-style35">
                            <dx:ASPxDateEdit ID="odemetrx" runat="server" Width="250px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td class="auto-style38">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="odemetrx" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
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

                <table>
                    <tr>

                        <td class="auto-style22"></td>

                        <td class="auto-style44"></td>
                        <td class="auto-style6">
                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="msg" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>

        </asp:Panel>
<%--                             </ContentTemplate>
                </asp:UpdatePanel>--%>

        <asp:Panel ID="pnltbl" runat="server">
            <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 1012px;">
                <tr>
                    <td valign="top" class="auto-style50">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span lang="AZ-LATIN">S/n</span><o:p></o:p>
                            </b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style53">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Tarix</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style53">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Əməliyyat</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Ümumi qalıq borc (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Məbləğ (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Qalıq (manatla)</span></b></p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Artıq ödəmə (manatla)</span></b></p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Sanksiya (manatla)</span></b></p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Gecikmiş günlərin sayı</span></b></p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Faiz hesablanıb (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Faiz qalıq (manatla)</span></b>
                        </p>
                    </td>


                    <td valign="top" width="114">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Sənədin nömrəsi</span></b>
                        </p>
                    </td>

                    <%--                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                            <b><span>Düzəliş</span></b>
                        </p>
                    </td>--%>
                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                            <b><span>Sil</span></b>
                        </p>
                    </td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>


                        <tr>
                            <td valign="top" class="auto-style50">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Container.ItemIndex+1%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style53">
                                <p class="MsoNormal" style="text-align:center">
                                    <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("NowTime").ToString()) %>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style53">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Operation1")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style53">
                                <p class="MsoNormal" style="text-align:center">
                                    <span lang="AZ-LATIN"><%#Eval("umumiborc")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Amount")%>   
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("RemainingDebt")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("MorePayment")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("Sanction")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("PercentDayCount")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("PercentCounted")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("PercentDebt")%>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" width="114">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("PaymentDocument")%>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" width="72">

                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="lnkDelete" CommandName="deleteRow"
                                            CommandArgument='<%# Eval("PaymentID") %>'
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
                                    </ContentTemplate>
                        </asp:UpdatePanel>
    </div>
    <br />
    <br />
</asp:Content>

