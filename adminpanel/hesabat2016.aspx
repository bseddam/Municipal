<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="hesabat2016.aspx.cs" Inherits="adminpanel_hesabat2016" %>

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
                AutoGenerateColumns="False" DataKeyNames="Name,cemi,qaliqoten,gelir,dotasiya,iane,umumixerc,qaliq,
yerliozunuidetme,tehsilsahesi,sehiyye,medeniyyet,idman,avtomobil,menzilkomunal,suteserrufati,iqtisadisahe,yerliekoloji,yerlisosialmud,digerxerc"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Şəhər, Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Cəmi" HeaderStyle-CssClass="headertextaligncenter"  DataField="cemi" />
                    <asp:BoundField HeaderText="01.01.2016-cı ilə qalıq (manatla)" HeaderStyle-CssClass="headertextaligncenter"  DataField="qaliqoten" />
                    <asp:BoundField HeaderText="2016-ci ildə bələdiyyələrin ümumi gəlirləri (dotasiya istisna olmaqla)" HeaderStyle-CssClass="headertextaligncenter" DataField="gelir" />
                    <asp:BoundField HeaderText="Dövlət tərəfindən verilən dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="dotasiya" />
                    <asp:BoundField HeaderText="İanələrdən daxilolmalar" HeaderStyle-CssClass="headertextaligncenter" DataField="iane" />
                    <asp:BoundField HeaderText="2016-cı ildə bələdiyyələrin ümumi xərci" HeaderStyle-CssClass="headertextaligncenter" DataField="umumixerc" />
                    <asp:BoundField HeaderText="01.01.2017-cı ilə qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="qaliq" />
                    <asp:BoundField HeaderText="Yerli özünüidarəetmə orqanlarının saxlanılması xərcləri" HeaderStyle-CssClass="headertextaligncenter" DataField="yerliozunuidetme" />
                    <asp:BoundField HeaderText="Təhsil sahəsində xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="tehsilsahesi" />
                    <asp:BoundField HeaderText="Səhiyyə sahəsində xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="sehiyye" />
                    <asp:BoundField HeaderText="Mədəniyyət sahəsində xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="medeniyyet" />
                    <asp:BoundField HeaderText="Bədən tərbiyəsi və idmanın inkişafı ilə bağlı xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="idman" />
                    <asp:BoundField HeaderText="Bələdiyyə avtomobil yollarının saxlanılması xərcləri" HeaderStyle-CssClass="headertextaligncenter" DataField="avtomobil" />
                    <asp:BoundField HeaderText="Mənzil və kommunal təsərrüfatı xərcləri" HeaderStyle-CssClass="headertextaligncenter" DataField="menzilkomunal" />
                    <asp:BoundField HeaderText="Su təsərrüfatı (yerli əhəmiyyətli su mənbələri) ilə bağlı xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="suteserrufati" />
                    <asp:BoundField HeaderText="İqtisadi sahədə xərclər" HeaderStyle-CssClass="headertextaligncenter" DataField="iqtisadisahe" />
                    <asp:BoundField HeaderText="Yerli ekoloji tədbirlər" HeaderStyle-CssClass="headertextaligncenter" DataField="yerliekoloji" />
                    <asp:BoundField HeaderText="Yerli sosial müdafiə tədbirləri" HeaderStyle-CssClass="headertextaligncenter" DataField="yerlisosialmud" />
                    <asp:BoundField HeaderText="Digər xərc" HeaderStyle-CssClass="headertextaligncenter" DataField="digerxerc" />
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

