<%@tag description="Club footer" pageEncoding="UTF-8" %>

<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@attribute name="message" required="false"%>
<jsp:useBean id="fecha_actual" class="java.util.Date" />

<footer class="panel panel-default ">
    <div class="panel-body bg-light">
        <p class="text-right">${message}</p>
        <p class="text-right"><fmt:formatDate value="${fecha_actual}" pattern="d MMMM YYYY"/></p>
    </div>
</footer>