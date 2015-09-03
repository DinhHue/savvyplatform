using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Net.Mail;
using System.Text;
using System.IO;
namespace WEBSITESAVVY.Pages
{
    public partial class DAILYTODO : System.Web.UI.Page
    {
        string tenGDV=null;
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        DaiLyDAO dldao = new DaiLyDAO();
        DAILYDTO dlDto = new DAILYDTO();
        SendMailDAO sendmail = new SendMailDAO();
        ClaimDAO cl = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
               {
                   int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                    loadImport(maGDV);
                    loadWaiting(maGDV);
                    loadDaiLyDone(maGDV);
                    loadGDV();
                    loadTaskReceived(maGDV);
                    loadTaskAssigned(maGDV);
                    loadTaskDone(maGDV);
                    loadAllTask();
                    loadDaGiao(maGDV);
                   // LoadgrAll();
                    pnEdit.Visible = false;
                }
                else
                    Response.Redirect("~/Pages/Login.aspx");
            }
        }
        void loadAllTask()
        {
            DataTable dt = new DataTable();
            dt = dldao.AllTask();
            if (dt.Rows.Count > 0)
            {
                //gvAllTask.DataSource = dt;
                //gvAllTask.DataBind();
                
            }
        }
        void loadGDV()
        {
            if (!this.IsPostBack)
            {
                drDSGDV.DataSource = gdv.DanhSachGiamDinhVien();
                drDSGDV.DataTextField = "TenGDV";
                drDSGDV.DataValueField = "ID_GDV";
                drDSGDV.DataBind();
                gvAlltasktodo.DataSource = gdv.DanhSachGiamDinhVien();
                gvAlltasktodo.DataBind();
            }
        }
        void loadImport(int magdv)
        {
            DataTable dt = new DataTable();
            dt = dldao.ListImportant(magdv);
            //if (dt.Rows.Count > 0)
            //{
                gvDSImportant.DataSource = dt;
                gvDSImportant.DataBind();
                gvShare.DataSource = dt;
                gvShare.DataBind();
            //}
        }
        void loadWaiting(int magdv)
        {
            DataTable dt = new DataTable();
            dt = dldao.ListWaiting(magdv);
            //if (dt.Rows.Count > 0)
            //{
                gvDSWaiting.DataSource = dt;
                gvDSWaiting.DataBind();
           // }
        }
        void loadTaskReceived(int magdv)
        {
            gvDSDuocNhan.DataSource = dldao.TaskReceived(magdv);
            gvDSDuocNhan.DataBind();
        }
        void loadTaskAssigned(int magdv)
        {
            //gvDSDaGiao.DataSource = dldao.TaskAssigned(magdv);
            //gvDSDaGiao.DataBind();
          
        }
        void loadDaGiao(int magdv)
        {
            gvDaGiao.DataSource = dldao.TaskAssigned(magdv);
            gvDaGiao.DataBind();
        }
        void loadTaskDone(int magdv)
        {
            gvTaskDone.DataSource = dldao.TaskAssigedDone(magdv);
            gvTaskDone.DataBind();
        }
        string GetName()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            return gdv.LayMaTen(maGDV);
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DAILYDTO dldto = new DAILYDTO();
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
            dldto.MaGDV = magdv;
            string maclaim = txtClaim.Text;
            if (maclaim != "")
                dldto.MaClaim = maclaim;
            else
                dldto.MaClaim = "";
            string diengiai = txtDescription.Text;
            if (diengiai == "")
                Response.Write("<script>alert('Chưa nhập diễn giải công việc!');<script/>");

            else
            {
                dldto.DienGiai = diengiai;
                dldto.Rate = int.Parse(drRate.SelectedItem.Value.ToString());
                dldto.Lev = int.Parse(drLevel.SelectedItem.Value.ToString());
                string da = txtDate.Text;
                string deadline = txtDeadline.Text;
                if (da != "")
                {
                    DateTime ngay = DateTime.Parse(txtDate.Text);
                    dldto.Ngay = ngay;
                }
                else
                    dldto.Ngay = DateTime.Parse(DateTime.Now.ToShortDateString());
                if (deadline != "")
                {
                    DateTime dead = DateTime.Parse(txtDeadline.Text);
                    dldto.Deadline = dead;
                }
                else
                    dldto.Deadline =DateTime.Parse(DateTime.Now.ToShortDateString());
                int gdvnhan=int.Parse(drDSGDV.SelectedItem.Value.ToString());
                if (gdvnhan != 0)
                {

                    string ten = GetName();
                    string user = gdv.LayUsername(gdvnhan);
                    dldto.MaGDVNhan = gdvnhan;
                    string email=gdv.LayEmail(user);
                    string noidung=txtDescription.Text;
                    string brief= txtClaim.Text +" - "+ cl.Laybrif(txtClaim.Text);
                    string deadtime = txtDeadline.Text;
                    string bodyCC = "Dear " + drDSGDV.SelectedItem.ToString();
                    bodyCC += "<br/>";
                    bodyCC += "<br/>";
                    bodyCC += "<br/>";
                    bodyCC += ten + " muốn bạn hỗ trợ vụ " + brief;
                    bodyCC += "<br/>";
                    bodyCC += "Với nội dung: " + noidung;
                    bodyCC += "<br/>";
                    bodyCC += "Hạn hoàn thành: " + deadtime;
                    bodyCC += "<br/>";
                    bodyCC += "Nếu có trở ngại gì vui lòng feedback ở platform hoặc gặp trực tiếp "+ten+ " nhé!<br/>";
                    bodyCC += "<br/>";
                    bodyCC += "<br/> Have a nice day.";
                    if (deadtime == "")
                    {
                        deadtime = DateTime.Now.ToString("yyyy-MM-dd");
                        //sendmail.ThongBaoTask("Task-to-do", ten, email, noidung, brief, deadtime);
                        sendmail.Send_Email_Task(email, "Task-to-do " + brief, bodyCC, "huedinh@savvyadjusters.vn");
                    }
                    else
                    {
                        //sendmail.ThongBaoTask("Task-to-do", ten, email, noidung, brief, deadtime);
                        sendmail.Send_Email_Task(email, "Task-to-do " + brief, bodyCC, "huedinh@savvyadjusters.vn");
                    }
                   // string bodyCC = "Dear Partner,";
                   // bodyCC += "<br/>";
                   // bodyCC += "<br/>";
                   // bodyCC += "<br/>";
                   // bodyCC += ten + " đã giao cho " + drDSGDV.SelectedItem.ToString() + " thực hiện công việc của vụ " + brief;
                   // bodyCC += "<br/>";
                   // bodyCC += "Với nội dung: " + noidung;
                   // bodyCC += "<br/>"; 
                   // bodyCC += "Hạn hoàn thành: " + deadtime;
                   // bodyCC += "<br/>";
                   // bodyCC += "<br/>";
                   // bodyCC += "<br/> Cheers, ";
                   // //sendmail.Send_Email("savvyadjus@gmail.com", email, "Task-to-do", bodyCC, "viettran@savvyadjusters.vn, khiemngo@savvyadjusters.vn, huedinh@savvyadjusters.vn");
                 // sendmail.Send_Email("savvyadjus@gmail.com", email, "Task-to-do", bodyCC, "hoalyli@gmail.com, huedinh@savvyadjusters.vn");
                   // sendmail.Send_Email_Task(email, "Task-to-do", bodyCC, "huedinh@savvyadjusters.vn");
                }
                else
                    dldto.MaGDVNhan = 0;
                bool them = dldao.DaiLyMoi(dldto);
                if (them == true)
                {
                    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                    string noidung = gdv.LayTenTheoMa(maGDV) + " created task of case" + maclaim + " .";
                    SaveLogTracking(maGDV, noidung, maclaim);
                    loadWaiting(magdv);
                    loadImport(magdv);
                    loadTaskReceived(magdv);
                    loadTaskAssigned(magdv);
                    loadDaGiao(magdv);
                    loadAllTask();
                    ClearInputs(Page.Controls);
                }
            }
        }
        private void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        void loadDaiLyMa(int ma)
        {
            DataTable dt = new DataTable();
            dt = dldao.DaiLyTheoMa(ma);
            //if (dt.Rows.Count > 0)
            //{
                gvLoadEdit.DataSource = dt;
                gvLoadEdit.DataBind();
           // }
        }
        void loadDaiLyDone(int magdv)
        {
            DataTable dt = new DataTable();
            dt = dldao.DaiLyDone(magdv);
            //if (dt.Rows.Count > 0)
            //{
            gvDSDone.DataSource = dt;
            gvDSDone.DataBind();
            // }
        }
        protected void gvDSImportant_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSImportant.SelectedRow;
            if (row != null)
            {
                int madaily = int.Parse(row.Cells[0].Text);
                Session["MaDaiLy"] = madaily;
                pnEdit.Visible = true;
                loadDaiLyMa(madaily);
                
            }
        }

        protected void btnUprate_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            //int ma=int.Parse(lblMaDaily.Text);
            dldao.UpRate(ma);
            loadDaiLyMa(ma);
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
        }

        protected void btnDownrate_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            //int ma=int.Parse(lblMaDaily.Text);
            dldao.DownRate(ma);
            loadDaiLyMa(ma);
            loadImport(maGDV);
            loadDaiLyDone(maGDV);
            loadWaiting(maGDV);
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            //int ma=int.Parse(lblMaDaily.Text);
            dldao.DoneDaily(ma);
            pnEdit.Visible = false;
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
            //int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string noidung = gdv.LayTenTheoMa(maGDV) + " finished task.";
            SaveLogTracking(maGDV, noidung, "");
        }

        protected void gvDSWaiting_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSWaiting.SelectedRow;
            if (row != null)
            {
                int madaily = int.Parse(row.Cells[0].Text);
                Session["MaDaiLy"] = madaily;
                pnEdit.Visible = true;
                loadDaiLyMa(madaily);

            }
        }

        protected void gvDSDone_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSDone.SelectedRow;
            if (row != null)
            {
                int madaily = int.Parse(row.Cells[0].Text);
                Session["MaDaiLy"] = madaily;
                pnEdit.Visible = true;
                loadDaiLyMa(madaily);

            }
        }

        protected void gvDSDone_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvDSDone.DataKeys[e.RowIndex].Value.ToString());
            dldao.DeleteDaiLy(ma);
      
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            pnEdit.Visible = false;
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnEdit.Visible = false;
        }

        protected void gvLoadEdit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvLoadEdit.EditIndex = -1;
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            loadDaiLyMa(ma);
        }

        protected void gvLoadEdit_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLoadEdit.EditIndex = e.NewEditIndex;
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            loadDaiLyMa(ma);
        }

        protected void gvLoadEdit_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string diengiai = null;
            GridViewRow row = gvLoadEdit.Rows[e.RowIndex];
            //TextBox maDaiLy = row.Cells[1].Controls[0] as TextBox;
            TextBox dienGiai = row.Cells[1].Controls[0] as TextBox;
            DateTime dateedit = DateTime.Now;
            diengiai = dienGiai.Text;
            bool up = dldao.UpdateDaily(ma,diengiai,dateedit);
            if (up == true)
            {
                
                string noidung = gdv.LayTenTheoMa(maGDV) + " updated task.";
                SaveLogTracking(maGDV, noidung, "");
                e.Cancel = true;
                gvLoadEdit.EditIndex = -1;
                loadDaiLyMa(ma);
                loadWaiting(maGDV);
                loadImport(maGDV);
                loadGDV();
            }
        }
        //shared list công việc đang làm cho người khác
        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            //DataTable dt = new DataTable();
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengiamdv = gdv.LayTenTheoMa(maGDV);
            string email = txtEmail.Text;
            //dt = dldao.ListImportant(maGDV);
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("savvyadjus@gmail.com");
            msg.To.Add(new MailAddress(email));
            msg.Subject = "Share Daily To Do List";
            msg.Body = "Bạn được " + tengiamdv + " chia sẻ daily to do list: ";
            msg.Body += GetGridViewData(gvShare);
            msg.IsBodyHtml = true;
            SmtpClient smtpserver = new SmtpClient();
            smtpserver.Host = "smtp.gmail.com";
            smtpserver.Port = 587;
            smtpserver.Credentials = new System.Net.NetworkCredential("savvyadjus@gmail.com", "AsZx0808");
            smtpserver.EnableSsl = true;
            smtpserver.Send(msg);
        }
        // Send email notification complete task
        void Taskdone(int madaily)
        {
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengiamdv = gdv.LayTenTheoMa(maGDV);
           DataTable dt= new DataTable();
            dt = dldao.GetEmailNguoiGiao(madaily);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string email = dr[0].ToString();
                string mavu = dr[1].ToString();
                string noidung = dr[2].ToString();
              
                string noidungT = gdv.LayTenTheoMa(maGDV) + " done task assignment.";
                SaveLogTracking(maGDV, noidungT,"");
                sendmail.TaskComplete("Task_to-do", tengiamdv, email, noidung, mavu);
            }
            //dt = dldao.ListImportant(maGDV);
           
        }
        public string GetGridViewData(GridView gv)
        {
            StringBuilder strbuild = new StringBuilder();
            StringWriter strwrite = new StringWriter(strbuild);
            HtmlTextWriter html = new HtmlTextWriter(strwrite);
            gv.RenderControl(html);
            return strbuild.ToString();
        }
        public override void VerifyRenderingInServerForm(Control control)
        { /* Do nothing */ }

        public override bool EnableEventValidation
        {
            get { return false; }
            set { /* Do nothing */}
        }

        protected void btnWaitting_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            bool up = dldao.Chuyen(ma);
            if (up == true)
            {
                loadDaiLyMa(ma);
                loadWaiting(maGDV);
                loadImport(maGDV);
            }
        }

        protected void btnImportant_Click(object sender, EventArgs e)
        {

            int ma = int.Parse(Session["MaDaiLy"].ToString());
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            bool up = dldao.ChuyenImportant(ma);
            if (up == true)
            {
                loadDaiLyMa(ma);
                loadWaiting(maGDV);
                loadImport(maGDV);
            }
        }

        protected void gvDSDuocNhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSDuocNhan.SelectedRow;
            if (row != null)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                //int maGDV = int.Parse(Session["MaGDV"].ToString());
                int madaily = int.Parse(row.Cells[0].Text);
                bool up = dldao.DoneDaily(madaily);
                Taskdone(madaily);
                loadImport(maGDV);
                loadWaiting(maGDV);
                loadDaiLyDone(maGDV);
                loadGDV();
                loadTaskReceived(maGDV);
                loadTaskAssigned(maGDV);
                loadTaskDone(maGDV);
            }
         }

        protected void gvTaskDone_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvTaskDone.DataKeys[e.RowIndex].Value.ToString());
            dldao.DeleteDaiLy(ma);
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string noidung = gdv.LayTenTheoMa(maGDV) + " deleted task.";
            SaveLogTracking(maGDV, noidung, "");
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
            loadGDV();
            loadTaskReceived(maGDV);
            loadTaskAssigned(maGDV);
            loadTaskDone(maGDV);
            loadAllTask();
        }

        //protected void gvDSDaGiao_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = gvDSDaGiao.Rows[e.RowIndex];
        //    int ma = int.Parse(gvDSDaGiao.DataKeys[e.RowIndex].Value.ToString());
        //    string diengiai = null;
        //    //int maGDV = int.Parse(Session["MaGDV"].ToString());
        //    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
        //    TextBox dienGiai = row.Cells[3].Controls[0] as TextBox;
        //    diengiai = dienGiai.Text;
        //    TextBox dead = row.Cells[5].Controls[0] as TextBox;
        //    DateTime deadline = DateTime.Parse(dead.Text);
        //    DataTable dt = new DataTable();           
        //    string ten = GetName();
        //    string email = null, idclaim = null, brief = null;            
        //    bool up = dldao.UpdateDaily(ma, diengiai,deadline);
        //    if (up == true)
        //    {
        //        e.Cancel = true;
        //        gvDSDaGiao.EditIndex = -1;
        //        dt = dldao.GetInfoTask(ma);
        //        if (dt.Rows.Count > 0)
        //        {
        //            //dl.ID_Claim, gdv.Email, dl.DienGiai, gdv.TenGDV;
        //            DataRow dr = dt.Rows[0];
        //            idclaim = dr[0].ToString();
        //            brief = idclaim +" - "+ cl.Laybrif(idclaim);
        //            email = dr[1].ToString();
        //        }
        //        sendmail.CapNhatTask("Task-to-do", ten, email, brief, diengiai, deadline);
        //        loadImport(maGDV);
        //        loadWaiting(maGDV);
        //        loadDaiLyDone(maGDV);
        //        loadGDV();
        //        loadTaskReceived(maGDV);
        //        loadTaskAssigned(maGDV);
        //        loadTaskDone(maGDV);
        //        loadAllTask();
        //    }
        //}

        //protected void gvDSDaGiao_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    e.Cancel = true;
        //    gvDSDaGiao.EditIndex = -1;
        //    //int ma = int.Parse(Session["MaDaiLy"].ToString());
        //    //int maGDV = int.Parse(Session["MaGDV"].ToString());
        //    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
        //    loadImport(maGDV);
        //    loadWaiting(maGDV);
        //    loadDaiLyDone(maGDV);
        //    loadGDV();
        //    loadTaskReceived(maGDV);
        //    loadTaskAssigned(maGDV);
        //    loadTaskDone(maGDV);
        //    loadAllTask();
        //}

        //protected void gvDSDaGiao_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvDSDaGiao.EditIndex = e.NewEditIndex;
        //    //int maGDV = int.Parse(Session["MaGDV"].ToString());
        //    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
        //    loadImport(maGDV);
        //    loadWaiting(maGDV);
        //    loadDaiLyDone(maGDV);
        //    loadGDV();
        //    loadTaskReceived(maGDV);
        //    loadTaskAssigned(maGDV);
        //    loadTaskDone(maGDV);
        //    loadAllTask();
        //}

        //protected void gvDSDaGiao_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int ma = int.Parse(gvDSDaGiao.DataKeys[e.RowIndex].Value.ToString());
        //    DataTable dt = new DataTable();
        //    dt = dldao.GetInfoTask(ma);
        //    string idclaim = null, email = null, noidung = null, brief = null;
        //    string ten = GetName();
        //    if (dt.Rows.Count > 0)
        //    {
        //        DataRow dr = dt.Rows[0];
        //        idclaim = dr[0].ToString();
        //        email = dr[1].ToString();
        //        noidung = dr[2].ToString();
        //        brief = idclaim + " - " + cl.Laybrif(idclaim);
        //    }
        //    sendmail.BoTask("Task_to-do", ten, email, brief, noidung);
        //    dldao.DeleteDaiLy(ma);
        //    //int maGDV = int.Parse(Session["MaGDV"].ToString());
        //    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
        //    loadImport(maGDV);
        //    loadWaiting(maGDV);
        //    loadDaiLyDone(maGDV);
        //    loadGDV();
        //    loadTaskReceived(maGDV);
        //    loadTaskAssigned(maGDV);
        //    loadTaskDone(maGDV);
        //    loadAllTask();
        //}

        protected void gvDSDuocNhan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma= int.Parse(gvDSDuocNhan.DataKeys[e.RowIndex].Value.ToString());
            lblID.Text = ma.ToString();
            DataTable dt = new DataTable();
            dt = dldao.SelectDaiLy(ma);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblNoiDungTask.Text = dr[1].ToString();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV=int.Parse(Request.Cookies["MaGDV"].Value);
            string ykien = txtFeedback.Text;
            int ma = int.Parse(lblID.Text);
            bool kq = dldao.UpdateYkien(ma, ykien);
            if (kq == true)
            {
               
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited feedback him(her) task.";
                SaveLogTracking(maGDV, noidung, "");
                lblNoiDungTask.Text = "";
                txtFeedback.Text = "";
                loadImport(maGDV);
                loadWaiting(maGDV);
                loadDaiLyDone(maGDV);
                loadGDV();
                loadTaskReceived(maGDV);
                loadDaGiao(maGDV);
                loadTaskDone(maGDV);
                loadAllTask();
                
            }
        }

        //protected void gvDSDaGiao_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        //{
        //    int ma = int.Parse(gvDSDaGiao.DataKeys[e.RowIndex].Value.ToString());
        //    DataTable dt = new DataTable();
        //    dt = dldao.GetInfoTask(ma);
        //    string idclaim = null, email = null, noidung = null, brief = null;
        //    string ten = GetName();
        //    if (dt.Rows.Count > 0)
        //    {
        //        DataRow dr = dt.Rows[0];
        //        idclaim = dr[0].ToString();
        //        email = dr[1].ToString();
        //        noidung = dr[2].ToString();
        //        brief = idclaim + " - " + cl.Laybrif(idclaim);
        //    }
        //    dldao.DeleteDaiLy(ma);
        //    sendmail.BoTask("Task_to-do", ten, email, brief, noidung);
            
        //    //int maGDV = int.Parse(Session["MaGDV"].ToString());
        //    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
        //    loadImport(maGDV);
        //    loadWaiting(maGDV);
        //    loadDaiLyDone(maGDV);
        //    loadGDV();
        //    loadTaskReceived(maGDV);
        //    loadTaskAssigned(maGDV);
        //    loadTaskDone(maGDV);
        //    loadAllTask();
        //}

        protected void gvDaGiao_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            int ma = int.Parse(gvDaGiao.DataKeys[e.RowIndex].Value.ToString());
            DataTable dt = new DataTable();
            dt = dldao.GetInfoTask(ma);
            string idclaim = null, email = null, noidung = null, brief = null;
            string ten = GetName();
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                idclaim = dr[0].ToString();
                email = dr[1].ToString();
                noidung = dr[2].ToString();
                brief = idclaim + " - " + cl.Laybrif(idclaim);
                sendmail.BoTask("Task_to-do", ten, email, brief, noidung);
            }
            dldao.DeleteDaiLy(ma);
            loadGDV();
            loadTaskReceived(maGDV);          
            loadAllTask();
            loadDaGiao(maGDV);
        }

        protected void gvDaGiao_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDaGiao.EditIndex = e.NewEditIndex;
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
            loadGDV();
            loadTaskReceived(maGDV);
            loadDaGiao(maGDV);
            loadTaskDone(maGDV);
            loadAllTask();
        }

        protected void gvDaGiao_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDaGiao.EditIndex = -1;
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            loadImport(maGDV);
            loadWaiting(maGDV);
            loadDaiLyDone(maGDV);
            loadGDV();
            loadTaskReceived(maGDV);
            loadDaGiao(maGDV);
            loadTaskDone(maGDV);
            loadAllTask();
        }

        protected void gvDaGiao_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDaGiao.Rows[e.RowIndex];
            int ma = int.Parse(gvDaGiao.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = null;
            //int maGDV = int.Parse(Session["MaGDV"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            TextBox dienGiai = row.Cells[3].Controls[0] as TextBox;
            diengiai = dienGiai.Text;
            TextBox dead = row.Cells[5].Controls[0] as TextBox;
            DateTime deadline = DateTime.Parse(dead.Text);
            DataTable dt = new DataTable();           
            string ten = GetName();
            string email = null, idclaim = null, brief = null;            
            bool up = dldao.UpdateDaily(ma, diengiai,deadline);
            if (up == true)
            {
               
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited task to assignment .";
                SaveLogTracking(maGDV, noidung, "");
                e.Cancel = true;
                gvDaGiao.EditIndex = -1;
                dt = dldao.GetInfoTask(ma);
                if (dt.Rows.Count > 0)
                {
                    //dl.ID_Claim, gdv.Email, dl.DienGiai, gdv.TenGDV;
                    DataRow dr = dt.Rows[0];
                    idclaim = dr[0].ToString();
                    brief = idclaim + " - " + cl.Laybrif(idclaim);
                    email = dr[1].ToString();
                    sendmail.CapNhatTask("Task-to-do", ten, email, brief, diengiai, deadline);
                }
            }
            loadGDV();
            loadTaskReceived(maGDV);
            loadDaGiao(maGDV);
            loadAllTask();
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

        protected void gvAlltasktodo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblmaGDV = (Label)e.Row.FindControl("lblmaGDV");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = getRoman(e.Row.RowIndex + 1);

                int maGDV = int.Parse(lblmaGDV.Text);
                DataTable dt = dldao.TaskReceived(maGDV);
                Repeater repeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
               
                repeaterChild.DataSource = dt;
                repeaterChild.DataBind();
            }
        }

        protected void gvAlltasktodo_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell HeaderCell = new TableCell();
                HeaderCell = new TableCell();
                HeaderCell.Text = "NO.";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "CASE NO.";
                HeaderCell.Width = 100;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "DESCRIPTION";
                HeaderCell.Width = 400;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "FEEDBACK";
                HeaderCell.Width = 180;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "D.A";
                HeaderCell.Width = 80;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "DEADLINE";
                HeaderCell.Width = 80;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "LA ASSIGNED";
                HeaderCell.Width = 120;
                HeaderRow.Cells.Add(HeaderCell);

                gvAlltasktodo.Controls[0].Controls.AddAt(0, HeaderRow);

                HeaderRow.Attributes.Add("class", "header");
            }
        }

    }
}