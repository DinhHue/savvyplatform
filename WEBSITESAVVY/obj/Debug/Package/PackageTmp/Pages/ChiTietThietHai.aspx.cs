using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class ChiTietThietHai : System.Web.UI.Page
    {
        LinhVucTonThatDAO lv = new LinhVucTonThatDAO();
        ChiTietThietHaiDAO ctdao = new ChiTietThietHaiDAO();
        ChiTietThietHaiDTO ctdto;
        string mathamchieu;
        ClaimDAO cl = new ClaimDAO();
        //int malv1 = 0;
        //int malv2 = 0;
        SummaryDAO sdao = new SummaryDAO();
        TheLoaiSumDAO tlsumdao = new TheLoaiSumDAO();
         MenhGiaDAO mgdao = new MenhGiaDAO();
        SummarydetailDTO smddto = new SummarydetailDTO();
        SummaryDetailDAO smddao= new SummaryDetailDAO();
        int ms = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    if (Session["ThamChieu"] == null)
                    {
                        Response.Redirect("~/Pages/Home.aspx");
                    }
                    else
                    {
                        loadMenhGia();
                        loadTheLoaiSum();
                        string maclaim = Session["ThamChieu"].ToString();
                        lblThamChieu.Text = maclaim;
                        //lblMaSum.Text = maclaim;
                        int kt = smddao.KiemTraSummary(maclaim);
                        if (kt == 0)
                        {
                            lblThongBaoSumdetail.Visible = true;

                        }
                        else
                        {
                            lblThongBaoSumdetail.Visible = false;
                            loadAll(maclaim);
                            int masum = LayMaSummary(maclaim);
                            if (masum != 0)
                            {
                                lblMaSum.Text = masum.ToString();
                            }
                            else
                            {
                                ms = LayMaSumMoi(maclaim);
                                lblMaSum.Text = ms.ToString();
                            }

                        }
                    }
                }
            }
           #region Oldcode
		 //int ma = int.Parse(drDSLoaiThietHai.SelectedItem.Value.ToString());
            //string thamchieu = Session["ThamChieu"].ToString();
            //mathamchieu = cl.LayMaTheoTen(thamchieu);
            //if (!this.IsPostBack)
            //{
            //    DataTable dt = new DataTable();
            //    dt = ctdao.LayMaLinhVucTonThat(mathamchieu);
            //    int temp = 0;
            //    int temp1 = 0;
            //    if (dt.Rows.Count == 1)
            //    {
            //        DataRow dr = dt.Rows[0];
            //        temp = int.Parse(dr[0].ToString());
            //        if (temp == 2 || temp == 3)
            //        {
            //            loadDanhSachChiTiet2(mathamchieu, temp);
            //        }
            //        else
            //            loadDanhSachChiTiet1(mathamchieu, temp);
            //    }
            //    else
            //        if (dt.Rows.Count == 2)
            //        {
            //            DataRow dr1 = dt.Rows[0];
            //            DataRow dr2 = dt.Rows[1];
            //            temp = int.Parse(dr1[0].ToString());
            //            if (temp == 2 || temp == 3)
            //            {
            //                malv2 = temp;
            //                loadDanhSachChiTiet2(mathamchieu, malv2);
            //            }
            //            else
            //            {
            //                malv1 = temp;
            //                loadDanhSachChiTiet1(mathamchieu, malv1);
            //            }
            //            temp1 = int.Parse(dr2[0].ToString());
            //            if (temp1 == 2 || temp1 == 3)
            //            {
            //                malv2 = temp1;
            //                loadDanhSachChiTiet2(mathamchieu, malv2);
            //            }
            //            else
            //            {
            //                malv1 = temp1;
            //                loadDanhSachChiTiet1(mathamchieu, malv1);
            //            }

            //        }

            //    //if (ma == 2 || ma == 3)
            //    //    loadDanhSachChiTiet2(mathamchieu);
            //    //else
            //    //    loadDanhSachChiTiet1(mathamchieu);
            //    loadLinhVucTonThat();
            //    lblThamChieu.Text = thamchieu; 
	#endregion
            }
        void loadAll(string id)
        {
           // loadTheLoaiSum();
            loadSummaryBuilding(id);
            loadSummaryConstruction(id);
            loadSummaryLiability(id);
            loadSummaryMachinery(id);
            loadSummaryOther(id);
            loadSummaryStock(id);
            loadTotalSum(id);
        }
         void loadTheLoaiSum()
        {
            
            drDSLoaiThietHai.DataSource =tlsumdao.DanhSach();
            drDSLoaiThietHai.DataTextField = "TheLoai";
            drDSLoaiThietHai.DataValueField = "ID_TheLoaiSum";
            drDSLoaiThietHai.DataBind();
          
        }
     
        protected void loadSummaryBuilding(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachBuilding(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblbuilding.Visible = true;
                gvDanhMucBuilding.DataSource = dt;
                gvDanhMucBuilding.DataBind();
            }
        }
        protected void loadSummaryStock(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachStock(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblstock.Visible = true;
                gvDanhMucStock.DataSource = dt;
                gvDanhMucStock.DataBind();
            }
        }
        protected void loadSummaryMachinery(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachMachinery(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblmachinery.Visible = true;
                gvDanhMucMachinery.DataSource = dt;
                gvDanhMucMachinery.DataBind();
            }
        }
        protected void loadSummaryLiability(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachLiability(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblliability.Visible = true;
                gvDanhMucLiability.DataSource = dt;
                gvDanhMucLiability.DataBind();
            }
        }
        protected void loadSummaryConstruction(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachConstruction(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblconstruction.Visible = true;
                gvDanhMucConstruction.DataSource = dt;
                gvDanhMucConstruction.DataBind();
            }
        }
        protected void loadSummaryOther(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachOther(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblother.Visible = true;
                gvDanhMucOther.DataSource = dt;
                gvDanhMucOther.DataBind();
            }
        }
        void loadTotalSum(string id)
        { 
            DataTable dt= new DataTable();
            dt=smddao.loadTotalSum(id);
            if(dt.Rows.Count>0)
            {
                gvTotal.DataSource=dt;
                gvTotal.DataBind();
            }
        }
        protected void loadMenhGia()
        {
            if (!this.IsPostBack)
            {
                drMenhGia.DataSource = mgdao.DanhSach();
                drMenhGia.DataValueField = "ID_MenhGia";
                drMenhGia.DataTextField = "MenhGia";
                drMenhGia.DataBind();
            }
        }
        protected int LayMaSummary(string idclaim)
        {
            int ma = 0;
            ma = sdao.KiemTraMa(idclaim);
            return ma;
        }
        protected int LayMaSumMoi(string idclaim)
        {
            return sdao.LayMaSummaryMoi(idclaim);
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            string id = lblMaSum.Text ;
            smddto.MaSummary = int.Parse(lblMaSum.Text);
            smddto.MaTheLoai = int.Parse(drDSLoaiThietHai.SelectedItem.Value.ToString());
            string diengiai = txtDienGiai.Text;
            if (diengiai != "")
                smddto.TenHangMuc = diengiai;
            else
                smddto.TenHangMuc = "";
            int menhgia = int.Parse(drMenhGia.SelectedItem.Value.ToString());
            if (menhgia != 0)
                smddto.MaMenhGia = menhgia;
            else
                Response.Write("<script>alert('Chưa chọn mệnh giá !');</script>");
            string giatr = txtGiaTriKhieuNai.Text;
            if (giatr != "")
                smddto.GiaTriKhieuNai = float.Parse(giatr);
            else
                smddto.GiaTriKhieuNai = 0;
            string thiethai = txtThietHaiHopLy.Text;
            if (thiethai != "")
                smddto.ThietHaiHopLy = float.Parse(thiethai);
            else
                smddto.ThietHaiHopLy = 0;
            string soluong = txtSoLuong.Text;
            if (soluong != "")
                smddto.SoLuong = int.Parse(soluong);
            else
                smddto.SoLuong = 0;
            string dexuat = txtDeXuatTinhToan.Text;
            if (dexuat != "")
                smddto.DeXuatTinhToan = float.Parse(dexuat);
            else
                smddto.DeXuatTinhToan = 0;
            string ghichu = txtGhiChu.Text;
            if (ghichu != "")
                smddto.GhiChu = ghichu;
            else
                smddto.GhiChu = "";

            bool t = smddao.ThemSummaryDettailMoi(smddto);
            if (t == true)
            {
                //Response.Write("<script>alert('Đã thêm mới !');</script> ");
                Response.Redirect(Request.Url.PathAndQuery, true);
                loadAll(id);
            }
        }
         protected void gvDanhMucBuilding_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucBuilding.EditIndex = -1;
            string id = Session["ThamChieu"].ToString();
            loadSummaryBuilding(id);
        }

        protected void gvDanhMucBuilding_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucBuilding.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucBuilding.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucBuilding.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
            //TextBox tenhangmuc = row.Cells[1].Controls[0] as TextBox;
            //TextBox giatrikhieunai = row.Cells[2].Controls[0] as TextBox;
            //TextBox soluong = row.Cells[3].Controls[0] as TextBox;
            //TextBox thiethaihoply = row.Cells[4].Controls[0] as TextBox;
            //TextBox dexuattinhtoan = row.Cells[5].Controls[0] as TextBox;
            //TextBox ghichu = row.Cells[6].Controls[0] as TextBox;
            //SummarydetailDTO smddt = new SummarydetailDTO();
            //int masum = LayMaSummary(id);
            //smddt.MaSummary = masum;
            //smddt.MaSummaryDetail = int.Parse(gvDanhMucBuilding.DataKeys[e.RowIndex].Value.ToString());
            //smddt.TenHangMuc = tenhangmuc.Text;
            //smddt.GiaTriKhieuNai = float.Parse(giatrikhieunai.Text);
            //smddt.ThietHaiHopLy = float.Parse(thiethaihoply.Text);
            //smddt.SoLuong = int.Parse(soluong.Text);
            //smddt.DeXuatTinhToan = float.Parse(dexuattinhtoan.Text);
            //smddt.GhiChu = ghichu.Text;
            //smddao.CapNhatSummaryDetail(smddt);
            //e.Cancel = true;
            //gvDanhMucBuilding.EditIndex = -1;
            //loadAll(id);
        }
        bool CapNhatSum(GridViewRow row, int idsumd)
        {
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            TextBox tenhangmuc = row.Cells[1].Controls[0] as TextBox;
            TextBox giatrikhieunai = row.Cells[2].Controls[0] as TextBox;
            TextBox soluong = row.Cells[3].Controls[0] as TextBox;
            TextBox thiethaihoply = row.Cells[4].Controls[0] as TextBox;
            TextBox dexuattinhtoan = row.Cells[5].Controls[0] as TextBox;
            TextBox ghichu = row.Cells[7].Controls[0] as TextBox;
            SummarydetailDTO smddt = new SummarydetailDTO();
            int masum = LayMaSummary(id);
            smddt.MaSummary = masum;
            smddt.MaSummaryDetail = idsumd;
            smddt.TenHangMuc = tenhangmuc.Text;
            smddt.GiaTriKhieuNai = float.Parse(giatrikhieunai.Text);
            smddt.ThietHaiHopLy = float.Parse(thiethaihoply.Text);
            smddt.SoLuong = int.Parse(soluong.Text);
            smddt.DeXuatTinhToan = float.Parse(dexuattinhtoan.Text);
            smddt.GhiChu = ghichu.Text;
            return smddao.CapNhatSummaryDetail(smddt);

        }
        protected void gvDanhMucBuilding_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucBuilding.EditIndex = e.NewEditIndex;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucMachinery.EditIndex = -1;
            //string id = Request.QueryString["Reference"];
            string id = Session["ThamChieu"].ToString();
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucMachinery.EditIndex = e.NewEditIndex;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucMachinery.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucMachinery.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucMachinery.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucStock_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Request.QueryString["Reference"];
           // string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucStock.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucStock.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucStock.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucStock_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucStock.EditIndex = e.NewEditIndex;
           // string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucStock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucStock.EditIndex = -1;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucConstruction.EditIndex = -1;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucConstruction.EditIndex = e.NewEditIndex;
            //string id = Request.QueryString["Reference"];
            string id = Session["ThamChieu"].ToString();
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Request.QueryString["Reference"];
           // string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucConstruction.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucConstruction.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucConstruction.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucLiability_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucLiability.EditIndex = -1;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucLiability_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucLiability.EditIndex = e.NewEditIndex;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucLiability_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucLiability    .Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucLiability.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucLiability.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucOther_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucOther.EditIndex = -1;
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            loadAll(id);
        }

        protected void gvDanhMucOther_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucOther.EditIndex = e.NewEditIndex;
            //string id = Request.QueryString["Reference"];
            string id = Session["ThamChieu"].ToString();
            loadAll(id);
        }

        protected void gvDanhMucOther_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string id = Request.QueryString["Reference"];
            //string id = Session["ThamChieu"].ToString();
            string id = lblThamChieu.Text;
            GridViewRow row = gvDanhMucOther.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucOther.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucOther.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }
        double qtyb = 0;
        double claimAb = 0;
        double agreeAb = 0;
        double proposedAdjusb = 0;
        protected void gvDanhMucBuilding_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //double qty = 0;
            //double claimA = 0;
            //double agreeA = 0;
            //double proposedAdjus = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyb.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyb);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAb.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAb);
                    e.Row.Cells[4].Text = agreeAb.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAb);
                    e.Row.Cells[5].Text = proposedAdjusb.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusb);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtym = 0;
        double claimAm = 0;
        double agreeAm = 0;
        double proposedAdjusm = 0;
        protected void gvDanhMucMachinery_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtym += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtym.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtym);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAm.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAm);
                    e.Row.Cells[4].Text = agreeAm.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAm);
                    e.Row.Cells[5].Text = proposedAdjusm.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusm);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtys = 0;
        double claimAs = 0;
        double agreeAs = 0;
        double proposedAdjuss = 0;
        protected void gvDanhMucStock_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtys += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAs += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAs += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjuss += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtys.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtys);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAs.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAs);
                    e.Row.Cells[4].Text = agreeAs.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAs);
                    e.Row.Cells[5].Text = proposedAdjuss.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjuss);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtyc = 0;
        double claimAc = 0;
        double agreeAc = 0;
        double proposedAdjusc = 0;
        protected void gvDanhMucConstruction_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyc.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyc);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAs.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAc);
                    e.Row.Cells[4].Text = agreeAc.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAc);
                    e.Row.Cells[5].Text = proposedAdjusc.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusc);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtyl = 0;
        double claimAl = 0;
        double agreeAl = 0;
        double proposedAdjusl = 0;
        protected void gvDanhMucLiability_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyl.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyl);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAl.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAl);
                    e.Row.Cells[4].Text = agreeAl.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAl);
                    e.Row.Cells[5].Text = proposedAdjusl.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusl);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtyo = 0;
        double claimAo = 0;
        double agreeAo = 0;
        double proposedAdjuso = 0;
        protected void gvDanhMucOther_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjuso += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyo.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyo);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAo.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAo);
                    e.Row.Cells[4].Text = agreeAo.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAo);
                    e.Row.Cells[5].Text = proposedAdjuso.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjuso);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtyt = 0;
        double claimAt = 0;
        double agreeAt = 0;
        double proposedAdjust = 0;
        protected void gvTotal_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjust += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[1].Text = qtyt.ToString();
                    e.Row.Cells[1].Text = string.Format("{0:###,###}", qtyt);
                    e.Row.Cells[0].HorizontalAlign = e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[2].Text = claimAt.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", claimAt);
                    e.Row.Cells[3].Text = agreeAt.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", agreeAt);
                    e.Row.Cells[4].Text = proposedAdjust.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", proposedAdjust);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }

        protected void btnSaveSummarydetail_Click(object sender, EventArgs e)
        {

        }
        
    }
#region Oldcode
		      
    //    void loadLinhVucTonThat()
    //    {
    //        drDSLoaiThietHai.DataSource = lv.DanhSachLinhVuc();
    //        drDSLoaiThietHai.DataValueField = "ID_LinhVucTonThat";
    //        drDSLoaiThietHai.DataTextField = "TenLinhVuc";
    //        drDSLoaiThietHai.DataBind();
    //    }
    //    void loadDanhSachChiTiet1(string maclaim, int malv)
    //    { 
    //        DataTable dt= new DataTable();
    //        dt = ctdao.DanhSachChiTietThietHai1(maclaim, malv);
    //        gvDanhSachChiTietThietHai1.DataSource = dt;
    //        gvDanhSachChiTietThietHai1.DataBind();
                      
    //    }
    //    void loadDanhSachChiTiet2(string maclaim, int malv)
    //    {
    //        DataTable dt = new DataTable();
    //        dt = ctdao.DanhSachChiTietThietHai2(maclaim,malv);
    //        gvDanhSachChiTietThietHai2.DataSource = dt;
    //        gvDanhSachChiTietThietHai2.DataBind();
    //    }
    //    protected void drDSLoaiThietHai_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        int ma = int.Parse(drDSLoaiThietHai.SelectedItem.Value.ToString());
    //        if (ma == 3|| ma==5)
    //        {
    //            lblDienGiai.Visible = true;
    //            txtDienGiai.Visible = true;
    //            lblGiaTriKhieuNai.Visible = true;
    //            txtGiaTriKhieuNai.Visible = true;
    //            lblThietHaiHopLy.Visible = true;
    //            txtThietHaiHopLy.Visible = true;
    //            lblDeXuatTinhToan.Visible = true;
    //            txtDeXuatTinhToan.Visible = true;
    //            lblGhiChu.Visible = true;
    //            txtGhiChu.Visible = true;
    //            btnCapNhat.Visible = true;
    //            lblChiPhiKhoiPhuc.Visible = false;
    //            txtChiPhiKhoiPhuc.Visible = false;
    //        }
    //        else
    //        {
    //            lblDienGiai.Visible = true;
    //            txtDienGiai.Visible = true;
    //            lblGiaTriKhieuNai.Visible = true;
    //            txtGiaTriKhieuNai.Visible = true;
    //            lblChiPhiKhoiPhuc.Visible = true;
    //            txtChiPhiKhoiPhuc.Visible = true;
    //            lblDeXuatTinhToan.Visible = true;
    //            txtDeXuatTinhToan.Visible = true;
    //            lblGhiChu.Visible = true;
    //            txtGhiChu.Visible = true;
    //            btnCapNhat.Visible = true;
    //            lblThietHaiHopLy.Visible = false;
    //            txtThietHaiHopLy.Visible = false;
    //        }
                
    //    }
        
    //    protected void btnCapNhat_Click(object sender, EventArgs e)
    //    {
    //        //if (!this.IsPostBack)
    //        //{
    //            ctdto = new ChiTietThietHaiDTO();
    //            int ma = int.Parse(drDSLoaiThietHai.SelectedItem.Value.ToString());
    //            //int stt=ctdao.SoThuTu(mathamchieu)+1;
    //            if (ma == 3 || ma == 5)
    //            {
    //                ctdto.MaClaim = mathamchieu;
    //                //ctdto.Stt = stt;
    //                ctdto.DienGiai = txtDienGiai.Text;
    //                ctdto.GiaTriKhieuNai = float.Parse(txtGiaTriKhieuNai.Text);
    //                ctdto.ThietHaiHopLy = float.Parse(txtThietHaiHopLy.Text);
    //                ctdto.DeXuatTinhToan = float.Parse(txtDeXuatTinhToan.Text);
    //                ctdto.GhiChu = txtGhiChu.Text;
    //                bool kq = ctdao.ThemChiTietThietHai2(ctdto);
    //                if (kq == true)
    //                    loadDanhSachChiTiet2(mathamchieu,ma);
    //            }
    //            else
    //            {
    //                ctdto.MaClaim = mathamchieu;
    //                //ctdto.Stt = stt;
    //                ctdto.DienGiai = txtDienGiai.Text;
    //                ctdto.GiaTriKhieuNai = float.Parse(txtGiaTriKhieuNai.Text);
    //                ctdto.ChiPhiKhoiPhuc = float.Parse(txtChiPhiKhoiPhuc.Text);
    //                ctdto.DeXuatTinhToan = float.Parse(txtDeXuatTinhToan.Text);
    //                ctdto.GhiChu = txtGhiChu.Text;
    //                bool kq = ctdao.ThemChiTietThietHai2(ctdto);
    //                if (kq == true)
    //                    loadDanhSachChiTiet1(mathamchieu,ma);
    //            }
    //        //}
    //    }

    //    protected void gvDanhSachChiTietThietHai1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //    {
    //        gvDanhSachChiTietThietHai1.PageIndex = e.NewPageIndex;
    //        loadDanhSachChiTiet1(mathamchieu, malv1);
    //    }

    //    protected void gvDanhSachChiTietThietHai2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //    {
    //        gvDanhSachChiTietThietHai2.PageIndex = e.NewPageIndex;
    //        loadDanhSachChiTiet2(mathamchieu, malv2);
    //    }
    //} 
	#endregion
}