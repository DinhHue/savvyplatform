using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Uc
{
    public partial class DonViBaoHiem : System.Web.UI.UserControl
    {
        DonViBHDAO dvdao = new DonViBHDAO();
        DonViDTO dvdto = new DonViDTO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                lblthongbao.Text = "";
                try
                {
                    NhaBHDAO nbhdao = new NhaBHDAO();
                    //drNBH.DataSource = nbhdao.DSCongTyTong();
                    //drNBH.DataValueField = "ID_NhaBH";
                    //drNBH.DataTextField = "TenNhaBH";
                    //drNBH.DataBind();
                    grDS.DataSource = dvdao.DonViBHInfo();
                    DataBind();
                    //load_GR();
                    
                }
                catch (Exception ex)
                {
                    lblthongbao.Text = ex.Message;
                }
            }
        }

      
        void load_GR()
        {
            try
            {
                if (IsPostBack)
                {                   
                    //grDS.DataSource = dvdao.ThongTinDVBH(ma);
                    grDS.DataSource = dvdao.DonViBHInfo();
                    grDS.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblthongbao.Text = ex.Message;
            }
        }
        #region Xem_infotheodropbox
        //protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //    //load_GR(ma);
        //}

        //protected void grDS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    grDS.PageIndex = e.NewPageIndex;
        //    int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //    load_GR(ma);
        //}

        //protected void grDS_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    e.Cancel = true;
        //    grDS.EditIndex = -1;
        //    int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //    load_GR(ma);
        //}

        //protected void grDS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    string mahoa = grDS.DataKeys[e.RowIndex].Value.ToString();
        //    bool kq = dvdao.XoaDonVi(mahoa);
        //    if (kq == true)
        //    {
        //        int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //        load_GR(ma);
        //    }
        //}

        //protected void grDS_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = grDS.Rows[e.RowIndex];
        //    TextBox tbtendv = row.Cells[0].Controls[0] as TextBox;
        //    TextBox tbdiachi = row.Cells[1].Controls[0] as TextBox;
        //    TextBox tbdienthoai = row.Cells[2].Controls[0] as TextBox;
        //    TextBox tbfax = row.Cells[3].Controls[0] as TextBox;
        //    TextBox tbweb = row.Cells[4].Controls[0] as TextBox;
        //    TextBox tbmst = row.Cells[5].Controls[0] as TextBox;
        //    dvdto.MaHoa = grDS.DataKeys[e.RowIndex].Value.ToString();
        //    dvdto.TenDonVi = tbtendv.Text;
        //    dvdto.DiaChi = tbdiachi.Text;
        //    dvdto.DienThoai = tbdienthoai.Text;
        //    dvdto.Fax = tbfax.Text;
        //    dvdto.WebSite = tbweb.Text;
        //    dvdto.MaSoThue = tbmst.Text;
        //    bool kq = dvdao.CapNhat(dvdto);
        //    if (kq == true)
        //    {
        //        e.Cancel = true;
        //        grDS.EditIndex = -1;
        //        int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //        load_GR(ma);
        //    }
        //}

        //protected void grDS_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    grDS.EditIndex = e.NewEditIndex;
        //    int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //    load_GR(ma);
        //}
        //string mahoa = null;

        //protected void grDS_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        //{
        //    mahoa = grDS.DataKeys[e.NewSelectedIndex].Value.ToString();
        //    Session["MaHoa"] = mahoa;
        //    Session["DonViBH"] = dvdao.LayDonVi(mahoa);
        //    Response.Redirect("/Manage/CapNhatDonViBaoHiem.aspx");
        //}

        //protected void btnXem_Click(object sender, EventArgs e)
        //{
        //    int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
        //    load_GR(ma);
        //}
        
        #endregion
    }
}