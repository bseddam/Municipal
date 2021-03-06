﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="ExpenseIllik.aspx.cs" Inherits="Users_Expense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 236px;
            height: 40px;
        }

        .auto-style20 {
            height: 40px;
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

        .auto-style23 {
            height: 40px;
            font-size: 35px;
            width: 251px;
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
            width: 290px;
        }

        
        .auto-style46 {
            width: 130px;
            height: 40px;
        }
        p.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:11.0pt;
	font-family:Arial,"sans-serif";
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
        .auto-style52
        {
            width: 931px;
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
                    <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
                </div>
       <%--         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <table style="width:100%">
                            <tr>
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">Sahə</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="cmbsahe" runat="server" ValueType="System.String" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="cmbsahe_SelectedIndexChanged" DropDownStyle="DropDown">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="cmbsahe" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                &nbsp;</td>
                                        </tr>
                                    </table>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">Təyinatı</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="cmbxerc" runat="server" ValueType="System.String" Width="250px" DropDownStyle="DropDown" AutoPostBack="True" OnSelectedIndexChanged="cmbxerc_SelectedIndexChanged">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="cmbxerc" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                                         </tr>
                                    </table>
                                    </td>
                            </tr>
                              <tr>
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">İl</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="cmbil" Width="250px" runat="server" OnSelectedIndexChanged="cmbil_SelectedIndexChanged" AutoPostBack="True">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="cmbil" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                                </tr>
                                    </table>
                                    </td>
                            </tr>
                            <tr id="Tr1" runat="server">
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">Ayrılmış vəsait (manat)</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="txtAyrilmishVesait" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAyrilmishVesait" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtAyrilmishVesait" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                                    &nbsp;</td>
                                </tr>
                                    </table>
                                    </td>
                            </tr>
                          
                            <tr>
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">Təsviri</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="tesviri" CssClass="form-control"  runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="tesviri" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                                 </tr>
                                    </table>
                                    </td>
                            </tr>
                            <tr>
                                        <td style="height:10px;">

                                        </td>
                                    </tr>
                            <tr id="xercemekhaqqitr" runat="server">
                            <td >
                                &nbsp;</td>
                            </tr>
                            <tr id="xercumumi" runat="server">
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">Xərclənmiş vəsait (manat)</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="mebleg" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mebleg" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="mebleg" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" ValidationGroup="Group1" Display="Dynamic" />
                                    &nbsp;</td>
                                </tr>
                                    </table>
                                    </td>
                            </tr>
                            
                            <tr>
                                <td class="auto-style52">
                                <table>
                                    <tr>
                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style46">
                                    &nbsp;</td>
                                <td class="auto-style35">
                                    &nbsp;</td>
                                <td class="auto-style38">
                                    &nbsp;</td>
                                </tr>
                                    </table>
                                    </td>
                            </tr>

                            <%--                <tr>
                     
                    <td class="auto-style18">Yerli vergi ödəyicisinin kodu</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="yvok" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>--%>

                        </table>
            <%--        </ContentTemplate>
                </asp:UpdatePanel>--%>
                <table>
                    <tr>

                        <td class="auto-style43"></td>

                        <td class="auto-style46"></td>
                        <td class="auto-style6">
                            &nbsp;</td>
                        <td class="auto-style20"></td>
                        <td class="auto-style23"></td>
                    </tr>
                </table>
                <br />
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
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <b><span lang="AZ-LATIN">S/n</span><o:p></o:p>
                            </b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style51">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <b><span>Sahə</span><span lang="AZ-LATIN"><o:p></o:p>
                            </span></b>
                        </p>
                    </td>
                    <td valign="top" width="132">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <b><span>Təyinatı</span></b></p>
                    </td>
                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center;line-height:15.0pt">
                            <b><span>Ayrılmış vəsait (manat)<o:p></o:p>
                            </span></b>
                        </p>
                    </td>
                    <td valign="top" width="114">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <b><span>Təsviri</span></b></p>
                    </td>
                    <td valign="top" class="auto-style48">
                        <p align="center" class="MsoNormal" style="text-align:center;line-height:15.0pt">
                            <b><span>Xərclənmiş vəsait (manat)<o:p></o:p>
                            </span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style49">
                        <p align="center" class="MsoNormal" style="text-align:center;line-height:15.0pt">
                            <b><span lang="AZ-LATIN">İl<o:p></o:p>
                            </span></b>
                        </p>
                    </td>
                    

                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center;line-height:15.0pt">
                            <b><span>Düzəliş</span></b></p>
                    </td>
                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center;line-height:15.0pt">
                            <b><span>Sil</span></b></p>
                    </td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
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
                    <td valign="top" width="132">
                        <p class="MsoNormal">
                            <span lang="AZ-LATIN">
                            <%#Eval("ExpensesSubAreaName")%>
                            </span>
                        </p>
                    </td>
                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <span lang="AZ-LATIN"><%#Eval("FundsAllocated")%>
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
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <span lang="AZ-LATIN"><%#Eval("Amount")%>
                            </span>
                        </p>
                    </td>
                    <td valign="top" class="auto-style49">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <span lang="AZ-LATIN"><%#Eval("ExpensesYear")%>
                            </span>
                        </p>
                    </td>

                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <span lang="AZ-LATIN"><a href='ExpenseIllik.aspx?TaxpayerID=<%#Eval("ExpensesID") %>&islem=duzelis'>Düzəliş</a>
                            </span>
                        </p>
                    </td>
                    <td valign="top" width="72">
                        <p align="center" class="MsoNormal" style="text-align:center">
                            <span lang="AZ-LATIN"><asp:LinkButton ID="lnkDelete" CommandName="deleteRow"
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
    <div>&nbsp;</div>
    <div>&nbsp;</div>

</asp:Content>

