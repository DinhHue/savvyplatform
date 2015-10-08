using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class QuanLyKhoDAO
    {
        public bool QuanLyKhoMoi(QuanLyKhoDTO ql)
        {
            string sql= "sp_QuanLyKhoMoi";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id",SqlDbType.Int);
            id.Value = ql.Id;
            ds.Add(id);
            SqlParameter luutru = new SqlParameter("@luutru",SqlDbType.NVarChar);
            luutru.Value = ql.Luutru;
            ds.Add(luutru);
            SqlParameter mota = new SqlParameter("@mota",SqlDbType.NVarChar);
            mota.Value = ql.MoTa;
            ds.Add(mota);
            SqlParameter chieucaochathang = new SqlParameter("@chieucaochathang",SqlDbType.NVarChar);
            chieucaochathang.Value = ql.ChieuCaoChatHang;
            ds.Add(chieucaochathang);
            SqlParameter chieucaonhakho = new SqlParameter("@chieucaonhakho",SqlDbType.NVarChar);
            chieucaonhakho.Value = ql.ChieuCaoNhaKho;
            ds.Add(chieucaonhakho);
            SqlParameter vatdung = new SqlParameter("@vatdung",SqlDbType.NVarChar);
            vatdung.Value = ql.VatDung;
            ds.Add(vatdung);
            SqlParameter vatlieudechay = new SqlParameter("@vatlieudechay",SqlDbType.NVarChar);
            vatlieudechay.Value = ql.VatLieuDeChay;
            ds.Add(vatlieudechay);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds) ;
        }

    }
}