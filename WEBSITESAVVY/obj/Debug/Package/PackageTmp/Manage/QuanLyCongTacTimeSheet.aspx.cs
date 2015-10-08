using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyCongTacTimeSheet : System.Web.UI.Page
    {
        CongTacTimeSheetDAO tsdao = new CongTacTimeSheetDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    loadGR();
                    lblThongBao.Text = "";
                }
            }
        }
        void loadGR()
        {
            grDSCongTacTS.DataSource = tsdao.DanhSachCongTac();
            grDSCongTacTS.DataBind();
        }
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {

        }
        private void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ma = txtMa.Text;
            string type = ma+"_"+txtType.Text;
            float rate = float.Parse(txtRate.Text);
            if (txtMa.Text == "" || txtType.Text == "")
                lblThongBao.Text = "Phải nhập Type timsesheet mới!";
            else
            {
                bool kq = tsdao.ThemMoi(ma, type,rate);
                if (kq == true)
                {
                    loadGR();
                    ClearInputs(Page.Controls);                   
                }
                else
                    lblThongBao.Text = "Fail!";
            }
        }
     

        protected void grDSCongTacTS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSCongTacTS.PageIndex = e.NewPageIndex;
            loadGR();
        }

        protected void grDSCongTacTS_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSCongTacTS.EditIndex = -1;
            loadGR();
        }

        protected void grDSCongTacTS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ma = grDSCongTacTS.DataKeys[e.RowIndex].Value.ToString();
            bool kq=tsdao.Xoa(ma);
            if (kq == true)
                loadGR();
        }

        protected void grDSCongTacTS_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDSCongTacTS.Rows[e.RowIndex];
            TextBox textma = row.Cells[1].Controls[0] as TextBox;
            TextBox texttype = row.Cells[2].Controls[0] as TextBox;
            TextBox textRate = row.Cells[3].Controls[0] as TextBox;
            string maold = grDSCongTacTS.DataKeys[e.RowIndex].Value.ToString();
            string manew = textma.Text;
            string type = texttype.Text;
            float rate = float.Parse(textRate.Text);
            bool kq = tsdao.CapNhat(maold, manew, type,rate);
            if (kq == true)
            {
                e.Cancel = true;
                grDSCongTacTS.EditIndex = -1;
                loadGR();
            }
            else
                lblThongBao.Text = "Cập nhật lỗi!";
        }

        protected void grDSCongTacTS_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSCongTacTS.EditIndex = e.NewEditIndex;
            loadGR();
        }

    }
}