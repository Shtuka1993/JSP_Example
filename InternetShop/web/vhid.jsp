<%@page import = "java.io.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<% byte[] ch = new byte[1];
ch[0] = 34;
String chrr = new String (ch);
String user = request.getParameter("login") ;
String fileName = request.getRealPath("WEB-INF\\base\\user\\")+"\\"+user+".info";
File f = new File (fileName);
if (!f.exists())
{out.println("Користувач '"+user+"' не знайдений");
}
else
{BufferedReader in = new BufferedReader(new FileReader(fileName));
String passw = request.getParameter ("passw");
String pass = new String (in.readLine());
in.close();
if (pass.equals(passw))
{
HttpSession h = request.getSession();
h.setAttribute("login",user);
response.sendRedirect("index.jsp");
}else
{
out.println("Вибачте, не правильний пароль. Попробуйте ще раз:<br>");
}
}
%>