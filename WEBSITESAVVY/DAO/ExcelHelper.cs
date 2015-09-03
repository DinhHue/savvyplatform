//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data.SqlClient;
//using WEBSITESAVVY.DAO;
//using WEBSITESAVVY.DTO;
//using System.Data.SqlClient;
//using System.Data;
//using System.IO;
//using System.Web.UI.HtmlControls;
//using System.Text;


//namespace WEBSITESAVVY.DAO
//{
//    public class ExcelHelper
//    {
//          //Row limits older excel verion per sheet, the row limit for excel 2003 is 65536
//        const int rowLimit = 65000;
 
//        //private static string getWorkbookTemplate()
//        //{
//        //    var sb = new StringBuilder(818);
//        //    sb.AppendFormat(@"{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"<?mso-application progid=""Excel.Sheet""??>{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"{0}", Environment.NewLine);
//        //    sb.AppendFormat(@" <Styles>{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  <Style ss:ID=""Default"" ss:Name=""Normal"">{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <alignment ss:vertical="" bottom="" />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <borders />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <font ss:fontname="" calibri="" x:family="" swiss="" x:size="" 11="" x:color="" />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <interior />{0}", Environment.NewLine);
//        //   // <interior ss:color="#800080" ss:pattern="Solid" />

//        //    sb.AppendFormat(@"   <numberformat />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <protection />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  </Style>{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  <Style ss:ID=""s62"">{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <font ss:fontname="" calibri="" x:family="" swiss="" x:size="" 11="" x:backgroundcolor="" x:color="" hold=" />            sb.AppendFormat(@" x:bold="" 1="" />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  </Style>{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  <Style ss:ID=""s63"">{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"   <numberformat ss:format="" short="" date="" />{0}", Environment.NewLine);
//        //    sb.AppendFormat(@"  </Style>{0}", Environment.NewLine);
//        //    sb.AppendFormat(@" </Styles>{0}", Environment.NewLine);
//        //    sb.Append(@"{0}\r\n");
//        //    return sb.ToString();
//        //}
 
//        private static string replaceXmlChar(string input)
//        {
//            input = input.Replace("&", "&amp");
//            input = input.Replace("<", "<");
//            input = input.Replace(">", ">");
//            input = input.Replace("\"", """);
//            input = input.Replace("'", "&apos;");
//            return input;
//        }
 
//        private static string getCell(Type type, object cellData)
//        {
//            var data = (cellData is DBNull) ? "" : cellData;
//            if (type.Name.Contains("Int") || type.Name.Contains("Double") || type.Name.Contains("Decimal")) return string.Format("<cell><data ss:type=\"Number\">{0}</data></cell>+", data);
//            if (type.Name.Contains("Date") && data.ToString() != string.Empty)
//            {
//                return string.Format("<cell ss:styleid='\'s63\"><data ss:type='\'DateTime\">{0}</data></cell>", Convert.ToDateTime(data).ToString("yyyy-MM-dd"));
//            }
//            return string.Format("<cell><data ss:type='\'String'\'>{0}</data></cell>", replaceXmlChar(data.ToString()));
//        }
//        //private static string getWorksheets(DataSet source)
//        //{
//        //    var sw = new StringWriter();
//        //    if (source == null || source.Tables.Count == 0)
//        //    {
//        //        sw.Write("<worksheet ss:name='\'Sheet1'\'>\r\n<table>\r\n<row><cell><data ss:type='\'String'\'></data></cell></row>\r\n</table>\r\n</worksheet>");
//        //        return sw.ToString();
//        //    }
//        //    foreach (DataTable dt in source.Tables)
//        //    {
//        //        if (dt.Rows.Count == 0)
//        //            sw.Write("<worksheet ss:name='\'>\r\n<table>\r\n<row><cell ss:styleid='\'s62\'><data ss:type='\'String\'></data></cell></row>\r\n</table>\r\n</worksheet>");
//        //        else
//        //        {
//        //            //write each row data                
//        //            var sheetCount = 0;
//        //            for (int i = 0; i < dt.Rows.Count; i++)
//        //            {
//        //                if ((i % rowLimit) == 0)
//        //                {
//        //                    //add close tags for previous sheet of the same data table
//        //                    if ((i / rowLimit) > sheetCount)
//        //                    {
//        //                        sw.Write("\r\n\r\n");
//        //                        sheetCount = (i / rowLimit);
//        //                    }
//        //                    sw.Write("\r\n<worksheet ss:name='\' mode=hold />(((i / rowLimit) == 0) ?  : Convert.ToString(i / rowLimit)) + '\'>\r\n<table>");
//        //                    //write column name row
//        //                    sw.Write("\r\n<ss:column ss:width='\'200\'/'>");
                         
 
//        //                    sw.Write("\r\n<row ss:height='\'20'\'>");
//        //                    foreach (DataColumn dc in dt.Columns)
//        //                        sw.Write(string.Format("<cell ss:bgcolor='\'red\ss:styleid='\'s62\><data ss:type='\'String\>{0}</data></cell>", replaceXmlChar(dc.ColumnName)));
//        //                    sw.Write("</row>");
//        //                }
//        //               // sw.Write("\r\n<ss:column ss:width="\"500\"/">");
//        //                sw.Write("\r\n<row ss:height='\'20'\'>");
//        //                foreach (DataColumn dc in dt.Columns)
//        //                    sw.Write(getCell(dc.DataType, dt.Rows[i][dc.ColumnName]));
//        //                sw.Write("</row>");
//        //            }
//        //            sw.Write("\r\n</ss:column></ss:column></table>\r\n");
//        //        }
//        //    }
 
//        //    return sw.ToString();
//        //}
//        public static string GetExcelXml(DataTable dtInput, string filename)
//        {
//            var excelTemplate = getWorkbookTemplate();
//            var ds = new DataSet();
//            ds.Tables.Add(dtInput.Copy());
//            var worksheets = getWorksheets(ds);
//            var excelXml = string.Format(excelTemplate, worksheets);
//            return excelXml;
//        }
 
//        public static string GetExcelXml(DataSet dsInput, string filename)
//        {
//            var excelTemplate = getWorkbookTemplate();
//            var worksheets = getWorksheets(dsInput);
//            var excelXml = string.Format(excelTemplate, worksheets);
//            return excelXml;
//        }
 
//        public static void ToExcel(DataSet dsInput, string filename, string fullPath)
//        {
//            var excelXml = GetExcelXml(dsInput, filename);
//            string str_FileName = fullPath;//"ExportData" +  System.DateTime.Now.Ticks.ToString() + ".xls";
//            // Open File stream for writing. 
//            FileStream fileStream;
//            StreamWriter streamWriter;
//            fileStream = new FileStream(str_FileName, FileMode.Create, FileAccess.ReadWrite);
//            //fileStream = new FileStream(serverPath + "Xls\\" + str_FileName, FileMode.Create, FileAccess.Write);
//            streamWriter = new StreamWriter(fileStream);
//            streamWriter.WriteLine(excelXml.ToString());
//            streamWriter.Close();
//            streamWriter.Dispose();
//            fileStream.Dispose();
//            fileStream.Close();
//            GC.Collect();
//        }
 
//       /* private void BindtoGrid(string maclaim)
//        {
//            try
//            {
//                SqlParameter[] param = new SqlParameter[1];
//                param[0] = new SqlParameter("@Date", SqlDbType.NVarChar);

//                //param[0].Value = DateTime.Now.Date.ToString("MM/dd/yyyy");
//                param[0].Value = "11/17/2012";//DateTime.Now.Date.ToString("MM/dd/yyyy");
//                //SqlDataReader dr = DBOPS.SqlHelper.ExecuteReader(objGlobal.connString, CommandType.StoredProcedure, "sp_rptBookOrderReportPerDay", param);
//                string sql="sp_Summary_selectAll";
//                DataTable dt = new DataTable();               
//                List<SqlParameter> list = new List<SqlParameter>();
//                SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
//                macl.Value = maclaim;
//                list.Add(macl);
//                dt= SqlDataAcessHelper.exStoreParas(sql, list);
//               // dt.Load(dr);
//                if (dt.Rows.Count > 0)
//                {
//                    string fileFullPath = string.Empty;

//                    string fileName = string.Concat("test.xls");
//                    string fullPath = string.Concat(Server.MapPath("../Reports/BookOrdersFile/"), fileName);
//                    //if (System.IO.File.Exists(fullPath))
//                    //    System.IO.File.Delete(fullPath);
//                    //GridViewExportUtil.ExportGrid(grd, fullPath);
//                    DataSet ds = new DataSet();
//                    ds.Tables.Add(dt);
//                    ExcelHelper.ToExcel(ds, fileName, fullPath);
//                    string strMessage = string.Empty;
//                    string strSubject = "Summary details";
//                   // clsGlobal objclsGlobal = new clsGlobal();
//                    SummaryDAO sm= new SummaryDAO();
//                    //strMessage = objclsGlobal.getMessage(Server.MapPath("..") + "//Email Templates//BookOrderPerDayEmail.htm");
//                    strMessage = sm.getMessage(Server.MapPath("..") + "//Email Templates//BookOrderPerDayEmail.htm");
//                    strMessage = strMessage.Replace("##Date", DateTime.Now.Date.ToString("MM/dd/yyyy"));
//                    //strMessage = strMessage.Replace("##OrderDetails", orderDetails);

//                    int res = objclsGlobal.BookOrderEmailAttachement("test@test.com", strMessage, strSubject, fullPath, fileName);
//                    // sendDailyNotificationEmail(fileName);
//                    //  int res1 = objclsGlobal.BookOrderEmail("test@test.com", strMessage, strSubject);
//                    // if (res == 1)
//                    Response.Write("email sent successfully");
//                }
//                else
//                {
//                    Response.Write("No record found");
//                }
//            }
//            catch (Exception ex)
//            {
//            }
//        }*/
    
//    }
//}