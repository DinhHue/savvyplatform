using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class TienDoXuLyDAO
    {
        public bool ThemTienDoXyLy(TienDoXyLyDTO td)
        {
            string sql = "sp_TienDoXuLy_insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = td.MaClaim;
            ds.Add(thamchieu);
            //SqlParameter stt = new SqlParameter("@stt", SqlDbType.Int);
            //stt.Value = td.Stt;
            //ds.Add(stt);
            SqlParameter hosoYC = new SqlParameter("@hosoyeucau", SqlDbType.NVarChar);
            hosoYC.Value = td.HoSoYeuCau;
            ds.Add(hosoYC);
            SqlParameter tinhtrang = new SqlParameter("@tinhtrang",SqlDbType.NVarChar);
            tinhtrang.Value = td.TinhTrang;
            ds.Add(tinhtrang);
            SqlParameter phuongan = new SqlParameter("@phuongandexuat",SqlDbType.NVarChar);
            phuongan.Value = td.PhuongAnDeXuat;
            ds.Add(phuongan);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);

        }
        public bool CapNhatTienDoXuLy(TienDoXyLyDTO td)
        {
            string sql = "sp_TienDoXuLy_update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = td.MaClaim;
            ds.Add(thamchieu);
            SqlParameter tiendo = new SqlParameter("@idtiendo", SqlDbType.Int);
            tiendo.Value = td.MaTienDo;
            ds.Add(tiendo);
            SqlParameter hosoYC = new SqlParameter("@hosoyeucau", SqlDbType.NVarChar);
            hosoYC.Value = td.HoSoYeuCau;
            ds.Add(hosoYC);
            SqlParameter tinhtrang = new SqlParameter("@tinhtrang", SqlDbType.NVarChar);
            tinhtrang.Value = td.TinhTrang;
            ds.Add(tinhtrang);
            SqlParameter phuongan = new SqlParameter("@phuongandexuat", SqlDbType.NVarChar);
            phuongan.Value = td.PhuongAnDeXuat;
            ds.Add(phuongan);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool XoaTienDoXuLy(string matc, int matiendo)
        {
            string sql = "sp_TienDoXuLy_delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = matc;
            ds.Add(thamchieu);
            SqlParameter sott = new SqlParameter("@matiendo", SqlDbType.Int);
            sott.Value = matiendo;
            ds.Add(sott);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DanhSachTienDoXuLy(string matc)
        {
            string sql = "sp_TienDoXuLy_select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = matc;
            ds.Add(thamchieu);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public int SoLuongTienDoXuLy(string macl)
        {
            string sql = "sp_TienDoXuLy_DemSL";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = macl;
            ds.Add(thamchieu);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int sl = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                sl= int.Parse(dr[0].ToString());
            }
            return sl;
        }
        public TienDoXyLyDTO Lay1TienDoXuLy(string matc,int matt)
        {
            TienDoXyLyDTO td = new TienDoXyLyDTO();
            string sql = "sp_TienDoXuLy_selectMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamchieu = new SqlParameter("@idclaim", SqlDbType.VarChar);
            thamchieu.Value = matc;
            ds.Add(thamchieu);
            SqlParameter matiendo = new SqlParameter("@idtiendo", SqlDbType.Int);
            matiendo.Value = matt;
            ds.Add(matiendo);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                td.MaClaim = dr[1].ToString();
                td.HoSoYeuCau = dr[3].ToString();
                td.TinhTrang = dr[4].ToString();
                td.PhuongAnDeXuat = dr[5].ToString();
            }
            return td;
        }
    }
}