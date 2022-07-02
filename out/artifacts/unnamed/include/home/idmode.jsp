<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<div id="idmode">
    <div id="touxiang"><img class="touxiang" src="img/tianmao/touxiang.jpg">
       </div>
    <div id="touxiangid"> <c:if test="${!empty user}">
       <span style="text-align:center"> <a href="login.jsp" style="text-align:center">Hi! ${user.name}</a></span>
    </c:if>
        <c:if test="${empty user}">
            <span style="text-align:center"><a href="login.jsp" >Hi! 您好！</a></span>
        </c:if></div>
    <div id="tiantupian"><img src="img/tianmao/天猫iddemo.webp"></div>
    <div id="gonggao">
        <span><h4 class="h4">公告 </h4> <h5 class="h">新鲜事儿都在这里～</h5></span>
        <span><a class="re">热点</a><a class="wen">设计创享家3D设计服务大赛来袭！</a></span>
        <span><a class="re">热点</a><a class="wen">全球新发现，好物开抢就现在！</a></span>
        <span><a class="re"> 热点</a><a class="wen">万款新品流行速递抢先看</a></span>

    </div>
    <div id="shouchang">
        <span ><img class="shouC" src="img/icon/shoucang.png"></span>
        <span ><img class="shouC" src="img/icon/gouwu.png"></span>
        <span ><img class="shouC" src="img/icon/shouye.png"></span>
        <span ><img class="shouC" src="img/icon/zuji.png"></span>
        <div>
        <span class="shouB"><a>收藏的宝贝</a></span>
            <span class="shouB"><a>买过的店铺</a></span>
            <span class="shouB"><a>收藏的店铺</a></span>
            <span class="shouB"><a>我的足迹</a></span>
        </div>
    </div>


</div>
</div>

