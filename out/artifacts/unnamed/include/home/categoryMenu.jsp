<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div class="categoryMenu">
    <c:forEach items="${categories}" var="category">
        <div cid="<%--${category.id}--%>" class="eachCategory">
            <span ><img class="icon" src="img/icon/${category.id}.png"></span>
            <a href="forecategory?cid=${category.id}">
                    ${category.name}
            </a>
        </div>
    </c:forEach>
</div>