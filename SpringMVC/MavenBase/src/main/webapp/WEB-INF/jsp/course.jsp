<%-- 
    Document   : course
    Created on : Feb 17, 2016, 8:35:19 AM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"><%-- Navbar: takaa että responsiivisuus toimii eri laitteilla --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
    </head>
    <body>
        <%@include file="header.jsp" %><%-- responsiivinen Navbar --%>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Add new course information</h1>
                    <form:form action="/admin/course" method="POST" modelAttribute="course"><%-- tässä JSP form, käyttää JSTL kirjastoa --%>
                        <%-- modelAttribute "course" menee POSTin mukana BackEndille, käytetään routterissa CourseController.java --%>
                        <%-- modelAttribute mäppää formin tiedon BackEndissä. Liitetään path muuttujalla Course-luokan atribuuttiin --%>
                        <form:label path="">Name</form:label><br/>
                        <form:input cssClass="form-control" path="CName"></form:input><br/>
                        <form:label path="">Grade</form:label><br/>
                        <form:input cssClass="form-control" path="grade"></form:input><br/>
                        <form:label path="">Info</form:label><br/>
                        <form:input cssClass="form-control" path="CInfo"></form:input><br/>
                        <input class="btn btn-primary" type="submit" value="Save Course"/>
                    </form:form>
                </div>
                <div class="col-md-6">
                    <p>${save_info}</p>
                    <h1>All Courses</h1>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Grade</th>
                                <th>Info</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cour" items="${courses}">
                                <tr>
                                    <td>${cour.getCName()}</td>
                                    <td>${cour.getGrade()}</td>
                                    <td>${cour.getCInfo()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
