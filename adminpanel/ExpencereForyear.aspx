<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ExpencereForyear.aspx.cs" Inherits="adminpanel_ExpencereForyear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style type="text/css">

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

        .auto-style23 {
            width: 308px;
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
    <div>

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
                <td class="auto-style12"></td>
                <td class="auto-style13">Sahə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbsahe" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="cmbsahe_SelectedIndexChanged1">
                    </asp:DropDownList>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Təyinatı üzrə:</td>
                <td class="auto-style14">
                    <asp:DropDownList ID="cmbxerc" runat="server" Width="200px">
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
        <br />

        <div align="center">

            <asp:Button ID="btnprint" runat="server" OnClientClick="return PrintPanel();" Text="Print" Width="170px" />
            <br />
            <br />
        </div>


        <div id="pnlhtml" runat="server">

            <div>


                <div id="pnlhtml0" runat="server">
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: left; line-height: normal; text-align: center; width: 1017px;">
                        <b><span lang="AZ-LATIN">&nbsp; Bələdiyyələrin xərcləri barədə müfəssəl məlumat<o:p></o:p></span></b>
                    </p>
                    <p align="center" class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: normal">
                        <span lang="AZ-LATIN">
                            <o:p>&nbsp;</o:p>
                        </span>
                    </p>
                    <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <b><span lang="AZ-LATIN">Şəhər, rayonun adı</span></b>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;<asp:Label ID="lblrayon" runat="server"></asp:Label>
                    </o:p>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <b><span lang="AZ-LATIN">Bələdiyyənin adı</span></b>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;<asp:Label ID="lblbeladi" runat="server"></asp:Label>
                    </o:p>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">01.01.2016-cı ilə
                                        qalıq (manat)</span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;</o:p><asp:Label ID="lblqaliq0" runat="server"></asp:Label>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal; width: 428px;">
                                    <span lang="AZ-LATIN">2016-cı ildə bələdiyyənin ümumi gəliri (dotasiya istisna olmaqla)</span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">&nbsp;<asp:Label ID="gelir" runat="server"></asp:Label>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">Dövlət tərəfindən verilən dotasiya (manat)<o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;</o:p><asp:Label ID="dotasiya" runat="server"></asp:Label>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span style="color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 200; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">İ</span><span lang="AZ-LATIN" style="box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 200; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">anələrdən daxil olma (manat)</span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;</o:p><asp:Label ID="lbliane" runat="server"></asp:Label>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">2016-cı ildə bələdiyyənin ümumi xərci (manat)<o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;<asp:Label ID="lblxerc" runat="server"></asp:Label>
                    </o:p>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">01.01.2017-ci ilə
                                        qalıq (manat)</span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">
                                        <o:p>&nbsp;</o:p><asp:Label ID="lblqaliq" runat="server"></asp:Label>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style23">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">&nbsp;</span>
                                </p>
                            </td>
                            <td valign="top" width="322">
                                <p class="MsoNormal" style="margin-top: 0in; margin-right: -2.6pt; margin-bottom: 0in; margin-left: 0in; margin-bottom: .0001pt; line-height: normal">
                                    <span lang="AZ-LATIN">&nbsp;
                                    </span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                        
                          

            <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Name,MunicipalName,ExpensesAreaName,ExpensesSubAreaName,FundsAllocated,NoteText,Amount"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="1000">
                <Columns>
                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Rayon" HeaderStyle-CssClass="headertextaligncenter"  ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter"  DataField="MunicipalName" />
                    <asp:BoundField HeaderText="Hesabatili" HeaderStyle-CssClass="headertextaligncenter"  DataField="ExpensesYear" />
                    <asp:BoundField HeaderText="Xərclər (sahə üzrə)" HeaderStyle-CssClass="headertextaligncenter"  DataField="ExpensesAreaName" />
                    <asp:BoundField HeaderText="Xərclər (təyinatı üzrə)" HeaderStyle-CssClass="headertextaligncenter" DataField="ExpensesSubAreaName" />
                    <asp:BoundField HeaderText="Ayrılmış vəsait (manat)" HeaderStyle-CssClass="headertextaligncenter" DataField="FundsAllocated" />
                    <asp:BoundField HeaderText="Xərclərin müfəssəl təsviri" HeaderStyle-CssClass="headertextaligncenter" DataField="NoteText" />
                    <asp:BoundField HeaderText="Manat" HeaderStyle-CssClass="headertextaligncenter" DataField="Amount" />
                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />



            </asp:GridView>



    


                    </table>
                </div>
            </div>


        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>

