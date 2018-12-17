<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyCauHoi.aspx.cs" Inherits="WebsiteTracNghiem.QuanLyCauHoi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
            height: 23px;
        }
        .auto-style3 {
            width: 498px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Danh sách câu hỏi mã đề: <asp:Label ID="lbMaDe" runat="server"></asp:Label></h3>
        <br />
        <table class="auto-style3">
            <tr>
                <th class="auto-style1">
                    Nội dung
                </th>
                
            </tr>
        </table>
    <asp:DataList runat="server" ID="dlCauHoi" OnItemCommand="dlCauHoiCommand" DataKeyField="CauHoiID">
        <ItemTemplate>
                        <table border="1">
                            
                           <tr>
                               <td>ID câu hỏi:</td>
                               <td><asp:Label ID="lbCauHoiID" runat="server"  text='<%#Eval("CauHoiID") %>'>></asp:Label></td>
                             
                           </tr>
                            <tr>
                                <td>
                                    Câu hỏi: 
                                </td>
                                <td>
                                    <asp:Label ID="txtCauHoi" runat="server" Height="100px" Width="400px" TextMode="MultiLine" text='<%#Eval("CauHoi") %>'>></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                     A:
                                </td>
                                <td>
                                    <asp:Label ID="txtA"  runat="server"  Height="40px" Width="400px" TextMode="MultiLine" text='<%#Eval("A") %>'> > </asp:Label>
                                </td>
                            </tr>
                             <tr>
                                 <td> B:</td>
                                 <td><asp:Label ID="txtB" runat="server"  Height="40px" Width="400px" TextMode="MultiLine"  text='<%#Eval("B") %>'>></asp:Label><br /></td>
                             </tr>     
                            <tr>
                                <td>
                                     C:
                                </td>
                                <td>
                                    <asp:Label ID="txtC" runat="server" Height="40px" Width="400px" TextMode="MultiLine"   text='<%#Eval("C") %>'> ></asp:Label>
                                </td>
                            </tr> 
                           <tr>
                               <td>
                                    D:
                               </td>
                               <td>
                                   <asp:Label ID="txtD" runat="server"  Height="40px" Width="400px" TextMode="MultiLine" text='<%#Eval("D") %>'> ></asp:Label>
                               </td>
                           </tr>
                            <tr>
                                <td>
                                        Đáp án đúng:
                                </td>
                                <td>
                                    <asp:Label ID="txtDapAnDung" runat="server"  text='<%#Eval("DapAnDung") %>'>></asp:Label>
                                </td>
                            </tr>    
                            <tr>
                                <td><asp:Button ID="btnSua" runat="server" Text="Sửa" CommandArgument='<%#Eval("CauHoiID") %>' CommandName="btnSua_Click"/>
                                </td>
                            </tr>                
                        </table>          
        </ItemTemplate>
    </asp:DataList>
     
      
    </form>
</body>
</html>
