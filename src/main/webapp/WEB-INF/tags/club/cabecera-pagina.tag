<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="container well">
    <h1 class="">
        <%-- Application URL can be obtained with c:url tag or pageContext.request.contextPath EL var --%>
        <a href="<c:url value='/'/>"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
           Club de Tenis
    </h1>
</header>