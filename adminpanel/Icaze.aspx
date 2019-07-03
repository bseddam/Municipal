<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Icaze.aspx.cs" Inherits="adminpanel_Icaze" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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

        .auto-style10 {
            width: 310px;
            height: 27px;
        }

        .auto-style11 {
            width: 108px;
            height: 27px;
        }

        .auto-style12 {
            width: 363px;
            height: 27px;
        }

        .auto-style13 {
            width: 175px;
            height: 27px;
        }

        .auto-style14 {
            height: 27px;
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>&nbsp;</div>
      <table style="width: 100%">
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">Rayon:</td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">Bələdiyyə:</td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px" >
                </asp:DropDownList>
            </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
        </tr>
                  <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">İcazə:</td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlicaze" runat="server" Width="200px" >
                    <asp:ListItem Value="1">Aktiv etmək</asp:ListItem>
                    <asp:ListItem Value="0">Diaktiv etmək</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
          </tr>
                  <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11"></td>
            <td class="auto-style12">
                    <asp:Button ID="axtar" runat="server"  Text="Yadda saxla" Width="115px" OnClick="axtar_Click" />
                  </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
        </tr>
    </table>
    <div>&nbsp;</div>
    
     
 
</asp:Content>

