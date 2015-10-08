using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace WEBSITESAVVY.Pages
{
    public partial class UploadMedia : System.Web.UI.Page
    {
        private String ROOT_PATH = "~/Uploads/Media/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binData();
            }
        }

        protected void binData()
        {
            //string[] filePaths = Directory.GetFiles(Server.MapPath(IMG_THUMB_PATH));

            DirectoryInfo di = new DirectoryInfo(Server.MapPath(ROOT_PATH));
            //di.GetDirectories();
            FileInfo[] files = di.GetFiles();
            //var orderedFiles = files.OrderBy(f => f.CreationTime);
            var orderedFiles = files.OrderByDescending(f => f.LastWriteTime);

            repeaterList.DataSource = orderedFiles;
            repeaterList.DataBind();

        }

        protected void Upload(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                StatusLabel.Text = "";
                try
                {
                    string contentType = fileUpload.PostedFile.ContentType;
                    //if (fileUpload.PostedFile.ContentLength < 50 * 1024 * 1024)
                    {
                        //if(FileUpload1.PostedFile.ContentLength > 10* 1024* 1024)

                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string path = Server.MapPath(ROOT_PATH) + fileName;

                        fileUpload.PostedFile.SaveAs(path);

                        binData();
                    }
                    //else    StatusLabel.Text = "Upload status: Max size 50MB!";
                }
                catch (Exception)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded.";
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String str = txtSearch.Text;

            DirectoryInfo di = new DirectoryInfo(Server.MapPath(ROOT_PATH));
            FileInfo[] files = di.GetFiles();
            //var orderedFiles = files.OrderBy(f => f.CreationTime);
            //var orderedFiles = files.OrderByDescending(f => f.LastWriteTime);

            var orderedFiles = files.Where(f => f.Name.Contains(str))
                                    .OrderByDescending(f => f.LastWriteTime);

            repeaterList.DataSource = orderedFiles;
            repeaterList.DataBind();
        }


    }
}