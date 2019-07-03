<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="MunicipalGeneraldebt.aspx.cs" Inherits="Users_Homepage" %>

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

        <div style="padding-top: 10px;">
            <h3>Vergi və ödəniş borcu olan fiziki və hüquqi şəxslərin siyahısı </h3>
        </div>
        <div style="padding-top: 10px;">
            <table>
                <tr>
                    <td>Vergi və ödəniş növləri :
                    </td>
                    <td>
                        <asp:DropDownList ID="vergiadi" runat="server" Width="650"></asp:DropDownList>

                    </td>
                                        <td>
                                            &nbsp;&nbsp;
                                            <asp:Button ID="Btnhesabat" runat="server" Text="Hesabata bax" OnClick="Btnhesabat_Click" Width="120px" />
                    </td>

                </tr>
                <tr style="height: 20px;">
                    <td></td>
                </tr>
            </table>
        </div>
        <div style="height: auto; width: 100%; background-color: white;">

                        <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="fullname,YVOK,Mobiltel,TaxesPaymentTypeName,Payment"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="500">
                <Columns>
                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                    <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                    <asp:BoundField HeaderText="Telefon nömrəsi" HeaderStyle-CssClass="headertextaligncenter" DataField="Mobiltel" />
                    <asp:BoundField HeaderText="Vergi obyektləri" HeaderStyle-CssClass="headertextaligncenter" DataField="TaxesPaymentTypeName" />
                    <asp:BoundField HeaderText="Borc (manat)" HeaderStyle-CssClass="headertextaligncenter" DataField="Payment" />

                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />
            </asp:GridView>





        </div>

    </div>
</asp:Content>

