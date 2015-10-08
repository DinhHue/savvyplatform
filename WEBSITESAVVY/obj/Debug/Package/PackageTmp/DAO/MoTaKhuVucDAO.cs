using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class MoTaKhuVucDAO
    {
        public bool MoTaKhuVucMoi(MoTaKhuVuDTO mt)
        {
            string sql= "sp_MoTaKhuVucMoi";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idkhaosatruiro", SqlDbType.Int);
            id.Value = mt.Id;
            ds.Add(id);
            SqlParameter tenKV1 = new SqlParameter("@tenkv1", SqlDbType.NVarChar);
            tenKV1.Value = mt.TenKV1;
            ds.Add(tenKV1);
            SqlParameter tenKV2 = new SqlParameter("@tenkv2", SqlDbType.NVarChar);
            tenKV2.Value = mt.TenKV2;
            ds.Add(tenKV2);
            SqlParameter tenKV3 = new SqlParameter("@tenkv3",SqlDbType.NVarChar);
            tenKV3.Value = mt.TenKV3;
            ds.Add(tenKV3);
            SqlParameter namXDKV1 = new SqlParameter("@namxdkv1", SqlDbType.Int);
            namXDKV1.Value = mt.NamXD_ThueKV1;
            ds.Add(namXDKV1);
            SqlParameter namXDKV2 = new SqlParameter("@namxdkv2",SqlDbType.Int);
            namXDKV2.Value= mt.NamXD_ThueKV2;
            ds.Add(namXDKV2);
            SqlParameter namXDKV3 = new SqlParameter("@namxdkv3",SqlDbType.Int);
            namXDKV3.Value = mt.NamXD_ThueKV3;
            ds.Add(namXDKV3);
            SqlParameter hientrangKV1 = new SqlParameter("@hientrangkv1",SqlDbType.NVarChar);
            hientrangKV1.Value = mt.HienTrangKV1;
            ds.Add(hientrangKV1);
            SqlParameter hientrangKV2 = new SqlParameter("@hientrangkv2", SqlDbType.NVarChar);
            hientrangKV2.Value = mt.HienTrangKV2;
            ds.Add(hientrangKV2);
            SqlParameter hientrangKV3 = new SqlParameter("@hientrangkv3", SqlDbType.NVarChar);
            hientrangKV3.Value = mt.HienTrangKV3;
            ds.Add(hientrangKV3);

            SqlParameter solauKV1 = new SqlParameter("@solaukv1",SqlDbType.NVarChar);
            solauKV1.Value = mt.SoLau_ChieuCaoKV1;
            ds.Add(solauKV1);
            SqlParameter solauKV2 = new SqlParameter("@solaukv2", SqlDbType.NVarChar);
            solauKV2.Value = mt.SoLau_ChieuCaoKV2;
            ds.Add(solauKV2);
            SqlParameter solauKV3 = new SqlParameter("@solaukv3", SqlDbType.NVarChar);
            solauKV3.Value = mt.SoLau_ChieuCaoKV3;
            ds.Add(solauKV3);

            SqlParameter tuongvachKV1 = new SqlParameter("@tuongvachkv1", SqlDbType.NVarChar);
            tuongvachKV1.Value = mt.Tuong_VachKV1;
            ds.Add(tuongvachKV1);
            SqlParameter tuongvachKV2 = new SqlParameter("@tuongvachkv2", SqlDbType.NVarChar);
            tuongvachKV2.Value = mt.Tuong_VachKV2;
            ds.Add(tuongvachKV2);
            SqlParameter tuongvachKV3 = new SqlParameter("@tuongvachkv3", SqlDbType.NVarChar);
            tuongvachKV3.Value = mt.Tuong_VachKV3;
            ds.Add(tuongvachKV3);

            SqlParameter maiKV1 = new SqlParameter("@maitrankv1", SqlDbType.NVarChar);
            maiKV1.Value = mt.Mai_Tran_SanKV1;
            ds.Add(maiKV1);
            SqlParameter maiKV2 = new SqlParameter("@maitrankv2", SqlDbType.NVarChar);
            maiKV2.Value = mt.Mai_Tran_SanKV2;
            ds.Add(maiKV2);
            SqlParameter maiKV3 = new SqlParameter("@maitrankv3",SqlDbType.NVarChar);
            maiKV3.Value = mt.Mai_Tran_SanKV3;
            ds.Add(maiKV3);
            
            SqlParameter dientichKV1 = new SqlParameter("@dientichkv1", SqlDbType.NVarChar);
            dientichKV1.Value = mt.DienTichKV1;
            ds.Add(dientichKV1);
            SqlParameter dientichKV2 = new SqlParameter("@dientichkv2", SqlDbType.NVarChar);
            dientichKV2.Value = mt.DienTichKV2;
            ds.Add(dientichKV2);
            SqlParameter dientichKV3 = new SqlParameter("@dientichkv3", SqlDbType.NVarChar);
            dientichKV3.Value = mt.DienTichKV3;
            ds.Add(dientichKV3);

            SqlParameter giohdKV1 = new SqlParameter("@giohoatdongkv1",SqlDbType.NVarChar);
            giohdKV1.Value = mt.GioHoatDongKV1;
            ds.Add(giohdKV1);
            SqlParameter giohdKV2 = new SqlParameter("@giohoatdongkv2", SqlDbType.NVarChar);
            giohdKV2.Value = mt.GioHoatDongKV2;
            ds.Add(giohdKV2);
            SqlParameter giohdKV3 = new SqlParameter("@giohoatdongkv3", SqlDbType.NVarChar);
            giohdKV3.Value = mt.GioHoatDongKV3;
            ds.Add(giohdKV3);

            SqlParameter cacmattgKV1 = new SqlParameter("@cacmattiepgiapkv1", SqlDbType.NVarChar);
            cacmattgKV1.Value = mt.CacMatTiepGiapKV1;
            ds.Add(cacmattgKV1);
            SqlParameter cacmattgKV2 = new SqlParameter("@cacmattiepgiapkv2", SqlDbType.NVarChar);
            cacmattgKV2.Value = mt.CacMatTiepGiapKV2;
            ds.Add(cacmattgKV2);
            SqlParameter cacmattgKV3 = new SqlParameter("@cacmattiepgiapkv3", SqlDbType.NVarChar);
            cacmattgKV3.Value = mt.CacMatTiepGiapKV3;
            ds.Add(cacmattgKV3);

            SqlParameter soluongvoiccKV1 = new SqlParameter("@soluonghopvoicckv1", SqlDbType.NVarChar);
            soluongvoiccKV1.Value = mt.SoLuongHop_VoiChuaChayKV11;
            ds.Add(soluongvoiccKV1);
            SqlParameter soluongvoiccKV2 = new SqlParameter("@soluonghopvoicckv2", SqlDbType.NVarChar);
            soluongvoiccKV2.Value = mt.SoLuongHop_VoiChuaChayKV21;
            ds.Add(soluongvoiccKV2);
            SqlParameter soluongvoiccKV3 = new SqlParameter("@soluonghopvoicckv3", SqlDbType.NVarChar);
            soluongvoiccKV3.Value = mt.SoLuongHop_VoiChuaChayKV31;
            ds.Add(soluongvoiccKV3);

            SqlParameter soluongbinhcckv1 = new SqlParameter("@soluongbinhcckv1",SqlDbType.Int);
            soluongbinhcckv1.Value = mt.SoLuongBinhChuaChayKV11;
            ds.Add(soluongbinhcckv1);
            SqlParameter soluongbinhcckv2 = new SqlParameter("@soluongbinhcckv2",SqlDbType.Int);
            soluongbinhcckv2.Value = mt.SoLuongBinhChuaChayKV21;
            ds.Add(soluongbinhcckv2);
            SqlParameter soluongbinhcckv3 = new SqlParameter("@soluongbinhcckv3",SqlDbType.Int);
            soluongbinhcckv3.Value = mt.SoLuongBinhChuaChayKV31;
            ds.Add(soluongbinhcckv3);

            SqlParameter htbdkv1 = new SqlParameter("@htbdkv1", SqlDbType.NVarChar);
            htbdkv1.Value = mt.HeThongBaoDongKV11;
            ds.Add(htbdkv1);
            SqlParameter htbdkv2 = new SqlParameter("@htbdkv2", SqlDbType.NVarChar);
            htbdkv2.Value = mt.HeThongBaoDongKV21;
            ds.Add(htbdkv2);
            SqlParameter htbdkv3 = new SqlParameter("@htbdkv3", SqlDbType.NVarChar);
            htbdkv3.Value = mt.HeThongBaoDongKV31;
            ds.Add(htbdkv3);

            SqlParameter htcctdkv1 = new SqlParameter("@htcctdkv1", SqlDbType.NVarChar);
            htcctdkv1.Value = mt.HeThongChuaChayTuDongKV11;
            ds.Add(htcctdkv1);
            SqlParameter htcctdkv2 = new SqlParameter("@htcctdkv2", SqlDbType.NVarChar);
            htcctdkv2.Value = mt.HeThongChuaChayTuDongKV21;
            ds.Add(htcctdkv2);
            SqlParameter htcctdkv3 = new SqlParameter("@htcctdkv3", SqlDbType.NVarChar);
            htcctdkv3.Value = mt.HeThongChuaChayTuDongKV31;
            ds.Add(htcctdkv3);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds) ;
        }
    }
}