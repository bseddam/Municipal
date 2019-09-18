<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Hesabatxerc.aspx.cs" Inherits="adminpanel_Hesabatxerc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style>
      p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: "Arial","sans-serif";
        }

        .auto-style1 {
            width: 619px;
        }

        .auto-style3x {
            width: 100%;
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
    <table class="auto-style3x">
                        <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Hesabatili:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbhesabatili" runat="server" Width="200px" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="cmbhesabatayi1" runat="server"  >
                    </asp:DropDownList>
                            &nbsp;
                    <asp:DropDownList ID="cmbhesabatayi2" runat="server"  >
                    </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="1">Rayon/Şəhər</asp:ListItem>
                    <asp:ListItem Value="2">Bələdiyyə</asp:ListItem>
                </asp:RadioButtonList></td>
                <td class="auto-style14">
                    <asp:Button ID="btnhesab" runat="server" Text="Hesabata bax" OnClick="btnhesab_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">
                
     
        <div style="height: auto; width: 100%; background-color: white;">

            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AutoGenerateColumns="False" DataKeyNames="Name,cemi,qaliq,gelir,dotasiya,iane,digergelir,umumixerc,
yerliozunuidetme,tehsilsahesi,sehiyye,medeniyyet,idman,avtomobil,menzilkomunal,suteserrufati,iqtisadisahe,yerliekoloji,yerlisosialmud,digerxerc"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="lblsira" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Şəhər, Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Cəmi" HeaderStyle-CssClass="headertextaligncenter"  DataField="cemi" />
                    <asp:BoundField HeaderText="01.01.2019-cı ilə qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="qaliq" />
                    <asp:BoundField HeaderText="2019-ci ildə vergi və ödənişlərdən daxil olma" HeaderStyle-CssClass="headertextaligncenter" DataField="gelir" />
                    <asp:BoundField HeaderText="Dövlət tərəfindən verilən dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="dotasiya" />
                    <asp:BoundField HeaderText="İanələrdən daxilolmalar" HeaderStyle-CssClass="headertextaligncenter" DataField="iane" />
                    <asp:BoundField HeaderText="Digər gəlirlər" HeaderStyle-CssClass="headertextaligncenter" DataField="digergelir" />
                    <asp:BoundField HeaderText="2018-cı ildə bələdiyyələrin ümumi xərci" HeaderStyle-CssClass="headertextaligncenter" DataField="umumixerc" />
                    
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

            <asp:GridView ID="GridView2" Width="100%" CellPadding="4"
                AutoGenerateColumns="False" DataKeyNames="Name,cemi,qaliq,gelir,dotasiya,iane,digergelir,umumixerc,
yerliozunuidetme,tehsilsahesi,sehiyye,medeniyyet,idman,avtomobil,menzilkomunal,suteserrufati,iqtisadisahe,yerliekoloji,yerlisosialmud,digerxerc"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="lblsira" runat="server" Text="<%#Container.DataItemIndex%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Şəhər, Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="bldname" />
                    <asp:BoundField HeaderText="Cəmi" HeaderStyle-CssClass="headertextaligncenter"  DataField="cemi" />
                    <asp:BoundField HeaderText="01.01.2019-cu ilə qalıq" HeaderStyle-CssClass="headertextaligncenter" DataField="qaliq" />
                    <asp:BoundField HeaderText="2019-cu ildə vergi və ödənişlərdən daxil olma" HeaderStyle-CssClass="headertextaligncenter" DataField="gelir" />
                    <asp:BoundField HeaderText="Dövlət tərəfindən verilən dotasiya" HeaderStyle-CssClass="headertextaligncenter" DataField="dotasiya" />
                    <asp:BoundField HeaderText="İanələrdən daxilolmalar" HeaderStyle-CssClass="headertextaligncenter" DataField="iane" />
                    <asp:BoundField HeaderText="Digər gəlirlər" HeaderStyle-CssClass="headertextaligncenter" DataField="digergelir" />
                    <asp:BoundField HeaderText="2018-cı ildə bələdiyyələrin ümumi xərci" HeaderStyle-CssClass="headertextaligncenter" DataField="umumixerc" />
                    
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

