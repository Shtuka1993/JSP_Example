/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.Calendar;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classes.ChatMessage;
import classes.ChatUser;

/**
 *
 * @author 1
 */
@WebServlet(name = "NewMessageServlet", urlPatterns = {"/send_message.do"})
public class NewMessageServlet extends ChatServlet {
 
  private static final long serialVersionUID = 1L; 
 
  protected void doPost(HttpServletRequest request, HttpServletResponse 
response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");  
    String message = (String)request.getParameter("message"); 
    if (message!=null && !"".equals(message)) { 
      ChatUser author = activeUsers.get((String) 
request.getSession().getAttribute("name"));  
      synchronized (messages) { 
        messages.add(new ChatMessage(message, author, 
Calendar.getInstance().getTimeInMillis())); 
      } 
    } 
    response.sendRedirect("/chat/compose_message.htm"); 
  } 
 
}