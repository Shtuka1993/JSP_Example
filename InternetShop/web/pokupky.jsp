<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.io.*"%>
<link rel=stylesheet href="styles.css" type="text/css">
<html>
<head>
<title>Pokupki</title>
</head>
<body>
<center>
<table width=100% border=0 cellSpacing=0 cellPadding=0>
<%--<tr><th colspan=2><%@ include file = "header.jsp"%></th>
</tr>--%>
<tr>
<td width=25% align=center valign=top bgcolor="azure">
<%@ include file = "login.jsp"%>
<br><%--
<%@ include file = "menu.jsp"%>
<br>
<%@ include file = "kalendar.jsp"%>
<br>--%>
</td>
<td valign=top bgcolor="azure" align=left>
<div style="margin:10px">
<p valign="left">
<strong>Вы заказали данные товары: </strong><br><br>
<%
if (user=="") out.println("Спочатку війдіть в систему!");
else
{ String Path = request.getRealPath("WEB-INF//base//korzina");
Path = Path + "//" + user+"//";
File fold = new File (Path);
if (!fold.exists()) fold.mkdir();
String ss = "";
String ffName = request.getRealPath("WEB-INF//base//pokupki//"+user+".hst");
File ff = new File (ffName);
if (ff.exists()) {
BufferedReader in = new BufferedReader(new FileReader(ffName));
String line;
while ((line = in.readLine()) != null)
ss = ss + line + "\n";
in.close();
}
fold = new File (Path);
File[] foldList = fold.listFiles();
int num = 0;
for (int x = 0; x < foldList.length; x ++)
if (foldList[x].isFile())
{String path= request.getRealPath("WEB-INF//base//katalog");
BufferedReader in = new BufferedReader(new FileReader(path+"/"+foldList[x].getName()+".txt"));
String Name = new String (in.readLine());
String Description = new String (in.readLine());
String Price = new String (in.readLine());
in.close();
in = new BufferedReader(new FileReader(foldList[x].getAbsolutePath()));
String quan = new String (in.readLine());
in.close();
int a=0;
try
{
Integer iii = new Integer(quan);
int qq = iii.intValue();
}
catch (Exception e){a++;}
if (a==0)
{
num++;
out.println(num+". "+Name+" - "+quan+" шт."+"<br>");
ss = ss + Name+" - "+quan+" шт. "+" \n";
}
}
PrintWriter fout = new PrintWriter(new FileWriter(ffName));
fout.println(ss);
fout.close();
}
String Str = request.getParameter("t");
out.println("Загальна сумма замовлення: "+Str);
%>
<br>
<center>
[ <a href="korzyna.jsp">Назад в корзину</a> ]
<br>
[ <a href="index.jsp">На головну сторінку</a> ]
</center>
</div>
</p>
</td>
</tr>
<tr>
    <%--<th colspan=2><%@ include file = "futer.jsp"%></th>--%>
</tr>
</table>
</center>
</body>
</html>