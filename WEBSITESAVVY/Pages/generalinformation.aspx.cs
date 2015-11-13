using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class generalinformation : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    string idGDV = Request.Cookies["MaGDV"].Value;


                    if (Session["ThamChieu"] != null)
                    {
                        string idclaim = Session["ThamChieu"].ToString();
                        DataRow row = cl.GetGeneralInformation(idclaim);
                        if (row != null)
                        {
                            lblStatus.Text = row["TenGiaiDoan"].ToString();
                            lblBrief.Text = row["Brief"].ToString();
                            lblThamChieu.Text = row["TenClaim"].ToString();
                            lblInsurer.Text = row["TenNhaBH"].ToString();
                            lblInsured.Text = row["TenKhachHang"].ToString();
                            lblPolicyNo.Text = row["PolicyNo"].ToString();
                            lblSubsidiary.Text = row["TenDonVi"].ToString();
                            lblEffective.Text = row["Effective"].ToString();
                            lblTypeofPolicy.Text = row["NamePolicy"].ToString();
                            lblAdress.Text = row["DiaChi"].ToString();
                            lblNguoiDaiDien.Text = row["TenNguoiDaiDien"].ToString();
                            lblDienThoai.Text = row["DienThoai"].ToString();
                            lblDiadiemTonThat.Text = row["Premises"].ToString();
                            lblDateofloss.Text = row["DOL"].ToString();
                            lblTypeofloss.Text = row["LoaiHinhTonThat"].ToString();
                            lblSuminsured.Text = row["SumInsured"].ToString();
                            lblDeductible.Text = row["TruMienThuong"].ToString();
                            lblClaimsum.Text = row["KhieuNai"].ToString();
                            string taIR= row["TamUngBoiThuong"].ToString();
                            if(taIR!="")
                                lblpayment.Text=taIR;
                            else
                                lblpayment.Text = row["TamUngBoiThuongPR"].ToString(); 
                            lbllossestimate.Text = row["DuPhongTonThat"].ToString();
                            string duphongILA = row["DuPhongTonThat"].ToString();
                            string duphongPR = row["DuPhongTonThatPR"].ToString();
                            string duphongIR = row["DuPhongTonThatIR"].ToString();
                            if (duphongIR != "")
                            {
                                lblReserve.Text = duphongIR;
                                
                            }
                            if (duphongIR == "" && duphongPR != "")
                            {
                                lblReserve.Text = duphongPR;
                               
                            }
                            if (duphongIR == "" && duphongPR == "")
                            {
                                lblReserve.Text= duphongILA;
                                
                            }
                           // lblReserve.Text =  row["DuPhongBoiThuong"].ToString();                          
                            lblsettlement.Text = row["BoiThuong"].ToString();
                            lblSR01date.Text = row["NgayBatDauGiamDinh"].ToString();
                            lblILAdate.Text = row["ILADATE"].ToString();
                            lblPRDate.Text = row["PRDate"].ToString();
                            lblIRdate.Text = row["IRDate"].ToString();
                            lblFRdate.Text = row["FRDate"].ToString();
                            lblFFRdate.Text = row["FFRDate"].ToString();
                            lblDateofinstruction.Text = row["AssignedDate"].ToString();
                        }

                    }
                }
            }
        }
    }
}