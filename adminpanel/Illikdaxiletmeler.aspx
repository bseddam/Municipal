<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Illikdaxiletmeler.aspx.cs" Inherits="adminpanel_Illikdaxiletmeler" %>


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
                AutoGenerateColumns="False" DataKeyNames="Name,MunicipalName,lblqaliq0,lblumumigelir,lbldotasiya,lbliane,lblumumixerc,lblqaliq"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Şəhər, Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="MunicipalName" />
                    <asp:BoundField HeaderText="01.01.2016-cı ilə qalıq (manatla)" HeaderStyle-CssClass="headertextaligncenter"  DataField="lblqaliq0" />
                    <asp:BoundField HeaderText="2016-ci ildə bələdiyyələrin ümumi gəlirləri (dotasiya istisna olmaqla)" HeaderStyle-CssClass="headertextaligncenter" DataField="lblumumigelir" />
                    <asp:BoundField HeaderText="Dövlət tərəfindən verilən dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="lbldotasiya" />
                    <asp:BoundField HeaderText="İanələrdən daxilolmalar" HeaderStyle-CssClass="headertextaligncenter" DataField="lbliane" />
                    <asp:BoundField HeaderText="2016-cı ildə bələdiyyələrin ümumi xərci" HeaderStyle-CssClass="headertextaligncenter" DataField="lblumumixerc" />
                    <asp:BoundField HeaderText="01.01.2017-cı ilə qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="lblqaliq" />
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


