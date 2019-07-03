<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="adminpanel_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

        .auto-style11 {
            width: 270px;
        }

        .auto-style13 {
            width: 230px;
        }

        .auto-style14 {
            width: 157px;
        }

        .auto-style16 {
            width: 120px;
        }

        .auto-style17 {
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p class="MsoNormal">
        <o:p>
        &nbsp;</o:p>
    </p>
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
                        <b><span>Rayonun adı</span><span lang="AZ-LATIN"></span></b>
                    </p>
                </td>
                <td class="auto-style13">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Bələdiyyənin adı</span></b>
                    </p>
                </td>
                <td nowrap class="auto-style11">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Soyad, ad, ata adı</span></b>
                    </p>
                </td>
                <td class="auto-style17">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>İstifadəçi<o:p> adı</o:p></span></b>
                    </p>
                </td>
                <td class="auto-style16">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>Parol</span></b>
                    </p>
                </td>
                <td>
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <b><span>IP</span></b>
                    </p>
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
                        <td nowrap style="text-align: left" class="auto-style11">
                            <span><%#Eval("Name")%></span>
                        </td>
                        <td style="text-align: left" class="auto-style17">
                            <span><%#Eval("Uname")%></span>
                        </td>
                        <td class="auto-style16">
                            <span><%#Eval("Passvord")%></span>
                        </td>
                        <td>
                            <span><%#Eval("VPN_IP")%></span>
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

