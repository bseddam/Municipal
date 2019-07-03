<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="ReportProfits.aspx.cs" Inherits="Users_Homepageii" %>

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
 <div id="pnlhtml" runat="server" style="background-color:ActiveBorder; height:500px; width:100%; text-align:center; vertical-align:auto;">
    
     <div style="padding-top:10px;text-align:center">
     <h3>MƏNFƏƏT VERGİSİ ÜZRƏ </h3> </div>

     <div style="height:auto; width:100%; background-color:white;">




                     <table border="1" cellpadding="0" cellspacing="0" class="table table-striped" style="stsubtable">
                         <tr>
                             <td valign="center" width="70" style="text-align: center;"><b><span lang="AZ-LATIN">S/n</span></b></td>                            
                             <td valign="center" width="250" style="text-align: center;"><b><span lang="AZ-LATIN">Vergi ödəyicisinin adı</span></b></td>
                             <td valign="center" width="200" style="text-align: center;"><b><span lang="AZ-LATIN">YVÖK</span></b> </td>
                             <td valign="center" width="200" style="text-align: center;"><b><span lang="AZ-LATIN">Müəssisənin adı</span></b> </td>
                             <td valign="center" width="200" style="text-align: center;"><b><span lang="AZ-LATIN">Fəaliyyət növü</span></b> </td>
                             <td valign="center" width="100" style="text-align: center;"><b><span lang="AZ-LATIN">Yerləşdiyi ünvan</span></b> </td>  
                             <td valign="center" width="200" style="text-align: center;"><b><span lang="AZ-LATIN">Hesabat ili ərzində gəlir (manat)</span></b></td>  
                             <td valign="center" width="100" style="text-align: center;"><b><span lang="AZ-LATIN">Hesabat ili ərzində çəkilən xərc (manat)</span></b> </td>
                             <td valign="center" width="100" style="text-align: center;"><b><span lang="AZ-LATIN">Ödənilməli vergi</span></b> </td>
                             <td valign="center" width="100" style="text-align: center;"><b><span lang="AZ-LATIN">Tarix</span></b> </td>                         
                         </tr>
                      <asp:Repeater ID="DataListCem" runat="server">
                            <ItemTemplate>
                                <tr>                                    
                                    <td valign="top" width="70" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("SN")%>
                                                <p></p>
                                            </span>
                                        </p>
                                    </td>
                                    <td valign="top" width="150" class="auto-style24">
                                        <p align="left" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Fullname")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("YVOK")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("CompanyName")%><o:p></o:p></span>
                                        </p>
                                    </td>                                    
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("ActivitieType")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("unvan")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Income")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Expense")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Amount")%><o:p></o:p></span>
                                        </p>
                                    </td>                                   
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Tarix")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                   
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Repeater ID="DataListBaza" runat="server">
                            <ItemTemplate>
                               <tr>                                    
                                    <td valign="top" width="70" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("SN")%>
                                                <p></p>
                                            </span>
                                        </p>
                                    </td>
                                    <td valign="top" width="150" class="auto-style24">
                                        <p align="left" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Fullname")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("YVOK")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("CompanyName")%><o:p></o:p></span>
                                        </p>
                                    </td>                                    
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("ActivitieType")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("unvan")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Income")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Expense")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Amount")%><o:p></o:p></span>
                                        </p>
                                    </td>                                   
                                    <td valign="top" width="100" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Tarix")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                   
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>

                     </div>

</div>
</asp:Content>

