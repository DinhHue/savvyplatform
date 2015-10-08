using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class TaiSanDAO
    {
        public bool HienTrangTonThatMoi(TaiSanDTO ts)
        {
            string sql= "sp_HienTrangTonThatClaimMoi";
            List<SqlParameter>ds= new List<SqlParameter>();

            SqlParameter maclaim = new SqlParameter("@maclaim",SqlDbType.NVarChar);
            maclaim.Value = ts.MaClaim;
            ds.Add(maclaim);

            SqlParameter nhaxuong = new SqlParameter("@nhaxuong", SqlDbType.NVarChar);
            nhaxuong.Value = ts.NhaXuong;
            ds.Add(nhaxuong);

            SqlParameter vatkientruc = new SqlParameter("@vatkientruc", SqlDbType.NVarChar);
            vatkientruc.Value = ts.VatKienTruc;
            ds.Add(vatkientruc);

            SqlParameter maymoc = new SqlParameter("@maymoc", SqlDbType.NVarChar);
            maymoc.Value = ts.MayMoc;
            ds.Add(maymoc);

            SqlParameter congcudungcu = new SqlParameter("@congcudungcu", SqlDbType.NVarChar);
            congcudungcu.Value = ts.CongCuDungCu;
            ds.Add(congcudungcu);

            SqlParameter thietbiVP = new SqlParameter("@thietbiVP", SqlDbType.NVarChar);
            thietbiVP.Value = ts.ThietBiVP;
            ds.Add(thietbiVP);

            SqlParameter nguyenvatlieu = new SqlParameter("@nguyenvatlieu", SqlDbType.NVarChar);
            nguyenvatlieu.Value = ts.NguyenVatLieu;
            ds.Add(nguyenvatlieu);

            SqlParameter banthanhpham = new SqlParameter("@banthanhpham", SqlDbType.NVarChar);
            banthanhpham.Value = ts.BanThanhPham;
            ds.Add(banthanhpham);

            SqlParameter thanhpham = new SqlParameter("@thanhpham", SqlDbType.NVarChar);
            thanhpham.Value = ts.ThanhPHam;
            ds.Add(thanhpham);

            SqlParameter vatdungkhac = new SqlParameter("@vatdungkhac", SqlDbType.NVarChar);
            vatdungkhac.Value = ts.VatDungKhac;
            ds.Add(vatdungkhac);

            SqlParameter ykien = new SqlParameter("@ykien",SqlDbType.NVarChar);
            ykien.Value = ts.YKienGDV;
            ds.Add(ykien);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}