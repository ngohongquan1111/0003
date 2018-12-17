<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="WebsiteTracNghiem.Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    
</head>
<body>
    Tài khoản: <asp:Label ID="lbusername" runat="server"></asp:Label>
    <br />
    
    <form id="form1" runat="server">
    <asp:Button runat="server" ID="btnLogout" Text="Đăng xuất" OnClick="btnLogout_Click"/>
        <table>
        
        <tr><td><a href="GiaoDienQuanLy.aspx">Giao diện quản lý</a></td></tr>
    </table>
    <div>
   <asp:DataList runat="server" ID="dlUser">
       <ItemTemplate>
            <table border="1">
        <tr>
            <td>Người dùng: <asp:Label runat="server" ID="lbusername"></asp:Label>  </td>                    
        </tr>
    </table>
       </ItemTemplate>
   </asp:DataList>
    </div>
    </form>
</body>
</html>
