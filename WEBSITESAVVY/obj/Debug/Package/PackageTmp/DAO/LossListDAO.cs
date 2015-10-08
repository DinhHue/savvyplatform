using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
namespace WEBSITESAVVY.DAO
{
    public class LossListDAO
    {
        public bool Insert(LossListDTO l)
        {
            string sql = "sp_LostList_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value=l.TenHangMuc;
            ds.Add(diengiai);

            SqlParameter soluong= new SqlParameter("@soluong", SqlDbType.Float);
            soluong.Value=l.SoLuong;
            ds.Add(soluong);

            SqlParameter donvi= new SqlParameter("@donvi", SqlDbType.Int);
            donvi.Value=l.MaDonViTinh;
            ds.Add(donvi);

            SqlParameter ghichu= new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value=l.GhiChu;
            ds.Add(ghichu);

            SqlParameter loai= new SqlParameter("@loai", SqlDbType.Int);
            loai.Value=l.LoaiHangMuc;
            ds.Add(loai);

            SqlParameter idclaim= new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value=l.MaClaim;
            ds.Add(idclaim);
            bool kq = false;
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool Update(LossListDTO l)
        {
            string sql = "sp_LostList_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = l.TenHangMuc;
            ds.Add(diengiai);

            SqlParameter soluong = new SqlParameter("@soluong", SqlDbType.Float);
            soluong.Value = l.SoLuong;
            ds.Add(soluong);

            

            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = l.GhiChu;
            ds.Add(ghichu);         

            SqlParameter id = new SqlParameter("@malostlist", SqlDbType.Int);
            id.Value = l.MaLossList;
            ds.Add(id);
            bool kq = false;
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }

        public void UpdateRowIndex(IDictionary<int, int> Dic)
        {
            string sql = "sp_LostList_UpdateRowIndex";

            foreach (KeyValuePair<int, int> entry in Dic)
            {
                // do something with entry.Value or entry.Key

                List<SqlParameter> ds = new List<SqlParameter>();
                ds.Add(new SqlParameter("@idLosslist", entry.Key ));
                ds.Add(new SqlParameter("@rowIndex", entry.Value ));

                SqlDataAcessHelper.exNonStoreParas(sql, ds);
            }

        }

        public bool Delete(int ma)
        {
            string sql = "sp_LostList_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@malostlist", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            bool kq = false;
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }

        public DataTable Select(string idclaim)
        {
            string sql = "sp_LostList_SelectAll";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }

        public static DataTable SelectClaimDetail(string idclaim, int idLoaiHangMuc)
        {
            string sql = "sp_LostList_Select_Claim_LoaiHangMuc";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@claimID", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            SqlParameter paramLoaiHangMuc = new SqlParameter("@idLoaiHangMuc", SqlDbType.VarChar);
            paramLoaiHangMuc.Value = idLoaiHangMuc;
            ds.Add(paramLoaiHangMuc);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}