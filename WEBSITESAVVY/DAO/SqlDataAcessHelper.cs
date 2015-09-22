using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace WEBSITESAVVY.DAO
{
    public class SqlDataAcessHelper
    {
        /// <summary>
        /// gọi các store SELECT, không có tham số input
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable exStoreNoParas(string sql)
        {
            DataTable dt = new DataTable();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public static DataSet SeletSto(string sql)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        /// <summary>
        /// gọi các store SELECT, có tham số(s) input
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ds"></param>
        /// <returns></returns>
        public static DataTable exStoreParas(string sql, List<SqlParameter> ds)
        {
            DataTable dt = new DataTable();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ds.Count; i++)
                cmd.Parameters.Add(ds[i]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public static DataSet SeletSto2(string sql, List<SqlParameter> ds)
        {
            DataSet dse = new DataSet();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;           
            for (int i = 0; i < ds.Count; i++)
                cmd.Parameters.Add(ds[i]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dse);
            return dse;
        }
        /// <summary>
        /// gọi các store INSERT/ UPDATE/ DELETE, có tham số(s) input
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ds"></param>
        /// <returns></returns>
        public static bool exNonStoreParas(string sql, List<SqlParameter> ds)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand(sql, cn);
            
            cmd.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ds.Count; i++)
                cmd.Parameters.Add(ds[i]);
            try
            {
               
                cmd.ExecuteNonQuery();
                
            }
            catch (SqlException se)
            {
                throw se;
            }
            finally
            {
                cn.Close();
            }
            
            return true;
        }

        /// <summary>
        /// gọi các store INSERT/ UPDATE/ DELETE, kHONG có tham số input
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static bool exNonStoreNoParas(string sql)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (SqlException se)
            {
                throw se;
            }
            finally
            {
                cn.Close();
            }
            return true;
        }

        /// <summary>
        /// gọi các store RETURN first column of the first row
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static Object exScalarStore(string sql, List<SqlParameter> ds)
        {
            Object result = "";
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SAVVYConnectionString"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ds.Count; i++)
                cmd.Parameters.Add(ds[i]);
            try
            {
                result = cmd.ExecuteScalar();
            }
            catch (SqlException se)
            {
                throw se;
            }
            finally
            {
                cn.Close();
            }
            return result;
        }

    }
}