<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<a href="/forehome">
    <img id="logo" src="img/tianmao/tianmao.png" class="logo">
</a>
<form action="foresearch" method="post">
    <div class="searchDiv">
        <input name="keyword" type="text" placeholder="搜索 天猫 商品 ">
        <button type="submit" class="searchButton">搜索</button>
        <div class="searchBelow">
            <%--获取分类集合，取第5到第8一共四个类显示--%>
            <c:forEach items="${categories}" var="category" varStatus="st">
                <c:if test="${st.count>=5 and st.count<=8}">
                        <span>
                            <a href="forecategory?cid=${category.id}">
                                    ${category.name}
                            </a>
                            <c:if test="${st.count!=8}">
                                <span>|</span>
                            </c:if>
                        </span>
                </c:if>
            </c:forEach>
        </div>
    </div>
</form>