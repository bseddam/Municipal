﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Calclastyears.aspx.cs" Inherits="adminpanel_Calclastyears" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
      <style>
        .auto-style1 {
            width: 619px;
        }

        .auto-style3x {
            width: 100%;
        }

        .auto-style8 {
            width: 378px;
            height: 42px;
        }

        .auto-style9 {
            width: 100px;
            height: 42px;
        }

        .auto-style10 {
            width: 205px;
            height: 42px;
        }

        .auto-style11 {
            height: 42px;
        }

        .auto-style12 {
            width: 378px;
            height: 43px;
        }

        .auto-style13 {
            width: 100px;
            height: 43px;
        }

        .auto-style14 {
            width: 205px;
            height: 43px;
        }

        .auto-style15 {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
             <table class="auto-style3x">
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style9">Rayon:</td>
                <td class="auto-style10">
                    <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Bələdiyyə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
            </tr>
                   <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Hesabat ili:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="ddlhesabatili" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">
                <asp:Button ID="btntediyye" runat="server" Text="Hesabla" Width="218px" OnClick="btntediyye_Click" />
                </td>
                <td>
                <asp:Label ID="lblsms" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
        </table>
    </asp:Content>
