using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Manage
{
    public partial class incomeadjusters : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        int magdv = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    magdv = int.Parse(Request.Cookies["MaGDV"].Value);

                    DataTable dt = new DataTable();
                    dt = gdvdao.CheckManager(magdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        int cv = int.Parse(dr[0].ToString());
                        if (cv != 2)
                        {
                            Response.Write("<script>alert('You can't access!');</script>");
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đ
                        }
                        else
                        {
                            drGDV.DataSource = gdvdao.DSGiamDinhVienWorking();
                            drGDV.DataTextField = "TenGDV";
                            drGDV.DataValueField = "ID_GDV";
                            drGDV.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            int ma=int.Parse(drGDV.SelectedValue.ToString());
            if (ma != 0)
            {
                gvDSTimeSheet.DataSource = gdvdao.ThuNhapGDV(ma, DateTime.Now.Year);
                gvDSTimeSheet.DataBind();
            }
        }
        double tBVAT = 0;
        double cyber = 0;
        double tt = 0;
        protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
              
                cyber += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "CyberIncome"));
                tt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "RealIncome"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    
                    e.Row.Cells[6].Text = string.Format("{0:###,###}", cyber);
                    e.Row.Cells[7].Text = string.Format("{0:###,###}", tt);
                    e.Row.Cells[6].HorizontalAlign = e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Right;

                    e.Row.Font.Bold = true;
                }
        }
    }
}