<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="User Management" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
    <h2>Registered Users</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary btn-sm">&larr; Back to Dashboard</a>
</div>

<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Email Address</th>
                <th>Role</th>
                <th>Joined Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>#<c:out value="${u.id}"/></td>
                    <td><strong><c:out value="${u.name}"/></strong></td>
                    <td><c:out value="${u.email}"/></td>
                    <td>
                        <span class="badge" style="background-color: ${u.role == 'ADMIN' ? '#fee2e2' : (u.role == 'SELLER' ? '#fef3c7' : '#dcfce7')}; color: ${u.role == 'ADMIN' ? '#b91c1c' : (u.role == 'SELLER' ? '#b45309' : '#15803d')};">
                            <c:out value="${u.role}"/>
                        </span>
                    </td>
                    <td style="color: var(--text-muted); font-size: 0.9rem;">
                        <c:out value="${u.createdAt}"/>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
