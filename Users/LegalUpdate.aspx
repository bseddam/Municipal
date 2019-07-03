<%@ Page Title="" Language="C#" MasterPageFile="~/Users/IndividualMasterPage.master" AutoEventWireup="true" CodeFile="LegalUpdate.aspx.cs" Inherits="Users_Juridical" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
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
            width: 508px;
        }



    </style>

    <div style="width: 1024px;">


        <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
            <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
        </div>
        <div style=" width: 100%">
        

              <%--      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
            <table>
                                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">&nbsp;</td>
                    <td class="auto-style35">
                        <asp:Button ID="btnyeni" runat="server" Text="Yeni" OnClick="btnyeni_Click" Width="250px" />

                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Ərizənin qeydiyyat tarixi</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="erizeqeydtarixi" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Vergi ödəyicisinin adı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="txtvergiod" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtvergiod" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
                </tr>
                                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">VÖEN</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="voen" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="voen" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator><asp:CompareValidator ID="cv6" runat="server" ControlToValidate="voen" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="voen" ErrorMessage="*" ValidationGroup="Group1" ValidationExpression="^[\s\S]{10,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Hüquqi ünvanı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="huquqiunvan" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Poçt indeksi</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="poctindex" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Dövlət qeydiyyatına alındığı tarix</td>
                    <td class="auto-style35">
                        <dx:ASPxDateEdit ID="dovletqeydtarix" runat="server" Width="250px">
                        </dx:ASPxDateEdit>

                    </td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Rəhbərin soyadı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="soyadi" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Adı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="adi" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Atasının adı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="ataadi" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                    &nbsp;</td>
                </tr>
                                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Cinsi</td>
                    <td class="auto-style35">
                                        <asp:RadioButton ID="rdman" runat="server" Text="Kişi" Checked="True" GroupName="A" />
                                &nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rdwoman" runat="server" Text="Qadın" GroupName="A" />
                    </td>
                    <td class="auto-style38">
                                  &nbsp;</td>
                </tr>
                <%--                <tr>
                     
                    <td class="auto-style40">Yerli vergi ödəyicisinin kodu</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="yvok" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style38">&nbsp;</td>
                </tr>--%>




                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Elektron poçt ünvanı</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Mobil telefonu</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="mobiltel" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">İş telefonu</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="iwtel" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Ev telefonu</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="evtel" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style40">Faks</td>
                    <td class="auto-style35">
                        <asp:TextBox ID="fax" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style38">&nbsp;</td>
                </tr>

            </table>
            <%--          </ContentTemplate>
            </asp:UpdatePanel>--%>

            <table>
                <tr>

                    <td class="auto-style22">&nbsp;</td>

                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" OnClick="btnsave_Click" ValidationGroup="Group1" Text="Yadda saxla" Width="120px" />
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style23">&nbsp;</td>
                </tr>
            </table>

        </div>
         




    </div>
</asp:Content>

