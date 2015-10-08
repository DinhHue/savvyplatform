using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class KhaoSatRuiRoDAO
    {
        public bool KhaoSatRuiRoMoi(KhaoSatRuiRoDTO ksrr)
        {  
            string sql= "sp_KhaoSatRuiRoMoi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maGDV1= new SqlParameter("@magdv1",SqlDbType.Int);
            maGDV1.Value= ksrr.MaGDV1;
            ds.Add(maGDV1);
            SqlParameter maGDV2= new SqlParameter("@magdv2",SqlDbType.Int);
            maGDV2.Value= ksrr.MaGDV2;
            ds.Add(maGDV2);
            SqlParameter maGDV3= new SqlParameter("@magdv3",SqlDbType.Int);
            maGDV3.Value= ksrr.MaGDV3;
            ds.Add(maGDV3);
            SqlParameter maGDV4= new SqlParameter("@magdv4",SqlDbType.Int);
            maGDV4.Value= ksrr.MaGDV4;
            ds.Add(maGDV4);

            SqlParameter thamChieu= new SqlParameter("@thamchieu",SqlDbType.VarChar);
            thamChieu.Value= ksrr.ThamChieu;
            ds.Add(thamChieu);

            SqlParameter madvBH= new SqlParameter("@madonviBH",SqlDbType.Int);
            madvBH.Value= ksrr.Id_DonViBaoHiem;
            ds.Add(madvBH);

            SqlParameter hieuluc= new SqlParameter("@hieuluc",SqlDbType.VarChar);
            hieuluc.Value=ksrr.HieuLuc;
            ds.Add(hieuluc);

            SqlParameter soHDBH= new SqlParameter("@sohdbh", SqlDbType.VarChar);
            soHDBH.Value= ksrr.SoHDBH;
            ds.Add(soHDBH);

            SqlParameter nguoiDuocBH= new SqlParameter("@nguoiduocBH", SqlDbType.NVarChar);
            nguoiDuocBH.Value= ksrr.NguoiDuocBH;
            ds.Add(nguoiDuocBH);

            SqlParameter diaChi= new SqlParameter("@diachi", SqlDbType.NVarChar);
            diaChi.Value= ksrr.DiaChi;
            ds.Add(diaChi);

            SqlParameter fax= new SqlParameter("@fax",SqlDbType.VarChar);
            fax.Value= ksrr.Fax;
            ds.Add(fax);

            SqlParameter nguoiLienHe= new SqlParameter("@nguoilienhe",SqlDbType.NVarChar);
            nguoiLienHe.Value= ksrr.NguoiLienHe;
            ds.Add(nguoiLienHe);

            SqlParameter dienThoai= new SqlParameter("@dienthoai", SqlDbType.VarChar);
            dienThoai.Value= ksrr.DienThoai;
            ds.Add(dienThoai);

            SqlParameter email= new SqlParameter("@email", SqlDbType.VarChar);
            email.Value= ksrr.Email;
            ds.Add(email);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public int LayMaKhaoSatRuiRo(string thamchieu)
        {
            string sql= "sp_LayMaKhaoSatRuiRo";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tc = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            tc.Value = thamchieu;
            ds.Add(tc);
            
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql,ds);
            int ma = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = int.Parse(dr[0].ToString());
            }
            return ma;
        }
        public bool CapNhatYkienGDV(int id,string ykien, string TGBD,string TGKT)
        {
            string sql= "sp_CapNhatYKienGDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter Id = new SqlParameter("@id", SqlDbType.Int);
            Id.Value = id;
            ds.Add(Id);
            SqlParameter Ykien = new SqlParameter("@ykien",SqlDbType.NVarChar);
            Ykien.Value = ykien;
            ds.Add(Ykien);
            SqlParameter thoigianBD = new SqlParameter("@thoigianbatdau",SqlDbType.VarChar);
            thoigianBD.Value = TGBD;
            ds.Add(thoigianBD);
            SqlParameter thoigianKT = new SqlParameter("@thoigianketthuc", SqlDbType.VarChar);
            thoigianKT.Value = TGKT;
            ds.Add(thoigianKT);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds) ;
        }
        public DataTable LayKhaoSatRuiRoTheoThamChieu(string thamchieu)
        {
            DataTable dt = new DataTable();
            string sql= "sp_LayKhaoSatRuiRoTheoThamChieu";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamChieu = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            thamChieu.Value = thamchieu;
            ds.Add(thamChieu);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);           
            return dt;
        }
        public bool KiemTraThamChieuKSRR(string thamchieu)
        {
            string sql= "sp_KiemTraThamCHieu";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter tc = new SqlParameter("@thamchieu",SqlDbType.VarChar);
            tc.Value = thamchieu;
            ds.Add(tc);
            
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql,ds);
            bool kt= false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;            
        }
        public DataTable LayKhaoSatRuiRo(string thamchieu)
        {
            DataTable dt = new DataTable();
            String sql = "sp_LayKhaoSatRuiRoTheoThamChieu";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
    }
}