using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteTracNghiem
{
    public partial class ThemCauHoi : System.Web.UI.Page
    {        
        string constr = "Data Source=LAPTOPPHONGLINH;Initial Catalog=QUIZ;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            lbNguoiTao.Text = Session["User_ID"].ToString();
            GetBoDe();
            showDatalist();
        }

        protected void GetBoDe()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("GetBoDeID", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenDangNhap", Session["User_ID"].ToString());
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.Read())
                        {
                            lbMaDe.Text = rd["BoDeID"].ToString();
                            lbNgayTao.Text = rd["NgayTao"].ToString();
                            lbBoMon.Text = rd["TenMonThi"].ToString();
                            txtBoMonID.Text = rd["MonThiID"].ToString();

                        }

                    }
                    cnn.Close();
                }
            }
        }
      
        private void InsertCauHoi()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("InsertCauHoi", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MonThiID", txtBoMonID.Text);
                    cmd.Parameters.AddWithValue("@BoDeID", lbMaDe.Text);
                    cmd.Parameters.AddWithValue("@CauHoi", txtCauHoi.Text);
                    cmd.Parameters.AddWithValue("@A", txtA.Text);
                    cmd.Parameters.AddWithValue("@B", txtB.Text);
                    cmd.Parameters.AddWithValue("@C", txtC.Text);
                    cmd.Parameters.AddWithValue("@D",txtD.Text);
                    cmd.Parameters.AddWithValue("@DapAnDung",txtDapAnDung.Text);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        txtCauHoi.Text=txtA.Text = txtB.Text = txtC.Text = txtD.Text =txtDapAnDung.Text= "";
                        Response.Write("Thêm câu hỏi thành công");
                    }
                    else
                    {
                        Response.Write("Thêm câu hỏi thất bại");
                    }
                    cnn.Close();
                }
            }
        }


        protected void btnAccept_Click(object sender, EventArgs e)
        {
            InsertCauHoi();
            showDatalist();
        }

        protected void showDatalist()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("FindCauHoiByMaDe", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaDeID", lbMaDe.Text);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        DL1.DataSource = tb;
                        DL1.DataBind();
                        //ddl1.Items.Insert(0, new ListItem("Tất cả", "All"));
                    }
                  
                    

                    }
                    cnn.Close();
                }
            }
        }
    }
