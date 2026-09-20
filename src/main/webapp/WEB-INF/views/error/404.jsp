<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="404 - Page Not Found" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="text-align: center; padding: 4rem 1rem; max-width: 500px; margin: 2rem auto; background: white; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
    <div style="font-size: 3.5rem; margin-bottom: 1rem;">🔍</div>
    <h2 style="font-size: 2rem; margin-bottom: 0.5rem;">404 - Page Not Found</h2>
    <p style="color: var(--text-muted); margin-bottom: 1.5rem; line-height: 1.5;">
        The page or product you are looking for does not exist or has been moved.
    </p>
    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Return to Store</a>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
