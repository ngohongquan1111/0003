<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GiaoDienQuanLy.aspx.cs" Inherits="WebsiteTracNghiem.GiaoDienQuanLy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 80px;
        }
        .auto-style2 {
            width: 85px;
        }
        .auto-style3 {
            width: 77px;
        }
        .auto-style5 {
            width: 67px;
        }
        .auto-style6 {
            width: 56px;
        }
        .auto-style7 {
            width: 110px;
        }
    </style>
    </head>
<body>
    <h1>Xin chào <asp:Label ID="lbl1" runat="server"></asp:Label></h1>
    <ul>
    </ul>
   
    <form id="form1" runat="server">
        <asp:Button runat="server" ID="btLogout" Text="Đăng xuất" OnClick="btLogout_Click" />
        <h3>Tạo bộ đề thi</h3>
    <table border="1">
        <tr>
            <td>Chọn Bộ Môn:</td>
            <td> <asp:DropDownList runat="server" ID="ddlBoMon"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Ngày tạo:</td>
            <td><asp:Label ID="lbNgayTao" runat="server"></asp:Label> </td>
        </tr>
        <tr>
            <td>
                Người tạo:
            </td>
            <td>
                <asp:Label ID="lbNguoiTao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnTaoBoDe" runat="server" Text="Tạo" Width="87px" OnClick="btnTaoBoDe_Click" /></td>
        </tr>
    </table>
        <br />  
        <h3>Quản lý bộ đề</h3>
        <br />
            <table border="1">
                <tr>
                    <th>Chọn môn</th>
                    <td><asp:DropDownList ID="ddlChonMon" runat="server" OnSelectedIndexChanged="ddlChonMon_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
                    
                </tr>
                <tr>
                            <th class="auto-style1">Mã đề</th>
                            <th class="auto-style2">Người tạo</th>
                            <th class="auto-style3">Tên môn</th>
                            <th class="auto-style7">Ngày tạo</th>
                            <th class="auto-style5">Chi tiết</th>
                        </tr>
            </table>
            <asp:DataList ID="blDSBoDe" runat="server" DataKeyField="ID" OnItemCommand="DatalistCommand">
                <ItemTemplate>
                    <table border="1">
                        <tr>
                            <td  class="auto-style1">
                                <asp:Label runat="server" ID="lblMaBoDe" text='<%#Eval("ID") %>'></asp:Label>
                                </td>
                            <td class="auto-style2"><asp:Label runat="server" ID="lbTenDangNhap"  text='<%#Eval("Tên đăng nhập") %>' ></asp:Label></td>    
                               <td class="auto-style3"><asp:Label runat="server" ID="lbMonHoc"  text='<%#Eval("Môn học") %>' > ></asp:Label></td> 
                                <td  class="auto-style7"><asp:Label runat="server" ID="lblNgayTao" text='<%#Eval("Thời gian tạo") %>'></asp:Label></td>
                              <td class="auto-style5"> <asp:Button runat="server" ID="btnChiTiet" Text="Chi Tiết" CommandName="btnChiTiet_Click" CommandArgument='<%#Eval("ID") %>'></asp:Button></td> 
                            
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
    
    </form>
</body>
</html>
