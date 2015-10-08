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
    public partial class NewsManager : System.Web.UI.Page
    {
        private NewsDAO newDao = new NewsDAO();
        private NewsTypeDAO newsType = new NewsTypeDAO();
        private GiamDinhVienDAO gdvDao = new GiamDinhVienDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (!checkAdmin())
                {
                    Response.Redirect("../Pages/Home.aspx");
                }
                loadData();
                loadDropdownList();
            }
        }

        public bool checkAdmin()
        {
            if (Request.Cookies["MaGDV"] != null)
            {
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                if (gdvDao.KiemTraBacQuanLy(idgdv))
                    return true;
                return false;
            }
            return false;
        }

        public void loadData()
        {
            ddlPageSize.SelectedValue = PageSize.ToString();
            DataTable dt = newDao.GetList();
            DataSource = dt;
            fillData();
        }

        public void loadDropdownList()
        {
            ddlTypes.DataSource = newsType.GetList();
            ddlTypes.DataTextField = "NameType";
            ddlTypes.DataValueField = "ID_Type";
            ddlTypes.DataBind();
        }

        public void fillData()
        {
            DataTable dt = DataSource;
            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = PageSize;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
                rptPages.Visible = false;

            repeaterList.DataSource = pgitems;
            repeaterList.DataBind();

            txtCurrentPage.Text = (PageNumber + 1).ToString();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String keyWord = txtSearch.Text;
            DataTable dt = null;
            String idType = ddlTypes.SelectedValue.ToString();
            if (idType.Trim() != "")
            {
                dt = newDao.GetListSearchByType(idType, keyWord);
            }
            else
            {
                dt = newDao.GetListSearch(keyWord);
            }

            PageNumber = 0;
            DataSource = dt;
            fillData();
        }

        public DataTable DataSource
        {
            get
            {
                if (ViewState["DataSource"] != null)
                    return (DataTable)ViewState["DataSource"];
                else
                    return new DataTable();
            }
            set
            {
                ViewState["DataSource"] = value;
            }
        }

        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }

        public int PageSize
        {
            get
            {
                if (ViewState["PageSize"] != null)
                    return Convert.ToInt32(ViewState["PageSize"]);
                else
                    return 10;
            }
            set
            {
                ViewState["PageSize"] = value;
            }
        }
        protected void rptPages_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {

            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            fillData();

        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageSize = int.Parse( ddlPageSize.SelectedValue);
            PageNumber = 0;
            fillData();
        }

        protected void txtCurrentPage_TextChanged(object sender, EventArgs e)
        {
            int page;
            if (int.TryParse(txtCurrentPage.Text, out page))
            {
                if(page - 1 >= 0)
                    PageNumber = page - 1;
            }
            
        }

        protected void dllTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageNumber = 0;
            string idType = ddlTypes.SelectedValue.ToString();
            if (idType.Trim() != "")
            {
                DataSource = newDao.GetListByType(idType);
                fillData();
            }
            else
            {
                loadData();
            }
        }

        protected void repeaterList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hiden = (HiddenField)e.Item.FindControl("hidden_ID_news");
                DataTable dt = newDao.GetListType(int.Parse( hiden.Value ));
                Repeater RepeaterChild = (Repeater)e.Item.FindControl("repeaterType");
                RepeaterChild.DataSource = dt;
                RepeaterChild.DataBind();
            }
        }

        protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lb = e.Item.FindControl("btnPage") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);

                if (lb.CommandArgument == (PageNumber + 1).ToString())
                {
                    lb.CssClass = "selected";
                }
            }
        }

        

    }
}