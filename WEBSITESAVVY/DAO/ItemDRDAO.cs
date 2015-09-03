using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class ItemDRDAO
    {
        public bool InsertNewItem(string name, int idloai)
        {
            string sql = "sp_Item_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.NVarChar);
            ten.Value = name;
            ds.Add(ten);
            SqlParameter matype = new SqlParameter("@matype", SqlDbType.Int);
            matype.Value = idloai;
            ds.Add(matype);
            
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateItem(int id, string ten)
        {
            string sql = "sp_Item_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter name = new SqlParameter("@ten", SqlDbType.NVarChar);
            name.Value = ten;           
            ds.Add(name);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DSItem(int maloai)
        {
            DataTable dt = new DataTable();
            string sql = "sp_Item_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maloai", SqlDbType.Int);
            ma.Value = maloai;
            ds.Add(ma);
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
            return dt;
        }
        public bool Delete(int id)
        {
            string sql = "sp_Item_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable ListItemAll()
        {
           
            string sql = "sp_Item_SelectAll";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
    }
}