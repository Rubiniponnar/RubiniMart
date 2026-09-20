<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${not empty param.success}">
    <div class="alert alert-success">
        <span><c:out value="${param.success}"/></span>
    </div>
</c:if>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success">
        <span><c:out value="${successMessage}"/></span>
    </div>
</c:if>

<c:if test="${not empty param.error}">
    <div class="alert alert-error">
        <span><c:out value="${param.error}"/></span>
    </div>
</c:if>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-error">
        <span><c:out value="${errorMessage}"/></span>
    </div>
</c:if>

<c:if test="${param.logout == 'true'}">
    <div class="alert alert-success">
        <span>You have been successfully logged out.</span>
    </div>
</c:if>
