<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Information.aspx.cs" Inherits="Users_Information" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style38 {
            height: 45px;
            font-size: 30px;
        }



        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }

            .modalPopup .header {
                background-color: #2FBDF1;
                height: 30px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 3px;
            }

            .modalPopup .yes, .modalPopup .no {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
            }

            .modalPopup .yes {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        .auto-style38 {
            height: 45px;
            font-size: 30px;
            width: 240px;
        }

        .auto-style40 {
            height: 45px;
            width: 250px;
        }

        .auto-style43 {
            height: 45px;
            width: 228px;
        }

        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style44 {
            width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 1024px;">


        <div style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #CC0000; text-align: center; margin-bottom: 0px;">
            <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <table>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Bələdiyyənin statusu:</td>
                <td class="auto-style44">
                    <asp:DropDownList ID="ddlstatus" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" InitialValue="-1" ControlToValidate="ddlstatus" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Bələdiyyənin telefonu:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtiw" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtiw" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Ünvanı:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtbldunvan" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtbldunvan" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">VÖEN:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtvoen" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtvoen" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator><asp:CompareValidator ID="cv6" runat="server" ControlToValidate="txtvoen" ErrorMessage="*" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Group1" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtvoen" ErrorMessage="*" ValidationGroup="Group1" ValidationExpression="^[\s\S]{10,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Hesab №:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txthesabn" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txthesabn" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">Bank:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtbank" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtbank" CssClass="hata_mesaj" Display="Dynamic" ErrorMessage="*" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <%--  <tr  style="display:none;">
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style40">Kateqoriya:</td>
                        <td class="auto-style35">
                            <asp:DropDownList ID="ddlkateqoriya" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>                <%--  <tr  style="display:none;">
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style40">Kateqoriya:</td>
                        <td class="auto-style35">
                            <asp:DropDownList ID="ddlkateqoriya" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>

            <%--  <tr  style="display:none;">
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style40">Kateqoriya:</td>
                        <td class="auto-style35">
                            <asp:DropDownList ID="ddlkateqoriya" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style44">
                    <asp:Button ID="btnsave" runat="server" Text="Yadda saxla" Width="120px" OnClick="btnsave_Click" CssClass="btn btn-success" ValidationGroup="Group1" />
                </td>
                <td class="auto-style38">
                    <asp:Label ID="Lblmessage" runat="server" Font-Bold="True" ForeColor="#006600" Font-Size="13pt"></asp:Label>
                </td>
            </tr>
        </table>


    </div>

</asp:Content>

