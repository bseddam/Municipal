<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="Certificate.aspx.cs" Inherits="Users_Certificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlprint.ClientID %>");
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
    <style type="text/css">
        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: "Times New Roman","sans-serif";
        }

        .auto-style3 {
            border-collapse: collapse;
            font-size: 11.0pt;
            font-family: Times New Roman, sans-serif;
            border: 1.0pt solid windowtext;
        }
    </style>
    <br />


    <div align="center">
        <asp:Button ID="btnprint" runat="server" Text="Print" OnClientClick="return PrintPanel();" Width="436px" />
    </div>
    <div style="clear: both;"></div>
    <div>&nbsp;</div>
    <asp:Panel ID="pnlprint" runat="server">
        <div align="center">

            <table border="1px" cellpadding="0" cellspacing="0" class="auto-style3" style="mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; width: 436px;">
                <tr>
                    <td valign="top" width="436px">
                        <div align="center" style="height: 30px">
                            <b><span lang="AZ-CYR" style="font-size: 15px;">Azərbaycan Respublikası</span></b>
                        </div>

                        <div style="clear: both;"></div>
                        <div align="center">
                            <b>
                                <asp:Label ID="lblbel" runat="server"></asp:Label></b>
                        </div>
                        <div style="clear: both;"></div>
                        <div align="center">
                            Yerli (bələdiyyə) büdcənin vergi ödəyicisi olan
                        </div>
                        <div style="clear: both;"></div>
                        <div align="center" style="height: 30px">
                            <asp:Label ID="lblsexs" runat="server"></asp:Label>
                            şəxsin uçota alınması haqqında
                        </div>

                        <div style="clear: both;"></div>
                        <div align="center" style="height: 35px">
                            <b><span lang="AZ-CYR" style="font-size: 14px;">ŞƏHADƏTNAMƏ</span></b>
                        </div>
                        <div style="clear: both;"></div>


                        <div style="clear: both;"></div>
                        <div lang="Times New Roman">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 54px;">
                                YVÖK
                            </div>
                            <div style="text-align: left; float: left; width: 355px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblyvok" runat="server"></asp:Label>
                            </div>
                        </div>


                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 200px;">
                                Vergi ödəyicisinin
                            </div>
                            <div style="text-align: center; float: left; width: 107px;">
                                &nbsp;
                            </div>
                        </div>



                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 54px;">
                                Soyadı
                            </div>
                            <div style="text-align: left; float: left; width: 355px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblsoyad" runat="server"></asp:Label>
                            </div>
                        </div>







                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 54px;">
                                Adı
                            </div>
                            <div style="text-align: left; float: left; width: 355px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblad" runat="server"></asp:Label>
                            </div>
                        </div>




                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 54px;">
                                Ata adı&nbsp;
                            </div>
                            <div style="text-align: left; float: left; width: 355px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblataadi" runat="server"></asp:Label>
                            </div>
                        </div>






                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 54px;">
                                Ünvanı
                            </div>
                            <div style="text-align: left; float: left; width: 355px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblunvan" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 410px; border-bottom: 1px solid #000;">
                                &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="436px">
                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal">
                            <span lang="AZ-CYR">
                                <o:p>&nbsp;</o:p>
                            </span>
                        </p>






                        <div lang="AZ-CYR">
                            <div style="float: left; width: 100px;">&nbsp;</div>

                            <div style="text-align: center; float: left; width: 40px; border-bottom: 1px solid #000;">
                                <asp:Label ID="lblgun" runat="server"></asp:Label>
                            </div>
                            <div style="text-align: left; float: left; width: 40px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 40px; border-bottom: 1px solid #000;">
                                <asp:Label ID="lblay" runat="server"></asp:Label>
                                
                            </div>
                            <div style="text-align: left; float: left; width: 40px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 50px; border-bottom: 1px solid #000;">
                                <asp:Label ID="lblil" runat="server"></asp:Label>
                            </div>
                        </div>





                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 100px;">&nbsp;</div>

                            <div style="text-align: center; float: left; width: 40px;">
                                gün</div>
                            <div style="text-align: left; float: left; width: 40px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 40px;">
                                ay</div>
                            <div style="text-align: left; float: left; width: 40px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 50px;">
                              il</div>
                        </div>


                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 10px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 147px;">
                                <asp:Label ID="mehsul" runat="server"></asp:Label>
                            </div>
                            <div style="text-align: center; float: left; width: 250px; border-bottom: 1px solid #000;">
                                <asp:Label ID="lblsedr" runat="server"></asp:Label>
                                &nbsp;</div>
                        </div>


                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 10px;">&nbsp;</div>
                            <div style="text-align: left; float: left; width: 146px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 250px;">
                                (soyadı, adı, atasının adı)
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div>&nbsp;</div>

                        <div style="clear: both;"></div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: right; float: left; width: 125px;">
                                İmza:
                            </div>
                            <div style="text-align: center; float: left; width: 284px; border-bottom: 1px solid #000;">
                                &nbsp;&nbsp;
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div>&nbsp;</div>
                        <div lang="AZ-CYR">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="text-align: right; float: left; width: 125px;">
                                &nbsp;
                            </div>
                            <div style="text-align: center; float: left; width: 284px;">
                                M.Y.&nbsp;
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
    </asp:Panel>



</asp:Content>

