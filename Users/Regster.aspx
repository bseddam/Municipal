<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regster.aspx.cs" Inherits="Regster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 1017px;
        }

        .auto-style3 {
            width: 158px;
            height: 50px;
        }

        .auto-style4 {
            width: 260px;
        }

        .auto-style10 {
            width: 288px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1024px; margin-left: auto; margin-right: auto; background-color: aliceblue;">




            <div style="text-align: center; background-color: Background; font-family: 'Times New Roman'; font-style: initial; color: white; font-size: 25px;">Qeydiyyat</div>
            <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
                <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Lblmessage" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
            </div>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Rayon:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlrayon" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" Text="*" InitialValue="-1" ControlToValidate="ddlrayon" ValidationGroup="qrup1" Display="Dynamic" Font-Size="17pt"></asp:RequiredFieldValidator>


                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Bələdiyyə:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlbelediyye" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" InitialValue="-1" ControlToValidate="ddlbelediyye" ValidationGroup="qrup1" Display="Dynamic" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Bələdiyyənin statusu:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlstatus" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" InitialValue="-1" ControlToValidate="ddlstatus" ValidationGroup="qrup1" Display="Dynamic" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">İstifadəçinin soyadı:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtsname" runat="server" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">&nbsp;Adı:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style3">Ata adı:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfname" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Cinsi:</td>
                    <td class="auto-style4">
                        <asp:RadioButton ID="rdman" runat="server" Text="Kişi" Checked="True" GroupName="A" />
                        <asp:RadioButton ID="rdwoman" runat="server" Text="Qadın" GroupName="A" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Mobil telefonu:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcontact" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Bələdiyyənin telefonu:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtiw" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtiw" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Ünvanı:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtbldunvan" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtbldunvan" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">VÖEN:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtvoen" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtvoen" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator><asp:CompareValidator ID="cv6" runat="server" ControlToValidate="txtvoen" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="qrup1" Display="Dynamic" Font-Size="17pt" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtvoen" ErrorMessage="*" ValidationGroup="qrup1" ValidationExpression="^[\s\S]{10,10}$" Display="Dynamic" Font-Size="17pt"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                                   <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Hesab №:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txthesabn" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txthesabn" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Bank:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtbank" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtbank" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Elektron ünvanı:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" CssClass="hata_mesaj" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtemail" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">İstifadəçi adı: (6 - 12 simvol)</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtlogin" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtlogin" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtlogin" ErrorMessage="*" ValidationGroup="qrup1" ValidationExpression="^[\s\S]{6,12}$" Display="Dynamic" Font-Size="17pt"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%--                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">Məktəbin nömrəsi:</td>
                    <td class="auto-style4">
                        <asp:textbox id="txtschool" runat="server" cssclass="form-control"></asp:textbox>
                    </td>
                    <td>
                        <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" controltovalidate="txtschool" cssclass="hata_mesaj" display="Dynamic" errormessage="Məktəb adı boş ola bilməz."></asp:requiredfieldvalidator>
                    </td>
                </tr>--%>                <%-- <tr  style="display:none;">
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style3">Şəkil:</td>
                        <td class="auto-style4">
                            <asp:FileUpload ID="fufoto"  runat="server" CssClass="btn-file"/>
                        </td>
                        <td>
                            <asp:Label ID="lblfu" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>--%>

                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Şifrə: (6 - 12 simvol)</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtpassvord" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassvord" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpassvord" ErrorMessage="*" ValidationGroup="qrup1" ValidationExpression="^[\s\S]{6,12}$" Display="Dynamic" Font-Size="17pt"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">Şifrə (təkrar):</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtpassvord2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassvord" ControlToValidate="txtpassvord2" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtpassvord2" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="qrup1" Font-Size="17pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--  <tr  style="display:none;">
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style3">Kateqoriya:</td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="ddlkateqoriya" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="btnsave" runat="server" Text="Yadda saxla" Width="120px" OnClick="btnsave_Click" CssClass="btn btn-success" ValidationGroup="qrup1" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <div style="background-color: Background; font-size: 17px; text-align: center; color: white;"><a href="/../Default.aspx" style="color: white">Giriş səhifəsinə keç</a></div>

        </div>
    </form>
</body>
</html>
