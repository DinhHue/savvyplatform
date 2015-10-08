using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;

namespace WEBSITESAVVY.Manage
{
    public partial class QuanlyMeMo : System.Web.UI.Page
    {
        QuiTrinhDAO qtdao = new QuiTrinhDAO();
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
            gvQuiTrinh.DataSource = qtdao.DSQuiTrinh();
            gvQuiTrinh.DataBind();
        }
        protected void gvQuiTrinh_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvQuiTrinh.DataKeys[e.RowIndex].Value.ToString());
            qtdao.XoaQuiTrinh(ma);
            Load();
        }

        protected void gvQuiTrinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvQuiTrinh.SelectedRow;
            if (row != null)
            {
                //string temp = row.Cells[0].Text;
                int ID =int.Parse(row.Cells[0].Text);
                
                Session["IDQT"] = ID;
               
                Response.Redirect("~/Manage/EditMemos.aspx?ID="+ID);
            }
            else
                Response.Write("<script> alert('Chưa có trong dữ liệu!');</script>");
        }
    }
}