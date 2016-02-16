<%-- 
    Document   : student
    Created on : Feb 16, 2016, 1:39:58 PM
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
        <title>Student</title>
    </head>
    <body>
        <%@include file="header.jsp" %><%-- responsiivinen Navbar --%>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Add new student information</h1>
                    <form:form action="/admin/student" method="POST" modelAttribute="student"><%-- tässä JSP form, käyttää JSTL kirjastoa --%>
                        <%-- modelAttribute "student" menee POSTin mukana BAckEndille, käytetään routterissa StudentController.java --%>
                        <%-- modelAttribute mäppää formin tiedon BackEndissä. Liitetään path muuttujalla Students-luokan atribuuttiin --%>
                        <form:label path="">Name</form:label><br/>
                        <form:input cssClass="form-control" path="SName"></form:input><br/>
                        <form:label path="">Address</form:label><br/>
                        <form:input cssClass="form-control" path="address"></form:input><br/>
                        <form:label path="">Email</form:label><br/>
                        <form:input cssClass="form-control" path="email"></form:input><br/>
                        <form:label path="">Phone</form:label><br/>
                        <form:input cssClass="form-control" path="phone"></form:input><br/>
                        <input class="btn btn-primary" type="submit" value="Save Student"/>
                    </form:form>
                </div>
                <div class="col-md-6">
                    <p>${save_info}</p>
                    <h1>All Students</h1>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Phone</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="stud" items="${students}">
                                <tr>
                                    <td>${stud.getSName()}</td>
                                    <td>${stud.getAddress()}</td>
                                    <td>${stud.getEmail()}</td>
                                    <td>${stud.getPhone()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
