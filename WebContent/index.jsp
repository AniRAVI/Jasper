<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="net.sf.jasperreports.view.*"%>
    <%@page import="net.sf.jasperreports.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>

<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=null;
response.setContentType("application/pdf");
try {
//Connecting to the MySQL database

Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "root");

		//	String report = "C:\\Users\\IBM_ADMIN\\ToolsReport.jrxml";
		String report = "C:\\TrainingTool\\JasperReport\\WebContent\\ToolsReport.jrxml";


JasperReport jasperreport=JasperCompileManager.compileReport(report);
JasperPrint jp=JasperFillManager.fillReport(jasperreport, null,conn);
//JasperExportManager.exportReportToPdf(jp);
OutputStream outStream = response.getOutputStream();
JasperExportManager.exportReportToPdfStream(jp, outStream);
System.out.println("Jasper REPORT ");

//JasperViewer.viewReport(jp);

}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>