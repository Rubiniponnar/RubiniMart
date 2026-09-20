<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Checkout" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<h2 style="margin-bottom: 1.5rem;">Checkout & Mock Payment</h2>

<div style="display: grid; grid-template-columns: 3fr 2fr; gap: 2rem; align-items: start;">
    <%-- Checkout Form --%>
    <div style="background: white; padding: 2rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
        <form action="${pageContext.request.contextPath}/checkout" method="POST">
            <h3 style="margin-bottom: 1.25rem;">1. Shipping Information</h3>

            <div class="form-group">
                <label class="form-label" for="shippingAddress">Delivery Address</label>
                <textarea id="shippingAddress" name="shippingAddress" class="form-control" rows="3"
                          placeholder="Street address, city, state, postal code..." required><c:out value="${shippingAddress}"/></textarea>
                <c:if test="${not empty fieldErrors.shippingAddress}">
                    <div class="field-error"><c:out value="${fieldErrors.shippingAddress}"/></div>
                </c:if>
            </div>

            <h3 style="margin-top: 2rem; margin-bottom: 1.25rem;">2. Mock Payment Method</h3>

            <div class="form-group">
                <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                    <label style="display: flex; align-items: center; gap: 0.5rem; cursor: pointer;">
                        <input type="radio" name="paymentMethod" value="MOCK_CARD" checked>
                        <span>Credit / Debit Card (Mock Instant Approval)</span>
                    </label>
                    <label style="display: flex; align-items: center; gap: 0.5rem; cursor: pointer;">
                        <input type="radio" name="paymentMethod" value="MOCK_UPI">
                        <span>UPI / QR Code (Mock Instant Approval)</span>
                    </label>
                    <label style="display: flex; align-items: center; gap: 0.5rem; cursor: pointer;">
                        <input type="radio" name="paymentMethod" value="MOCK_COD">
                        <span>Cash on Delivery</span>
                    </label>
                </div>
            </div>

            <div style="margin-top: 1.5rem; padding: 0.85rem; background-color: #f0fdf4; border-radius: var(--radius); border: 1px solid #bbf7d0; font-size: 0.85rem; color: #166534;">
                🔒 <strong>Mock Payment Gate:</strong> No real payment is required. Your order will be placed and processed immediately upon clicking below.
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1.5rem; padding: 0.85rem; font-size: 1.1rem;">
                Confirm & Place Order (&#8377;<c:out value="${cart.totalAmount}"/>)
            </button>
        </form>
    </div>

    <%-- Order Summary --%>
    <div style="background: white; padding: 1.5rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
        <h3 style="margin-bottom: 1rem;">Items in Your Order (<c:out value="${cart.totalItems}"/>)</h3>

        <div style="display: flex; flex-direction: column; gap: 1rem; max-height: 350px; overflow-y: auto; margin-bottom: 1.5rem;">
            <c:forEach var="item" items="${cart.items}">
                <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
                    <div>
                        <div style="font-weight: 600;"><c:out value="${item.productName}"/></div>
                        <div style="font-size: 0.85rem; color: var(--text-muted);">
                            Qty: <c:out value="${item.quantity}"/> &times; &#8377;<c:out value="${item.unitPrice}"/>
                        </div>
                    </div>
                    <div style="font-weight: 600;">
                        &#8377;<c:out value="${item.subtotal}"/>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div style="border-top: 2px solid var(--border-color); padding-top: 1rem;">
            <div style="display: flex; justify-content: space-between; font-size: 1.25rem; font-weight: bold;">
                <span>Total Due:</span>
                <span style="color: var(--primary);">&#8377;<c:out value="${cart.totalAmount}"/></span>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
