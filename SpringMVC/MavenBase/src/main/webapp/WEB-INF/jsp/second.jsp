<%-- 
    Document   : second
    Created on : Feb 9, 2016, 1:04:35 PM
    Author     : student (Luotu itse)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--yllä oleva lisätty 12.2.2016: --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--lisätty 12.2.2016: yllä olevaa määritystä tarvitaan kun käytetään formeja--%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"><%-- lisätty 16.2.2016. Navbar: takaa että responsiivisuus toimii eri laitteilla --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" /><%-- 16.2.2016 kopsattu header.jsp:stä --%>
        <title>Teacher</title>
    </head>
    <body>
        <%@include file="header.jsp" %><%-- lisätty 16.2.2016: responsiivinen Navbar --%>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Add new teacher information</h1>
                    <form:form action="/admin/teacher" method="POST" modelAttribute="teacher"><%-- tässä JSP form, käyttää JSTL kirjastoa --%>
                        <%-- modelAttribute "teacher" menee POSTin mukana BAckEndille, käytetään routterissa DefaultController.java --%>
                        <%-- modelAttribute mäppää formin tiedon BackEndissä. Liitetään path muuttujalla Teachers-luokan atribuuttiin --%>
                        <form:label path="">Name</form:label><br/>
                        <form:input cssClass="form-control" path="TName"></form:input><br/><%-- TName tulee Teachers.java:sta --%>
                        <form:label path="">Email</form:label><br/>
                        <form:input cssClass="form-control" path="email"></form:input><br/><%-- 16.2.2016 lisätty inputille Bootstrap tyyli cssClass-määreellä --%>
                        <form:label path="">Phone</form:label><br/>
                        <form:input cssClass="form-control" path="phone"></form:input><br/>
                        <form:label path="">Subject</form:label><br/>
                        <form:input cssClass="form-control" path="TSubject"></form:input><br/>
                        <input class="btn btn-primary" type="submit" value="Save Teacher"/>
                    </form:form>
                </div>
                <div class="col-md-6">
                    <p>${save_info}</p>
                    <h1>All Teachers</h1>
                    <table class="table table-hover table-bordered"><%-- 16.2.2016 lisätty taulukolle Bootstrap tyyli --%>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Subject</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="teach" items="${teachers}"><%-- teach:iin talleteaan yksi arvo teachers:ista kerrallaan --%>
                                <tr>
                                    <td>${teach.getTName()}</td>
                                    <td>${teach.getEmail()}</td>
                                    <td>${teach.getPhone()}</td>
                                    <td>${teach.getTSubject()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
