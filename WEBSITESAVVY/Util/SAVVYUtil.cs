using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Util
{
    public class SAVVYUtil
    {
        public static string GetMD5Hash(string input)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            return (s.ToString());
        }

        public static String getRoman(int number)
        {
            String[] riman = { "M", "XM", "CM", "D", "XD", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
            int[] arab = { 1000, 990, 900, 500, 490, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
            StringBuilder result = new StringBuilder();
            int i = 0;
            while (number > 0 || arab.Length == (i - 1))
            {
                while ((number - arab[i]) >= 0)
                {
                    number -= arab[i];
                    result.Append(riman[i]);
                }
                i++;
            }

            return result.ToString();
        }

        public static void fixBugValueClaim()
        {
            String sql = "SELECT cl.ID_CLAIM FROM CLAIM cl";
            DataTable dt = SqlDataAcessHelper.exQuery(sql);
            foreach (DataRow row in dt.Rows)
            {
                String idClaim = row["ID_CLAIM"].ToString();

                fixBugValueClaim(idClaim);
            }
        }

        public static void fixBugValueClaim(String idClaim)
        {
            //Add colums update
            //String[]colums = { "DienBienTonThat", "PhamViTonThat", "DePhongVaKhuyenCao", "YKienGDV", "GioiThieu" };

            String sql = "SELECT * FROM CLAIM WHERE ID_CLAIM = " + idClaim;
            DataTable dt = SqlDataAcessHelper.exQuery(sql);
            if (dt.Rows.Count == 1)
            {
                DataRow row = dt.Rows[0];

                ClaimDAO claimDao = new ClaimDAO();


                foreach (DataColumn c in dt.Columns)
                {
                    String key = c.ColumnName;
                    if (key!= "ID_Claim" && row[key] != null)
                    {

                        String valueOld = row[key].ToString();
                        if (valueOld.StartsWith("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n"))
                        {
                            String valueNew = valueOld.Replace("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n", "").Replace("\r\n</body>\r\n</html>", "");

                            claimDao.updateClaimField(idClaim, key, valueNew);
                        }
                    }
                }


            }
        }
    }
}