<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ReportTaxpayer.aspx.cs" Inherits="Users_Homepageasdfg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style>

        .auto-style16 {
            width: 427px;
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


    <br />


   
    <table style="width: 100%;">
          <tr>
            <td class=""></td>
            <td class="">Rayon:</td>
            <td class="">
                <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="190px">
                </asp:DropDownList>
            </td>
            <td class="">Bələdiyyə:</td>
            <td class="">
                <asp:DropDownList ID="ddlbelediyye" runat="server" Width="190px">
                </asp:DropDownList>
            </td>
            <td class="">Ödəyici:</td>
            <td class="">
                <asp:DropDownList ID="ddlfizhuq" runat="server" Width="190px">
                    <asp:ListItem Value="-1">Ümumi</asp:ListItem>
                    <asp:ListItem Value="1">Fiziki şəxs</asp:ListItem>
                    <asp:ListItem Value="2">Hüquqi şəxs</asp:ListItem>
                </asp:DropDownList>
              </td>
          
        </tr>

                  <tr>
            <td class=""></td>
            <td class=""></td>
            <td class="">

            </td>
            <td class=""></td>
            <td class="">

            </td>
            <td class=""></td>
            <td class="">
&nbsp;
              </td>
          
        </tr>
        <tr>
            <td class=""></td>
            <td class="">YVÖK:</td>
            <td class="">
                <asp:TextBox ID="txtyvok" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td class="">Soyad:</td>
            <td class="">
                <asp:TextBox ID="txtsoyad" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td class="">Ad:</td>
            <td class="">
                <asp:TextBox ID="txtad" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td class="">Ata adı:</td>
            <td class="">
                <asp:TextBox ID="txtataadi" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
    </table>

    <table style="width: 100%; height: 54px;">

        <tr>
            <td class="auto-style16">&nbsp;</td>

            <td>
                <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" Width="170px" /></td>

        </tr>
    </table>

    <br />

    <div align="center">
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

        <div style="padding-top: 10px; text-align: center;">
            <h3>VERGİ ÖDƏYİCİLƏRİ </h3>
        </div>





        <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
            AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Sn,RegionName,MunicipalName,fullname,YVOK,ActualAdress,telefon,Guzesht,RegistrPetitondate"
            runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
            <Columns>
                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:BoundField HeaderText="Rayon" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="RegionName" />
                <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="MunicipalName" />
                <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                <asp:BoundField HeaderText="Adress" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="ActualAdress" />
                <asp:BoundField HeaderText="Telefon" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="telefon" />
                <asp:BoundField HeaderText="Güzəşt" HeaderStyle-CssClass="headertextaligncenter" DataField="Guzesht" />
                <asp:BoundField HeaderText="Qeydiyyat tarixi" HeaderStyle-CssClass="headertextaligncenter" DataField="RegistrPetitondate" />
            </Columns>


            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

            <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                PageButtonCount="3" />



        </asp:GridView>





    </div>
</asp:Content>

