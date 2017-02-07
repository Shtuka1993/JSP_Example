<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.io.*"%>
<html>
<body>
<center>
<table width=100% border=0 cellSpacing=0 cellPadding=0>
<tr><th colspan=2><%@ include file = "header.jsp"%></th>
</tr>
<tr>
<td width=25% align=center valign=top bgcolor="azure">
<%@ include file = "login.jsp"%><%--
<br>
<%@ include file = "menu.jsp"%>
<br>
<%@ include file = "kalendar.jsp"%>
<br>--%>
</td>
<td valign=top bgcolor="azure" align=left>
<%
if (user=="") out.println("Cпочатку заеєструйтеся!");
else
{
String bPath = request.getRealPath("WEB-INF\\base\\korzina");
bPath = bPath + "\\" + user+"\\";
File fold = new File (bPath);
if (!fold.exists())
fold.mkdir();
Enumeration enu = request.getParameterNames();
while (enu.hasMoreElements())
{
String paramName = (String) enu.nextElement();
String bbPath= request.getRealPath("WEB-INF/base/katalog");
String bFileName = bbPath + "\\" + paramName + ".txt";
File fff = new File (bFileName);
if (fff.exists())
{
String val = (String) request.getParameter(paramName);
PrintWriter fout = new PrintWriter(new FileWriter(bPath + "\\" + paramName));
fout.println(val);
fout.close();
}
}
}
response.sendRedirect("korzyna.jsp");%>
</td>
</tr>
</table>
</center>
</body>
</html>