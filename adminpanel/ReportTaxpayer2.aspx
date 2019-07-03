<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ReportTaxpayer2.aspx.cs" Inherits="Users_Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style_1/styles.css" rel="stylesheet" />
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style>
        .navi {
            padding-left: 10px;
            background-color: #D7E6E8;
        }

        .nav_left {
            float: left;
            padding-left: 10px;
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

        .auto-style16 {
            width: 157px;
        }

        .auto-style17 {
            width: 159px;
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
            <td class="auto-style13">Ödəyici:</td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlfizhuq" runat="server" Width="200px">
                    <asp:ListItem Value="-1">Ümumi</asp:ListItem>
                    <asp:ListItem Value="1">Fiziki şəxs</asp:ListItem>
                    <asp:ListItem Value="2">Hüquqi şəxs</asp:ListItem>
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
    </div>
    <div id="pnlhtml" runat="server" style="background-color: ActiveBorder; height: 500px; width: 100%; text-align: center; vertical-align: auto;">

        <div style="padding-top: 10px; text-align: center;">
            <h3>VERGİ ÖDƏYİCİLƏRİ </h3>
        </div>

        <div style="height: auto; width: 100%; background-color: white;">
            <table border="1" cellpadding="0" cellspacing="0" class="table table-striped" style="stsubtable">
                <tr>
                    <td valign="center" width="70" style="text-align: center;"><b><span lang="AZ-LATIN">S/n</span></b></td>
                    <td valign="center" style="text-align: center;" class="auto-style16"><b><span lang="AZ-LATIN">Rayon</span></b></td>
                    <td valign="center" style="text-align: center;" class="auto-style17"><b><span lang="AZ-LATIN">Bələdiyyə</span></b></td>
                    <td valign="center" width="300" style="text-align: center;"><b><span lang="AZ-LATIN">Vergi ödəyicisinin adı</span></b></td>
                    <td valign="center" width="150" style="text-align: center;"><b><span lang="AZ-LATIN">YVÖK</span></b> </td>
                    <td valign="center" width="300" style="text-align: center;"><b><span lang="AZ-LATIN">Ünvan</span></b> </td>
                    <td valign="center" width="300" style="text-align: center;"><b><span lang="AZ-LATIN">Telefon</span></b> </td>
                    <td valign="center" width="100" style="text-align: center;"><b><span lang="AZ-LATIN">Güzəşt</span></b></td>
                    <td valign="center" width="150" style="text-align: center;"><b><span lang="AZ-LATIN">Qeydiyyat tarixi</span></b></td>
                </tr>

                <asp:Repeater ID="DataListCem" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td valign="top" width="70" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"></span>
                            </td>
                            <td valign="top" class="auto-style16">&nbsp;</td>
                            <td valign="top" class="auto-style17">&nbsp;</td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN">Cəmi:  <%#Eval("say")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="150" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">&nbsp;<o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN">&nbsp;<o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN">&nbsp;<o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="100" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("heyox")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="150" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN">&nbsp;<o:p></o:p></span>
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
                                    <span lang="AZ-LATIN"><%#((int.Parse(Session["x"].ToString())-1)*1000+(Container.ItemIndex+1))%>
                                    </span>
                            </td>
                            <td valign="top" class="auto-style16">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("RegionName")%></span>
                                </p>
                            </td>
                            <td valign="top" class="auto-style17">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("MunicipalName")%></span>
                                </p>
                            </td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Fullname")%></span>
                                </p>
                            </td>
                            <td valign="top" width="150" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("YVOK")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("ActualAdress")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="300" class="auto-style24">
                                <p align="left" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("telefon")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="100" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("Guzesht")%><o:p></o:p></span>
                                </p>
                            </td>
                            <td valign="top" width="150" class="auto-style24">
                                <p align="center" class="MsoNormal">
                                    <span lang="AZ-LATIN"><%#Eval("RegistrPetitondate")%><o:p></o:p></span>
                                </p>
                            </td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <div id="naviqasiya" runat="server" visible="false" class="navi">
                <div class="nav_left">
                    <asp:LinkButton ID="lb6" runat="server" Font-Underline="False"
                        OnClick="lb6_Click"><</asp:LinkButton>
                </div>
                &nbsp;
                
 
         <div class="nav_left">
             <asp:LinkButton ID="lb1" runat="server" OnClick="lb1_Click"
                 Font-Underline="False">1</asp:LinkButton>
         </div>
                &nbsp;
         <div class="nav_left">
             <asp:LinkButton ID="lb2" runat="server" OnClick="lb2_Click"
                 Font-Underline="False">2</asp:LinkButton>
         </div>
                &nbsp;
          <div class="nav_left">
              <asp:LinkButton ID="lb3" runat="server" OnClick="lb3_Click"
                  Font-Underline="False">3</asp:LinkButton>
          </div>
                &nbsp;
         <div class="nav_left">
             <asp:LinkButton ID="lb4" runat="server" OnClick="lb4_Click"
                 Font-Underline="False">4</asp:LinkButton>
         </div>
                &nbsp;
         <div class="nav_left">
             <asp:LinkButton ID="lb5" runat="server" OnClick="lb5_Click"
                 Font-Overline="False" Font-Underline="False">5</asp:LinkButton>
         </div>
                &nbsp;
        
     
     
     
        <div class="nav_left">
            <asp:LinkButton ID="lb7" runat="server" Font-Underline="False"
                OnClick="lb7_Click">></asp:LinkButton>
        </div>
            </div>

        </div>

    </div>
    <br />
     <br />
</asp:Content>

