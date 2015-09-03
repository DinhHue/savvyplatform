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
    public partial class A111_Introduction : System.Web.UI.UserControl
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
                    //DataTable dt = new DataTable();
                    //dt = cldao.SelectA1(id);
                    //if(dt.Rows.Count>0)
                   // load_CK();
                    loadA1(id);
                }
            }
        }
        //void load_CK()
        //{
        //    txtA1.config.toolbar = new object[]
        //    {
        //        new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"},
        //        new object[] {"Styles", "Format", "FontSize"  }
        //    };
        //}
        void loadA1(string id)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectA1(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string text = dr[0].ToString();
                if(text !="")
                    txtA1.Text = dr[0].ToString();
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
        //SendMailDAO sm = new SendMailDAO();
        protected void btnUpdateA1_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();
            
            string text = txtA1.Text;
            bool up = cldao.UpdateA1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Introduction", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadA1(ma);

            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
    }
}