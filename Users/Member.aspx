﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Users_Member" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 236px;
        }

        .auto-style9 {
            width: 205px;
            height: 58px;
        }



        .auto-style20 {
            height: 58px;
            font-size: 30px;
            width: 35px;
        }

        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 10.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style23 {
            border-collapse: collapse;
            line-height: 115%;
            font-size: 10.0pt;
            font-family: Arial, sans-serif;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }

        .auto-style24 {
            height: 28px;
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

        .auto-style25 {
            width: 123px;
            height: 58px;
        }

        .auto-style26 {
            width: 148px;
            height: 58px;
        }

        .auto-style28 {
            width: 205px;
        }

        .auto-style29 {
            width: 72px;
        }

        .auto-style30 {
            width: 80px;
        }

        .auto-style31 {
            width: 161px;
        }
        .auto-style32 {
            width: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 1024px;">


        <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
            <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
        </div>
                <asp:HiddenField ID="TaxpayerID" runat="server" />
        <br />


        <div style="float: left; width: 42%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="auto-style3">
                        <tr>

                            <td class="auto-style26">Seçildiyi vəzifə</td>
                            <td class="auto-style9">
                                <dx:ASPxComboBox ID="ddlvezife" runat="server" ValueType="System.String" Width="250px">
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlvezife" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style26">Soyadı</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="soyadi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="soyadi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style26">Adı</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="adi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="adi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style26">Atasının adı</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="ataadi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ataadi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style26">Cinsi</td>
                            <td class="auto-style28">&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdman" runat="server" Text="Kişi" Checked="True" GroupName="A" />
                                &nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdwoman" runat="server" Text="Qadın" GroupName="A" />
                            </td>
                            <td class="auto-style20">&nbsp;</td>
                        </tr>
                        <%--                <tr>
                     
                    <td class="auto-style18">Yerli vergi ödəyicisinin kodu</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="yvok" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>--%>
                        <tr>

                            <td class="auto-style26">Qeydiyyatda olduğu yaşayış ünvanı</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="qeydiyyatadres" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="qeydiyyatadres" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style26">Elektron poçt ünvanı</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" CssClass="hata_mesaj" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Əlaqə telefonu</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="mobiltel" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="qeydiyyatadres" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Partiyalılığı</td>
                            <td class="auto-style28">
                                <dx:ASPxComboBox ID="ddlpartiya" runat="server" ValueType="System.String" Width="250px">
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ddlpartiya" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Təvəllüdü</td>
                            <td class="auto-style28">
                                <dx:ASPxDateEdit ID="cmbtevellud" runat="server" Width="250px">
                                </dx:ASPxDateEdit>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="cmbtevellud" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Milliyyəti</td>
                            <td class="auto-style28">
                                <asp:TextBox ID="txtmilliyyet" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmilliyyet" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Təhsil</td>
                            <td class="auto-style28">
                                <dx:ASPxComboBox ID="ddltehsil" runat="server" ValueType="System.String" Width="250px">
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="ddltehsil" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Şəkili (3x4)</td>
                            <td class="auto-style28">
                                <asp:FileUpload ID="fufoto" runat="server" />
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="*" ControlToValidate="fufoto"
                                    runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="Group1" />

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fufoto" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.png|.JPG|.JPEG|.PNG)$" ValidationGroup="Group1" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>

            <table class="auto-style3">
                <tr>
                    <td class="auto-style25"></td>
                    <td class="auto-style6">
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />

                    </td>
                    <td class="auto-style20">&nbsp;</td>

                </tr>
            </table>
        </div>

        <%--      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>
        <div style="overflow: scroll; float: left; width: 58%; height: 460px;">
            <div>
                <table class="nav-justified">
                    <tr>
                        <td class="auto-style29">&nbsp;</td>
                        <td class="auto-style30">Məsul şəxs</td>
                        <td class="auto-style31">

                            <dx:ASPxComboBox ID="ddlmehsul" runat="server" ValueType="System.String" Width="150px">
                            </dx:ASPxComboBox>

                        </td>
                        <td class="auto-style32">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="ddlmehsul" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="g" Font-Size="17pt"></asp:RequiredFieldValidator>
                            </td>
                        <td>
                            <asp:Button ID="btnmehsul" runat="server" Text="Yadda saxla" OnClick="btnmehsul_Click" ValidationGroup="g" />
                        </td>
                    </tr>
                </table>
            </div>
            <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 570px; height: 49px;">
                <tr>
                    <td valign="center" width="62" style="text-align: center;">

                        <b><span lang="AZ-LATIN">S/n</span></b>

                    </td>
                    <td valign="center" width="178" style="text-align: center;">

                        <b><span lang="AZ-LATIN">Adı<o:p></o:p></span></b>

                    </td>

                    <td valign="center" width="96" style="text-align: center;">

                        <b><span lang="AZ-LATIN">Seçildiyi vəzifə</span></b></td>
                    <%--<td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Baxış</span></b> </td>--%>
                     <td valign="center" width="60" style="text-align: center;">
                        <b><span lang="AZ-LATIN">Şəkil</b>
                    </td>
                     <td valign="center" width="60" style="text-align: center;">
                        <b><span lang="AZ-LATIN">Məsul şəxs</b>
                    </td>
                    <td valign="center" width="60" style="text-align: center;">

                        <b><span lang="AZ-LATIN">Düzəliş</span></b>

                    </td>
                    <td valign="center" width="30" style="text-align: center;">

                        <b><span lang="AZ-LATIN">Sil</span></b>

                    </td>
                </tr>
                <asp:Repeater ID="DataList1" OnItemCommand="repeattaxpayer" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td valign="top" width="62" class="auto-style24">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Container.ItemIndex+1%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="178" class="auto-style24">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <o:p><%#Eval("Name")%></o:p>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" width="96" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <o:p><%#Eval("StatusPositionName") %></o:p>
                                    </span>
                                </p>
                            </td>
                            <%--                                    <td valign="top" width="96" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN">
                                                <o:p><a href='Member.aspx?TaxpayerID=<%#Eval("StructureID") %>&amp;islem=baxis'>Baxış</a></o:p>

                                            </span>
                                        </p>
                                    </td>--%>
                            <td valign="top" width="60" class="auto-style24" align="center">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <o:p><img  src="<%#Eval("Photo").ToString() %>" style="width: 60px; height: 70px" /></o:p>
                                    </span>

                                </p>
                            </td>
                             <td valign="top" width="60" class="auto-style24" align="center">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <o:p><%#Eval("Charge")%></o:p>
                                    </span>

                                </p>
                            </td>
                            <td valign="top" width="60" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <o:p>
                                            
                                            <asp:LinkButton  ID="LinkButton8" runat="server" CommandName="duzelis" CommandArgument='<%# Eval("StructureID") %>'>Düzəliş</asp:LinkButton>                          

                                            


                                        </o:p>
                                    </span>

                                </p>
                            </td>
                            <td valign="top" width="30" class="auto-style24">

                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">

                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("StructureID") %>' CommandName="deleteRow" OnClick="DeleteRecord" Text="Sil"></asp:LinkButton>
                                        <cc1:ConfirmButtonExtender ID="cbe" runat="server" DisplayModalPopupID="mpe" TargetControlID="lnkDelete">
                                        </cc1:ConfirmButtonExtender>
                                        <cc1:ModalPopupExtender ID="mpe" runat="server" BackgroundCssClass="modalBackground" CancelControlID="btnNo" OkControlID="btnYes" PopupControlID="pnlPopup" TargetControlID="lnkDelete">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                                            <div class="header">
                                                Diqqətli olun.
                                            </div>
                                            <div class="body">
                                                Silməyə əminsinizmi?
                                            </div>
                                            <div align="right" class="footer">
                                                <asp:Button ID="btnYes" runat="server" CssClass="yes" Text="Bəli" />
                                                <asp:Button ID="btnNo" runat="server" CssClass="no" Text="Xeyr" />
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
        <%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>


</asp:Content>

