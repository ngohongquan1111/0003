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
    public partial class SuaCauHoi : System.Web.UI.Page
    {
        string constr = "Data Source=LAPTOPPHONGLINH;Initial Catalog=QUIZ;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            lbidcauhoiedit.Text = Request.QueryString["id"];
            if (!Page.IsPostBack)
            {
                LoadCauHoi();
               
            }
           
        }
        protected void LoadCauHoi()
        {
            string Dapandung = "";
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("ShowCauHoiByID", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CauHoiID", Request.QueryString["id"]);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        lbMonhoc.Text = tb.Rows[0]["TenMonThi"].ToString();
                        tbcauhoi.Text= tb.Rows[0]["CauHoi"].ToString();
                        tbA.Text = tb.Rows[0]["A"].ToString();
                        tbB.Text= tb.Rows[0]["B"].ToString();
                        tbC.Text= tb.Rows[0]["C"].ToString();
                        tbD.Text= tb.Rows[0]["D"].ToString();
                        Dapandung= tb.Rows[0]["DapAnDung"].ToString();
                        if (Dapandung == "A")
                        {
                            rdA.Checked = true;
                        }else if (Dapandung == "B")
                        {
                            rdB.Checked = true;
                        }else if (Dapandung == "C")
                        {
                            rdC.Checked = true;
                        }
                        else
                        {
                            rdD.Checked = true;
                        }
                    }
                    cnn.Close();
                }
            }
        }
        protected void EditCauHoi()
        {
            string DapAnDung = "";
            if (rdA.Checked)
            {
                DapAnDung = "A";
            }else if (rdB.Checked)
            {
                DapAnDung = "B";
            }
            else if (rdC.Checked)
            {
                DapAnDung = "C";
            }
            else 
            {
                DapAnDung = "D";
            }
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                
                using (SqlCommand cmd = new SqlCommand("EditCauHoiByID", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CauHoiID", Request.QueryString["id"]);
                    cmd.Parameters.AddWithValue("@CauHoi",tbcauhoi.Text );
                    cmd.Parameters.AddWithValue("@A",tbA.Text );
                    cmd.Parameters.AddWithValue("@B",tbB.Text);
                    cmd.Parameters.AddWithValue("@C", tbC.Text);
                    cmd.Parameters.AddWithValue("@D", tbD.Text);
                    cmd.Parameters.AddWithValue("@DapAnDung", DapAnDung);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Write("Cập nhập câu hỏi thành công");
                    }
                    else
                    {
                        Response.Write("Thất bại");
                    }
 
                    cnn.Close();
                }
            }
        }
        protected void Sua_Onclick(object sender, EventArgs e)
        {
            EditCauHoi();
        }

        //protected void checkRadioBox()
        //{
        //    if (rdA.Checked==true)
        //    {
        //        rdB.Checked = false;
        //        rdC.Checked = false;
        //        rdD.Checked = false;
        //    }
        //    else if (rdB.Checked == true)
        //    {
        //        rdA.Checked = false;
        //        rdC.Checked = false;
        //        rdD.Checked = false;
        //    }
        //    else if (rdC.Checked == true)
        //    {
        //        rdA.Checked = false;
        //        rdB.Checked = false;
        //        rdD.Checked = false;
        //    }
        //    else if (rdD.Checked == true)
        //    {
        //        rdA.Checked = false;
        //        rdB.Checked = false;
        //        rdC.Checked = false;
        //    }
        //}

        protected void rdA_CheckedChanged(object sender, EventArgs e)
        {
            rdB.Checked = false;
            rdC.Checked = false;
            rdD.Checked = false;
        }

        protected void rdB_CheckedChanged(object sender, EventArgs e)
        {
            rdA.Checked = false;
            rdC.Checked = false;
            rdD.Checked = false;
        }

        protected void rdC_CheckedChanged(object sender, EventArgs e)
        {
            rdA.Checked = false;
            rdB.Checked = false;
            rdD.Checked = false;
        }

        protected void rdD_CheckedChanged(object sender, EventArgs e)
        {
            rdA.Checked = false;
            rdB.Checked = false;
            rdC.Checked = false;
        }
    }
}