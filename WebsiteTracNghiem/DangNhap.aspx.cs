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
    public partial class TrangChu : System.Web.UI.Page
    {
        string constr = "Data Source=LAPTOPPHONGLINH;Initial Catalog=QUIZ;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (checkAccount() == true)
            {
                
                //Session["RoleID"] = checkRole();
                //if (checkRole() > 2) {
                //    Response.Redirect("GiaoDienQuanLy.aspx");
                //}
                //else
                //{
                //    Response.Redirect("Administrator.aspx");
                //}
                Response.Redirect("GiaoDienQuanLy.aspx");

            }
            else
            {
                Response.Write("Sai tên tài khoản hoặc mật khẩu");
            }
        }

        protected bool checkAccount()
        {
            int i = 0;
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("FindAcount", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenDangNhap", txtUserNameLogin.Text);
                    cmd.Parameters.AddWithValue("@MatKhau", txtPassLogin.Text);
                    int kq = (int)cmd.ExecuteScalar();
                    if (kq > 0)
                    {
                       // HttpContext.Current.Session.Add("User_ID", "Guest");
                        HttpContext.Current.Session["User_ID"] = txtUserNameLogin.Text;
                        return true;

                    }
                    else
                    {
                        i = 1;

                    }
                }
                if (i == 1)
                {
                    return false;
                }
                return true;

            }
        }
        protected int checkRole()
        {
            int roleID = 3;
            if (checkAccount() == true)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {

                    using (SqlCommand cmd = new SqlCommand("SelectQuyen", cnn))
                    {
                        cnn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenDangNhap", txtUserNameLogin.Text);
                        using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                        {
                            DataTable tb = new DataTable();
                            ad.Fill(tb);
                            string s = tb.Rows[0]["QuyenID"].ToString();
                            roleID = Int16.Parse(s) ;                     
                        }                     
                    }
                }
                
            }
            return roleID;
        }
    }
}
