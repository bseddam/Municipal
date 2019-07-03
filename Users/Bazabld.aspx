<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="Bazabld.aspx.cs" Inherits="Users_Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style_1/styles.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

 <div style="background-color:ActiveBorder; height:500px; width:100%; text-align:center; vertical-align:auto;">
    
     <div style="padding-top:10px;">
     <h3>Bələdiyyə üzrə qeydiyyata alınan məlumatlar </h3> </div>

     <div style="height:auto; width:100%; background-color:white;">
                     <table border="1" cellpadding="0" cellspacing="0" class="auto-style23" style="stsubtable">
                         <tr>
                             <%--<td valign="center" width="62" style="text-align: center;"><b><span lang="AZ-LATIN">S/n</span></b></td>  --%>                          
                             <td valign="center" width="113" style="text-align: center;"><b><span lang="AZ-LATIN">Vergi ödəyicisinin adı</span></b></td>
                             <td valign="center" width="113" style="text-align: center;"><b><span lang="AZ-LATIN">YVÖK</span></b> </td>
                             <td valign="center" width="500" style="text-align: center;"><b><span lang="AZ-LATIN">Vergi obyektləri</span></b></td>                             
                         </tr>
                      
                        <asp:Repeater ID="DataListBaza" runat="server">
                            <ItemTemplate>
                                <tr>                                    
                                    <%--<td valign="top" width="70" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("N")%>
                                                <p></p>
                                            </span>
                                        </p>
                                    </td>--%>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("Fullname")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td valign="top" width="113" class="auto-style24">
                                        <p align="center" class="MsoNormal">
                                            <span lang="AZ-LATIN"><%#Eval("YVOK")%><o:p></o:p></span>
                                        </p>
                                    </td>
                                    <td>
                                       
                                            <%#Eval("name")%>
                                       
                                    </td>
                                   
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>

                     </div>

</div>
</asp:Content>

