using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.Util;
namespace WEBSITESAVVY.Pages
{
    public partial class AdjustSummary : System.Web.UI.Page
    {
        static string mClaimID = "";
        //LossListDAO ld = new LossListDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];


            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    string id = Request.Cookies["MaGDV"].Value;

                    BindGrid(mClaimID);

                }
            }
        }

        protected void btnNewType_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeItemWorkSheet.aspx");
        }

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewItemWorkSheet.aspx");
        }


        protected void BindGrid(String claimID)
        {
            DataTable dt = LoaiHangMucDAO.GetListInSummary(claimID);
            gvLoaiHangMucDetails.DataSource = dt;
            gvLoaiHangMucDetails.DataBind();

        }

        protected void gvgvLoaiHangMucDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblLoaiHangMucID = (Label)e.Row.FindControl("lblLoaiHangMucID");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = SAVVYUtil.getRoman(e.Row.RowIndex + 1);

                string strLoaiHangMucID = lblLoaiHangMucID.Text;
                DataTable dt = SummaryDAO.SelectSummaryDetail(mClaimID, int.Parse(strLoaiHangMucID));

                float SoLuongC = getSumColumn( dt, "SoLuongC");
                if (SoLuongC != -1)
                    ((Label)e.Row.FindControl("lblSoLuongC")).Text = SoLuongC.ToString();

                float ThanhTienC = getSumColumn(dt, "ThanhTienC");
                if(ThanhTienC != -1)
                    ((Label)e.Row.FindControl("lblThanhTienC")).Text = ThanhTienC.ToString("#,##0");

                Repeater RepeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                RepeaterChild.DataSource = dt;
                RepeaterChild.DataBind();
            }
        }


        private float getSumColumn(DataTable dt, String column)
        {
            try
            {
                float S = 0;
                foreach (DataRow row in dt.Rows) // Loop over the rows.
                {
                    S += float.Parse(row[column].ToString());
                }
                return S;
            }catch(Exception ex)
            {
                return -1;
            }
        }


        protected void repeaterChild_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlMenhGia = (DropDownList)e.Item.FindControl("ddlMenhGia");
                MenhGiaDAO mgdao = new MenhGiaDAO();
                ddlMenhGia.DataSource = mgdao.DanhSach();
                ddlMenhGia.DataTextField = "MenhGia";
                ddlMenhGia.DataValueField= "ID_MenhGia";
                //ddlMenhGia.SelectedValue = ((HiddenField)e.Item.FindControl("ID_MenhGia")).ToString();
                ddlMenhGia.DataBind();

                DropDownList ddlDonVi = (DropDownList)e.Item.FindControl("ddlDonVi");
                DonViTinhDAO dvtinhDao = new DonViTinhDAO();
                ddlDonVi.DataSource = dvtinhDao.SelectAll();
                ddlDonVi.DataTextField = "TenDonVi";
                ddlDonVi.DataValueField = "ID_DonViTinh";
                //ddlDonVi.SelectedValue = ((HiddenField)e.Item.FindControl("ID_DonViTinh")).ToString();
                ddlDonVi.DataBind();
            }
        }

        



        protected void gvLoaiHangMucDetails_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //img remove column
                String img = "<img class='imgRemove [classEdit]' src='../Content/themes/icons/edit_remove.png' />";
				String imgAdd = "<img class='imgAdd [classEdit]' src='../Content/themes/icons/edit_add.png' />";
                //24 column
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No.<br/>" + imgAdd;
                HeaderCell.Width = 30;
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "DESCRIPTION/MANAGED ITEMS<br/> (Diễn giải/Chi tiết hạng mục tốn thất)";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);


                //group grSummary
                HeaderCell = new TableCell();
                HeaderCell.Text = "Qty<br/>(SL)";
                //HeaderCell.CssClass = "grSummary";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.Text = "Unit.<br/>(ĐV)" + img.Replace("[classEdit]", "fieldUnitRemove");
                HeaderCell.CssClass = "fieldUnit";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.Text = "Cur.<br/>(ĐVT)" + img.Replace("[classEdit]", "fieldCurRemove");
                HeaderCell.CssClass = "fieldCur";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Claim<br/>(Khiếu nại)" + img.Replace("[classEdit]", "grClaimRemove");
				HeaderCell.CssClass = "grClaim";
                HeaderCell.ColumnSpan = 3;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Available supporting Documents<br/>(Hồ sơ/ Chứng từ đã thu nhập)" + img.Replace("[classEdit]", "grSupportRemove"); ;
                HeaderCell.CssClass = "grSupport";
				HeaderCell.ColumnSpan = 7;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Reasonable <br/>(Tính toán hợp lý)" + img.Replace("[classEdit]", "grReasonableRemove"); 
                HeaderCell.CssClass = "grReasonable";
				HeaderCell.ColumnSpan = 3;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "%ACV <br/>(%GT quy đổi)" + img.Replace("[classEdit]", "fieldGiaTriQuyDoiRemove"); 
                HeaderCell.CssClass = "fieldGiaTriQuyDoi";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sum insured <br/>(Số tiền bảo hiểm)" + img.Replace("[classEdit]", "fieldSoTienBaoHiemRemove");
                HeaderCell.CssClass = "fieldSoTienBaoHiem";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "V.A.R <br/>(gt chịu rủi ro)" + img.Replace("[classEdit]", "fieldGiaTriChiuRuiRoRemove");
                HeaderCell.CssClass = "fieldGiaTriChiuRuiRo";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "%Avg <br/>(tỉ lệ BT)" + img.Replace("[classEdit]", "fieldTileBTRemove");
                HeaderCell.CssClass = "fieldTileBT";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Proposed Settlement<br/>(Đề xuất tínht toán)" + img.Replace("[classEdit]", "fieldDeXuatTinhToanRemove");
                HeaderCell.CssClass = "fieldDeXuatTinhToan";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.A's Remark<br/>(GDV ghi chú)";
                //HeaderCell.CssClass = "grSummary";
                HeaderCell.RowSpan = 2;
                HeaderRow.Cells.Add(HeaderCell);


                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(0, HeaderRow);

                GridViewRow HeaderRow2 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();

				//group grClaim
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Qty<br/>(SL)";
				HeaderCell2.CssClass = "grClaim";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "U.Price<br/>(Đ.giá)";
				HeaderCell2.CssClass = "grClaim";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Amount<br/>(Thành tiền)";
				HeaderCell2.CssClass = "grClaim";
                HeaderRow2.Cells.Add(HeaderCell2);

				//grSupport
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "SS.Records<br/>BB H.trường";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Org.docs<br/>(Hsơ ban đầu)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Org.cost<br/>(Nguyên giá)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Acquisition<br/>(Bắt đầu..)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Used time <br/>(Tuổi TS)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Replacement<br/>(CTừ thay mới)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "NR_UPrice<br/>(Đgiá mới)";
				HeaderCell2.CssClass = "grSupport";
                HeaderRow2.Cells.Add(HeaderCell2);


                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Qty<br/>(SL)";
				HeaderCell2.CssClass = "grReasonable";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "U.Price<br/>(Đ.giá)";
				HeaderCell2.CssClass = "grReasonable";
                HeaderRow2.Cells.Add(HeaderCell2);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "Amount<br/>(Thành tiền)";
				HeaderCell2.CssClass = "grReasonable";
                HeaderRow2.Cells.Add(HeaderCell2);


                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(1, HeaderRow2);



                HeaderRow.Attributes.Add("class", "header nodrop nodrag");
                HeaderRow2.Attributes.Add("class", "header nodrop nodrag");
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }



        [System.Web.Services.WebMethod]
        public static bool UpdateFieldSummaryDetail(String id, String key, String val)
        {
            try
            {
                //Thread.Sleep(4000);
                SummaryDetailDAO dao = new SummaryDetailDAO();
                dao.updateField(id, key, val);
                

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
		
		[System.Web.Services.WebMethod]
        public static bool UpdateAllFieldSummaryDetail(String str)
        {
            try
            {
                SummaryDetailDAO dao = new SummaryDetailDAO();

                String[] strArr = str.Split('~');
                for (int i = 0; i < strArr.Length; i++)
                {
                    IDictionary<string, string> myDic = new Dictionary<string, string>();

                    String[] strData = strArr[i].Split(';');
                    for (int j = 0; j < strData.Length; j++)
                    {
                        String[] strObj = strData[j].Split(':');
                        myDic.Add(strObj[0].Trim(), strObj[1].Trim());
                    }

                    dao.updateAllField(myDic);
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
		
    }
}