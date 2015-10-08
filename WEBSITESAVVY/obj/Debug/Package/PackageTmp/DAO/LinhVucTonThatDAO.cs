using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class LinhVucTonThatDAO
    {
        public DataTable DanhSachLinhVuc()
        {
            string sql = "sp_LinhVucTonThat_select";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
    }
}