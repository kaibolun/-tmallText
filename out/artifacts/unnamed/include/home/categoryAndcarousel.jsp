<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<script>

    function showProductsAsideCategorys(cid) {
        $("div.eachCategory[cid=" + cid + "]").css("background-color", "white");
        $("div.eachCategory[cid=" + cid + "] a").css("color", "#87CEFA");
        $("div.productsAsideCategorys[cid=" + cid + "]").show();
    }

    function hideProductsAsideCategorys(cid) {
        $("div.eachCategory[cid=" + cid + "]").css("background-color", "#e2e2e3");
        $("div.eachCategory[cid=" + cid + "] a").css("color", "#000");
        $("div.productsAsideCategorys[cid=" + cid + "]").hide();
    }

    $(function () {
        $("div.eachCategory").mouseenter(function () {
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.eachCategory").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseenter(function () {
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseleave(function () {
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });

        $("div.rightMenu span").mouseenter(function () {
            var left = $(this).position().left;
            var top = $(this).position().top;
            var width = $(this).css("width");
            var destLeft = parseInt(left) + parseInt(width) / 2;
            $("img#catear").css("left", destLeft);
            $("img#catear").css("top", top - 20);
            $("img#catear").fadeIn(500);

        });
        $("div.rightMenu span").mouseleave(function () {
            $("img#catear").hide();
        });

        var left = $("div#carousel-of-product").offset().left;
        $("div.categoryMenu").css("left", left - 20);
        $("div.categoryWithCarousel div.head").css("margin-left", left);
        $("div.productsAsideCategorys").css("left", left - 20);

    });
</script>

<%--<img src="img/site/catear.png" id="catear" class="catear"/>--%>
<div>
<div class="categoryWithCarousel">

    <div class="headbar show1">
        <div class="head ">
            <span style="margin-left:10px">主题市场</span>

        </div>

        <div class="rightMenu">
            <span><a href=""><img src="img/tianmao/天猫超市.png"/></a></span>
            <span><a href=""><img src="img/tianmao/天猫国际.png"/></a></span>
     <%--       <span><a href="">天猫会员</a></span>
            <span><a href="">喵鲜生</a></span>
            <span><a href="">医药馆</a></span>
            <span><a href="">魅力惠</a></span>
            <span><a href="">飞猪旅行</a></span>
            <span><a href="">苏宁易购</a></span>
            <span><a href="">天猫内容</a></span>--%>

            <c:forEach items="${categories}" var="category" varStatus="st">
                <c:if test="${st.count<=4}">
                <span>
                <a href="forecategory?cid=${category.id}">
                        ${category.name}
                </a></span>
                </c:if>
            </c:forEach>
        </div>

    </div>

    <div style="position: relative">
        <%@include file="categoryMenu.jsp" %>
    </div>

    <div style="position: relative;left: 0;top: 0;">
        <%@include file="productsAsideCategories.jsp" %>
    </div>
    <div>
        <%@include file="lunbo.jsp" %>
    </div>
    <div>
        <%@include file="idmode.jsp" %>
    </div>
    </div>




</div>
</div>