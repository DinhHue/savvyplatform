using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
namespace WEBSITESAVVY.Uc
{
    public partial class ClaimSettlement : System.Web.UI.UserControl
    {
        ClaimDAO cldao = new ClaimDAO();
        SendMailDAO sm = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string id = Session["ThamChieu"].ToString();

                if (id != null)
                {
                    load(id);
                    //load_CK();
                }
            }
        }
        //void load_CK()
        //{
        //    txtSettlement.config.toolbar = new object[]
        //    {
        //        new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"},
        //        new object[] {"Styles", "Format", "FontSize"  }
        //    };
        //}
        void load(string id)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectClaimSettlement(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string text = dr[0].ToString();
                if (text != "")
                txtSettlement.Text = dr[0].ToString();
            }
        }
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected string TenGDV()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengdv = gdvdao.LayTenTheoMa(maGDV);
            //tengdv=lblGDV.ToString();
            return tengdv;

        }

        protected void btnUpdateSettlement_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();
            string text = txtSettlement.Text;
            bool up = cldao.UpdateI(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Claim Settlement", ma);
                Response.Write("<script>alert('Updated !');</script>");
                load(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
    }
}