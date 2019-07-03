<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Statistiks.aspx.cs" Inherits="adminpanel_Statistiks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style3 {
            width: 100%;
            border-collapse: collapse;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Calibri, sans-serif;
            margin-left: 1.6pt;
        }

        .auto-style10 {
            text-align:center;
            width: 55px;
        }

        .auto-style13 {
            width: 234px;
        }

        .auto-style14 {
            width: 170px;
        }

         .auto-style18 {
             width: 310px;
         }
         .auto-style19 {
             width: 117px;
         }
         .auto-style20 {
             width: 284px;
         }
         .auto-style21 {
             width: 310px;
             height: 30px;
         }
         .auto-style22 {
             width: 117px;
             height: 30px;
         }
         .auto-style23 {
             width: 284px;
             height: 30px;
         }
         .auto-style24 {
             height: 30px;
         }
        .auto-style26 {
            width: 207px;
        }
        .auto-style27 {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <p class="MsoNormal">
        <o:p>
        &nbsp;</o:p></p>
      <table style="width: 100%">
        <tr>
            <td class="auto-style21"></td>
            <td class="auto-style22">Rayon:</td>
            <td class="auto-style23">
                <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style21"></td>
            <td class="auto-style22">Bələdiyyə:</td>
            <td class="auto-style23">
                <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px" >
                </asp:DropDownList>
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
                  <tr>
            <td class="auto-style18"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20">
                    <asp:Button ID="axtar" runat="server"  Text="Axtar" Width="115px" OnClick="axtar_Click" />
                  </td>
            <td class="auto-style13jj"></td>
            <td class="auto-style14jj"></td>
        </tr>
    </table>
    <div>&nbsp;</div>

    <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" class="auto-style3" style="mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt">
            <tr>
                <td class="auto-style10">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>S/n</span></b>
                    </p>
                </td>
                <td class="auto-style14">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Rayonun adı</span></b></p>
                </td>
                <td class="auto-style13">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Bələdiyyənin adı</span></b>
                    </p>
                </td>
                <td nowrap class="auto-style27">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Fiziki şəxs (nəfər)</span></b></p>
                </td>
                <td class="auto-style26">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Hüquqi şəxs (nəfər)</span></b></p>
                </td>
                <td class="auto-style16">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Güzəştli</span></b>
                    </p>
                </td>
                <td class="auto-style16">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Güzəştsiz</span></b>
                    </p>
                </td>
                <td>
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Cəmi (nəfər)</span></b>
                    </p>
                </td>
            </tr>
            <tr>
                        <td class="auto-style10">
                            &nbsp;</td>
                        <td style="text-align: center" class="auto-style14">
                            <span><asp:Label ID="lblrayon" runat="server" ></asp:Label></span>
                        </td>
                        <td style="text-align: center" class="auto-style13">
                            <span><asp:Label ID="lblbel" runat="server" ></asp:Label></span>
                        </td>
                        <td nowrap style="text-align: center" class="auto-style27">
                            <span><asp:Label ID="fiz" runat="server" ></asp:Label></span>
                        </td>
                        <td style="text-align: center" class="auto-style26">
                            <span><asp:Label ID="huq" runat="server" ></asp:Label></span>
                        </td>
                        <td style="text-align: center" class="auto-style26">
                            <span><asp:Label ID="guzeshtli" runat="server" ></asp:Label></span>
                        </td>
                        <td style="text-align: center" class="auto-style26">
                            <span><asp:Label ID="guzeshtsiz" runat="server" ></asp:Label></span>
                        </td>

                        <td style="text-align: center">
                            <span><asp:Label ID="cem" runat="server" ></asp:Label></span>
                        </td>
                    </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td class="auto-style10">
                            <span><%#Container.ItemIndex+1%></span>

                        </td>
                        <td style="text-align: left" class="auto-style14">
                            <span><%#Eval("RegionName")%></span>
                        </td>
                        <td style="text-align: left" class="auto-style13">
                            <span><%#Eval("MunicipalName")%></span>
                        </td>
                        <td nowrap style="text-align: center" class="auto-style27">
                            <span><%#Eval("sayfiziki")%></span>
                        </td>
                        <td style="text-align: center" class="auto-style26">
                            <span><%#Eval("sayhuquqi")%></span>
                        </td>
                        <td style="text-align: center" class="auto-style16">
                            <span><%#Eval("guzeshtli")%></span>
                        </td>
                        <td style="text-align: center" class="auto-style16">
                            <span><%#Eval("guzeshtsiz")%></span>
                        </td>
                        <td style="text-align: center">
                            <span><%#Eval("cem")%></span>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <p class="MsoNormal">
        <o:p>
        &nbsp;</o:p>
    </p>
</asp:Content>

