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
    public partial class Uploads : System.Web.UI.Page
    {
        private String IMG_PATH = "~/Uploads/Images/";
        private String IMG_THUMB_PATH = "~/Uploads/Images/Thumb/";

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

            DirectoryInfo di = new DirectoryInfo(Server.MapPath(IMG_PATH));
            FileInfo[] files = di.GetFiles();
            //var orderedFiles = files.OrderBy(f => f.CreationTime);
            var orderedFiles = files.OrderByDescending(f => f.LastWriteTime);

            repeaterView.DataSource = orderedFiles;
            repeaterView.DataBind();

            repeaterList.DataSource = orderedFiles;
            repeaterList.DataBind();

        }

        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                StatusLabel.Text = "";
                try
                {
                    string contentType = FileUpload1.PostedFile.ContentType;
                    if (contentType == "image/jpeg" || contentType == "image/jpg" || contentType == "image/png")
                    {
                        //if(FileUpload1.PostedFile.ContentLength > 10* 1024* 1024)

                        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string imgPath = Server.MapPath(IMG_PATH) + fileName;
                        string imgThumbPath = Server.MapPath(IMG_THUMB_PATH) + fileName;

                        FileUpload1.PostedFile.SaveAs(imgPath);

                        CreateThumbnail(110, imgPath, imgThumbPath);

                        binData();
                    }
                    else
                        StatusLabel.Text = "Upload status: Only JPEG || PNG files are accepted!";
                }
                catch (Exception)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded.";
                }
            }


        }

        void CreateThumbnail(int ThumbnailMax, string OriginalImagePath, string ThumbnailImagePath)
        {
            // Loads original image from file
            System.Drawing.Image imgOriginal = System.Drawing.Image.FromFile(OriginalImagePath);
            // Finds height and width of original image
            float OriginalHeight = imgOriginal.Height;
            float OriginalWidth = imgOriginal.Width;
            // Finds height and width of resized image
            int ThumbnailWidth;
            int ThumbnailHeight;
            if (OriginalHeight > OriginalWidth)
            {
                ThumbnailHeight = ThumbnailMax;
                ThumbnailWidth = (int)((OriginalWidth / OriginalHeight) * (float)ThumbnailMax);
            }
            else
            {
                ThumbnailWidth = ThumbnailMax;
                ThumbnailHeight = (int)((OriginalHeight / OriginalWidth) * (float)ThumbnailMax);
            }
            // Create new bitmap that will be used for thumbnail
            Bitmap ThumbnailBitmap = new Bitmap(ThumbnailWidth, ThumbnailHeight);
            Graphics ResizedImage = Graphics.FromImage(ThumbnailBitmap);
            // Resized image will have best possible quality
            ResizedImage.InterpolationMode = InterpolationMode.HighQualityBicubic;
            ResizedImage.CompositingQuality = CompositingQuality.HighQuality;
            ResizedImage.SmoothingMode = SmoothingMode.HighQuality;
            // Draw resized image
            ResizedImage.DrawImage(imgOriginal, 0, 0, ThumbnailWidth, ThumbnailHeight);
            // Save thumbnail to file
            ThumbnailBitmap.Save(ThumbnailImagePath);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String str = txtSearch.Text;

            DirectoryInfo di = new DirectoryInfo(Server.MapPath(IMG_PATH));
            FileInfo[] files = di.GetFiles();
            //var orderedFiles = files.OrderBy(f => f.CreationTime);
            //var orderedFiles = files.OrderByDescending(f => f.LastWriteTime);

            var orderedFiles = files.Where(f => f.Name.Contains(str))
                                    .OrderByDescending(f => f.LastWriteTime);

            repeaterView.DataSource = orderedFiles;
            repeaterView.DataBind();

            repeaterList.DataSource = orderedFiles;
            repeaterList.DataBind();
        }
    }
}