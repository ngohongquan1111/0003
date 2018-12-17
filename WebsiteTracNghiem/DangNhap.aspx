<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebsiteTracNghiem.TrangChu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form runat="server" id="frmLogin">
         <table border="1" align="center">
        <tr>
            <td>Tài khoản: <asp:TextBox ID="txtUserNameLogin" runat="server"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="CheckNullUserName" runat="server" ControlToValidate="txtUserNameLogin"  ErrorMessage="Tên đăng nhập không được để trống" Display="None"></asp:RequiredFieldValidator>
             <asp:RequiredFieldValidator ID="CheckNullPassWord" runat="server" ControlToValidate="txtPassLogin" Display="None" ErrorMessage="Mật khẩu không được đề trống"></asp:RequiredFieldValidator>
      
        </tr>
             <tr>
                 <td>
                    Password: <asp:TextBox ID="txtPassLogin" type="password" runat="server"></asp:TextBox>
                 </td>
             </tr>
        <tr>
            <td><a href="DangKy.aspx">Chưa có tài khoản ? </a></td>
            <td><asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="Login" /></td>
        </tr>
    </table>
        <asp:ValidationSummary runat="server"  ShowMessageBox="true" ID="validsum" />
    </form>
   
    
</body>
</html>
