<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Optional Logout button for authenticated users --%>

<c:if test="${not empty pageContext.request.remoteUser}">
    <a class="nav-link border border-danger text-danger" href="<c:url value="/Logout"/>">Desconectar ${pageContext.request.remoteUser}</a>
</c:if>
