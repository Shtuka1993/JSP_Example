<%@page import="org.mano.service.EmployeeBean"%>
<%@page import="org.mano.model.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Emp ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Salary</th>
                        <th>Designation</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        EmployeeBean eb = new EmployeeBean();
                        List<Employee> list = eb.getEmployees();
                        for (Employee e : list) {
                    %>
 
                    <tr>
                        <td><%=String.valueOf(e.getEmpId())%></td>
                        <td><%=e.getName()%></td>
                        <td><%=e.getPhone()%></td>
                        <td><a href="mailto:<%=e.getEmail()%>"><%=e.getEmail()%></a></td>
                        <td><%=String.valueOf(e.getSalary())%></td>
                        <td><%=e.getDesignation()%></td>
                        <td style="border: none;">
                            <div>
                                <form method="post" action="empUpdate.jsp">
                                    <input type="hidden" id="updateId" name="updateId" value="<%=String.valueOf(e.getEmpId())%>"/> 
                                    <input type="submit" value="Modify..."/> 
                                </form>
                            </div>
                        </td>
                        <td style="border: none;">
                            <div>
                                <form method="post" action="DeleteServlet">
                                    <input type="hidden" id="delId" name="delId" value="<%=String.valueOf(e.getEmpId())%>"/> 
                                    <input type="submit" value="Delete"/> 
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>