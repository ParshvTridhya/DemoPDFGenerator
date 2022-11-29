<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="DemoPDF.Reports.Reports" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script runat="server">  
  
      void Page_Load(object sender, EventArgs e)  
      {  
  
         if (!IsPostBack)  
         {  
  
            List<DemoPDF.Customers> customers = null;  
  
            using (ReportViewerMVC.EntityFrameworkTestEntities _entities = new ReportViewerMVC.EntityFrameworkTestEntities())  
            {  
  
               customers = _entities.Customers.ToList();  
  
               ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/MyReport.rdlc");  
  
  
               ReportDataSource RDS = new ReportDataSource("DataSet1", customers);  
  
               CrystalReportViewer1.ReportSource = RDS ;  
  
               CrystalReportViewer1.RefreshReport();  
  
            }  
  
         }  
      }
   </script> 
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        </div>
    </form>
</body>
</html>
