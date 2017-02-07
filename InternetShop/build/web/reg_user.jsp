<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<% String user = request.getParameter("login") ;
String fileName = request.getRealPath("WEB-INF\\base\\user\\")+"\\"+user+".info";
File f = new File (fileName);
byte[] ch = new byte[1];
ch[0] = 34;
String chrr = new String (ch);
%>
<html>
<head>
<title>Main</title>
</head>
<body>
<center>
<table width=100% border=0 cellSpacing=0 cellPadding=0>
<tr><th colspan=2><%@ include file = "header.jsp"%></th>
</tr>
<tr>
<td width=25% align=center valign=top bgcolor="azure">
    <%--
<%@ include file = "menu.jsp"%>
<br>
<%@ include file = "kalendar.jsp"%>
<br>
    --%>
</td>
<td valign=top bgcolor="azure" align=left>
<div style="margin:10px">
<% if (f.exists())
{ out.println("Користувач з таким іменем уже існує!");}
else {String password = request.getParameter("Pass1");
PrintWriter wr = new PrintWriter(new FileWriter(f));
wr.println(request.getParameter("Pass1"));
wr.println(request.getParameter("Name"));
wr.println(request.getParameter("Fam"));
wr.println(request.getParameter("age"));
wr.println(request.getParameter("Adress"));
wr.println(request.getParameter("city"));
wr.println(request.getParameter("country"));
wr.println(request.getParameter("phone"));
wr.println(request.getParameter("mail"));
wr.close();
out.println("<p>");
out.println("Користувач " + user + " зареєстрований!");
out.println("</p>");
out.print("<a href = "+chrr+"vhod.jsp?login="+user+"&passw="+password+chrr+">");
out.print("Війти в систему");
out.println("</a></p>");
};
%>
</div>
</td>
</tr>
<tr>
<%--<th colspan=2><%@ include file = "futer.jsp"%></th>--%>
</tr>
</table>
</center>
</html>