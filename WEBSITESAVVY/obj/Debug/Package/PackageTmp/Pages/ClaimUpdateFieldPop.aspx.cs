using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Pages
{
    public partial class ClaimUpdateFieldPopUp : System.Web.UI.Page
    {
        String claimID = "";
        String key = "";
        String value = "";
        public String type = "";
        string title = "";
        ClaimDAO claimDao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Request.QueryString["key"] != null)
                        key = Request.QueryString["key"].ToString();

                    if (Session["ThamChieu"] != null)
                        claimID = Session["ThamChieu"].ToString();

                    if (Request.QueryString["claimID"] != null)
                        claimID = Request.QueryString["claimID"].ToString();

                    if (Request.QueryString["type"] != null)
                        type = Request.QueryString["type"];

                    if (Request.QueryString["title"] != null)
                        title = Request.QueryString["title"];
                    if (type == "date")
                    {
                        txtValue.TextMode = TextBoxMode.SingleLine;
                        txtValue.Height = 22;
                       // CalendarExtenderInput.Enabled = true;
                    }
                   
                    HiddenTitle.Value = title;
                    hiddenClaimID.Value = claimID;
                    hiddenKey.Value = key;
                    txtValue.Text = claimDao.getClaimField(claimID, key).ToString();

                }catch(Exception ex)
                {
                    Response.Write("<script>parent.showMessage('Error', 'Page load');</script>");
                    Response.Write("<script>parent.closeDialog()</script>");
                }
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
        SendMailDAO sm = new SendMailDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                claimID = hiddenClaimID.Value.Trim();
                key = hiddenKey.Value.Trim();
                value = txtValue.Text.Trim();
                title = HiddenTitle.Value.Trim();
                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                claimDao.updateClaimField(claimID, key, value);
                //sm.sendNoiDungClaim("Report_Update", TenGDV(), value,key, claimID);
                //sm.UpdateClaim("Report_Update", TenGDV(), value, key, claimID);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + claimID + ".";
                SaveLogTracking(maGDV, noidung, claimID);
                Response.Write("<script>parent.closeDialog();</script>");
                Response.Write("<script>parent.reloaData();</script>");

            }catch(Exception ex)
            {
                Response.Write("<script>parent.showMessage('Error', 'Error update data');</script>");    
            }
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
    }
}