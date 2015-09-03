using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Manage
{
    public partial class CLAIM_PERMISSION : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                loadDSClaim();
            }
        }
        void loadDSClaim()
        {
            gvDSClaim.DataSource = cldao.ClaimPermissionList();
            gvDSClaim.DataBind();
        }
        protected void gvDSClaim_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSClaim.EditIndex = e.NewEditIndex;
            loadDSClaim();
        }

        protected void gvDSClaim_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSClaim.EditIndex = -1;
            loadDSClaim();
        }

        protected void gvDSClaim_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSClaim.Rows[e.RowIndex];

            TextBox txtmatruycap = row.Cells[3].Controls[0] as TextBox;

            string id = gvDSClaim.DataKeys[e.RowIndex].Value.ToString();
            int mapub = int.Parse(txtmatruycap.Text);
            bool cn = cldao.CapNhatPub(id, mapub);
            if (cn == true)
            {
                e.Cancel = true;
                gvDSClaim.EditIndex = -1;
                loadDSClaim();
            }
            else
                Response.Write("<script> alert('Sorry :-(');</script>");
        }
    }
}