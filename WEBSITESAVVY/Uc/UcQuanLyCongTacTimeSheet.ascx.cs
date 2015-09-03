using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Uc
{
    public partial class UcQuanLyCongTacTimeSheet : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                lblThongBao.Text = "";
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                string ma = txtMa.Text;
                string congtac = ma + "/" + txtCongTac.Text;
                CongTacTimeSheetDAO ct = new CongTacTimeSheetDAO();
                bool kq = ct.KiemTraMa(ma);
                if (kq == false)
                {
                    bool them= ct.ThemMoi(ma, congtac,0);
                    if (them == true)
                    {
                        lblThongBao.Text = "Thêm thành công!";
                        txtMa.Text = "";
                        txtCongTac.Text = "";
                    }
                    else
                        lblThongBao.Text = "Fail!";
                }
                else
                    lblThongBao.Text = "Mã đã tồn tại.";
            }
            catch (Exception ex)
            { lblThongBao.Text = ex.Message; }
        }
    }
}