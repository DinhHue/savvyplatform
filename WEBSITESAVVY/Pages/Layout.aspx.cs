using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Net.Json;

namespace WEBSITESAVVY.Pages
{
    public partial class Layout : System.Web.UI.Page
    {
        public static string claimName = "";
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = "";
            if( Request.QueryString["id"]!=null)
                id = Request.QueryString["id"];
            //if(Session["ThamChieu"]!= null)
            //    id = Session["ThamChieu"].ToString();
          
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                linklogin.Visible = true;

            }
            else
            {
                //JsonTextParser parser = new JsonTextParser();
                //JsonObject obj = parser.Parse(jsonText);


                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                dt = gdvdao.LayTenvaChucVu(idgdv);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    string name = dr[0].ToString();
                    lblName.Text = name;
                    string chucvu = dr[1].ToString();
                    lblChucVu.Text = chucvu;
                }
                linklogin.Visible = false;

                ClaimDAO dao = new ClaimDAO();
                claimName = dao.getClaimField(id, "TenClaim").ToString();
            }
        }
    }
}