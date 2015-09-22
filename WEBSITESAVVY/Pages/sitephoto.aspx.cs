using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.IO;
namespace WEBSITESAVVY.Pages
{
    public partial class sitephoto : System.Web.UI.Page
    {
        SitePhotoDAO sp = new SitePhotoDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ThamChieu"] != null)
                {
                    txtClaimNo.Text = Session["ThamChieu"].ToString();
                    LoadImage(Session["ThamChieu"].ToString());
                    
                }
                else
                    txtClaimNo.Text = "Session was timeout.";
            }
        }

        protected void btnPostHinh_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Uploads.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                FileUpload img = (FileUpload)imgUpload;
              
                string filename = Path.GetFileName(img.PostedFile.FileName);
                img.SaveAs(Server.MapPath("../Uploads/Images/" + filename));
                string id=txtClaimNo.Text;
                bool them = sp.Insert(id, txtDienGiai.Text, "../Uploads/Images/" + filename);
                if (them == true)
                    LoadImage(id);

            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }
        void LoadImage(string id)
        {
            DataSet ds = sp.SelectHinhClaim(id);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
       
    }
}