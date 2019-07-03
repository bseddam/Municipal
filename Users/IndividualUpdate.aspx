<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="IndividualUpdate.aspx.cs" Inherits="Users_Individual" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .auto-style35 {
            width: 250px;
        }

        .auto-style38 {
            height: 40px;
            font-size: 30px;
            width: 240px;
        }

        .auto-style40 {
            height: 40px;
            width: 277px;
        }

        .auto-style43 {
            height: 40px;
            width: 228px;
        }

        .auto-style44 {
            height: 40px;
            width: 500px;
        }
    </style>

    <div style="width: 1024px;">

        <div style="float: left; width: 100%;">
            <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
                <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">&nbsp;</td>
                            <td class="auto-style35">
                                <asp:Button ID="btnyeni" runat="server" Text="Yeni" OnClick="btnyeni_Click" Width="250px" />
                            </td>
                            <td class="auto-style38">&nbsp;
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Ərizənin qeydiyyat tarixi</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="erizeqeydtarixi" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>

                            </td>
                            <td class="auto-style38">&nbsp;
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Vergi ödəyicisinin soyadı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="soyadi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="soyadi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Adı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="adi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="adi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Atasının adı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="ataadi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ataadi" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Şəxsiyyət vəsiqəsinin nömrəsi</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="vesnomre" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">
                                <asp:CompareValidator ID="cv6" runat="server" ControlToValidate="vesnomre" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="vesnomre" Display="Dynamic" ErrorMessage="*" ValidationExpression="^[\s\S]{7,9}$" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Pin kodu</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="vespinkod" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="vespinkod" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="vespinkod" ErrorMessage="*" ValidationGroup="Group1" ValidationExpression="^[\s\S]{7,7}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                &nbsp;</td>
                        </tr>

                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Şəxsiyyət vəsiqəsini verən orqanın adı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="vesverorqan" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>

                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Verilmə tarixi</td>
                            <td class="auto-style35">
                                <dx:ASPxDateEdit ID="vesvertarix" runat="server" Width="250px">
                                </dx:ASPxDateEdit>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Doğulduğu yer</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="dogumyeri" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Doğulduğu tarix</td>
                            <td class="auto-style35">
                                <dx:ASPxDateEdit ID="dogumtarixi" runat="server" Width="250px">
                                </dx:ASPxDateEdit>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Milliyəti</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="milliyeti" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Vətəndaşlığı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="vetendasligi" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Cinsi</td>
                            <td class="auto-style35">&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdman" runat="server" Text="Kişi" Checked="True" GroupName="A" />
                                &nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdwoman" runat="server" Text="Qadın" GroupName="A" />
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <%--                <tr>
                     
                    <td class="auto-style18">Yerli vergi ödəyicisinin kodu</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="yvok" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>--%>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Poçt indeksi</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="poctindex" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Qeydiyyatda olduğu yaşayış ünvanı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="qeydiyyatadres" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Faktiki yaşayış ünvanı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="faktikiadres" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Elektron poçt ünvanı</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Mobil telefonu</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="mobiltel" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">İş telefonu</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="iwtel" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Ev telefonu</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="evtel" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Faks</td>
                            <td class="auto-style35">
                                <asp:TextBox ID="fax" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <tr>

                            <td class="auto-style43">&nbsp;</td>

                            <td class="auto-style40" style="width: 277px">Vergi ödəyicisinin güzəşti barədə məlumat</td>
                            <td class="auto-style35">&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdguzewtsiz" runat="server" Text="Güzəştsiz" Checked="True" GroupName="b" AutoPostBack="True" OnCheckedChanged="rdguzewtsiz_CheckedChanged" />
                                &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdguzewtli" runat="server" Text="Güzəştli" GroupName="b" AutoPostBack="True" OnCheckedChanged="rdguzewtli_CheckedChanged" />
                            </td>
                            <td class="auto-style38">&nbsp;</td>
                        </tr>
                        <div id="pnlguzewt" visible="false" runat="server">
                            <tr>

                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style40" style="width: 277px">Güzəşt sənədini verən təşkilat</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="guzvertewkilat" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"
                                        ControlToValidate="guzvertewkilat" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1" ToolTip="Required"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>


                            <tr>

                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style40" style="width: 277px">Güzəştin səbəbi</td>
                                <td class="auto-style35">
                                    <dx:ASPxComboBox ID="guzsebeb" runat="server" ValueType="System.String" Width="250px">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style38">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="guzsebeb" Display="Dynamic" ErrorMessage="*" InitialValue="-1" Text="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style40" style="width: 277px">Güzəşt sənədinin seriyası</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="guzseriya" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">&nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style40" style="width: 277px">Güzəşt sənədinin nömrəsi</td>
                                <td class="auto-style35">
                                    <asp:TextBox ID="guznomre" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style38">&nbsp;</td>
                            </tr>
                            <tr>

                                <td class="auto-style43">&nbsp;</td>

                                <td class="auto-style40" style="width: 277px">Güzəşt sənədinin verilmə tarixi</td>
                                <td class="auto-style35">

                                    <dx:ASPxDateEdit ID="guzverilme" Width="250px" runat="server">
                                    </dx:ASPxDateEdit>

                                </td>
                                <td class="auto-style38">&nbsp;</td>
                            </tr>
                        </div>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
                <tr>

                    <td class="auto-style22"></td>

                    <td class="auto-style44"></td>
                    <td class="auto-style6">
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />
                    </td>
                    <td class="auto-style20"></td>
                    <td class="auto-style23"></td>
                </tr>
            </table>
            <br />
            <br />
            <br />

        </div>

    </div>


</asp:Content>

