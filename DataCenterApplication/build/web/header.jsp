<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <div id="mystyle" style="border: none;">
            <h1>Data Center Application</h1>
            <p><a href="https://github.com/ShtukaDev/MyExperiments_in_JavaWebProjects.git">GIT HUB</a><br/>
                <b>Creating Data centric Application with JSP Servlet</b><br/>
                <%=new Date()%></br>  </br>
                <a href="empAddNew.jsp">Add New Employee</a> &NegativeThickSpace; |
                <a href="empView.jsp">View Employee</a>
            </p>
        </div>
    </center>
</body>
</html>