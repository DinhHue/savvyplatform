using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
//using System.Configuration;
//using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.IO;
namespace WEBSITESAVVY.Pages
{
    public partial class docsrequestn : System.Web.UI.Page
    {
        static string ClaimID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    loadTypeDR();
                    gvDRUpdate.Visible = false;
                    gvDRList.Visible = true;
                    btnView.Visible = false;
                    if (Session["ThamChieu"] != null)
                    {
                        ClaimID = Session["ThamChieu"].ToString();
                        loadLoaiDR(ClaimID);
                        loadTypeDR();
                        int ma = int.Parse(drTypeDR.SelectedItem.Value.ToString());
                        loadItem(ma);
                    }
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        LoaiDRDAO ldr = new LoaiDRDAO();
        DRDAO dr = new DRDAO();
        ItemDRDAO i = new ItemDRDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void loadTypeDR()
        {
            drTypeDR.DataSource = ldr.DanhSachLoai();
            drTypeDR.DataTextField = "TenLoai";
            drTypeDR.DataValueField = "ID_LoaiDR";
            drTypeDR.DataBind();
        }
        protected void loadItem(int maloai)
        {
            drItems.DataSource = i.DSItem(maloai);
            drItems.DataTextField = "NameItem";
            drItems.DataValueField = "ID_Item";
            drItems.DataBind();
        }
        protected void loadLoaiDR(string idclaim)
        {
            gvDRList.DataSource = ldr.DanhSachLoaiClaim(idclaim);
            gvDRList.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            DRDTO drn = new DRDTO();
            drn.MaClaim = ClaimID.ToString();
            drn.MaLoaiDR = int.Parse(drTypeDR.SelectedItem.Value.ToString());
            drn.MaItem = int.Parse(drItems.SelectedItem.Value.ToString());
            string tendr = txtItem.Text;
            if (tendr != "")
            {
                drn.TenDR = tendr;
                bool ins = dr.Insert(drn);
                if (ins == true)
                {
                    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                    string noidung = gdv.LayTenTheoMa(maGDV) + " created item docsrequest of case " + ClaimID.ToString() + ".";
                    SaveLogTracking(maGDV, noidung, ClaimID.ToString());
                    txtItem.Text = "";
                    loadLoaiDR(ClaimID);
                    gvDRUpdate.Visible = false;
                    gvDRList.Visible = true;
                }
            }
            else
                Response.Write("<script> alert('Enter item document request!');</script>");
        }
        void SaveLogTracking(int maGDV, string noidung, string maclaim)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = maGDV;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = maclaim;
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
        protected String getRoman(int number)
        {
            String[] riman = { "M", "XM", "CM", "D", "XD", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
            int[] arab = { 1000, 990, 900, 500, 490, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
            StringBuilder result = new StringBuilder();
            int i = 0;
            while (number > 0 || arab.Length == (i - 1))
            {
                while ((number - arab[i]) >= 0)
                {
                    number -= arab[i];
                    result.Append(riman[i]);
                }
                i++;
            }

            return result.ToString();
        }
        protected void gvDRList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblmaLoaiDR = (Label)e.Row.FindControl("lblmaLoaiDR");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = getRoman(e.Row.RowIndex + 1);

                string maloaiDR = lblmaLoaiDR.Text;
                DataTable dt = dr.ItemlistDR(ClaimID, int.Parse(maloaiDR));
                Repeater repeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                repeaterChild.DataSource = dt;
                repeaterChild.DataBind();
            }
        }
        protected void gvDRList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No.";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "ITEMS DOCS / HẠNG MỤC HỒ SƠ";
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "STATUS / TÌNH TRẠNG";
                HeaderRow.Cells.Add(HeaderCell);

                gvDRList.Controls[0].Controls.AddAt(0, HeaderRow);


                HeaderRow.Attributes.Add("class", "header");
            }
        }
        void LoadDRUpdate(string id)
        {
            gvDRUpdate.DataSource = dr.ItemListUpdate(id);
            gvDRUpdate.DataBind();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            LoadDRUpdate(ClaimID);
            gvDRUpdate.Visible = true;
            gvDRList.Visible = false;
            btnView.Visible = true;
            btnUpdate.Visible = false;
        }

        protected void gvDRUpdate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDRUpdate.EditIndex = e.NewEditIndex;
            LoadDRUpdate(ClaimID);
            gvDRUpdate.Visible = true;
            gvDRList.Visible = false;
        }

        protected void gvDRUpdate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDRUpdate.EditIndex = -1;
            LoadDRUpdate(ClaimID);
            gvDRUpdate.Visible = true;
            gvDRList.Visible = false;
        }

        protected void gvDRUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDRUpdate.Rows[e.RowIndex];
            TextBox txttendr = row.Cells[2].Controls[0] as TextBox;
            TextBox txttinhtrang = row.Cells[3].Controls[0] as TextBox;
            TextBox txtngay = (TextBox)row.FindControl("txtNgay");
            DRDTO drdto = new DRDTO();
            drdto.MaDR = int.Parse(gvDRUpdate.DataKeys[e.RowIndex].Value.ToString());
            drdto.TenDR = txttendr.Text;
            drdto.TinhTrang = txttinhtrang.Text;
            string ngaynhan=txtngay.Text;
            if (ngaynhan != "")
                drdto.NgayNhan = DateTime.Parse(txtngay.Text);
            else
                Response.Write("<script>alert('Enter date received!');</script>");
            bool up = dr.UpdateDocsRequest(drdto);
            if (up == true)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited item docsrequest of case " + ClaimID.ToString() + ".";
                SaveLogTracking(maGDV, noidung, ClaimID.ToString());
                e.Cancel = true;
                gvDRUpdate.EditIndex = -1;
                loadLoaiDR(ClaimID);
                LoadDRUpdate(ClaimID);
                gvDRUpdate.Visible = true;
                gvDRList.Visible = false;
            }
            else
                Response.Write("<script>alert('Update failed!');</script>");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            btnView.Visible = false;
            gvDRUpdate.Visible = false;
            gvDRList.Visible = true;
            btnUpdate.Visible = true;
        }

        protected void drTypeDR_SelectedIndexChanged(object sender, EventArgs e)
        {
            //loadTypeDR();
            int ma = int.Parse(drTypeDR.SelectedItem.Value.ToString());
            if (ma != 0)
            {
                drItems.DataSource = i.DSItem(ma);
                drItems.DataTextField = "NameItem";
                drItems.DataValueField = "ID_Item";
                drItems.DataBind();
            }
        }
    }
}