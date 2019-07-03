<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="Personalacc.aspx.cs" Inherits="Users_Personalacc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div id="pnlhtml" runat="server">
        <div>&nbsp;</div>
        <div align="center">
            <b><span lang="AZ-CYR" style="font-size: 15px;">
                <asp:Label runat="server" ID="il"></asp:Label>
                ili&nbsp;üçün yerli (bələdiyyə) vergilər üzrə
            <asp:Label ID="fizhuq" runat="server"></asp:Label>&nbsp;səxsin<br />
                ŞƏXSİ HESAB VƏRƏQƏSİ</span></b>
        </div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>
            <table class="nav-justified">
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px"><b>Bələdiyyənin adı:</b></td>
                    <td class="auto-style34s" style="width: 222px">
                        <asp:Label ID="beled" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px">&nbsp;</td>
                    <td class="auto-style34s" style="width: 222px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px"><b>Vergi ödəyicisinin S.A.A:</b></td>
                    <td class="auto-style34s" style="width: 222px">
                        <asp:Label ID="adsoyad" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px">&nbsp;</td>
                    <td class="auto-style34s" style="width: 222px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px; height: 18px;" class="modal-sm"></td>
                    <td class="auto-style27" style="width: 257px; height: 18px;"><b>Vergi ödəyicisinin kodu (YVÖK):</b></td>
                    <td style="height: 18px; width: 222px;">
                        <asp:Label ID="yvok" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px">&nbsp;</td>
                    <td class="auto-style34s" style="width: 222px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px; height: 18px;" class="modal-sm"></td>
                    <td class="auto-style27" style="width: 257px; height: 18px;"><b>Vergi ödəyicisinin ünvanı:</b></td>
                    <td style="height: 18px; width: 222px;">
                        <asp:Label ID="unvan" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px" class="auto-style6">&nbsp;</td>
                    <td class="auto-style6" style="width: 257px">&nbsp;</td>
                    <td class="auto-style34s" style="width: 222px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 212px; height: 18px;" class="modal-sm"></td>
                    <td class="auto-style27" style="width: 257px; height: 18px;"><b>Vergi ödəyicisinin telefonu:</b></td>
                    <td style="height: 18px; width: 222px;">
                        <asp:Label ID="tel" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div>&nbsp;</div>
        <div id="emlaktorp" runat="server">
            <div align="center">
                <b><span lang="AZ-CYR" style="font-size: 15px;">Əmlak və torpaq vergisi üzrə</span></b>
            </div>

            <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="width: 1012px;">
                <tr>
                    <td valign="top" class="auto-style50" style="width: 28px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span lang="AZ-LATIN">S/n</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style45s" style="width: 111px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Tarix</span></b>
                        </p>
                    </td>

                    <td valign="top" class="auto-style45s" style="width: 119px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Əməliyyat</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style45s" style="width: 119px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Vergi obyekti</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Ümumi qalıq borc (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Məbləğ (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style44s">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Qalıq (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52" style="width: 67px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Artıq ödəmə (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Sanksiya (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Gecikmiş günlərin sayı</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Faiz hesablanıb (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style45s" style="width: 91px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Faiz qalıq (manatla)</span></b>
                        </p>
                    </td>


                    <td valign="top" class="auto-style45s" style="width: 94px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Sənədin nömrəsi</span></b>
                        </p>
                    </td>


                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>


                        <tr>
                            <td valign="top" class="auto-style50" style="width: 28px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Container.ItemIndex+1%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 111px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("NowTime").ToString()) %>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 119px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Operation1")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 119px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("TaxesPaymentTypeName")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style53">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("umumiborc")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Amount")%>   
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style44s">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("RemainingDebt")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52" style="width: 67px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("MorePayment")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("Sanction")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("PercentDayCount")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style48">
                                <p align="center" class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("PercentCounted")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 91px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("PercentDebt")%>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" class="auto-style45s" style="width: 94px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("PaymentDocument")%>
                                    </span>
                                </p>
                            </td>


                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
        <div>&nbsp;</div>
        <div id="pnlodeniw" runat="server">
            <div align="center">
                <b><span lang="AZ-CYR" style="font-size: 15px;">Mədən, mənfəət vergisi və ödənişlər üzrə</span></b>
            </div>


            <table border="1" cellpadding="0" cellspacing="0" class="auto-style47" style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext; width: 1012px;">
                <tr>
                    <td valign="top" class="auto-style50" style="width: 28px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span lang="AZ-LATIN">S/n</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style45s" style="width: 111px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Tarix</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style45s" style="width: 119px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Əməliyyatın növü</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style40s" style="width: 183px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Vergi obyektləri</span></b>
                        </p>
                    </td>
                    <%--                    <td valign="top" class="auto-style32s" style="width: 156px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Ümumi qalıq borc (manatla)</span></b>
                        </p>
                    </td>--%>
                    <td valign="top" class="auto-style52" style="width: 118px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Ödənilmiş məbləğ (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style44s" style="width: 70px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Qalıq (manatla)</span></b>
                        </p>
                    </td>
                    <td valign="top" class="auto-style52" style="width: 76px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Artıq ödəmə (manatla)</span></b>
                        </p>
                    </td>

                    <td valign="top" class="auto-style45s" style="width: 94px">
                        <p align="center" class="MsoNormal" style="text-align: center">
                            <b><span>Sənədin nömrəsi</span></b>
                        </p>
                    </td>


                </tr>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>


                        <tr>
                            <td valign="top" class="auto-style50" style="width: 28px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Container.ItemIndex+1%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 111px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Class2.sozukes(Eval("NowTime").ToString()) %>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style45s" style="width: 119px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Operation")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style40s" style="width: 183px">
                                <p class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("TaxesPaymentTypeName")%>
                                    </span>
                                </p>
                            </td>
                            <%--                            <td valign="top" class="auto-style32s" style="width: 156px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN"><%#Eval("RemainingDebt")%>
                                    </span>
                                </p>
                            </td>--%>
                            <td valign="top" class="auto-style52" style="width: 118px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("Amount")%>   
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style44s" style="width: 70px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("RemainingDebt")%>
                                    </span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style52" style="width: 76px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("MorePayment")%>
                                    </span>
                                </p>
                            </td>

                            <td valign="top" class="auto-style45s" style="width: 94px">
                                <p class="MsoNormal" style="text-align: center">
                                    <span lang="AZ-LATIN">
                                        <%#Eval("PaymentDocument")%>
                                    </span>
                                </p>
                            </td>


                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>

        <div style="width:100%; height:50px; padding-top:20px;">
            <table style="width:100%; height:100%;">
                <tr>
                    <td>

                    </td>
                    <td class="auto-style382" style="width: 91px">
                        Ümumi borc :
                    </td>
                    <td class="auto-style6" style="width: 255px">
                        <asp:Label ID="lblumumiborc" runat="server" Text="0"></asp:Label>
                    </td>
                    <td>

                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <div>&nbsp;</div>
        <div>
            <table>
                <tr>
                    <%--     <td style="width: 212px; height: 18px;" class="modal-sm"></td>--%>
                    <td class="auto-style6" style="width: 257px; height: 18px;"><b>Əməliyyatı aparmış Məsul şəxs:</b></td>
                    <td style="height: 18px; width: 233px;">
                        <asp:Label ID="mehsulsexs" runat="server"></asp:Label>
                    </td>
                    <td style="height: 18px"><b>İmza:_____________</b></td>
                </tr>
                <tr>
                    <%-- <td style="width: 212px" class="auto-style6">&nbsp;</td>--%>
                    <td class="auto-style6" style="width: 257px">&nbsp;</td>
                    <td class="auto-style34s" style="width: 233px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <%-- <td style="width: 212px" class="auto-style6">&nbsp;</td>--%>
                    <td class="auto-style6" style="width: 257px"><b><asp:Label ID="mehsul" runat="server"></asp:Label>:</b></td>
                    <td class="auto-style34s" style="width: 233px">
                        <asp:Label ID="vxor" runat="server"></asp:Label>
                    </td>
                    <td><b>İmza:_____________</b></td>
                </tr>
            </table>
        </div>
    </div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
</asp:Content>

