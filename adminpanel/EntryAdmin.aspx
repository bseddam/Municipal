<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntryAdmin.aspx.cs" Inherits="adminpanel_EntryAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        .style1 {
            width: 100%;
            height: 200px;
        }

        .style2 {
            width: 400px;
        }

        .style3 {
            width: 8%;
        }

        .style4 {
            height: 23px;
        }

        .auto-style1 {
            width: 8%;
            height: 30px;
        }

        .auto-style2 {
            height: 30px;
        }

        .auto-style3 {
            width: 400px;
            height: 165px;
            background-color: skyblue;
            padding: 50px 50px 50px 50px;
            font-family: 'Times New Roman';
            font-style: inherit;
            font-size: 14px;
        }

        .auto-style4 {
            height: 35px;
        }
    </style>
    <link href="../style_1/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <div>

            <table class="style1" style="margin-top: 5px;">

                <tr>
                    <td style="text-align: center; background-color: Background; background-color: white; font-family: 'Times New Roman'; font-style: initial; color: white; padding-bottom: 5px">
                        <img src="../img/gerb.png" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; background-color: Background; font-family: 'Times New Roman'; font-style: initial; color: white; font-size: 25px;" class="auto-style4">BAMS nəzarət sistemi</td>
                </tr>
                <tr>
                    <td>
                        <table align="center" class="auto-style3">
                            <tr>
                                <td colspan="2" style="text-align: center" width="30%" class="style4">
                                    <asp:Label ID="lblBilgi" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                 <td class="style3">&nbsp;&nbsp;&nbsp;İstifadəçi adı:</td>
                                <td>
                                    <asp:TextBox class="form-control" ID="txtlogin" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">&nbsp;&nbsp;&nbsp;Şifrə:</td>
                                <td>
                                    <asp:TextBox class="form-control" ID="txtparol" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1"></td>
                                <td class="auto-style2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button class="btn btn-default" ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" />
                                            </td>
                                            <td style="padding-left: 30px; font-size: large"><%--<a href="Regster.aspx"> Qeydiyyat</a>--%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 10px">
                </tr>
                <%--   <tr>
                <td style="text-align:center;background-color:Background;font-family:'Times New Roman';  font-style:initial; color:white;">
                    <h4>İmtahan qaydaları</h4></td>
            </tr>
            <tr style="padding-top:0px;">
                <td style="text-align:left;background-color:Background;font-family:'Times New Roman'; height:150px; font-style:initial; color:white; padding-left:100px">
                    <h5>1. Qeydiyyatdan keçdiyiniz sahə üzrə təqdim olunan sualların sayı TQDK-nın uyğun sahəsi üzrə sualların sayına bərabərdir</h5>
                    <h5>2. Qeydiyyatdan keçdiyiniz sahə üzrə təqdim olunan imtahan müddəti TQDK-nın uyğun sahəsi üzrə imtahan müddətinə bərabərdir</h5>
                    <h5>3. İmtahan müddəti ərzində siz sualları cavablandıra bilərsiz, cavablarınızı ləğv edə bilərsiz və cavab variantını dəyişdirə bilərsiz</h5>
                    <h5>4. İmtahan müddəti bitmədən "Təsdiqlə" düyməsi vasitəsi ilə imtahanın nəticəsinə baxa bilərsiz</h5>
                    <h5>5. İmtahan müddəti bitmədən "Təsdiqlə" düyməsi vasitəsi ilə mütləq imtahanın nəticəsinə baxmalısınız,</h5>
                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;əks təqdirdə imtahanın nəticəsini əldə edə bilməyəcəksiniz</h5>
                </td>
            </tr>--%>
            </table>

        </div>
    </form>
</body>
</html>
