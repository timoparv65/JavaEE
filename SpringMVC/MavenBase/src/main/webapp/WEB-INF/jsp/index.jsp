<%-- 
    Document   : index
    Created on : 14.10.2015, 8:33:25
    Author     : Opiframe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- lisätty 15.2.2016 --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css" />
        <script src="resources/js/scripts.js"></script>
        <title>Start Page</title>
    </head>
    <body>
        
        <form:form action="/login" method="POST">
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%><%-- lisätään security token --%>
            <input type="text" id="username" name="username"/><br/>
            <input type="password" id="password" name="password"><br/>
            <input type="submit" value="Login"/>
        </form:form>
    </body>
</html>
