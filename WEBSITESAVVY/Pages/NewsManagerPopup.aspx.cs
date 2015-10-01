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
    public partial class NewsManagerPopup : System.Web.UI.Page
    {
        NewsDAO newsDao = new NewsDAO();
        NewsTypeDAO typeDAO = new NewsTypeDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                if (Request.Cookies["MaGDV"] == null) Response.Redirect("../Pages/Login.aspx");    

                LoadData();

                String idNews = "";
                if (Request.QueryString["idNews"] != null)
                {
                    idNews = Request.QueryString["idNews"].ToString();

                    NewsDTO news = newsDao.GetNews(int.Parse(idNews, 0));
                    txtID_News.Value = news.ID_News.ToString();
                    txtTitle.Text = news.Title;
                    txtLinkImage.Text = news.LinkImages;
                    txtBrief.Text = news.Brief;
                    txtContents.Text = news.Contents;

                    updateSelectedType(news.ID_Types);

                    btnCreate.Visible = false;
                    btnUpdate.Visible = true;
                }
				else
				{
					txtTitle.Text  = "";
					txtBrief.Text = "";
					txtContents.Text = "";

                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
				}
            }
        }


        public void LoadData()
        {

            listBoxType.DataSource = typeDAO.GetList();
            listBoxType.DataTextField = "NameType";
            listBoxType.DataValueField = "ID_Type";
            listBoxType.DataBind();
        }

        protected void updateSelectedType(String strTypes)
        {
            String[] types = strTypes.Split(',');
            foreach (ListItem item in listBoxType.Items)
            {
                string value = item.Value;
                for (int j = 0; j < types.Length; j++)
                {
                    if(value == types[j].Trim())
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);

            NewsDTO news = new NewsDTO();
            news.Title = txtTitle.Text;
            news.LinkImages = txtLinkImage.Text;
            news.Brief = txtBrief.Text;
            news.Contents = txtContents.Text;
            news.DateCreated = DateTime.Now;
            news.DateModified = DateTime.Now;
            news.ID_GDVPost = idgdv;
            news.ID_GDVEdit = idgdv;

            int[] aSelected = listBoxType.GetSelectedIndices();
            String type = "";
            for (int i = 0; i < aSelected.Length; i++)
            {
                string value = listBoxType.Items[aSelected[i]].Value;
                type += value;
                if (i != aSelected.Length - 1)
                    type += ", ";
            }
            news.ID_Types = type;

            lblStatus.Text = "";
            if (newsDao.CreateNew(news))
            {
                Response.Write("<script> window.parent.closeDialog(); </script>");
                Response.Write("<script> window.parent.Refresh();</script>");
            }
            else
                lblStatus.Text = "Create Error";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);

            int idNews = int.Parse( txtID_News.Value);
            NewsDTO news = newsDao.GetNews(idNews);
            news.Title = txtTitle.Text;
            news.LinkImages = txtLinkImage.Text;
            news.Brief = txtBrief.Text;
            news.ID_GDVEdit = idgdv;
            news.DateModified = DateTime.Now;
            news.Contents = txtContents.Text;

            int[]aSelected = listBoxType.GetSelectedIndices();
            String type = "";
            for (int i = 0; i < aSelected.Length; i++)
            {
                string value = listBoxType.Items[aSelected[i]].Value;
                type += value;
                if (i != aSelected.Length - 1)
                    type += ", ";
            }

            news.ID_Types = type;

            lblStatus.Text = "";
            if (newsDao.Update(news))
            {
                Response.Write("<script> window.parent.Refresh();</script>");
            }
            else
            {
                lblStatus.Text = "Update error";
            }
        }
        
    }
}