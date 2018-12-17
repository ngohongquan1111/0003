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
    public partial class QuanLyCauHoi : System.Web.UI.Page
    {
        string constr = "Data Source=LAPTOPPHONGLINH;Initial Catalog=QUIZ;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                LoadCauHoi();
            }
            }
        protected void LoadCauHoi()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("ShowCauHoiByMaDe", cnn))
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BoDeID", Request.QueryString["id"]);
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        DataTable tb = new DataTable();
                        ad.Fill(tb);
                        dlCauHoi.DataSource = tb;
                        dlCauHoi.DataBind();
                    }
                    cnn.Close();
                }
            }
        }

        protected void dlCauHoiCommand(object source, DataListCommandEventArgs e)
        {
            //TextBox tb = (TextBox)e.Item.FindControl("tb1");
            //if (tb != null)
            //{
            //    tb.Text = "";
            //}
            if(e.CommandName== "btnSua_Click")
            {
                Response.Redirect("SuaCauHoi.aspx?id="+e.CommandArgument.ToString());
            }
        }
    }
}