<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="All Platform Orders" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
    <h2>All Platform Orders</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary btn-sm">&larr; Back to Dashboard</a>
</div>

<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Order #</th>
                <th>Buyer</th>
                <th>Items Count</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Date Placed</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td><strong>#<c:out value="${o.id}"/></strong></td>
                    <td>
                        <c:out value="${o.buyerName}"/><br>
                        <span style="font-size: 0.8rem; color: var(--text-muted);"><c:out value="${o.buyerEmail}"/></span>
                    </td>
                    <td><c:out value="${fn:length(o.items)}"/> item(s)</td>
                    <td style="font-weight: 600; color: var(--primary);">&#8377;<c:out value="${o.totalAmount}"/></td>
                    <td>
                        <span class="badge badge-${fn:toLowerCase(o.status)}">
                            <c:out value="${o.status}"/>
                        </span>
                    </td>
                    <td style="color: var(--text-muted); font-size: 0.9rem;"><c:out value="${o.createdAt}"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/orders/detail?id=${o.id}" class="btn btn-secondary btn-sm">
                            Inspect
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
