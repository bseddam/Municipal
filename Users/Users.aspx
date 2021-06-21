<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users_UsersForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style38 {
            height: 45px;
            font-size: 30px;
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

        .auto-style38 {
            height: 45px;
            font-size: 30px;
    
        }

        .auto-style40 {
            height: 45px;
            width: 174px;
        }

        .auto-style43 {
            height: 45px;
            width: 28px;
        }
         .auto-style44 {
            height: 45px;
            width: 211px;
        }

        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style44 {
            width: 250px;
        }
        .auto-style45 {
            height: 45px;
        }

         .menu-list label {
            display: inline;
            font-weight: normal;
            margin-right: 10px;
            margin-left: 5px;
        }
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 1024px;">


        <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
            <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
        </div>
        <br />
       
        <table style="width:100%">

             <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style44">
                    <asp:LinkButton ID="btnAdd" runat="server" CommandArgument="add" OnClick="LnkPnlMenu_Click" CssClass="btn btn-default">Yeni</asp:LinkButton>
                </td>
                <td class="auto-style38">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Soyadı:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtsname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Adı:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style40">Ata adı:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Cinsi:</td>
                <td class="auto-style44">
                    <asp:RadioButton ID="rdman" runat="server" Text="Kişi" Checked="True" GroupName="A" />
                    <asp:RadioButton ID="rdwoman" runat="server" Text="Qadın" GroupName="A" />
                </td>
                <td class="auto-style38">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Mobil telefonu:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcontact" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Elektron ünvanı:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" CssClass="hata_mesaj" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtemail" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">İstifadəçi adı: (6 - 12 simvol)</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtlogin" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtlogin" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtlogin" ErrorMessage="*" ValidationGroup="Group1" ValidationExpression="^[\s\S]{6,12}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Şifrə: (6 - 12 simvol)</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtpassvord" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassvord" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpassvord" ErrorMessage="*" ValidationGroup="Group1" ValidationExpression="^[\s\S]{6,12}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Şifrə (təkrar):</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtpassvord2" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassvord" ControlToValidate="txtpassvord2" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:CompareValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style40">İcazə verilən bölmələr</td>
                <td colspan="2" class="auto-style45">
                    <asp:CheckBoxList ID="chkbolmeler" runat="server" RepeatColumns="3" CssClass="menu-list">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style44">
                    <asp:Button ID="btnsave" runat="server" Text="Yadda saxla" Width="120px" OnClick="btnsave_Click" CssClass="btn btn-success" ValidationGroup="Group1" />
                </td>
                <td class="auto-style38">&nbsp;</td>
            </tr>
        </table>








        <div>
            <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 1012px;">
                <tr>
                    <td valign="top" class="auto-style33">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span lang="AZ-LATIN">Sn</span></b>
                        </p>
                    </td>
                    <td valign="top" style="text-align: center; font-weight: bold">
                         <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span lang="AZ-LATIN">Adı</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style36">
                        <p align="center" class="MsoNormal" style="text-align: center; line-height: 15.0pt">
                            <b><span>Mobil telefonu</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style37">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Elektron ünvanı</span></b>
                        </p>
                    </td>
                   <td valign="top" class="auto-style37">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>İstifadəçi adı</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style37">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Aktiv menyular</span></b>
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


                <asp:Repeater ID="Repeater1" runat="server">
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
                                    <span lang="AZ-LATIN"><%#Eval("fullname")%>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" class="auto-style36">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("Contactmobile")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style37">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Email")%>
                                    </span>
                                </p>
                            </td>
                             <td valign="top" class="auto-style37">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                       <%#Eval("Uname")%>
                                    </span>
                                </p>
                            </td>
                             <td valign="top" class="auto-style37">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("MenuActive")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" width="72">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <asp:LinkButton ID="lnkEdit" OnClick="lnkEdit_Click" CommandArgument='<%#Eval("UserID") %>' Text="Düzəliş" runat="server" />
                                    </span>
                                </p>
                            </td>
                            <td valign="top" width="72">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                          <asp:LinkButton ID="LinkButton1" OnClick="lnkDelete_Click" 
                                              OnClientClick="return confirm('Silmək istədiyinizə əminsinizmi?');" 
                                              CommandArgument='<%#Eval("UserID") %>' Text="Sil" runat="server" />

                                                                     
                                    </span>
                                </p>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>

    </div>
</asp:Content>



