<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Ferqqaliq.aspx.cs" Inherits="adminpanel_Ferqqaliq" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style>
        .auto-style1 {
            width: 619px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
      <br />
<%--    <div align="center">
        <br />
        <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
    </div>--%>

    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

     
        <div style="height: auto; width: 100%; background-color: white;">

            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AutoGenerateColumns="False" DataKeyNames="Name,MunicipalName,yaranmiwqaliq,belediyyeqeydetdiyi,ferq"
                runat="server">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Şəhər, Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter"  DataField="MunicipalName" />
                    <asp:BoundField HeaderText="Cəmlərdən yaranmış qalıq" HeaderStyle-CssClass="headertextaligncenter"  DataField="yaranmiwqaliq" />
                    <asp:BoundField HeaderText="Qeyd edilmiş qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="belediyyeqeydetdiyi" />
                    <asp:BoundField HeaderText="Fərq" HeaderStyle-CssClass="headertextaligncenter" DataField="ferq" />
                     </Columns>

            </asp:GridView>


                <div>&nbsp;</div>
      <br />
      <br />
        </div>

    </div>
    <div>&nbsp;</div>
      <br />
      <br />
</asp:Content>



