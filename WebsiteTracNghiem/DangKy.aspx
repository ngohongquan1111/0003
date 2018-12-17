<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="WebsiteTracNghiem.DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="frmRegister" runat="server">
    <div>
    <h3> Đăng ký tài khoản</h3>
        <table>
            <tr>
                <td>
                    Họ và tên: 
                </td>
                <td><asp:TextBox runat="server" ID="txtName"></asp:TextBox></td>             
            </tr>
            <tr>
                <td>
                   Tên đăng nhập:
                </td>
                <td>
                     <asp:TextBox runat="server" ID="txtUserName" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                   Mật khẩu: 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPass" type="password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày sinh: 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtDayOfBirth"  type="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Nam <asp:RadioButton ID="rbNam" runat="server" /> 
                              Nữ  <asp:RadioButton ID="rbNu" runat="server" /> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnRegister"  Text="Đăng ký" runat="server" Width="118px" OnClick="btnRegister_Click"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
