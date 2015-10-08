using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class NhanDienRuiRoDAO
    {
        public bool NhanDienRuiRoMoi(NhanDienRuiRoDTO nd)
        {
            string sql= "sp_NhanDienRuiRoMoi" ;
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id",SqlDbType.Int);
            id.Value = nd.Id;
            ds.Add(id);
            SqlParameter esp = new SqlParameter("@esp",SqlDbType.NVarChar);
            esp.Value = nd.Eps;
            ds.Add(esp);
            SqlParameter gannguonnuoc = new SqlParameter("@gannguonnuoc", SqlDbType.NVarChar);
            gannguonnuoc.Value = nd.GanNguonNuoc;
            ds.Add(gannguonnuoc);
            SqlParameter ngaybaotrigannhat = new SqlParameter("@ngaybaotrigannhat",SqlDbType.NVarChar);
            ngaybaotrigannhat.Value = nd.NgayBaoTriDienGanNhat;
            ds.Add(ngaybaotrigannhat);
            SqlParameter dinhky = new SqlParameter("@dinhky",SqlDbType.NVarChar);
            dinhky.Value = nd.DinhKy;
            ds.Add(dinhky);
            SqlParameter xulyrac = new SqlParameter("@xulyrac", SqlDbType.NVarChar);
            xulyrac.Value = nd.XuLyRac;
            ds.Add(xulyrac);
            SqlParameter hancat = new SqlParameter("@hancat",SqlDbType.NVarChar);
            hancat.Value = nd.HanCat;
            ds.Add(hancat);
            SqlParameter quidinhphatsinhnhiet = new SqlParameter("@quidinhphatsinhnhiet", SqlDbType.NVarChar);
            quidinhphatsinhnhiet.Value = nd.QuiDinhPhatSinhNhiet;
            ds.Add(quidinhphatsinhnhiet);
            SqlParameter dungcuphunson = new SqlParameter("@dungcuphunson", SqlDbType.NVarChar);
            dungcuphunson.Value = nd.DungCuPhunSon;
            ds.Add(dungcuphunson);
            SqlParameter htthonggio = new SqlParameter("@htthonggio",SqlDbType.NVarChar);
            htthonggio.Value = nd.HTThongGio;
            ds.Add(htthonggio);
            SqlParameter htpccc = new SqlParameter("@htpccc",SqlDbType.NVarChar);
            htpccc.Value = nd.HTPCCC;
            ds.Add(htpccc);
            SqlParameter naubep = new SqlParameter("@naubep", SqlDbType.NVarChar);
            naubep.Value = nd.NauBep;
            ds.Add(naubep);
            SqlParameter vesinh = new SqlParameter("@vesinh", SqlDbType.NVarChar);
            vesinh.Value = nd.VeSinh;
            ds.Add(vesinh);
            SqlParameter danhgiactvs = new SqlParameter("@danhgiactvs", SqlDbType.NVarChar);
            danhgiactvs.Value = nd.DanhGiaCTVS;
            ds.Add(danhgiactvs);
            SqlParameter khoangcach = new SqlParameter("@khoangcach",SqlDbType.NVarChar);
            khoangcach.Value = nd.KhoangCach;
            ds.Add(khoangcach);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}