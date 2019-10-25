<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="MunicipalGeneralIncome.aspx.cs" Inherits="Users_Homepage" %>

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
 <div  id="pnlhtml" runat="server"  style="background-color:ActiveBorder; height:500px; width:100%; text-align:center; vertical-align:auto;">
    
     <div style="padding-top:10px;text-align:center">
     <h3>Vergi və ödənişlərdən gələn gəlirlər </h3> </div>
     <div style="height:auto; width:100%; background-color:white;">
         <table>
             <tr>
                 <td style="width:180px;">
                     Vergi obyekti:<asp:DropDownList ID="vergiadi" runat="server" Width="150"></asp:DropDownList>
                 </td>

                 <td style="width:150px;">                    
                    Ödəniş növü:<asp:DropDownList ID="ddlodenisnovu" runat="server" Width="120px">
                            <asp:ListItem Value="-1">Ümumi</asp:ListItem>
                            <asp:ListItem Value="0">Nəğd</asp:ListItem>
                            <asp:ListItem Value="1">Online</asp:ListItem>
                        </asp:DropDownList>
                 </td>
                 <td style="width:160px;">                    
                  YVÖK:<asp:TextBox ID="txtyvok" runat="server" style="width:150px;"></asp:TextBox>
                 </td>
                 <td style="width:160px;">
                     Tarixdən:<dx:ASPxDateEdit ID="DEDate1" runat="server"  Width="150px"></dx:ASPxDateEdit>
                 </td>
                 <td style="width:160px;">
                     tarixədək <dx:ASPxDateEdit ID="DEDate2" runat="server"  Width="150px"></dx:ASPxDateEdit>
                 </td>
                 <td style="width: 150px;vertical-align:bottom">
                     <asp:Button ID="btnaxtar" runat="server" Text="Axtar" OnClick="btnaxtar_Click" />
                 </td>
             </tr>
             <tr style="height:30px;">
                 <td>

                 </td>
                 <td>

                 </td>
                 <td>

                 </td>
                 <td>

                 </td>
                  <td class="auto-style3">

                 </td>
             </tr>
         </table>
     </div>

     <div style="height:auto; width:100%; background-color:white;">






           <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Sn,fullname,YVOK,TaxesPaymentName,mebleg,Tarix"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
                <Columns>
                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Vergi ödəyicisinin adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="fullname" />
                    <asp:BoundField HeaderText="YVÖK" HeaderStyle-CssClass="headertextaligncenter" DataField="YVOK" />
                    <asp:BoundField HeaderText="Vergi obyektləri" HeaderStyle-CssClass="headertextaligncenter" DataField="TaxesPaymentName" />
                    <asp:BoundField HeaderText="Ödənilmiş məbləğ (manatla)" HeaderStyle-CssClass="headertextaligncenter" DataField="mebleg" />
                    <asp:BoundField HeaderText="Online xidmət haqqı - 3% (manatla)" HeaderStyle-CssClass="headertextaligncenter" DataField="faizmebleg" />
                    <asp:BoundField HeaderText="Qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="qaliq" />

                    <asp:BoundField HeaderText="Tarix" HeaderStyle-CssClass="headertextaligncenter" DataField="Tarix" />

                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />

            </asp:GridView>

</div>

</div>
</asp:Content>

