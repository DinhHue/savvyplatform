using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class DRDAO
    {
        public bool Insert(DRDTO dr)
        {
            string sql = "sp_DocsRequest_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maloaidr = new SqlParameter("@maloaiDR", SqlDbType.Int);
            maloaidr.Value = dr.MaLoaiDR;
            ds.Add(maloaidr);

            SqlParameter maitem = new SqlParameter("@maitem", SqlDbType.Int);
            maitem.Value = dr.MaItem;
            ds.Add(maitem);

            SqlParameter maclaim = new SqlParameter("@maclaim", SqlDbType.NVarChar);
            maclaim.Value = dr.MaClaim;
            ds.Add(maclaim);
            SqlParameter ten = new SqlParameter("@tenDR", SqlDbType.NVarChar);
            ten.Value = dr.TenDR;
            ds.Add(ten);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable ItemlistDR(string maclaim, int maloaiDR)
        {
            string sql = "sp_DocsRequest_Select";
            DataTable dt = new DataTable();
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maclaim", SqlDbType.NVarChar);
            id.Value = maclaim;
            ds.Add(id);
            SqlParameter ml = new SqlParameter("@maloaiDR", SqlDbType.Int);
            ml.Value = maloaiDR;
            ds.Add(ml);
       
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
          
            return dt;
        }
        public DataTable ItemListUpdate(string maclaim)
        {
            string sql = "sp_DocsRequesr_SelectAllClaim";
            DataTable dt = new DataTable();
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maclaim", SqlDbType.NVarChar);
            id.Value = maclaim;
            ds.Add(id);            
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateDocsRequest(DRDTO dr)
        { 
            string sql = "sp_DocsRequest_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maDR", SqlDbType.Int);
            id.Value = dr.MaDR;
            ds.Add(id);  
            SqlParameter ten = new SqlParameter("@tendr", SqlDbType.NVarChar);
            ten.Value = dr.TenDR;
            ds.Add(ten);  
            SqlParameter tinhtrang = new SqlParameter("@tinhtrang", SqlDbType.NVarChar);
            tinhtrang.Value = dr.TinhTrang;
            ds.Add(tinhtrang);
            SqlParameter ngaynhan = new SqlParameter("@ngaynhan", SqlDbType.Date);
            ngaynhan.Value = dr.NgayNhan;
            ds.Add(ngaynhan);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool DeleteDocsRequest(int id)
        {
            string sql = "sp_DocsRequest_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}