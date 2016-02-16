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
        <meta name="viewport" content="width=device-width, initial-scale=1"><%-- lisätty 16.2.2016. Navbar: takaa että responsiivisuus toimii eri laitteilla --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" /><%-- 16.2.2016 kopsattu header.jsp:stä --%>
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css" />
        <script src="resources/js/scripts.js"></script>
        <title>Start Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %><%-- lisätty 16.2.2016: responsiivinen Navbar --%>
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-4"><%-- 16.2.2016: varaa neljä saraketta 12:sta, offset vasemmasta laidasta 4 --%>
                    <form:form action="/login" method="POST">
                        <label>Username:</label><br/>
                        <input class="form-control" type="text" id="username" name="username"/><br/><%-- 16.2.2016: lisätty class atribuutti --%>
                        <label>Password:</label><br/>
                        <input class="form-control" type="password" id="password" name="password"><br/><%-- 16.2.2016: lisätty class atribuutti --%>
                        <input class="btn btn-primary" type="submit" value="Login"/><%-- 16.2.2016: lisätty class atribuutti --%>
                    </form:form>
                        <p style="color:red;">${login_error}</p>
                </div>
            </div>
        </div>
    </body>
</html>
