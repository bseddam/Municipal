<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Dotation.aspx.cs" Inherits="Users_Dotation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style25 {
            width: 167px;
        }

        .auto-style26 {
            width: 267px;
        }

        .auto-style27 {
        }

        .auto-style28 {
            width: 267px;
            height: 40px;
        }

        .auto-style29 {
            width: 167px;
            height: 40px;
        }

        .auto-style30 {
            width: 257px;
            height: 40px;
        }

        .auto-style31 {
            height: 40px;
        }
        .auto-style33 {
            width: 84px;
        }
        .auto-style36 {
            width: 139px;
        }
        .auto-style37 {
            width: 194px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="nav-justified">
        <tr>
            <td class="auto-style26">
                <asp:HiddenField ID="TaxpayerID" runat="server" />
            </td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28"></td>
            <td class="auto-style29">
                       <asp:Label ID="lbltype0" runat="server" ></asp:Label></td>
            <td class="auto-style30">
                <dx:ASPxDateEdit ID="dotvertarix" runat="server" Width="250px" EditFormat="DateTime">
                </dx:ASPxDateEdit>

            </td>
            <td class="auto-style31">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dotvertarix" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" Font-Size="17pt"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
                <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style25">Məbləğ</td>
            <td class="auto-style27">
                <asp:TextBox ID="mebleg" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mebleg" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" Font-Size="17pt"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="mebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" Font-Size="17pt" />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style25">Təsviri</td>
            <td class="auto-style27">
                <asp:TextBox ID="tesviri" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="tesviri" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" Font-Size="17pt"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style27" colspan="2">
                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />
            &nbsp;<asp:Label ID="msg" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


    <div>
        <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 1012px;">
            <tr>
                <td valign="top" class="auto-style33">
                    <p align="center" class="MsoNormal" style="text-align: center">
                        <b><span lang="AZ-LATIN">S/n</span><o:p></o:p>
                        </b>
                    </p>
                </td>

                   <td valign="top"  style="text-align:center;font-weight:bold">
                       <asp:Label ID="lbltype" runat="server" ></asp:Label></td>
                <td valign="top" class="auto-style36">
                    <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                        <b><span>Məbləğ (manat)<o:p></o:p>
                        </span></b>
                    </p>
                </td>
                                    <td valign="top" class="auto-style37">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <b><span>Təsviri</span></b></p>
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
            <asp:Repeater ID="Repeater1"  OnItemCommand="repeattaxpayer" runat="server">
                <ItemTemplate>


                    <tr>
                        <td valign="top" class="auto-style33">
                            <p class="MsoNormal">
                                <span lang="AZ-LATIN"><%#Container.ItemIndex+1%>
                                </span>
                            </p>
                        </td>
                        <td valign="top" class="auto-style36">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("DotationGiveDate").ToString()) %>
                                </span>
                            </p>
                        </td>

                        <td valign="top" class="auto-style36">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <span lang="AZ-LATIN"><%#Eval("Amount")%>
                                </span>
                            </p>
                        </td>
                          <td valign="top" class="auto-style37">
                        <p class="MsoNormal">
                            <span lang="AZ-LATIN">
                            <%#Eval("DotationName")%>
                            </span>
                        </p>
                    </td>
                        <td valign="top" width="72">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <span lang="AZ-LATIN">
                                    
                                 <%--   <a href='Dotation.aspx?DotationType=<%#Eval("DotationType")%>&TaxpayerID=<%#Eval("DotationID") %>&islem=duzelis'>Düzəliş</a>--%>
                                <asp:LinkButton  ID="LinkButton8" runat="server" CommandName="duzelis" CommandArgument='<%# Eval("DotationID") %>'>Düzəliş</asp:LinkButton>                          

                                    
                                     </span>
                            </p>
                        </td>
                        <td valign="top" width="72">
                            <p align="center" class="MsoNormal" style="text-align: center">
                                <span lang="AZ-LATIN">
                                    <asp:LinkButton ID="lnkDelete" CommandName="deleteRow"
                                        CommandArgument='<%# Eval("DotationID") %>' OnClick="DeleteRecord"
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

    </div>
</asp:Content>

