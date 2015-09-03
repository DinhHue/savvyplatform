using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class ManageUnit : System.Web.UI.Page
    {
        DonViTinhDAO dv = new DonViTinhDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    Load();
            }

        }
        void Load()
        {
            DataTable dt = new DataTable();
            dt = dv.SelectAll();
            if (dt.Rows.Count > 0)
            {
                gvDS.DataSource = dt;
                gvDS.DataBind();
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string tendon = txtDonVi.Text;
            bool kq = dv.Insert(tendon);
            if (kq == true)
                Load();
            else
                Response.Write("<script>alert('Không thêm được !');</script>");
        }

        protected void gvDS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvDS.DataKeys[e.RowIndex].Value.ToString());
            bool kq= dv.Delete(id);
            if (kq == true)
                Load();
            else
                Response.Write("<script>alert('Không xoá được !');</script>");

        }
    }
}