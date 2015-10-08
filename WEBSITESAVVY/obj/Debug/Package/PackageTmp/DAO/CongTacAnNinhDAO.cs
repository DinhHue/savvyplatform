using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class CongTacAnNinhDAO
    {
        public bool CongtacAnNinhMoi(CongTacAnNinhDTO ct)
        {
            string sql= "sp_CongTacAnNinhMoi";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ct.Id;
            ds.Add(id);
            SqlParameter lapdathtbt = new SqlParameter("@lapdathtbt", SqlDbType.NVarChar);
            lapdathtbt.Value = ct.LapDatHTBT;
            ds.Add(lapdathtbt);
            SqlParameter hoatdonggiamsat = new SqlParameter("@hoatdonggiamsat", SqlDbType.NVarChar);
            hoatdonggiamsat.Value = ct.HoatDongGiamSat;
            ds.Add(hoatdonggiamsat);
            SqlParameter cameraanninh = new SqlParameter("@cameraaninh",SqlDbType.NVarChar);
            cameraanninh.Value = ct.CameraAnNinh;
            ds.Add(cameraanninh);

            SqlParameter hopdongBT = new SqlParameter("@hopdongbaotri", SqlDbType.NVarChar);
            hopdongBT.Value = ct.HopDongBaoTri;
            ds.Add(hopdongBT);

            SqlParameter khoachim = new SqlParameter("@khoachim",SqlDbType.NVarChar);
            khoachim.Value = ct.KhoaChim;
            ds.Add(khoachim);

            SqlParameter thietkekhoacuaso = new SqlParameter("@thietkekhoacuaso", SqlDbType.NVarChar);
            thietkekhoacuaso.Value = ct.ThietKeKhoaCuaSo;
            ds.Add(thietkekhoacuaso);
            SqlParameter baove = new SqlParameter("@baove",SqlDbType.NVarChar);
            baove.Value = ct.BaoVe;
            ds.Add(baove);
            SqlParameter nguonthuoctruc = new SqlParameter("@nguonthuongtruc",SqlDbType.NVarChar);
            nguonthuoctruc.Value = ct.NguoiThuongTruc;
            ds.Add(nguonthuoctruc);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
    }
}