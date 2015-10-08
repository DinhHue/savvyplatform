using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class QuanLyHutThuocDAO
    {
        public bool QuanLyHutThuocMoi(QuanLyHutThuocDTO qldto)
        {
            string sql= "sp_QuanLyHutThuocMoi";
            List<SqlParameter> ds = new List<SqlParameter>() ;
            SqlParameter marr = new SqlParameter("@id", SqlDbType.Int);
            marr.Value = qldto.Id;
            ds.Add(marr);
            SqlParameter thuchien = new SqlParameter("@thuchien", SqlDbType.VarChar);
            thuchien.Value = qldto.ThucHien;
            ds.Add(thuchien);
            SqlParameter nhakho = new SqlParameter("@nhakho",SqlDbType.VarChar);
            nhakho.Value = qldto.NhaKho;
            ds.Add(nhakho);
            SqlParameter sanxuat = new SqlParameter("@sanxuat",SqlDbType.VarChar);
            sanxuat.Value = qldto.SanXuat;
            ds.Add(sanxuat);
            SqlParameter khac = new SqlParameter("@khac",SqlDbType.VarChar);
            khac.Value = qldto.Khac;
            ds.Add(khac);
            SqlParameter nhanxet = new SqlParameter("@nhanxet",SqlDbType.NVarChar);
            nhanxet.Value = qldto.NhanXet;
            ds.Add(nhanxet);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
    }
}