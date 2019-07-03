<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ReportLivingLand.aspx.cs" Inherits="Users_Homepagedfg" %>

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
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style14">
                <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" />
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
            <h3>Həyətyanı torpaq sahələri üzrə</h3>
        </div>

        <div style="height: auto; width: 100%; background-color: white;">
       <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
               AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="fullname,YVOK,Name,Concession1,GeneralArea,mebleg,Tarix"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
                <Columns>
                    <asp:TemplateField HeaderText="SN"   HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                    <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                    <asp:BoundField HeaderText="Torpağın növü" HeaderStyle-CssClass="headertextaligncenter" DataField="Name" />
                    <asp:BoundField HeaderText="Güzəşt" HeaderStyle-CssClass="headertextaligncenter" DataField="Concession1" />
                    <asp:BoundField HeaderText="Torpaq sahəsi (kv. m.)" HeaderStyle-CssClass="headertextaligncenter" DataField="GeneralArea" />
                    <asp:BoundField HeaderText="Vergi dərəcəsi" HeaderStyle-CssClass="headertextaligncenter" DataField="TaxRate" />
                    <asp:BoundField HeaderText="Ödənilməli məbləğ (manat)" HeaderStyle-CssClass="headertextaligncenter" DataField="mebleg" />
                    <asp:BoundField HeaderText="Tarix" HeaderStyle-CssClass="headertextaligncenter" DataField="Tarix" />
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />
            </asp:GridView>

        </div>

    </div>
</asp:Content>

