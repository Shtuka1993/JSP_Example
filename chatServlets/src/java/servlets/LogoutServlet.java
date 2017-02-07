/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classes.ChatUser;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout.do"})
public class LogoutServlet extends ChatServlet {
  
  private static final long serialVersionUID = 1L; 
     
  protected void doGet(HttpServletRequest request, HttpServletResponse 
response) throws ServletException, IOException { 
    String name = (String) request.getSession().getAttribute("name"); 
    if (name!=null) { 
      ChatUser aUser = activeUsers.get(name); 
      if (aUser.getSessionId().equals((String) 
request.getSession().getId())) { 
        synchronized (activeUsers) { 
          activeUsers.remove(name); 
        } 
        request.getSession().setAttribute("name", null); 
        response.addCookie(new Cookie("sessionId", null));
      response.sendRedirect(response.encodeRedirectURL("/chat/")); 
      } else { 
  response.sendRedirect(response.encodeRedirectURL("/chat/view.htm"));   
      } 
    } else { 
  response.sendRedirect(response.encodeRedirectURL("/chat/view.htm")); 
    } 
  } 
   
} 