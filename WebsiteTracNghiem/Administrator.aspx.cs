using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteTracNghiem
{
    public partial class Administrator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roleid = Session["RoleID"].ToString();
            int i = Int16.Parse(roleid);
            if (i > 2)
            {
                Response.Redirect("NoPermission.aspx");
            }
            lbusername.Text = Session["User_ID"].ToString();       
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("DangNhap.aspx");
        }
    }
}