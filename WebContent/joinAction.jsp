<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>남병우T 물리1</title>
</head>
<body>
    <%
    String userID = null;
    if(session.getAttribute("userID") !=null){
    	userID = (String) session.getAttribute("userID");
    }
    if(userID !=null){
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어 있습니다.')");
        script.println("location.href = 'main.jsp'");    
        script.println("</script>");
    }
    if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserEmail() == null) {
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('빈 입력란이 있습니다.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
    else{
    	   UserDAO userDAO = new UserDAO();
           int result = userDAO.join(user);
           if (result == -1){
        	   PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('이미 존재하는 아이디입니다.')");
               script.println("history.back()");    // 이전 페이지로 사용자를 보냄
               script.println("</script>");
           }
           else  {
           	   session.setAttribute("userID", user.getUserID());
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href = 'main.jsp'");
               script.println("</script>");
           }
    }
        
    
        
    %>
 
</body>
</html>