<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="ReportPayments.aspx.cs" Inherits="Users_Homepage" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />

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
    <div align="center">
        <br />
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

        <div style="padding-top: 10px; text-align: center">
            <h3>ÖDƏNİŞLƏR ÜZRƏ </h3>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">
            <table>
                <tr>
                    <td style="width: 200px;">Ödəniş növü :</td>
                    <td>
                        <asp:DropDownList ID="ddlodeniw" runat="server" Width="500px" AutoPostBack="True" OnSelectedIndexChanged="ddlodeniw_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Ümumi</asp:ListItem>
                            <asp:ListItem Value="1">Küçə (divar) reklamının yayımı üçün ödəniş</asp:ListItem>
                            <asp:ListItem Value="2">Nəqliyyat vasitələrinin daimi və ya müvəqqəti dayanacaqları üçün ödəniş</asp:ListItem>
                            <asp:ListItem Value="3">Bələdiyyə mülkiyyətinin icarəsinə görə ödəniş</asp:ListItem>
                            <asp:ListItem Value="4">Mehmanxana, sanatoriya-kurort və turizm xidmətləri göstərən şəxslərdən alınan ödəniş</asp:ListItem>
                            <asp:ListItem Value="5">Stasionar və ya səyyar ticarət, ictimai iaşə və digər xidmətlərə görə ödəniş</asp:ListItem>
                            <asp:ListItem Value="6">Bələdiyyə mülkiyyətinin özgəninkiləşdirilməsinə görə ödəniş</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr style="height: 30px;">
                    <td></td>
                    <td></td>
                </tr>

            </table>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">
            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Sn,fullname,YVOK,nametype,Mebleg,Tarix"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                    <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                    <asp:BoundField HeaderText="Ödəniş növü" HeaderStyle-CssClass="headertextaligncenter" DataField="nametype" />
                    <asp:BoundField HeaderText="Ödənilməli məbləğ" HeaderStyle-CssClass="headertextaligncenter" DataField="Mebleg" />
                    <asp:BoundField HeaderText="Tarix" HeaderStyle-CssClass="headertextaligncenter" DataField="Tarix" />

                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />



            </asp:GridView>





            

        </div>

    </div>
</asp:Content>

