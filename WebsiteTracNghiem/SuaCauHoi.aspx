<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaCauHoi.aspx.cs" Inherits="WebsiteTracNghiem.SuaCauHoi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3>Câu hỏi :<asp:Label runat="server" ID="lbidcauhoiedit"></asp:Label></h3>
        <h4> Môn học: <asp:Label runat="server" ID="lbMonhoc"></asp:Label></h4>
        <table border="1">
            <tr>
                <td>
                    Câu hỏi:
                </td>
                <td>
                    <asp:TextBox ID="tbcauhoi" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                   A:
                </td>
                <td>
                    <asp:TextBox ID="tbA" runat="server" Height="40px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    B:
                </td>
                <td>
                    <asp:TextBox ID="tbB" runat="server" Height="40px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr> <tr>
                <td>
                    C:
                </td>
                <td>
                    <asp:TextBox ID="tbC" runat="server" Height="40px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr> <tr>
                <td>
                    D:
                </td>
                <td>
                    <asp:TextBox ID="tbD" runat="server" Height="40px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr> <tr>
                <td>
                    Đáp án đúng:
                </td>
                <td>
                    
                     A:<asp:RadioButton runat="server" ID="rdA" OnCheckedChanged="rdA_CheckedChanged" AutoPostBack="true" />
                     B:<asp:RadioButton runat="server" ID="rdB"  OnCheckedChanged="rdB_CheckedChanged" AutoPostBack="true"/>
                     C:<asp:RadioButton runat="server" ID="rdC"  OnCheckedChanged="rdC_CheckedChanged" AutoPostBack="true"/>
                     D:<asp:RadioButton runat="server" ID="rdD"  OnCheckedChanged="rdD_CheckedChanged" AutoPostBack="true"/>                 
                </td>
            </tr>
            <tr>
                <td> <asp:Button runat="server" Text="Sửa" OnClick="Sua_Onclick" Width="78px" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
