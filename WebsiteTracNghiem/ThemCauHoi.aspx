<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemCauHoi.aspx.cs" Inherits="WebsiteTracNghiem.ThemCauHoi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 106px;
        }
        .auto-style2 {
            width: 212px;
        }
        .auto-style3 {
            width: 137px;
        }
        .auto-style4 {
            height: 25px;
        }
    </style>
  
    <div>
      
    </div>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
      <table border="1">
       <tr>
          <td>Ngày tạo:</td>
           <td><asp:Label ID="lbNgayTao" runat="server"></asp:Label></td>
       </tr>
        <tr>
          <td class="auto-style4">Người tạo:</td>
           <td class="auto-style4"><asp:Label ID="lbNguoiTao" runat="server"></asp:Label></td>
       </tr>
        <tr>
            <td class="auto-style4" >Bộ môn:</td>
            <td class="auto-style4"><asp:Label ID="lbBoMon" runat="server"></asp:Label></td>
            
        </tr>
         <tr>
             <td>Mã đề:</td>
             <td><asp:Label ID="lbMaDe" runat="server"></asp:Label></td>
         </tr>
                         <tr>
                             <td>Mã môn: </td>
                             <td><asp:Label ID="txtBoMonID" runat="server"></asp:Label> </td>
                         </tr>
        <tr>
            <td class="auto-style1">Nội dung câu hỏi:</td>
            <td><asp:TextBox ID="txtCauHoi" runat="server" Height="100px" Width="400px" TextMode="MultiLine" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Đáp án 1:</td>
            <td><asp:TextBox ID="txtA" runat="server" Height="30px" Width="400px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Đáp án 2:</td>
            <td><asp:TextBox ID="txtB" runat="server" Height="30px" Width="400px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Đáp án 3:</td>
            <td><asp:TextBox ID="txtC" runat="server" Height="30px" Width="400px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Đáp án 4:</td>
            <td><asp:TextBox ID="txtD" runat="server" Height="30px" Width="400px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
         <tr>
            <td class="auto-style1">Đáp án đúng:</td>
            <td><asp:TextBox ID="txtDapAnDung" runat="server"  Height="30px" Width="50px"></asp:TextBox></td>
        </tr>
                         <tr>
                             <td></td>
                             <td>

                                 <asp:Button ID="btnAccept" Text="Gửi" runat="server" OnClick="btnAccept_Click" />
                             </td>
                         </tr>     
    </table>
                   
              <br />
                    <h3 class="auto-style3">Bộ câu hỏi vừa thêm</h3>
<br />
                          <asp:DataList ID ="DL1" runat="server" Width="224px" Visible="true" RepeatDirection="Vertical">
                             <ItemTemplate>
                                 <table border="1">
                                     <tr><td>
                                         Câu hỏi:
                                         </td>
                                         <td>
                                              <asp:Label id="lbquestion"  text='<%#Eval("CauHoi") %>' runat="server"></asp:Label>    
                                         </td>
                                     </tr>
                                     <tr><td>
                                         A:
                                         </td>
                                         <td>
                                             <asp:Label id="lbA" runat="server" text='<%#Eval("A") %>'></asp:Label>
                                         </td>
                                     </tr>
                                     <tr><td>
                                         B:
                                         </td>
                                         <td>
                                             <asp:Label id="lbB" runat="server" text='<%#Eval("B") %>'></asp:Label>
                                         </td>
                                     </tr>
                                     <tr><td>
                                         C:
                                         </td>
                                         <td>
                                             <asp:Label id="lbC" runat="server" text='<%#Eval("C") %>'></asp:Label>
                                         </td>
                                     </tr>
                                     <tr><td>
                                         D:
                                         </td>
                                         <td>
                                             <asp:Label id="lbD" runat="server" text='<%#Eval("D") %>'></asp:Label>
                                         </td>
                                     </tr>
                                     <tr><td>
                                         Đáp án đúng:
                                         </td>
                                         <td>
                                              <asp:Label id="Label1" runat="server" text='<%#Eval("DapAnDung") %>'></asp:Label>
                                         </td>
                                     </tr>
                                 </table>
                                 

                             </ItemTemplate>
                            
                         </asp:DataList>
   
        
    </div>
    </form>
</body>
</html>
