using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WebsiteTracNghiem
{
    public partial class DangKy : System.Web.UI.Page
    {
        string constr = "Data Source = LAPTOPPHONGLINH; Initial Catalog = QUIZ; Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string GT = "";
            if(rbNam.Checked)
            {
                GT = "Nam";
            }
            else
            {
                GT = "Nữ";
            }
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("CreateAccount", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenDangNhap", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@MatKhau", txtPass.Text);
                    cmd.Parameters.AddWithValue("@HoTen", txtName.Text);
                    cmd.Parameters.AddWithValue("@GioiTinh", GT);
                    cmd.Parameters.AddWithValue("@NgaySinh", txtDayOfBirth.Text);
                    int kq = cmd.ExecuteNonQuery();
                    if (kq > 0)
                    {
                        MessageBox.Show("Tạo tài khoản thành công");
                        Response.Redirect("DangNhap.aspx");
                    }
                    else
                        MessageBox.Show("Đăng ký thất bại ");
                }
            }
        }
    }
}