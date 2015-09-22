﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class SitePhotoDAO
    {
        public bool Insert(string id, string diengiai,string hinh)
        {
            string sql = "sp_SitePhoto_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", id));
            ds.Add(new SqlParameter("@diengiai",diengiai));
            ds.Add(new SqlParameter("@link", hinh));

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

        
        public DataSet SelectHinhClaim(string idclaim)
        {
            string sql = "sp_SitePhoto_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim ", idclaim));
            return SqlDataAcessHelper.SeletSto2(sql, ds);
        }
    }
}