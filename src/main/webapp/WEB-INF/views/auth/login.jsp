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

    <%-- Default Administrator Credentials --%>
    <div style="margin-top: 1.75rem; padding: 1rem; background-color: #f8fafc; border-radius: var(--radius); border: 1px dashed var(--border-color); font-size: 0.85rem; text-align: center;">
        <span style="display: block; font-weight: 600; color: var(--secondary); margin-bottom: 0.35rem;">Default Administrator Login</span>
        <div style="font-family: monospace; font-size: 0.9rem; color: var(--text-main); font-weight: 600; margin-bottom: 0.5rem;">
            admin@mart.com &bull; Admin@123
        </div>
        <button type="button" onclick="fillAdminCredentials()" class="btn btn-secondary btn-sm" style="font-size: 0.78rem; padding: 0.3rem 0.85rem;">
            Quick Fill Admin Login
        </button>
    </div>

    <script>
    function fillAdminCredentials() {
        var emailInput = document.getElementById('email');
        var passInput = document.getElementById('password');
        if (emailInput) emailInput.value = 'admin@mart.com';
        if (passInput) passInput.value = 'Admin@123';
    }
    </script>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
