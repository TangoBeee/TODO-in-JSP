<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO - Home</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
    <h1>TODO</h1>
    <form method="POST" action="todo.jsp">
      <input
        type="text"
        class="input"
        name="todo"
        placeholder="Enter your TODO"
        autocomplete="off"
      />
      
      <hr>
      
      	<%
			List<String> items = (List<String>) session.getAttribute("myTodo");
			
			if(items == null) {
				items = new ArrayList<String>();
				session.setAttribute("myTodo", items);
			}
			
			String myItems = request.getParameter("todo");
			
			if(myItems != null && (!myItems.trim().equals(""))) {
				items.add(myItems);
			}
			
			List<String> delit = null;
			
			if(request.getParameterValues("todos") != null) {
				delit = Arrays.asList(request.getParameterValues("todos"));
			}
			
			if(delit != null) {
				for(String i : delit) {
					i = i.replaceAll("-", " ");
					items.remove(i);
				}
			}
		%>

      <ul class="todos">
		<%
			for(String it : items) {
				it = it.replaceAll(" ", "-");
				out.println("<li> " + "<input type="+"checkbox"+" name="+"todos"+" value="+it+" />" + it +"</li>");
			}
		%>
      </ul>
      
        <input class="btn" type="submit" value="Submit">
    </form>

    <small>Made By <a class="cp" target="_blank" href="https://google.com">Alien</a><br>
      With ❤️</small>

</body>
</html>