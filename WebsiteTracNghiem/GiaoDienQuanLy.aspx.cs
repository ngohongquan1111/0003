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
    public partial class GiaoDienQuanLy : System.Web.UI.Page
    {
        string constr = "Data Source=LAPTOPPHONGLINH;Initial Catalog=QUIZ;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            string ss = Session["User_ID"].ToString();
            if (ss == "Guest")
            {
                Response.Redirect("NoPermission.aspx");
            }
            lbl1.Text = Session["User_ID"].ToString();
            lbNguoiTao.Text = Session["User_ID"].ToString();
            lbNgayTao.Text = DateTime.Now.ToString();
            if (!Page.IsPostBack)
            {

                loadDropDownList();
                loadDropDownList2();
               loadDSbode();


            }



        }

        protected void loadDropDownList()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select*from MonThi", cnn))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        ddlBoMon.DataSource = ddlChonMon.DataSource = tb;
                        ddlBoMon.DataTextField = ddlChonMon.DataTextField = "TenMonThi";
                        ddlBoMon.DataValueField = ddlChonMon.DataValueField = "MonThiID";
                        ddlBoMon.DataBind();
                       
                    }
                }
            }


        }

        protected void loadDropDownList2()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select*from MonThi", cnn))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        ddlChonMon.DataSource = tb;
                        ddlChonMon.DataTextField = "TenMonThi";
                        ddlChonMon.DataValueField = "MonThiID";
                        ddlChonMon.DataBind();
                       ddlChonMon.Items.Insert(0, new ListItem("Tất cả", "All"));
                    }
                }
            }


        }

        protected void btnTaoBoDe_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("InsertBoDe", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenDangNhap", Session["User_ID"].ToString());
                    cmd.Parameters.AddWithValue("@MonThiID", ddlBoMon.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@NgayTao", DateTime.Now.ToString());
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Write("Tạo bộ đề thành công");
                    }
                    else
                    {
                        Response.Write("Tạo bộ đề thất bại");
                    }

                }
            }
            Response.Redirect("ThemCauHoi.aspx");

        }


        protected void loadDSbode()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("FindBoDeByUser2", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenDangNhap", Session["User_ID"].ToString());
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        blDSBoDe.DataSource = tb;
                        blDSBoDe.DataBind();
                    }
                    cnn.Close();
                }
            }
        }
           
      

        protected void ddlChonMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                if (ddlChonMon.SelectedIndex > 0)
                {
                    using (SqlCommand cmd = new SqlCommand("FindBoDeByUser", cnn))
                    {
                        cnn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenDangNhap", Session["User_ID"].ToString());
                        cmd.Parameters.AddWithValue("@MonThiID", ddlChonMon.SelectedValue);
                        using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                        {
                            DataTable tb = new DataTable();
                            ad.Fill(tb);
                            blDSBoDe.DataSource = tb;
                            blDSBoDe.DataBind();
                            
                        }
                        cnn.Close();
                    }

                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("FindBoDeByUser2", cnn))
                    {
                        cnn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenDangNhap", Session["User_ID"].ToString());
                        using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                        {
                            DataTable tb = new DataTable();
                            ad.Fill(tb);
                            blDSBoDe.DataSource = tb;
                            blDSBoDe.DataBind();
                        }
                        cnn.Close();
                    }
                }
            }

        }

        protected void DatalistCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName== "btnChiTiet_Click")
            {
                Response.Redirect("QuanLyCauHoi.aspx?id="+e.CommandArgument.ToString());
            }
        }

        protected void btLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("DangNhap.aspx");
        }
    }
}