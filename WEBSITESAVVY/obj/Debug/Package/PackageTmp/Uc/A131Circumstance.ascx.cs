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
    public partial class A131Circumstance : System.Web.UI.UserControl
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
                    
                    //load_CK();
                    load(id);
                }
            }
        }
        //void load_CK()
        //{
        //    txtCircum.config.toolbar = new object[]
        //    {
        //        new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"},
        //        new object[] {"Styles", "Format", "FontSize"  }
        //    };
        //}
        void load(string id)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectCircumstance(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string text = dr[0].ToString();
                if (text != "")
                    txtCircum.Text = dr[0].ToString();
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

        protected void btnUpdateInsured_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();
            string text = txtCircum.Text;
            bool up = cldao.UpdateC1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Circumstance", ma);
                Response.Write("<script>alert('Updated !');</script>");
                load(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
    }
}