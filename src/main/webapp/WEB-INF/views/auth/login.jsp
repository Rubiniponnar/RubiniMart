<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Login" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="max-width: 440px; margin: 3rem auto; background: white; padding: 2rem; border-radius: var(--radius); box-shadow: var(--shadow); border: 1px solid var(--border-color);">
    <h2 style="margin-bottom: 1.5rem; text-align: center;">Welcome Back</h2>

    <form action="${pageContext.request.contextPath}/auth/login" method="POST">
        <input type="hidden" name="redirect" value="<c:out value='${redirect}'/>">

        <div class="form-group">
            <label class="form-label" for="email">Email Address</label>
            <input type="email" id="email" name="email" class="form-control"
                   value="<c:out value='${email}'/>" required autofocus>
        </div>

        <div class="form-group">
            <label class="form-label" for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Sign In</button>
    </form>

    <div style="margin-top: 1.5rem; text-align: center; font-size: 0.9rem; color: var(--text-muted);">
        Don't have an account? <a href="${pageContext.request.contextPath}/register" style="color: var(--primary); font-weight: 600;">Create one</a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
