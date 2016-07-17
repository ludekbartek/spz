<%-- 
    Document   : editInstalled
    Created on : Jan 1, 2016, 11:58:02 AM
    Author     : bar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<f:setBundle basename="editInstalled"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="pageTitle"/><c:out value="${spz.id}"/></title>
        <link rel="stylesheet" href="styles/dcb.css" type="text/css"/>
        <script type="text/javascript" src="scripts/support-scripts.js"></script>
            
    </head>
    <body>
        <jsp:include page="headerspz.jsp"/>
        <div class="center">
            <jsp:include page="navigationSpz.jsp"/>
        </div>
        <h1><f:message key="pageTitle"/></h1>
        <table class="border-fullwidthtable">
            <jsp:include page="editcommon.jsp"/>
            <tr>
                <td class="tablelabel"><f:message key="revised"/></td>
                <td><c:out value="${spz.revised}" escapeXml="false"/></td>
            </tr>
            <tr>
                <td class="tablelabel"><f:message key="solution"/></td>
                <td><c:out value="${spz.solution}" escapeXml="false"/></td>
            </tr>
            <tr>
                <td class="tablelabel"><f:message key="estWorkLoad"/></td>
                <td><c:out value="${spz.workLoadEstimation}"/></td>
            </tr>
            <tr>
                <td class="tablelabel"><f:message key="solInfo"/></td>
                <td><c:out value="${spz.relNotes}" escapeXml="false"/></td>
            </tr>
            <tr>
                <td class="tablelabel"><f:message key="realWorkLoad"/></td>
                <td>
                    <c:if test="${not empty spz.workLoadReal}"><c:out value="${spz.workLoadReal}"/></c:if>
                    <c:if test="${empty spz.workLoadReal}"><c:out value="${spz.workLoadEstimation}"/></c:if>
                </td>
            </tr>
            
        </table>
        <c:choose>
            <c:when test="${user.role=='0'}">
                <form id="acceptForm" action="${pageContext.request.contextPath}/SPZServlet/acceptSpz" method="post">
                    <input type="hidden" name="state" value="${spz.spzState}"/>
                    <input type="hidden" name="newState" value="CONFIRMED"/>
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                    <!--<input type="submit" value="<f:message key='acceptBut'/>"/>-->
                </form>
                <form id="reclaimedForm" action="${pageContext.request.contextPath}/SPZServlet/reclaim" method="post">
                    <input type="hidden" name="state" value="${spz.spzState}"/>
                    <input type="hidden" name="newState" value="RECLAIMED"/>
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                    <!--<input type="submit" value="<f:message key='reclaimBut'/>"/>-->
                </form>
                <form method="post">
                    <input type="button" value="<f:message key='acceptBut'/>" onclick="doPost(acceptForm)"/>
                    <input type="button" value="<f:message key='reclaimBut'/>" onclick="doPost(reclaimedForm)"/>
                </form>
            </c:when>
            <c:otherwise>
                <form id="deleteForm" action="${pageContext.request.contextPath}/SPZServlet/delete" method="post">
                    <input type="hidden" name="state" value="${spz.spzState}"/>
                    <input type="hidden" name="newState" value="CANCELED"/>
                    <input type="hidden" name="spzid" value="${spz.id}"/>
                    <input type="hidden" name="userid" value="${user.id}"/>
                    <input type="hidden" name="configid" value="${config.id}"/>
                    <input type="hidden" name="projectid" value="${project.id}"/>
                 <!--   <input type="submit" value="<f:message key='cancel'/>"/>-->
                </form>
                <form method="post">
                    <input type="button" value="<f:message key='cancel'/>" onclick="doPost(deleteForm)"/>
                </form>
            </c:otherwise>
        </c:choose>
        <jsp:include page="listHistory.jsp"/>
    </body>
</html>
