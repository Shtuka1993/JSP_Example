<%@page import = "java.io.*"%>
<%@page import = "java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<Table bgcolor="#0099FF" align="top left" cellSpacing="0" cellPadding="5" width="100%" border="0">
<%
byte[] ch = new byte[1];
ch[0] = 34;
String chrr = new String (ch);
HttpSession h = request.getSession();
Enumeration s = h.getAttributeNames();
String user = "";
while (s.hasMoreElements())
{
String n = (String) s.nextElement();
if (n=="login") user = (String) h.getAttribute("login");
}
if (user == "")
{out.println(
"<form name = "+chrr+"loginForm"+chrr+" action = "+chrr+"vhid.jsp"+chrr+" method = "+chrr+"POST"+chrr+">"+
"<tr> <td> <strong> Вхід в систему </strong> <br> </td> </tr>"+
"<tr> <td>Логін <br></td> </tr>"+
"<tr> <td><input type = "+chrr+"text"+chrr+" name = "+chrr+"login"+chrr+"><br></td> </tr>"+
"<tr> <td>Пароль <br></td> </tr>"+
"<tr> <td><input type = "+chrr+"password"+chrr+" name = "+chrr+"passw"+chrr+"><br></td> </tr>"+
"<tr> <td><input type = "+chrr+"submit"+chrr+" value = "+chrr+"Війти"+chrr+">"+
"</form>"
);
out.println("<tr align="+chrr+"right"+chrr+"><td><strong><a href = "+chrr+"reg_user.jsp"+chrr+">Регістрація</strong></a><br>");
}
else
{out.println("<tr><td>Ви війшли в систему під іменем "+user+"</td></tr>");
out.println("<tr><td><a href = "+chrr+"vyhid.jsp"+chrr+">"+"Виход"+"</a></td></tr>");
%>
<tr><td><br><a href = "korzyna.jsp">Корзина</a></td></tr>
<%
}
%>
</Table>
</html>