<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="${isEdit ? 'Edit Product' : 'Add New Product'}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="max-width: 600px; margin: 2rem auto; background: white; padding: 2rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
    <h2 style="margin-bottom: 1.5rem;">
        <c:out value="${isEdit ? 'Edit Product Listing' : 'Create New Product Listing'}"/>
    </h2>

    <form action="${pageContext.request.contextPath}/seller/product/${isEdit ? 'edit' : 'new'}" method="POST">
        <c:if test="${isEdit}">
            <input type="hidden" name="id" value="${product.id}">
        </c:if>

        <div class="form-group">
            <label class="form-label" for="name">Product Name *</label>
            <input type="text" id="name" name="name" class="form-control"
                   value="<c:out value='${isEdit ? product.name : name}'/>" required>
            <c:if test="${not empty fieldErrors.name}">
                <div class="field-error"><c:out value="${fieldErrors.name}"/></div>
            </c:if>
        </div>

        <div class="form-group">
            <label class="form-label" for="description">Description</label>
            <textarea id="description" name="description" class="form-control" rows="4"><c:out value="${isEdit ? product.description : description}"/></textarea>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
            <div class="form-group">
                <label class="form-label" for="price">Price (&#8377;) *</label>
                <input type="number" id="price" name="price" step="0.01" min="0.01" class="form-control"
                       value="<c:out value='${isEdit ? product.price : price}'/>" required>
                <c:if test="${not empty fieldErrors.price}">
                    <div class="field-error"><c:out value="${fieldErrors.price}"/></div>
                </c:if>
            </div>

            <div class="form-group">
                <label class="form-label" for="stockQty">Stock Quantity *</label>
                <input type="number" id="stockQty" name="stockQty" min="0" class="form-control"
                       value="<c:out value='${isEdit ? product.stockQty : stockQty}'/>" required>
                <c:if test="${not empty fieldErrors.stockQty}">
                    <div class="field-error"><c:out value="${fieldErrors.stockQty}"/></div>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="category">Category *</label>
            <input type="text" id="category" name="category" list="category-options" class="form-control"
                   value="<c:out value='${isEdit ? product.category : category}'/>" placeholder="e.g. Electronics, Fashion, Books" required>
            <datalist id="category-options">
                <c:forEach var="cat" items="${categories}">
                    <option value="<c:out value='${cat}'/>">
                </c:forEach>
            </datalist>
            <c:if test="${not empty fieldErrors.category}">
                <div class="field-error"><c:out value="${fieldErrors.category}"/></div>
            </c:if>
        </div>

        <div class="form-group">
            <label class="form-label" for="imageUrl">Image URL</label>
            <input type="url" id="imageUrl" name="imageUrl" class="form-control"
                   placeholder="https://example.com/image.jpg"
                   value="<c:out value='${isEdit ? product.imageUrl : imageUrl}'/>">
        </div>

        <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
            <button type="submit" class="btn btn-primary" style="flex: 1;">
                <c:out value="${isEdit ? 'Save Changes' : 'Publish Product'}"/>
            </button>
            <a href="${pageContext.request.contextPath}/seller/dashboard" class="btn btn-secondary">
                Cancel
            </a>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
