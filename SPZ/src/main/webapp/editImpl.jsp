<%-- 
    Document   : editimpl
    Created on : Dec 31, 2015, 4:56:12 AM
    Author     : bar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<f:setBundle basename="editImpl"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="pageTitle"/> <c:out value="${spz.id}"/></title>
        <link rel="stylesheet" href="styles/dcb.css" type="text/css"/>
        <script type="text/javascript" src="scripts/support-scripts.js"></script>
    </head>
    <body>
        <jsp:include page="headerspz.jsp"/>
        <h1><f:message key="pageTitle"/></h1>
        <table>
            <jsp:include page="editcommon.jsp"/>
            <tr>
                <td class="label"><f:message key="revised"/>:</td>
                <td colspan="3"><c:out value="${spz.revised}" escapeXml="true"/></td>
            </tr>
            <tr>
                <td class="label"><f:message key="solution"/>:</td>
                <td colspan="3"><c:out value="${spz.solution}" escapeXml="true"/></td>
            </tr>
            <tr>
                <td class="label"><f:message key="estWorkLoad"/>:</td>
                <td>
                    <c:out value="${spz.workLoadEstimation}"/> <f:message key="manHours"/>
                    (<f:formatNumber maxFractionDigits="2" value="${spz.workLoadEstimation/8.0}"/>
                    <f:message key="manDays"/>)
                </td>
            </tr>
        </table>
                <form action="${pageContext.request.contextPath}/SPZServlet/changeDevel" method="post">
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="state" value="IMPLEMENTATION"/>
                    <input type="hidden" name="newState" value="IMPLEMENTATION"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                    <input type="submit" value="<f:message key='changeDevBut'/>"/>
                </form>
                <form action="${pageContext.request.contextPath}/SPZServlet/refineImpl" method="post">
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="state" value="IMPLEMENTATION"/>
                    <input type="hidden" name="newState" value="IMPLREFINE"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                    <input type="submit" value="<f:message key='refineBut'/>"/>
                </form>
                <c:if test="${user.role==1}">
                    <form action="${pageContext.request.contextPath}/SPZServlet/releaseVersion" method="post">
                        <input type="hidden" name="spzid" value="${spz.id}"/>
                        <input type="hidden" name="userid" value="${user.id}"/>
                        <input type="hidden" name="state" value="IMPLEMENTATION"/>
                        <input type="hidden" name="newState" value="RELEASE"/>
                        <input type="hidden" name="configid" value="${config.id}"/>
                        <input type="hidden" name="projectid" value="${project.id}"/>
                        <input type="submit" value="<f:message key='releaseBut'/>"/>
                    </form>
                </c:if>
                <form action="${pageContext.request.contextPath}/SPZServlet/delete" method="post">
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="state" value="IMPLEMENTATION"/>
                    <input type="hidden" name="newState" value="CANCELED"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                    <input type="submit" value="<f:message key='cancel'/>"/>
                </form>
                    <jsp:include page="listHistory.jsp"/>
    </body>
</html>
