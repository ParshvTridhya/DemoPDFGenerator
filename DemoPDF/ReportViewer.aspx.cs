using DemoPDF.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoPDF
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var reportName = "";
                var Datasource = (object)null;
                if (Request.QueryString["Report"] == "COGNIVOReport")
                {
                    reportName = "COGNIVOReport.rdlc";
                    //Create 
                    Datasource = new COGNIVOReportModel();
                }
                ReportViewer1.LocalReport.ReportPath = Server.MapPath(string.Format("~/Report/{0}", reportName));
                ReportDataSource RDS = new ReportDataSource("DataSet1", Datasource);
                ReportViewer1.LocalReport.DataSources.Add(RDS);
                ReportViewer1.LocalReport.Refresh();

            }
            ReportViewer1.LocalReport.Refresh();
        }
    }
}