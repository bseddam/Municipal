﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ReportPaymentsMonth.aspx.cs" Inherits="Users_Homepagegjv" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            text-align:right;
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

    <table class="auto-style3x">
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style9">Rayon:</td>
            <td class="auto-style10">
                <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style13">Bələdiyyə:</td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="auto-style15"></td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style13">Hesabat ili:</td>
            <td class="auto-style14">
                <asp:DropDownList ID="DDLHesabatILI" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="auto-style15"></td>
        </tr>
       <%-- <tr>
            <td class="auto-style12"></td>
            <td class="auto-style13">Ödəniş növü:</td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlodeniw" runat="server" Width="200px">
                    <asp:ListItem Value="-1">Ümumi</asp:ListItem>
                    <asp:ListItem Value="1">Küçə (divar) reklamının yayımı üçün ödəniş</asp:ListItem>
                          <asp:ListItem Value="2">Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş</asp:ListItem>
                          <asp:ListItem Value="3">Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş</asp:ListItem>
                          <asp:ListItem Value="4">Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş</asp:ListItem>
                          <asp:ListItem Value="5">Stasionar və ya səyyar ticarət, ictimai iaşə və digər xidmətlərə görə ödəniş</asp:ListItem>
                          <asp:ListItem Value="6">Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsinə görə ödəniş</asp:ListItem>
                </asp:DropDownList>



            </td>
            <td class="auto-style15">&nbsp;</td>
        </tr>--%>
        <tr>
            <td class="auto-style12">
                <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Text="Rayon/Şəhər    " Width="108px" GroupName="1" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Bələdiyyə" Width="150px" GroupName="1" />
            </td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style14">
                <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" style="height: 26px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <div align="center">
        <br />
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

        <div style="padding-top: 10px; text-align: center">
            <h3>
            ÖDƏNİŞLƏR ÜZRƏ
                </h3>
        </div>

        <div style="height: auto; width: 100%; background-color: white;">



            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames=""
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1500">
                <Columns>

                    <asp:BoundField HeaderText="S/s" HeaderStyle-CssClass="headertextaligncenter" DataField="Sn1" />
                    <asp:BoundField HeaderText="Şəhər/Rayon" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Yanvar" HeaderStyle-CssClass="headertextaligncenter" DataField="Yanvar" />
                    <asp:BoundField HeaderText="Fevral" HeaderStyle-CssClass="headertextaligncenter" DataField="Fevral" />
                    <asp:BoundField HeaderText="Mart" HeaderStyle-CssClass="headertextaligncenter" DataField="Mart" />
                    <asp:BoundField HeaderText="Aprel" HeaderStyle-CssClass="headertextaligncenter" DataField="Aprel" />
                    <asp:BoundField HeaderText="May" HeaderStyle-CssClass="headertextaligncenter" DataField="May" />
                    <asp:BoundField HeaderText="İyun" HeaderStyle-CssClass="headertextaligncenter" DataField="Iyun" />
                    <asp:BoundField HeaderText="İyul" HeaderStyle-CssClass="headertextaligncenter" DataField="Iyul" />
                    <asp:BoundField HeaderText="Avqust" HeaderStyle-CssClass="headertextaligncenter" DataField="Avqust" />
                    <asp:BoundField HeaderText="Sentyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Sentyabr" />
                    <asp:BoundField HeaderText="Oktyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Oktyabr" />
                    <asp:BoundField HeaderText="Noyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Noyabr" />
                    <asp:BoundField HeaderText="Dekabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Dekabr" />
                    <asp:BoundField HeaderText="Dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="Dotasiya" />
                    <asp:BoundField HeaderText="Cəmi" HeaderStyle-CssClass="headertextaligncenter" DataField="Cemi" />
                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />



            </asp:GridView>
<asp:GridView ID="GridView2" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames=""
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1500">
                <Columns>

                    <asp:BoundField HeaderText="S/s" HeaderStyle-CssClass="headertextaligncenter" DataField="Sn1" />
                    <asp:BoundField HeaderText="Şəhər/Rayon" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="MunicipalName" />
                    <asp:BoundField HeaderText="Yanvar" HeaderStyle-CssClass="headertextaligncenter" DataField="Yanvar" />
                    <asp:BoundField HeaderText="Fevral" HeaderStyle-CssClass="headertextaligncenter" DataField="Fevral" />
                    <asp:BoundField HeaderText="Mart" HeaderStyle-CssClass="headertextaligncenter" DataField="Mart" />
                    <asp:BoundField HeaderText="Aprel" HeaderStyle-CssClass="headertextaligncenter" DataField="Aprel" />
                    <asp:BoundField HeaderText="May" HeaderStyle-CssClass="headertextaligncenter" DataField="May" />
                    <asp:BoundField HeaderText="İyun" HeaderStyle-CssClass="headertextaligncenter" DataField="Iyun" />
                    <asp:BoundField HeaderText="İyul" HeaderStyle-CssClass="headertextaligncenter" DataField="Iyul" />
                    <asp:BoundField HeaderText="Avqust" HeaderStyle-CssClass="headertextaligncenter" DataField="Avqust" />
                    <asp:BoundField HeaderText="Sentyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Sentyabr" />
                    <asp:BoundField HeaderText="Oktyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Oktyabr" />
                    <asp:BoundField HeaderText="Noyabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Noyabr" />
                    <asp:BoundField HeaderText="Dekabr" HeaderStyle-CssClass="headertextaligncenter" DataField="Dekabr" />
                    <asp:BoundField HeaderText="Dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="Dotasiya" />
                    <asp:BoundField HeaderText="Cəmi" HeaderStyle-CssClass="headertextaligncenter" DataField="Cemi" />

                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />



            </asp:GridView>

        </div>

    </div>
</asp:Content>

