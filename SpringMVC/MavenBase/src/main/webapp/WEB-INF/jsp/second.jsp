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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher</title>
    </head>
    <body>
        <div>
            <h1>Add new teacher information</h1>
            <form:form action="/teacher" method="POST" modelAttribute="teacher"><%-- tässä JSP form, käyttää JSTL kirjastoa --%>
                <%-- modelAttribute "teacher" menee POSTin mukana BAckEndille, käytetään routterissa DefaultController.java --%>
                <%-- modelAttribute mäppää formin tiedon BackEndissä. Liitetään path muuttujalla Teachers-luokan atribuuttiin --%>
                <form:label path="">Name</form:label>
                <form:input path="TName"></form:input><br/><%-- TName tulee Teachers.java:sta --%>
                <form:label path="">Email</form:label>
                <form:input path="email"></form:input><br/>
                <form:label path="">Phone</form:label>
                <form:input path="phone"></form:input><br/>
                <form:label path="">Subject</form:label>
                <form:input path="TSubject"></form:input><br/>
                <input type="submit" value="Save Teacher"/>
            </form:form>
                <p>${save_info}</p>
                <table>
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
    </body>
</html>
