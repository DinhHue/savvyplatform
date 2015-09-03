using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Text;
using System.Data;
using System.IO;

namespace WEBSITESAVVY.Manage
{
    public partial class ManageItemDR : System.Web.UI.Page
    {
        ItemDRDAO i = new ItemDRDAO();
        LoaiDRDAO l = new LoaiDRDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    LoadType();
                    loadTypeGr();
                    gvListItemDR.Visible = false;
                    gvItemList.Visible = true;
                    btnShowEdit0.Visible = false;
                    btnShowEdit.Visible = true;
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        void LoadType()
        {
            drType.DataSource = l.DanhSachLoai();
            drType.DataValueField = "ID_LoaiDR";
            drType.DataTextField = "TenLoai";
            drType.DataBind();
        }
        void loadTypeGr()
        {
            gvItemList.DataSource = l.DanhSachLoai();
            gvItemList.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            int matype = int.Parse(drType.SelectedItem.Value.ToString());
            string ten = txtTenLoai.Text.Trim();
            bool kq = i.InsertNewItem(ten, matype);
            if (kq == true)
                loadTypeGr();
            else
                Response.Write("<script>alert('Update failed!');</script>");
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
        protected void gvItemList_RowCreated(object sender, GridViewRowEventArgs e)
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

                gvItemList.Controls[0].Controls.AddAt(0, HeaderRow);


                HeaderRow.Attributes.Add("class", "header");
            }
        }

        protected void gvItemList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblmaLoaiDR = (Label)e.Row.FindControl("lblmaLoaiDR");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = getRoman(e.Row.RowIndex + 1);

                string maloaiDR = lblmaLoaiDR.Text;
                DataTable dt = i.DSItem(int.Parse(maloaiDR));
                Repeater repeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                repeaterChild.DataSource = dt;
                repeaterChild.DataBind();
            }
        }

    
        protected void btnShowEdit_Click(object sender, EventArgs e)
        {
            gvListItemDR.DataSource = i.ListItemAll();
            gvListItemDR.DataBind();
            gvListItemDR.Visible = true;
            gvItemList.Visible = false;
            btnShowEdit.Visible = false;
            btnShowEdit0.Visible = true;
        }
        void loadList()
        {
            gvListItemDR.DataSource = i.ListItemAll();
            gvListItemDR.DataBind();
            
        }
        protected void gvListItemDR_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvListItemDR.DataKeys[e.RowIndex].Value.ToString());
            bool kq = i.Delete(id);
            if (kq == true)
            {
                LoadType();
                loadTypeGr();
                loadList();
                
            }
            else
                Response.Write("<script>alert('Không xoá được !');</script>");
        }

        protected void btnShowEdit0_Click(object sender, EventArgs e)
        {
            btnShowEdit.Visible = true;
            gvItemList.Visible = true;
            btnShowEdit0.Visible = false;
            gvListItemDR.Visible = false;
        }

        protected void gvListItemDR_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvListItemDR.EditIndex = -1;
            loadList();
        }

        protected void gvListItemDR_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListItemDR.EditIndex = e.NewEditIndex;
            loadList();
        }

        protected void gvListItemDR_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow rw = gvListItemDR.Rows[e.RowIndex];
            TextBox txtnameitem=rw.Cells[2].Controls[0] as TextBox;
            int ma= int.Parse(gvListItemDR.DataKeys[e.RowIndex].Value.ToString());
            bool up = i.UpdateItem(ma, txtnameitem.Text.Trim());
            if (up == true)
            {
                e.Cancel = true;
                gvListItemDR.EditIndex = -1;
                loadList();
            }
        }
    }
}