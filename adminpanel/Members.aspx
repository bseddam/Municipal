<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="adminpanel_Members" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
        p.MsoNormal {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 10.0pt;
            font-family: Arial,"sans-serif";
        }

        .auto-style23 {
            border-collapse: collapse;
            line-height: 115%;
            font-size: 10.0pt;
            font-family: Arial, sans-serif;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }

        .auto-style24 {
            height: 28px;
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
        .auto-style25 {
            width: 43px;
        }
        .auto-style26 {
            height: 28px;
            width: 43px;
        }
        .auto-style27 {
            width: 83px;
        }
        .auto-style28 {
            height: 28px;
            width: 83px;
        }
        .auto-style29 {
            width: 64px;
        }
        .auto-style30 {
            height: 28px;
            width: 64px;
        }
        .auto-style31 {
            width: 111px;
        }
        .auto-style32 {
            height: 28px;
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>&nbsp;</div>
      <table style="width: 100%">
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
                <asp:DropDownList ID="ddlbelediyye" runat="server" Width="200px" >
                </asp:DropDownList>
            </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
        </tr>
                  <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11"></td>
            <td class="auto-style12">
                    <asp:Button ID="axtar" runat="server"  Text="Axtar" Width="115px" OnClick="axtar_Click" />
                  </td>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
        </tr>
    </table>
    <div>&nbsp;</div>
    
     <asp:GridView ID="GridView1" Width="100%" CellPadding="4"
                AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Sn,RegionName,MunicipalName,Name,StatusPositionName,Charge"
                runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">
                <Columns>

                    <asp:TemplateField HeaderText="SN" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField HeaderText="Rayon" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="RegionName" />
                    <asp:BoundField HeaderText="Bələdiyyə" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="MunicipalName" />
                    <asp:BoundField HeaderText="Adı" HeaderStyle-CssClass="headertextaligncenter" ItemStyle-CssClass="text-left" DataField="Name" />
                    <asp:BoundField HeaderText="Seçildiyi vəzifə" HeaderStyle-CssClass="headertextaligncenter" DataField="StatusPositionName" />
                    <asp:TemplateField HeaderText="Şəkil" HeaderStyle-CssClass="headertextaligncenter">
                        <ItemTemplate>
                          <img  src="../Users/<%#Eval("Photo").ToString() %>" style="width: 60px; height: 70px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Məsul şəxs" HeaderStyle-CssClass="headertextaligncenter" DataField="Charge" />

                </Columns>


                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" CssClass="pagination" />

                <PagerSettings NextPageText="Next" PreviousPageText="Back" Mode="NumericFirstLast"
                    PageButtonCount="3" />

            </asp:GridView>


 
</asp:Content>

