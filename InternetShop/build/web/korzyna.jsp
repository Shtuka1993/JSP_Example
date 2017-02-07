<%@page import = "java.io.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>korzina</title>
</head>
<body>
<center>
<table width=100% border=0 cellSpacing=0 cellPadding=0>
<tr><th colspan=2><%@ include file = "header.jsp"%></th>
</tr>
<tr>
<td width="25%" align=center valign="top" bgcolor="azure">
<%@ include file = "login.jsp"%>
<br><%--<%@ include file = "menu.jsp"%><br><%@ include file = "kalendar.jsp"%><br>--%></td>
<td valign=top bgcolor="azure" align=left>
<%
if (user=="") out.println("Sorry, you must login first"); else
{
String bPath = request.getRealPath("WEB-INF\\base\\korzina");
bPath = bPath + "\\" + user+"\\";
File fold = new File (bPath);
if (!fold.exists())
fold.mkdir();
%>
<div style="margin:10px">
<h3 align=center class="style4"> КОРЗИНА </h3>
<br>
<table width=80% border=1 align=center bgcolor="violet">
<form action = "new_korzyna.jsp" method = "POST">
<tr bgcolor="#ccccff" align=center>
<td width="5%" bgcolor="azure"><P align="center"><STRONG>номер:<STRONG></P></td>
<td bgcolor="azure"><P align=center><STRONG>назва:<STRONG></P></td>
<td bgcolor="azure"><P align=center><STRONG>кільість:</STRONG></P></td>
<td bgcolor="azure"><P align=center><STRONG>ціна:<STRONG></P></td>
</tr>
<%
int a=0;
int total=0;
fold = new File (bPath);
File[] foldList = fold.listFiles();
int num = 0;
for (int x = 0; x < foldList.length; x ++)
if (foldList[x].isFile())
{
String path= request.getRealPath("WEB-INF/base/katalog");
BufferedReader in = new BufferedReader(new FileReader(path+"/"+foldList[x].getName()+".txt"));
String bName = new String (in.readLine());
String bDescription = new String (in.readLine());
String bPrice = new String (in.readLine());
in.close();
in = new BufferedReader(new FileReader(foldList[x].getAbsolutePath()));
String quan = new String (in.readLine());
in.close();
num++;
out.println("<tr>");
out.println("<td bgcolor="+chrr+"azure"+chrr+">"+num+"</td>");
out.println("<td bgcolor="+chrr+"azure"+chrr+">"+bName+"</td>");
out.println("<td bgcolor="+chrr+"azure"+chrr+">");
%>
<input type = "text" value = "<%=quan%>" name = "<%=foldList[x].getName()%>">
<%
out.println("</td>");
out.println("<td bgcolor="+chrr+"azure"+chrr+">"+bPrice+"</td>");
out.println("</tr>");
int Q=0; int Price=0;
try
{
Integer iii = new Integer(bPrice);
Price = iii.intValue();
}
catch (Exception e){out.println("Кількість товарів повинна бути числом!!!"); a++;}
try
{
Integer jjj = new Integer(quan);
Q = jjj.intValue();
}
catch (Exception e){out.println("Ціна не є числом!!!");}
if (a==0)
{total = total+Q*Price;}
}
out.println("</table>");
%>
<center>
<br>
Загальна сумма:<input type="text" name="загальна сумма" value = "<%=total%>">
<input type =submit value ="Оновити корзину">&nbsp<br><br>
<a href = "pokupky.jsp?t=<%=total%>"><IMG BORDER="0" SRC="images/zakazaty.gif" NAME="zakazaty"></a>
<br>
[ <a href="index.jsp">На головну сторінку</a> ]
</center>
</form>
</table>
<%
}
%>
</div>
</td>
</tr>
<%--<tr><th colspan=2><%@ include file = "futer.jsp"%></th>--%>
</tr></table></center></body></html>