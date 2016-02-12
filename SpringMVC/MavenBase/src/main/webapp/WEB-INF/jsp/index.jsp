<%-- 
    Document   : index
    Created on : 14.10.2015, 8:33:25
    Author     : Opiframe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css" />
        <script src="resources/js/scripts.js"></script>
        <title>Start Page</title>
    </head>
    <body>
        <h1 class="my_color">Hello World ${name}</h1><%-- 9.2.2016 ${name} liima näkymälle. Kts DefaultController.  --%>
        <a href="/second">To second page</a><%-- 9.2.2016 konteksti /second --%>
    </body>
</html>
