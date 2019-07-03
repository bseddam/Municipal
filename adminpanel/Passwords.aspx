<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Passwords.aspx.cs" Inherits="adminpanel_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <style type="text/css">
        .auto-style5 {
            width: 175px;
        }
          .auto-style6 {
              width: 108px;
          }
          .auto-style7 {
              width: 310px;
          }
          .auto-style8 {
              width: 304px;
          }
          .auto-style9 {
              width: 363px;
          }
              .auto-style10 {
                  width: 310px;
                  height: 27px;
              }
              .auto-style11 {
                  width: 108px;
                  height: 27px;
              }
              .auto-style12 {
                  width: 363px;
                  height: 27px;
              }
              .auto-style13 {
                  width: 175px;
                  height: 27px;
              }
              .auto-style14 {
                  height: 27px;
              }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>&nbsp;</div>
    <div>
        <table style="width:100%">
                <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">Rayon:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlrayon" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlrayon_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                    </td>
                <td class="auto-style13"></td>
                <td class="auto-style14"></td>
            </tr>
                <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">Bələdiyyə:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlbelediyye_SelectedIndexChanged">
                    </asp:DropDownList>
                    </td>
                <td class="auto-style13"></td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">İstifadəçi:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlistifadeci" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlistifadeci_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style13"></td>
                <td class="auto-style14"></td>
            </tr>
               <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    İstifadəçi adı:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtlogin" runat="server" Enabled="False" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    </td>
                <td class="auto-style14">
                    </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    Şifrə:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtkohneparol" runat="server" Enabled="False" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    </td>
                <td class="auto-style14">
                    </td>
            </tr>
              <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">Yeni şifrə:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtyeniparol" runat="server" Width="200px"></asp:TextBox>
                  </td>
                <td class="auto-style13"></td>
                <td class="auto-style14"></td>
            </tr>
                          <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
                          <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Yadda saxla" />
                              </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
                          <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp; 
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
</asp:Content>

