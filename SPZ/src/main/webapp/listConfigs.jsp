<%-- 
    Document   : listConfigs
    Created on : Jan 10, 2016, 10:16:04 AM
    Author     : bar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<f:setBundle basename="list"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="confList"/> (<c:out value="${user.login}"/>)</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/dcb.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/support-scripts.js"></script>
    </head>
    <body>
        <jsp:include page="headerProject.jsp"/>
        <div class="center">
            <jsp:include page="navigation.jsp"/>
        </div>
        <h1 class="center"><f:message key="availConfs"/></h1>
        <table class="fullwidthtable">
            <thead>
                <tr>
                    <td class="code" style="width: 20%;"><f:message key="code"/></td>
                    <td class="desc" style="width: 80%;"><f:message key="desc"/></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="conf" items="${configs}">
                    <tr>
                        <td  class="item">
                            <form name="${conf.code}" action="${pageContext.request.contextPath}/SPZServlet/listspz" method="post">
                                <input type="hidden" name="projectid" value="${project.id}"/>
                                <input type="hidden" name="configid" value="${conf.id}"/>
                                <input type="hidden" name="userid" value="${user.id}"/>
                                <%--<input type="submit" value="${conf.code}"/>--%>
                                <a href="javascript: doPost(${conf.code});">${conf.code}</a>
                                <%--     <c:out value="${conf.code}"/>--%>
                            </form>
                        </td>
                        <td class="item"><c:out value="${conf.description}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
