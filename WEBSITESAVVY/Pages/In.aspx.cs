﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEBSITESAVVY.Pages
{
    public partial class In : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control ctrl = (Control)Session["ctrl"];
            PrintHelper.PrintWebControl(ctrl);
        }
    }
}