﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="GeneralTaxes.aspx.cs" Inherits="Users_LivingLandTax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <style type="text/css">
        
        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 10.0pt;
            font-family: Arial,"sans-serif";
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

F            .modalPopup .body {
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
         .widthfirsttd
         {
             width:200px;
         }
         .heighttr
         {
             height:30px;
         }
    .auto-style3
    {
        height: 32px;
    }
         </style>
     <script type="text/javascript">
         function PrintPanel1() {
             var panel = document.getElementById("<%=pnlprint1.ClientID %>");
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
          function PrintPanel2() {
             var panel = document.getElementById("<%=pnlprint2.ClientID %>");
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
         function PrintPanel3() {
             var panel = document.getElementById("<%=pnlprint3.ClientID %>");
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
         function PrintPanel4() {
             var panel = document.getElementById("<%=pnlprint4.ClientID %>");
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
         function PrintPanel5() {
             var panel = document.getElementById("<%=pnlprint5.ClientID %>");
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
         function PrintPanel6() {
             var panel = document.getElementById("<%=pnlprint6.ClientID %>");
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
         function PrintPanel7() {
             var panel = document.getElementById("<%=pnlprint7.ClientID %>");
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
         function PrintPanel8() {
             var panel = document.getElementById("<%=pnlprint8.ClientID %>");
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
         function PrintPanel9() {
             var panel = document.getElementById("<%=pnlprint9.ClientID %>");
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
         function PrintPanel10() {
             var panel = document.getElementById("<%=pnlprint10.ClientID %>");
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
         function PrintPanel11() {
             var panel = document.getElementById("<%=pnlprint11.ClientID %>");
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
         function PrintPanel12() {
             var panel = document.getElementById("<%=pnlprint12.ClientID %>");
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
         function PrintPanel13() {
             var panel = document.getElementById("<%=pnlprint13.ClientID %>");
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
         function PrintPanel14() {
             var panel = document.getElementById("<%=pnlprint14.ClientID %>");
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

         <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
             <asp:Label ID="lblBilgi" runat="server" Width="500px" Text=""></asp:Label>
         </div>
         <br />
   
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
              
             <ContentTemplate>

                 <div style="width: 100%; height: 80px;">
                     <b>
                     <table>
                         <tr style="height:30px;"> <td>
                                 Vergi ödəyicisi :&nbsp;
                            </td>
                             <td>
                               <dx:ASPxLabel ID="LBTaxPayerName" runat="server" Text="" Font-Bold="True"></dx:ASPxLabel>

                            </td>
                             <td>
                                 YVÖK :&nbsp;
                             </td>
                             <td> 
                                 <dx:ASPxLabel ID="YVOK" runat="server" Text="" Width="150px" Font-Bold="True"></dx:ASPxLabel>
                             </td>
                             <td>
                                 VÖEN :&nbsp;
                             </td>
                             <td>
                                 <dx:ASPxLabel ID="VOEN" runat="server" Text="" Width="150px" Font-Bold="True"></dx:ASPxLabel>
                             </td>
                        </tr>
                         <tr style="height:30px">
                             <td>
                                 Vergi və ödəniş növləri :
                             </td>
                             <td>
                                 <dx:ASPxComboBox ID="CbTaxes" runat="server" Width="450px" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbTaxes_SelectedIndexChanged"></dx:ASPxComboBox>
                             </td>
                             <td>
                                 
                             </td>
                             <td>
                                
                             </td>
                         </tr>
                     </table>
                         </b>

                 </div>                 
                 
                 <!--Yaşayış sahəsi üzrə əmlakın qeydiyyata alınması -->


                 <div id="PnlLivingPropertyTax" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Yaşayış sahəsi üzrə əmlakın qeydiyyata alınması
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DERegistrDateLiving" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                            
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:200px;">Mülkiyyət sənədinin nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtDocumentNumberLiving" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeGivingDateLiving" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                    
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                         <td>
                                             <dx:ASPxComboBox ID="CbRegionliving" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbRegionliving_SelectedIndexChanged">
                                             </dx:ASPxComboBox>
                                         </td>
                                         <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                         <td>
                                             <dx:ASPxComboBox ID="CbQKliving" runat="server" DropDownStyle="DropDown">
                                             </dx:ASPxComboBox>
                                         </td>
                                         <td>&nbsp;&nbsp;&nbsp;</td>
                                         <td>Küçə&nbsp;&nbsp;</td>
                                         <td>
                                             <dx:ASPxComboBox ID="CbStreetliving" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                             </dx:ASPxComboBox>
                                         </td>                                  
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbHomeliving" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbFletLiving" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr id="trzonaemsaliLiving" runat="server">
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td id="yzonaemsali" runat="server" class="widthfirsttd">Zona əmsalı:</td>
                                     <td style="width:170px;">
                                         <dx:ASPxComboBox ID="CbZonaLiving" runat="server" Height="16px" SelectedIndex="0">
                                             
                                         </dx:ASPxComboBox>
                                     </td>
                                     
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Ümumi sahəsi (kv. m.) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtGeneralAreaLiving" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td> 
                                     <td style="text-align:center; width:120px;">Vergi dərəcəsi:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBVergiDerecesiLiving" runat="server" Height="16px" SelectedIndex="0">
                                             
                                             <Items>
                                                 <dx:ListEditItem Selected="True" Text="Seçin" Value="0" />
                                                 <dx:ListEditItem Text="0.4" Value="1" />
                                                 <dx:ListEditItem Text="0.3" Value="2" />
                                                 <dx:ListEditItem Text="0.2" Value="3" />
                                                 <dx:ListEditItem Text="0.1" Value="4" />
                                             </Items>
                                             
                                         </dx:ASPxComboBox>
                                     </td>                                    
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td class="auto-style3">
                             <div>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Vergi güzəşti :</td>
                                     <td style="width:100px;">
                                       <dx:ASPxRadioButton ID="RbGuzeshtHeLiving" runat="server" Text="Hə" GroupName="A"></dx:ASPxRadioButton> 
   
                                     </td>  
                                     <td class="widthfirsttd">
                                       <dx:ASPxRadioButton ID="RbGuzeshtYoxLiving" runat="server" Text="Yox" GroupName="A"></dx:ASPxRadioButton>  
   
                                     </td>                                     
                                 </tr>
                             </table>
                                 </div>
                         </td>
                     </tr>
                     
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Əlavə et" Width="120px" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="btnupdateLivPro" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="btnupdateLivPro_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="msgdocument1" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                     <div align="right">
                              <asp:Button ID="btnprint1" runat="server" OnClientClick="return PrintPanel1();" Text="Print" Width="170px" />
                     </div>
         
                 <div id="pnlprint1" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td valign="center" width="62" style="text-align: center;"><b><span lang="AZ-LATIN">S/n</span></b></td>
                            
                             <td valign="center" width="113" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b>

                             </td>
                             <td valign="center" width="113" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b>

                             </td>
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b>

                             </td>
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b>

                             </td>
                             <td id="yZonaGridfieldCaption" runat="server" valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Zona əmsalı</span></b>

                             </td>
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Vergi dərəcəsi</span></b>

                             </td>
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Ümumi sahə (kv.m.)</span></b>

                             </td> 
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Vergiyə cəlb edilən sahə (kv.m.)</span></b>

                             </td>
                             <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Vergi güzəşti</span></b>

                             </td>
                              <td valign="center" width="96" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Məbləğ </span><span>(manat)</span></b>

                             </td>
                             <td valign="center" width="60" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Düzəliş</span></b>

                             </td>
                             <td valign="center" width="30" style="text-align: center;">

                                 <b><span lang="AZ-LATIN">Sil</span></b>

                             </td>
                         </tr>
                      
                        <asp:Repeater ID="DataListLivPro" runat="server" OnItemCommand="DataListLivPro_ItemCommand" OnInit="DataListLivPro_Init" OnItemCreated="DataListLivPro_ItemCreated" OnItemDataBound="DataListLivPro_ItemDataBound">
                            <ItemTemplate>
                                <tr>                                    
                                    <td valign="top" width="70" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("sn")%>
                                                <p></p>
                                            </span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("RegistrDate1")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("GivingDate1")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="left" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("unvan")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td id="yZonaGridfield" runat="server" valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Zonaname")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("TaxRate")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("GeneralArea")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("DiffGeneralArea")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" align="center" width="62" class="auto-style24">
                                        <p class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Concession")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                                                        <td valign="top" width="62" class="auto-style24">
                                        <p align="center"  class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("mebleg")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="60" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN">                                               
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="UpdaterowLivPro" CommandArgument='<%# Eval("LivingAreaID") %>'>Düzəliş</asp:LinkButton>
                                            </span>
                                        </p>
                                    </td>
                                    <td valign="top" width="30" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN">
                                                <asp:LinkButton ID="deleteLivpro" runat="server" CommandName="deleterowLivPro" CommandArgument='<%# Eval("LivingAreaID") %>'>Sil</asp:LinkButton>
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



                 <!--Yaşayış sahəsi üzrə  qeydiyyata alınması -->
                 <div id="PnlLivingLandTax" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Yaşayış sahəsi üzrə torpağın qeydiyyata alınması
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DELivLandRegisterDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Torpağın istifadə növü:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbLivingLandUsingtype" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Mülkiyyət" Value="1" />
                                                 <dx:ListEditItem Text="İstifadə" Value="2" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>        
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:90px;"></td>
                                     <td >Sənədin nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtLivingLandDocNumber" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DELivingLandDocumentDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">İstifadə müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DELivLandUsingdate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DELivLandUsingdate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                        
                                             <td>
                                                 <dx:ASPxComboBox ID="CbLivLandregion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbLivLandregion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbLivLandQK" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbLivLandStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                        
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbLivLandHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBLivLandFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Ümumi sahəsi (kv. m.) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtLivLandGeneralArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>    
                                     <td style="text-align:center; width:120px;">Vergi dərəcəsi:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbLivingLandFactor" runat="server" Height="16px" SelectedIndex="0">
                                             
                                             <Items>
                                                 <dx:ListEditItem Selected="True" Text="Seçin" Value="0" />
                                                 <dx:ListEditItem Text="0.006" Value="1" />
                                                 <dx:ListEditItem Text="0.005" Value="2" />
                                                 <dx:ListEditItem Text="0.003" Value="3" />
                                                 <dx:ListEditItem Text="0.001" Value="4" />
                                             </Items>
                                             
                                         </dx:ASPxComboBox>
                                     </td>                               
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td class="auto-style3">
                             <div>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Vergi güzəşti :</td>
                                     <td style="width:100px;">
                                       <dx:ASPxRadioButton ID="RbLivLandhe" runat="server" Text="Hə" GroupName="A"></dx:ASPxRadioButton> 
   
                                     </td>  
                                     <td class="widthfirsttd">
                                       <dx:ASPxRadioButton ID="RbLivLandyox" runat="server" Text="Yox" GroupName="A"></dx:ASPxRadioButton>  
   
                                     </td>                                     
                                 </tr>
                             </table>
                                 </div>
                         </td>
                     </tr>
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnLivingLandSave" runat="server" CssClass="btn btn-success" ValidationGroup="Group5" Text="Əlavə et" Width="120px" OnClick="BtnLivingLandSave_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnLivingLandEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group2" Text="Düzəliş" Width="120px" OnClick="BtnLivingLandEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="MsgLivingLand" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbIdLivingAreaLivingLand" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                           <div align="right">
                              <asp:Button ID="btnprint2" runat="server" OnClientClick="return PrintPanel2();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint2" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"><b><span lang="AZ-LATIN">S/n</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Torpağın istifadə növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>                             
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ümumi sahə (kv.m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi dərəcəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi güzəşti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Məbləğ (manat)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListLivLand" runat="server" OnItemCommand="DataListLivLand_ItemCommand">
                             <ItemTemplate>
                                 <tr>
                                     <td class="auto-style24" valign="top"  width="70">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("sn")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("Name")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GivingDate1")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("GeneralArea")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TaxRate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Concession1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="UpdaterowLivLand">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteLivpro0" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="deleterowLivland">Sil</asp:LinkButton>
                                             <asp:Panel ID="pnlPopup0" runat="server" CssClass="modalPopup" Style="display: none">
                                                 <div class="header">
                                                     Diqqətli olun.
                                                 </div>
                                                 <div class="body">
                                                     Silməyə əminsinizmi?
                                                 </div>
                                                 <div align="right" class="footer">
                                                     <asp:Button ID="btnYes0" runat="server" CssClass="yes" Text="Bəli" />
                                                     <asp:Button ID="btnNo0" runat="server" CssClass="no" Text="Xeyr" />
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

                 

                 <div id="PnlNolivingPropertyTax" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Qeyri yaşayış sahəsi üzrə əmlakın qeydiyyata alınması
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeQlivProregistrDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                          
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:200px;">Mülkiyyət sənədinin nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtQLivProDocumentNumber" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEQlivProDocumentDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                    <%-- <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Obyekdin kodu :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtQlivProObjectKod" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>--%>
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbQlivProRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbQlivProRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbQlivProQK" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbQlivProStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbQlivProHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbQlivProFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>

                     <tr id="trzonaemsaliQLiving" runat="server">
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Zona əmsalı:</td>
                                     <td style="width:170px;">
                                         <dx:ASPxComboBox ID="CbQlivProZona" runat="server" Height="16px" SelectedIndex="0">
                                           </dx:ASPxComboBox>
                                     </td>
                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>   

                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Ümumi sahəsi (kv. m.) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtQlivProGeneralArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>    
                                     <td style="text-align:center; width:120px;">Vergi dərəcəsi:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBQlivproTAxRate" runat="server" Height="16px" SelectedIndex="0">
                                             
                                             <Items>
                                                 <dx:ListEditItem Selected="True" Text="Seçin" Value="0" />
                                                 <dx:ListEditItem Text="0.4" Value="1" />
                                                 <dx:ListEditItem Text="0.3" Value="2" />
                                                 <dx:ListEditItem Text="0.2" Value="3" />
                                                 <dx:ListEditItem Text="0.1" Value="4" />
                                             </Items>
                                             
                                         </dx:ASPxComboBox>
                                     </td>                                  
                                 </tr>
                             </table>
                         </td>
                     </tr>
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnQlivProNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnQlivProNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnQlivProEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnQlivProEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="MsgQLivPro" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbQLivPro" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                           <div align="right">
                              <asp:Button ID="btnprint3" runat="server" OnClientClick="return PrintPanel3();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint3" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"><b><span lang="AZ-LATIN">S/n</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>                             
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b> </td>
                           <%--  <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Obyektin kodu</span></b> </td>--%>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Zona əmsalı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi dərəcəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ümumi sahə (kv.m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış illik vergi məbləği</span></b> </td>  
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListQLivpro" runat="server" OnItemCommand="DataListQLivpro_ItemCommand">
                             <ItemTemplate>
                                 <tr>
                                     <td class="auto-style24" valign="top" width="178">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <p>
                                                 <%#Eval("sn")%>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("RegistrDate1")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GivingDate1")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                    <%-- <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ObjectCode")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>--%>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("unvan")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Zonaname")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TaxRate")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GeneralArea")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p>
                                             </p>
                                             </span>
                                         </p>
                                     </td>
                                     
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="LnkbQlivProedit" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="UpdaterowQLivPro">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteQLivpro" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="deleterowQLivPro">Sil</asp:LinkButton>
                                             <asp:Panel ID="pnlPopup2" runat="server" CssClass="modalPopup" Style="display: none">
                                                 <div class="header">
                                                     Diqqətli olun.
                                                 </div>
                                                 <div class="body">
                                                     Silməyə əminsinizmi?
                                                 </div>
                                                 <div align="right" class="footer">
                                                     <asp:Button ID="btnYes2" runat="server" CssClass="yes" Text="Bəli" />
                                                     <asp:Button ID="btnNo2" runat="server" CssClass="no" Text="Xeyr" />
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




                 <div id="PnlNolivingLandtax" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Qeyri-yaşayış sahəsi üzrə torpağın qeydiyyata alınması
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEQlivLandRegister" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Torpağın istifadə növü:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbQlivLandUsingLand" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Mülkiyyət" Value="1" />
                                                 <dx:ListEditItem Text="İstifadə" Value="2" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>        
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:98px;"></td>
                                     <td >Sənədin nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtQlivLandDocumentNumber" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEQlivLandGiveDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">İstifadə müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEQlivLandUsingDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEQlivLandUsingDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                            <td>
                                                 <dx:ASPxComboBox ID="CbQlivLandRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbQlivLandRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbQlivLandQk" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbQlivLandStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbQlivLandHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBQlivLandFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Ümumi sahəsi (kv. m.) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtQlivLandGeneralArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>   
                                     <td style="text-align:center; width:120px;">Vergi dərəcəsi:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbQlivLandTaxRate" runat="server" Height="16px" SelectedIndex="0">
                                             
                                             <Items>
                                                 <dx:ListEditItem Selected="True" Text="Seçin" Value="0" />
                                                 <dx:ListEditItem Text="0.10" Value="1" />
                                                 <dx:ListEditItem Text="0.08" Value="2" />
                                                 <dx:ListEditItem Text="0.04" Value="3" />
                                                 <dx:ListEditItem Text="0.02" Value="4" />
                                             </Items>
                                             
                                         </dx:ASPxComboBox>
                                     </td>                                   
                                 </tr>
                             </table>
                         </td>
                     </tr>
                    
                    <tr class="heighttr">
                         <td class="auto-style3">
                             <div>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Vergi güzəşti :</td>
                                     <td style="width:100px;">
                                       <dx:ASPxRadioButton ID="RBQlivLAndhe" runat="server" Text="Hə" GroupName="A"></dx:ASPxRadioButton> 
   
                                     </td>  
                                     <td class="widthfirsttd">
                                       <dx:ASPxRadioButton ID="RBQlivLAndyox" runat="server" Text="Yox" GroupName="A" Height="21px"></dx:ASPxRadioButton>  
   
                                     </td>                                     
                                 </tr>
                             </table>
                                 </div>
                         </td>
                     </tr>
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnNewQlivLand" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnNewQlivLand_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnEditQlivLand" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnEditQlivLand_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="MsgQlivLand" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbIdQlivLand" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                           <div align="right">
                              <asp:Button ID="btnprint4" runat="server" OnClientClick="return PrintPanel4();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint4" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Torpağın istifadə növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İstifadə müddəti (tarixdən)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İstifadə müddəti (tarixədək)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ümumi sahə (kv.m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi dərəcəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi güzəşti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış illik vergi məbləği</span></b> </td> 
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListQLivLand" runat="server" OnItemCommand="DataListQLivLand_ItemCommand">
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
                                             <span lang="AZ-LATIN"><%#Eval("RegistrDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TypeUseLand1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GivingDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("UsingBeginDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("UsingEndDate1")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("GeneralArea")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TaxRate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Concession1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td> 
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>  
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateQlivLand" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="UpdaterowQLivLand">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteQLivLand" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="deleterowQLivLand">Sil</asp:LinkButton>
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
                 





                     <div id="PnlVillageLand" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Kənd təsərrüfatı təyinatlı torpaq sahələri üzrə
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeVillageRegistr" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Torpağın istifadə növü:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbVillageUseType" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Mülkiyyət" Value="1" />
                                                 <dx:ListEditItem Text="İstifadə" Value="2" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>        
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:98px;"></td>
                                     <td >Sənədin nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtVillageDocumetNumber" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeVillageGivDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">İstifadə müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeVillageUseDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeVillageUseDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                            <td>
                                                 <dx:ASPxComboBox ID="CbVillageRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbVillageRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbVillageQk" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                            
                                             <td style="width:100px; text-align:center">Küçə</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbVillageStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbVillageHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbVillageFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Sahəsi (hektar) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtVillageArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>   
                                     <td style="width:120px; text-align:center;">Keyfiyyət qrupu</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbVillageQualityGroup" runat="server" ValueType="System.String" DropDownStyle="DropDown">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" />
                                                 <dx:ListEditItem Text="I" Value="1" />
                                                 <dx:ListEditItem Text="II" Value="2" />
                                                 <dx:ListEditItem Text="III" Value="3" />
                                                 <dx:ListEditItem Text="IV" Value="4" />
                                                 <dx:ListEditItem Text="V" Value="5" />
                                              </Items>
                                         </dx:ASPxComboBox>
                                     </td> 
                                     <td style="width:100px; text-align:center">Şərti bal :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtVillageConditionalPoints" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                  
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td class="auto-style3">
                             <div>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Vergi güzəşti :</td>
                                     <td style="width:100px;">
                                       <dx:ASPxRadioButton ID="RBVillageHe" runat="server" Text="Hə" GroupName="A"></dx:ASPxRadioButton> 
   
                                     </td>  
                                     <td class="widthfirsttd">
                                       <dx:ASPxRadioButton ID="RBVillageYox" runat="server" Text="Yox" GroupName="A" Height="21px"></dx:ASPxRadioButton>  
   
                                     </td>                                     
                                 </tr>
                             </table>
                                 </div>
                         </td>
                     </tr>
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnvillageNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnvillageNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnvillageEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnvillageEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="MsgVillageLand" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbİdVillageLand" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                               <div align="right">
                              <asp:Button ID="btnprint5" runat="server" OnClientClick="return PrintPanel5();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint5" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" 
                         style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; 
mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; 
mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;" >
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Torpağın istifadə növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İstifadə müddəti (tarixdən)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İstifadə müddəti (tarixədək)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ümumi sahə (ha)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Keyfiyyət qrupu</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Şərti bal</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Vergi güzəşti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış illik məbləğ (manat)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListVillageLand" runat="server" OnItemCommand="DataListVillageLand_ItemCommand">
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
                                             <span lang="AZ-LATIN"><%#Eval("RegistrDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Name")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GivingDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("UsingBeginDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("UsingEndDate1")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("GeneralArea")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("QualityGroup")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ConditionalPoints")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Concession1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateVillageLand" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="UpdaterowVillageLand">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteVillageLand" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="deleterowVillageLand">Sil</asp:LinkButton>
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







                                          <div id="PnlTransport" runat="server">
            <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
                Nəqliyyat vasitəsinin qeydiyyata alınması
            </div>
            <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Nəqliyyat vasitəsinin növü:</td>
                                <td>
                                    <asp:RadioButton ID="rdsu" runat="server" Checked="True" GroupName="B" Text="Su" />
                                    &nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="rdhava" runat="server" GroupName="B" Text="Hava" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Qeydiyyata alınma tarixi :</td>
                                <td>
                                    <dx:ASPxDateEdit ID="qeydtrx" runat="server"></dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Mülkiyyət sənədinin nömrəsi :</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtmulknom" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td style="width: 120px; text-align: center;">verilmə tarixi:</td>
                                <td>
                                    <dx:ASPxDateEdit ID="mukltrx" runat="server"></dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Adı :</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtneqladi" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Buraxılış ili :</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbburaxili" runat="server">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Nəqliyyat vasitəsi :</td>
                                <td>
                                    <asp:RadioButton ID="rdmuhli" runat="server" AutoPostBack="True" Checked="True" GroupName="A" Text="Mühərrikli" OnCheckedChanged="rdmuhli_CheckedChanged" />
                                    &nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="rdmuhsiz" runat="server" AutoPostBack="True" GroupName="A" Text="Mühərriksiz" OnCheckedChanged="rdmuhsiz_CheckedChanged" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <asp:Panel ID="pnlmuhli" Visible="true" runat="server">
                    <tr class="heighttr">
                        <td>
                            <table>
                                <tr>
                                    <td class="widthfirsttd">Mühərrikin həcmi<br />
                                        (kub santimetr) :</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtmuhhecm" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="pnlmuhsiz" Visible="false" runat="server">
                    <tr class="heighttr">
                        <td>
                            <table>
                                <tr>
                                    <td class="widthfirsttd">Dəyəri (manat) :</td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtdeyer" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="neqlyelaveet" runat="server" CssClass="btn btn-success" ValidationGroup="Group5" Text="Əlavə et" Width="120px" OnClick="neqlyelaveet_Click" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btnsuhava" runat="server" CssClass="btn btn-success" ValidationGroup="Group2" Text="Düzəliş" Width="120px" OnClick="btnsuhava_Click" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <dx:ASPxLabel ID="gizle" runat="server" Text="" Font-Size="Medium" Visible="False"></dx:ASPxLabel>
                            <asp:Label ID="lblsms" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
                     <div align="right">
                              <asp:Button ID="btnprint6" runat="server" OnClientClick="return PrintPanel6();" Text="Print" Width="170px" />
                     </div>
            <div id="pnlprint6" style="height: auto; width: 100%; background-color: white;"  runat="server">
                <table  border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; 
mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; 
mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                    <tr>
                        <td style="text-align: center;" valign="center" width="62"><b><span lang="AZ-LATIN">S/n</span></b> </td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Nəqliyyat vasitəsinin növü</span></b> </td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin nömrəsi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyət sənədinin verilmə tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Adı</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Buraxılış ili</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Nəqliyyat vasitəsi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mühərrikin həcmi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Dəyəri</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış vergi məbləği</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                        <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                    </tr>
                    <asp:Repeater ID="rpneqliyyat" runat="server" OnItemCommand="rpneqliyyat_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="auto-style24" valign="top" width="178">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <p><%#Container.ItemIndex+1%></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("Registrdate").ToString()) %> 
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("TransportType")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("GivingDate").ToString()) %> 
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Name")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>

                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("GraduationYear")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                                                <td class="auto-style24" valign="top" width="62">
                                    <p class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("MotorType")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("MotorSize")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Price")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="62">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                            <p></p>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("TransportID") %>' CommandName="Updaterowneqliyyat">Düzəliş</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="30">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="deleteLivpro0" runat="server" CommandArgument='<%# Eval("TransportID") %>' CommandName="deleterowneqliyyat">Sil</asp:LinkButton>
                                            <asp:Panel ID="pnlPopup0" runat="server" CssClass="modalPopup" Style="display: none">
                                                <div class="header">
                                                    Diqqətli olun.
                                                </div>
                                                <div class="body">
                                                    Silməyə əminsinizmi?
                                                </div>
                                                <div align="right" class="footer">
                                                    <asp:Button ID="btnYes0" runat="server" CssClass="yes" Text="Bəli" />
                                                    <asp:Button ID="btnNo0" runat="server" CssClass="no" Text="Xeyr" />
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









                  <div id="PnlMeden" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     Mədən vergisi
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEMedenRegstrDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Tikinti materiallarının növü:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbMedenType" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Kərpic – kirəmit gilləri" Value="1" />
                                                 <dx:ListEditItem Text="Tikinti qumları" Value="2" />
                                                 <dx:ListEditItem Text="Çınqıl xammal" Value="3" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>    
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Çıxarılan&nbsp; yerin ünvanı : </td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtPositionAdres" runat="server" Width="460px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>    
                     
                     <tr class="heighttr">
                         <td>
                             Yerləşdiyi ünvan:
                             </td>
                        </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                            <td>
                                                 <dx:ASPxComboBox ID="CbMedenRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbMedenRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbMedenQk" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CbMedenStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbMedenHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbMedenFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     
                    
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnMedenNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnMedenNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnMedenEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnMedenEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="MsgMeden" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbIdMeden" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                     <div align="right">
                       <asp:Button ID="btnprint7" runat="server" OnClientClick="return PrintPanel7();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint7" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" 
                         style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; 
mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; 
mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Tikinti materiallarının növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Yerləşdiyi yer</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
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

                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateMeden" runat="server" CommandArgument='<%# Eval("MineID") %>' CommandName="UpdaterowMeden">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteMeden" runat="server" CommandArgument='<%# Eval("MineID") %>' CommandName="deleterowMeden">Sil</asp:LinkButton>
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
                     


                    
                    
                     <div id="Pnllease" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş</span></b></div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeleaseRegistrDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd"><b><span lang="AZ-CYR">İcarə müqaviləsinin </span></b>:</td>
                                     <td>
                                         
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>        
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:90px;"></td>
                                     <td style="width:110px;">Nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtleaseDocNum" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">bağlanma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeleaseDocGivDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr><td style="width:90px;"></td>
                                     <td style="width:110px;">Müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEleaseDocDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEleaseDocDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd"><b><span lang="AZ-CYR">İcarəyə verilmiş mülkiyyətin</span></b>:</td>
                                     <td>
                                        
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Növü:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBleaseType" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Torpaq" Value="1" />
                                                 <dx:ListEditItem Text="Bina" Value="2" />
                                                 <dx:ListEditItem Text="Digər" Value="3" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                           
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Təyinatı:&nbsp;&nbsp;</td>
                                     <td>
                                        <dx:ASPxTextBox ID="txtleasefixing" runat="server" Width="460px"></dx:ASPxTextBox> 
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width: 90px;"></td>
                                     <td style="width: 110px;">Ünvanı:&nbsp;&nbsp;</td>
                                     <td></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>

                                     <td style="width: 200px; text-align: right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBleaseregion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CBleaseregion_SelectedIndexChanged">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBleaseQK" runat="server" DropDownStyle="DropDown">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;</td>
                                     <td>Küçə&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbleaseStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBleaseHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBleaseFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                        <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;"> Sahəsi (kv. m.) :&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtleaseArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>    
                                     <td style="width:190px; text-align:right;">Əmsal(1 kv.m. 1 ay üçün) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtleaseFaktor" runat="server" Width="100px"></dx:ASPxTextBox>
                                     </td>                                   
                                 </tr>
                             </table>
                        </td>
                     </tr>
                    
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnleaseNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnleaseNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnleaseEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnleaseEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LbleaseMsg" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbleaseID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                      <div align="right">
                              <asp:Button ID="btnprint8" runat="server" OnClientClick="return PrintPanel8();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint8" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed;
mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; 
mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>                             
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">İcarə müqaviləsinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İcarə müqaviləsinin verilmə tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İcarə müqaviləsinin müddəti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İcarəyə verilmiş mülkiyyətin növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">İcarəyə verilmiş mülkiyyətin təyinatı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ümumi sahə (kv. m.)</span></b> </td>   
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Əmsal (1_kv.m. üçün)</span></b> </td>  
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış məbləğ (manat)</span></b> </td>                            
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListLease" runat="server" OnItemCommand="DataListLease_ItemCommand">
                             <ItemTemplate>
                                 <tr>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <p><%#Eval("sn")%></p>
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
                                             <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GivingDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("UsingBeginDate1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TypeUseLand1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("LeaseFixing")%>
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
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("GeneralArea")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("TaxRate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateleaseEdit" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="Updaterowlease">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteleaseDelete" runat="server" CommandArgument='<%# Eval("LivingAreaID") %>' CommandName="deleterowlease">Sil</asp:LinkButton>
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





                  <div id="PnlReklam" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Küçə (divar) reklamının yayımı üçün ödəniş</span></b>
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEAdvertisementRegisterDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd"><b><span lang="AZ-CYR">Reklam daşıyıcısının : </span></b>:</td>
                                     <td>
                                         
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>    
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:180px;">1.Kateqoriyası (yeri) :</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBAdvertisementKateqoriya" runat="server" Height="16px" Width="682px" SelectedIndex="0" AutoPostBack="True" OnSelectedIndexChanged="CBAdvertisementKateqoriya_SelectedIndexChanged">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Yerüstü keçidlərdə, körpü və estakadalarda" Value="1" />
                                                 <dx:ListEditItem Text="Küçələrin kənarlarında, meydan, park, bağ və yol ayrıclarında" Value="2" />
                                                 <dx:ListEditItem Text="Damlarda, binaların, hava şarlarının, aerostat və dirijablların üzərində" Value="3" />
                                                 <dx:ListEditItem Text="Yeraltı keçidlərdə, dayanacaqlarda, ticarət, köşk və yanacaqdoldurma pavilyonlarının günlüklərində" Value="4" />
                                                 <dx:ListEditItem Text="Hasarlarda, vitrin və pəncərələrdə" Value="5" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>   
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width: 20px;"></td>
                                     <td style="width: 180px;">2. Ünvanı :&nbsp;&nbsp;</td>
                                     <td></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>

                                     <td style="width: 200px; text-align: right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbAdvertisementRegionName" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CbAdvertisementRegionName_SelectedIndexChanged">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBAdvertisementVillageName" runat="server" DropDownStyle="DropDown">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;</td>
                                     <td>Küçə&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbAdvertisementStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>                     
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>                                                                 
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBAdvertisementHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbAdvertisementFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                      <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>   
                                     <td style="width:180px;">3. Yerləşdiyi zona :</td>
                                     <td>
                                         <asp:RadioButton ID="RBAdvertisementA" runat="server" GroupName="A" Text="A" AutoPostBack="True" OnCheckedChanged="RBAdvertisementA_CheckedChanged" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="RBAdvertisementB" runat="server" GroupName="A" Text="B" AutoPostBack="True" OnCheckedChanged="RBAdvertisementB_CheckedChanged" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="RBAdvertisementC" runat="server" GroupName="A" Text="C" AutoPostBack="True" OnCheckedChanged="RBAdvertisementC_CheckedChanged" />
                                     </td>
                                     <td style="width:50px;"></td>   
                                     <td>Zonalar üzrə aylıq ödəniş tarifi (1 kv. m)  :&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxLabel ID="LBAdvertisementFactor" runat="server" Text="" Font-Bold="True"></dx:ASPxLabel>
                                     </td>

                                 </tr>
                             </table>
                         </td>
                     </tr> 
                      <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>  
                                     <td class="widthfirsttd">4. Reklamın :</td>
                                     <td>
                                         
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                      <tr>
                        <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:180px;">Ölçüsü (kv. m.) :&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtAdvertisementSize" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:180px;">Mövzusu :&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtAdvertisementTema" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>   
                                    
                                     <td style="width:110px;">&nbsp;&nbsp;&nbsp;Əmsal :&nbsp;&nbsp;</td>
                                     <td>
                                        <dx:ASPxComboBox ID="txtAdvertisementEmsal" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                            <Items>
                                            <dx:ListEditItem Text="1" Value="0" Selected="True" />
                                            <dx:ListEditItem Text="0.7" Value="1" />
                                            <dx:ListEditItem Text="0.5" Value="2" />
                                            <dx:ListEditItem Text="0.1" Value="3" />
                                            </Items>
                                         </dx:ASPxComboBox>
                                     </td>   
                                     
                                     <td style="width:180px;"></td>
                                     <td style="width:180px;"></td>                                
                                 </tr>
                             </table>
                        </td>
                     </tr>
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:20px;"></td>
                                     <td style="width:180px;">İcazə sənədinin  nömrəsi: </td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtAdvertisementPermitDocNum" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:110px;">&nbsp;&nbsp;&nbsp;Müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEAdvertisementPermitDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEAdvertisementPermitDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:20px;"></td>
                                     <td style="width:180px;">Müqavilənin  nömrəsi:  </td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtContractDocNum" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:110px;">&nbsp;&nbsp;&nbsp;Müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEContractDocDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEContractDocDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td class="widthfirsttd">Yayımın başlanma  tarixi :</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="OutreachDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>                   
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td class="widthfirsttd">Yayımın dayandırılma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="OutreachDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     
                    
                    
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnAdvertisementNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnAdvertisementNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnAdvertisementEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnAdvertisementEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LbAdvertisementMSG" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LBAdvertisementID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                 <div align="right">
                              <asp:Button ID="btnprint9" runat="server" OnClientClick="return PrintPanel9();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint9" style="height:auto; width:100%; background-color:white;"  runat="server" ScrollBars="Horizontal">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed;
mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; 
mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Kateqoriyası (yeri)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Ünvanı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləş- diyi zona</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN"> Reklamın ölçüsü (kv. m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mövzusu</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Əmsal</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">İcazə sənədinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">İcazə sənədinin müddəti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Müqavilənin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Müqavilənin müddəti</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Yayımın başlanma - dayandırılma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Zonalar üzrə aylıq ödəniş tarifi (1 kv.m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Hesablanmış məbləq  (manat)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListAdvertisement" runat="server" OnItemCommand="DataListAdvertisement_ItemCommand" >
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
                                             <span lang="AZ-LATIN"><%#Eval("RegisterDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("kateqoriyatxt")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("ZonaABC1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AdvertisemenSize")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AdvertisemenTema")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AdvertisemenEmsal")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AdvertisPermitDocNum")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AdvertisPermitDocDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                    
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractDocNum")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractDocDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("OutreachDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Factor")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateAdvertisement" runat="server" CommandArgument='<%# Eval("AdvertisementID") %>' CommandName="UpdaterowAdvertisement">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteAdvertisement" runat="server" CommandArgument='<%# Eval("AdvertisementID") %>' CommandName="deleterowAdvertisement">Sil</asp:LinkButton>
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



                  <div id="PnlCarParking" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş</span></b>
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DECarStopRegisterDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd"><b><span lang="AZ-CYR">Dayanacağın : </span></b>:</td>
                                     <td>
                                         
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>   
                                     <td style="width:180px;">Növü :</td>
                                     <td>
                                         <asp:RadioButton ID="RBCarType1" runat="server" GroupName="A" Text="daimi" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="RBCarType2" runat="server" GroupName="A" Text="müvəqqəti" />
                                     </td>
                                     <td>                                        
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>   
                                     <td style="width:180px;"></td>
                                     <td>
                                         <asp:RadioButton ID="RBCarType3" runat="server" GroupName="A" Text="İxtisaslaşdırilmış avtodayanacaq" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="RBCarType4" runat="server" GroupName="A" Text="Bələdiyyə qərarına əsasən müəyyənləşdirilmiş avtodayanacaq" />
                                     </td>
                                     <td>                                        
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width: 20px;"></td>
                                     <td style="width: 180px;">Ünvanı :&nbsp;&nbsp;</td>
                                     <td></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>

                                     <td style="width: 200px; text-align: right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBCarRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CBCarRegion_SelectedIndexChanged">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBCarVillage" runat="server" DropDownStyle="DropDown">
                                         </dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;</td>
                                     <td>Küçə&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBCarStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>                     
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>                                                                 
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBCarHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbCarFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>                       
                     <tr>
                        <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:180px;">Dayanacağın sahəsi(kv. m.):</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtCarArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:180px;">Tutumu(avtomobil sayı) :&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtCarCount" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                        </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:300px;">Xidmət göstərilməsinin başlanma tarixi :</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DECarDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>                   
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:300px;">Xidmət göstərilməsinin dayandırılma tarixi :</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DECarDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     
                    
                    
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnCarStopNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnCarStopNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnCarStopEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnCarStopEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LbCarStopmsg" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbCarStopID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                            <div align="right">
                              <asp:Button ID="btnprint10" runat="server" OnClientClick="return PrintPanel10();" Text="Print" Width="170px" />
                     </div>
                 <div  id="pnlprint10" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Dayanacağın növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Ünvanı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Dayanacağın sahəsi(kv. m.)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Tutumu(avtomobil sayı)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstərilməsinin başlanma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstərilməsinin dayandırılma tarixi</span></b> </td>
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
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ServiceDate1")%>
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
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateCarStop" runat="server" CommandArgument='<%# Eval("CarID") %>' CommandName="UpdaterowCarStop">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteCarStop" runat="server" CommandArgument='<%# Eval("CarID") %>' CommandName="deleterowCarStop">Sil</asp:LinkButton>
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



                  <div id="Pnltourism" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş</span></b> 

                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DeHotelRegisterDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Müəssisənin növü:</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbHoletType" runat="server" Height="16px" Width="170px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Mehmanxana" Value="1" />
                                                 <dx:ListEditItem Text="Sanatoriya- kurort" Value="2" />
                                                 <dx:ListEditItem Text="Turizm" Value="3" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr> 
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Müəssisənin adı:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtHotelName" runat="server" Width="290px"></dx:ASPxTextBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>                      
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:300px;">Xidmət göstərilməsinin başlanma tarixi :</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEHotelServicesDate1" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>                   
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:20px;"></td>
                                     <td style="width:300px;">Xidmət göstərilməsinin dayandırılma tarixi :</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEHotelServicesDate2" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>

                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnHotelNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnHotelNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnHotelEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnHotelEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LbHotelMsg" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbHotelID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                            <div align="right">
                              <asp:Button ID="btnprint11" runat="server" OnClientClick="return PrintPanel11();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint11" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müəssisənin növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Müəssisənin adı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstərilməsinin başlanma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Xidmət göstərilməsinin dayandırılma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListHotel" runat="server" OnItemCommand="DataListHotel_ItemCommand">
                             <ItemTemplate>
                                 <tr>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <p><%#Eval("sn")%></p>
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
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateHotel" runat="server" CommandArgument='<%# Eval("HotelID") %>' CommandName="UpdaterowHotel">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteHotel" runat="server" CommandArgument='<%# Eval("HotelID") %>' CommandName="deleterowHotel">Sil</asp:LinkButton>
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





                  <div id="PnlStosionar" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Stasionar və ya səyyar ticarət, ictimai iaşə, su satışı və digər xidmətlərə görə ödəniş</span></b></div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DETradeRegistrDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             Müqavilənin :
                             </td>
                        </tr>      
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:90px;"></td>
                                     <td style="width:110px;">Nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtTradeDocNum" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Bağlanma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DETradeGivDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Müddəti:&nbsp;&nbsp;</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DETradeBeginDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:120px; text-align:center;">tarixindən</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DETradeEndDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td>&nbsp;&nbsp;tarixinədək</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:200px;"><%--Ayrılmış torpağın :&nbsp;&nbsp;--%></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Məbləğ (AZN) :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtTradeLandArea" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Ünvanı :&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                            <td>
                                                 <dx:ASPxComboBox ID="CBTradeRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CBTradeRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CBTradeVillage" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CBTradeStreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBTradeHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBTradeFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     
                    <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Göstərilən xidmətin növü :</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CbTradeServicesType" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Stasionar və ya səyyar ticarət" Value="1" />
                                                 <dx:ListEditItem Text="İctimai iaşə" Value="2" />
                                                <%-- <dx:ListEditItem Text="Digər xidmətlər" Value="3" />--%>
                                                 <dx:ListEditItem Text="Su satışı" Value="4" />
                                                 <dx:ListEditItem Text="Məişət tullantıları" Value="5" />
                                                 <dx:ListEditItem Text="Mərasim xidmətləri" Value="6" />
                                                 <dx:ListEditItem Text="Kənd təsərrüfatı məhsulları" Value="7" />
                                                 <dx:ListEditItem Text="Stüasiya planı və arayış" Value="8" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnTradeNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnTradeNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnTradeEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnTradeEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LbTrademsg" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LbTradeID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                            <div align="right">
                              <asp:Button ID="btnprint12" runat="server" OnClientClick="return PrintPanel12();" Text="Print" Width="170px" />
                     </div>
                 <div id="pnlprint12" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müqavilənin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Müqavilənin bağlanma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müqavilənin müddəti (tarixdən)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müqavilənin müddəti (tarixədək)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Məbləğ (AZN)</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ayrılmış torpağın ünvanı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Göstərilən xidmətin növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Hesablanmış ödəniş məbləği (manat)</span></b> </td> 
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListTrade" runat="server" OnItemCommand="DataListTrade_ItemCommand">
                             <ItemTemplate>
                                 <tr>
                                     <td class="auto-style24" valign="top" width="178">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <%#Eval("sn")%>
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
                                             <span lang="AZ-LATIN"><%#Eval("ContractDocNum")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractGiveDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractBeginDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractEndDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("LandArea")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("unvan")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>                                     
                                     <td class="auto-style24" valign="top" width="62">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ServiceType1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="62">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Mebleg")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdateTrade" runat="server" CommandArgument='<%# Eval("TradeID") %>' CommandName="UpdaterowTrade">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deleteTrade" runat="server" CommandArgument='<%# Eval("TradeID") %>' CommandName="deleterowTrade">Sil</asp:LinkButton>
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

                  <div id="PnlPrivate" runat="server">
                 <div style="height:auto; width:100%; background-color:rgba(0, 0, 0, 0.07); text-align:center; font-size:16px;">
                     <b><span lang="AZ-LATIN">Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsinə görə ödəniş</span></b>
                     </div>
                 <table cellpadding="1" cellspacing="1" class="nav-justified" border="0">
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEPrivateRegistrdate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                 </tr>
                             </table>
                             
                         </td>
                     </tr>
                    
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:200px;">Mülkiyyətin :&nbsp;&nbsp;</td>                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="heighttr">
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Növü :</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBPrivateType" runat="server" Height="16px" SelectedIndex="0">
                                             <Items>
                                                 <dx:ListEditItem Text="Seçin" Value="0" Selected="True" />
                                                 <dx:ListEditItem Text="Torpaq" Value="1" />
                                                 <dx:ListEditItem Text="Bina" Value="2" />
                                                 <dx:ListEditItem Text="Digər" Value="3" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>  
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>
                                     <td style="width:90px;"></td>
                                     <td style="width:110px;">Ünvanı :&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>

                                     <td style="width:200px; text-align:right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                            <td>
                                                 <dx:ASPxComboBox ID="CBPrivateRegion" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="CBPrivateRegion_SelectedIndexChanged">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CBPrivateVillage" runat="server" DropDownStyle="DropDown">
                                                 </dx:ASPxComboBox>
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;</td>
                                             <td>Küçə&nbsp;&nbsp;</td>
                                             <td>
                                                 <dx:ASPxComboBox ID="CBPrivatestreet" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                                 </dx:ASPxComboBox>
                                             </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr class="heighttr">
                         <td>
                             <table>
                                 <tr>                                    
                                     <td style="width:200px; text-align:right;"> Ev/Bina &nbsp&nbsp</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBPrivateHome" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">Mənzil</td>
                                     <td>
                                         <dx:ASPxComboBox ID="CBPrivateFlat" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                     </td>
                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                      <tr class="heighttr">
                         <td>
                             Alqı satqı müqaviləsinin : 
                             </td>
                        </tr>      
                     <tr class="heighttr">                        
                         <td>
                             <table>
                                 <tr>
                                      <td style="width:90px;"></td>
                                     <td style="width:110px;">Nömrəsi:</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtPrivatContractNum" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                     <td style="width:120px; text-align:center;">verilmə tarixi:</td>
                                     <td>
                                         <dx:ASPxDateEdit ID="DEPrivatContracDate" runat="server"></dx:ASPxDateEdit>
                                     </td>
                                     <td style="width:150px; text-align:center;">Ödəniləcək məbləğ :</td>
                                     <td>
                                         <dx:ASPxTextBox ID="txtPrivateAmount" runat="server" Width="170px"></dx:ASPxTextBox>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                    
                    
                     <tr>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
                 
                 <div style="width: 100%;height:70px; background-color:rgba(0, 0, 0, 0.07)">

                     <table>
                         <tr style="height:70px;">
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnPrivateNew" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="BtnPrivateNew_Click" />

                             </td>
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td >
                                 <asp:Button ID="BtnPrivateEdit" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="BtnPrivateEdit_Click" />

                             </td>
                             <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <dx:ASPxLabel ID="LBPrivatemsg" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                                 <asp:Label ID="LBPrivateID" runat="server" Visible="False"></asp:Label>
                                 </td>                             
                         </tr>
                     </table>
                 </div>
                            <div align="right">
                              <asp:Button ID="btnprint13" runat="server" OnClientClick="return PrintPanel13();" Text="Print" Width="170px" />
                     </div>
                 <div  id="pnlprint13" style="height:auto; width:100%; background-color:white;" runat="server">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                         <tr>
                             <td style="text-align: center;" valign="center" width="62"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Mülkiyyətin növü</span></b> </td>
                             <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Mülkiyyətin ünvanı</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Alqı satqı müqaviləsinin nömrəsi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Alqı satqı müqaviləsinin verilmə tarixi</span></b> </td>
                             <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Ödəniləcək məbləğ</span></b> </td>
                             <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                             <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                         </tr>
                         <asp:Repeater ID="DataListPrivate" runat="server" OnItemCommand="DataListPrivate_ItemCommand">
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
                                             <span lang="AZ-LATIN"><%#Eval("RegistrDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AlienationType1")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("Unvan")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractNum")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("ContractGiveDate")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="113">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN"><%#Eval("AmountOnContract")%>
                                             <p></p>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="60">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="UpdatePrivate" runat="server" CommandArgument='<%# Eval("AlienationID") %>' CommandName="UpdaterowPrivate">Düzəliş</asp:LinkButton>
                                             </span>
                                         </p>
                                     </td>
                                     <td class="auto-style24" valign="top" width="30">
                                         <p align="center" class="MsoNormal">
                                             <span lang="AZ-LATIN">
                                             <asp:LinkButton ID="deletePrivate" runat="server" CommandArgument='<%# Eval("AlienationID") %>' CommandName="deleterowPrivate">Sil</asp:LinkButton>
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
 <div id="PnlMenfeet" runat="server">

            <div style="height: auto; width: 100%; background-color: rgba(0, 0, 0, 0.07); text-align: center; font-size: 16px;">
                Mənfəət vergisi
            </div>

            <table>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Qeydiyyata alınma tarixi:</td>
                                <td>
                                    <dx:ASPxDateEdit ID="qeydtarix" runat="server"></dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                   <tr class="heighttr">
                    <td>Müəssisənin:
                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td style="width: 200px; text-align: right;">Adı:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtmuesadi" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td style="width: 120px; text-align: center;">Fəaliyyət növü:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtfealnov" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>

                            </tr>
                        </table>
                    </td>
                </tr>
                                   <tr class="heighttr">
                    <td>Hüquqi ünvanı təsdiq edən sənədin
                    </td>
                </tr>
                                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td style="width: 200px; text-align: right;">Nömrəsi:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtnumdoc" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td style="width: 120px; text-align: center;">Verilmə tarixi:</td>
                                <td>
                                   <dx:ASPxDateEdit ID="txtvertrx" runat="server"></dx:ASPxDateEdit>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>

                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="heighttr">
                    <td>Yerləşdiyi ünvan:
                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td style="width: 200px; text-align: right;">Şəhər/Rayon &nbsp;&nbsp;</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbray" runat="server" DropDownStyle="DropDown" ValueType="System.String" AutoPostBack="True" OnSelectedIndexChanged="cmbray_SelectedIndexChanged">
                                    </dx:ASPxComboBox>
                                </td>
                                <td style="width: 120px; text-align: center;">Qəsəbə/Kənd</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbyasmen" runat="server" DropDownStyle="DropDown">
                                    </dx:ASPxComboBox>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>Küçə&nbsp;&nbsp;</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbkuce" runat="server" DropDownStyle="DropDown" ValueType="System.String">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td style="width: 200px; text-align: right;">Ev/Bina &nbsp&nbsp</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbev" runat="server" ValueType="System.String" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                </td>
                                <td style="width: 120px; text-align: center;">Mənzil</td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbmenzil" runat="server" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                                <tr class="heighttr">
                    <td>
                        <table>
                            <tr>
                                <td class="widthfirsttd">Poçt indeksi:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtpoctin" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                                               
            </table>
             <div style="width: 100%; height: 70px; background-color: rgba(0, 0, 0, 0.07)">

                <table>
                    <tr style="height: 70px;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btnmenfeet" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Əlavə et" Width="120px" OnClick="btnmenfeet_Click1"  />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <asp:Button ID="btnmendeyiw" runat="server" CssClass="btn btn-success" ValidationGroup="Group1" Text="Düzəliş" Width="120px" OnClick="btnmendeyiw_Click1"  />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <dx:ASPxLabel ID="lbler" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
                            <asp:Label ID="lblgizlemen" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
           <div align="right">
              <asp:Button ID="btnprint14" runat="server" OnClientClick="return PrintPanel14();" Text="Print" Width="170px" />
           </div>
            <div  id="pnlprint14" style="height: auto; width: 100%; background-color: white;" runat="server">
                <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 100%; height: 49px;">
                    <tr>
                        <td style="text-align: center;" valign="center" class="auto-style4"></b>&nbsp;<b><span lang="AZ-LATIN">S/n</span></b></td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Qeydiyyata alınma tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Müəssisənin adı</span></b></td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Sənədin nömrəsi</span></b></td>
                        <td style="text-align: center;" valign="center" width="113"><b><span lang="AZ-LATIN">Verilmə tarixi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>
                        <td style="text-align: center;" valign="center" width="96"><b><span lang="AZ-LATIN">Poçt indeksi</span></b> </td>
                        <td style="text-align: center;" valign="center" width="60"><b><span lang="AZ-LATIN">Düzəliş</span></b> </td>
                        <td style="text-align: center;" valign="center" width="30"><b><span lang="AZ-LATIN">Sil</span></b> </td>
                    </tr>
                    <asp:Repeater ID="rpmenfeet" runat="server" OnItemCommand="rpmenfeet_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="auto-style4" valign="top">
                                    <p class="MsoNormal">
                                       <%#Container.ItemIndex+1%></p></td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                          <%#Class2.sozukes(Eval("RegstrDate").ToString()) %>
                                        </span>
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
                                        <span lang="AZ-LATIN"><%#Eval("DocumentNumber")%>
                                         
                                        </span>
                                    </p>
                                </td>
                                                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("GivingDate").ToString()) %>
                                         
                                        </span>
                                    </p>
                                </td>
                                                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                         <%#Eval("unvan")%>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="113">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                         <%#Eval("PostIndex")%>
                                        </span>
                                    </p>
                                </td>

                                <td class="auto-style24" valign="top" width="60">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="UpdateMeden" runat="server" CommandArgument='<%# Eval("IncomeTaxID") %>' CommandName="Updaterownmenfeet">Düzəliş</asp:LinkButton>
                                        </span>
                                    </p>
                                </td>
                                <td class="auto-style24" valign="top" width="30">
                                    <p align="center" class="MsoNormal">
                                        <span lang="AZ-LATIN">
                                            <asp:LinkButton ID="deleteMeden" runat="server" CommandArgument='<%# Eval("IncomeTaxID") %>' CommandName="deleterowmenfeet">Sil</asp:LinkButton>
                                          
                                        </span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>

        </div>


         
             </ContentTemplate>
         </asp:UpdatePanel>
          
         
       

        
        
    </div>
</asp:Content>

