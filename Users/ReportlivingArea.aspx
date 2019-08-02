<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="ReportlivingArea.aspx.cs" Inherits="Users_Homepage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
     <style type="text/css">
        .auto-style4 {
            height: 50px;
            text-align:right;
        }
        .auto-style5 {
            height: 50px;
            width: 658px;

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
    <div align="center">
        <br />
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

        <div style="padding-top: 10px; text-align: center">
            <h3>YAŞAYIŞ SAHƏLƏRİ ÜZRƏ ƏMLAKLAR </h3>
        </div>

                <div style="padding-top: 10px;padding-left:10px;">
            <table>
                <tr>
                    <td class="auto-style4">Ödəyicilərin yaşayış ünvanı:
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtunvanodeyici" runat="server" Width="650"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Vergi obyektlərinin ünvanı:
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtunvanobyekt" runat="server" Width="650"></asp:TextBox>
                    </td>
                </tr>
              
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                      <asp:Button ID="Btnhesabat" runat="server" Text="Hesabata bax" OnClick="Btnhesabat_Click" Width="120px" />
                    </td>
                </tr>
                <tr style="height: 20px;">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">


            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Sn,fullname,YVOK,Concession,GeneralArea,DiffGeneralArea,ZonaFactor,TaxRate,mebleg,Tarix"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                    <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                    <asp:BoundField HeaderText="Vergi ödəyicisinin ünvanı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="ActualAdress" />
                    <asp:BoundField HeaderText="Vergi obyektinin ünvanı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="unvan" />       
                    <asp:BoundField HeaderText="Güzəşt" HeaderStyle-CssClass="headertextaligncenter" DataField="Concession" />
                    <asp:BoundField HeaderText="Əmlakın sahəsi" HeaderStyle-CssClass="headertextaligncenter" DataField="GeneralArea" />
                    <asp:BoundField HeaderText="Vergiyə cəlb olunan sahə" HeaderStyle-CssClass="headertextaligncenter" DataField="DiffGeneralArea" />
                    <asp:BoundField HeaderText="Zona əmsalı" HeaderStyle-CssClass="headertextaligncenter" DataField="ZonaFactor" />
                    <asp:BoundField HeaderText="Vergi dərəcəsi" HeaderStyle-CssClass="headertextaligncenter" DataField="TaxRate" />
                    <asp:BoundField HeaderText="Ödənilməli vergi" HeaderStyle-CssClass="headertextaligncenter" DataField="mebleg" />
                    <asp:BoundField HeaderText="Tarix" HeaderStyle-CssClass="headertextaligncenter" DataField="Tarix" />

                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />



            </asp:GridView>









        </div>

    </div>
</asp:Content>

