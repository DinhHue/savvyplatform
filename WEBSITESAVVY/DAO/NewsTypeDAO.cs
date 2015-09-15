using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WEBSITESAVVY.DAO
{
    public class NewsTypeDAO
    {
        public DataTable GetList()
        {
            string sql = "sp_TypeNews_List";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
    }
}