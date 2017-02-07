<%@page import = "java.io.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Model</title></head>
<body>
<center>
<table width=100% border=0 cellSpacing=0 cellPadding=0>
<tr><th colspan=2><%@ include file = "header.jsp"%></th>
</tr>
<tr>
<td width=25% align=center valign=top bgcolor=azure>
<%@ include file = "login.jsp"%>
<br>
<%--<%@ include file = "menu.jsp"%><br><%@ include file = "kalendar.jsp"%> В процесі розробки --%>
<br>
</td>
<td valign=top bgcolor=azure align=center>
<div style="margin:20px">
<% String fName = request.getParameter("name");
String path= request.getRealPath("WEB-INF/base/katalog");
BufferedReader in = new BufferedReader(new FileReader(path+"/"+fName+".txt"));
String Name = new String (in.readLine());
String Description = new String (in.readLine());
String Price = new String (in.readLine());
%>
<img width="300" height="300" src = "
<% String pPath = path + "/"+"images\\" + fName + ".jpg";
File picture = new File (pPath);
out.println(pPath);
%>
">
<table border=0 align=center>
<tr><td valign=top><strong>Название:</strong></td><td valign=top><%=Name%></td>
</tr>
<tr><td valign=top><strong>Описание:</strong></td><td valign=top><%=Description%></td>
</tr>
<tr><td valign=top><strong>Цена:</strong></td><td valign=top><%=Price%> тенге</td>
</tr>
<tr>
<td colspan=2 align=center>
<% if (user != "") { %>
<form name = "fff" action = "new_korzina.jsp?<%=request.getParameter("name")%>=1" method = "post">
<input type = "submit" value = "Заказати"><br>
</form>
<%}%>
</td>
</tr>
<tr>
<td colspan=2 align=center>
[ <a href = "katalog.jsp?start=1">Назад до списку товарів<a/> ]<br>
[ <a href="index.jsp">На головну сторінку</a> ]
</td>
</tr>
</table>
<% in.close(); %>
</div></td></tr>
<%--<tr><th colspan=2><%@ include file = "futer.jsp"%></th> В процесі розробки %-->
</tr></table></center></body></html>