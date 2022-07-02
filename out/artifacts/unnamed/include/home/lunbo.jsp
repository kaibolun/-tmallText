<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<div id="lunbo">
    <div id="lunboOne">
        <div>
            <%@include file="lun1.jsp" %>
        </div>
        </div>

    <div id="lunbotow">
        <div id="lunbotow1">
            <style>
                #swiper-container-two{
                    width: 235px;
                    height: 227px;

                    border-radius:15px;

                }
                .imglunbo{
                    width: 100%;
                    height: 100%;
                }

                #swiper-container-two{
                    --swiper-theme-color: red;/*设置分页器颜色*/
                    --swiper-pagination-color: red;/*设置按钮颜色*/
                    --swiper-navigation-size:15px;/*设置按钮大小*/
                }
            </style>

            <!--使用swiper中文文档实现图片轮播-->
            <!--出现多个轮播图的情况，给swiper-container定义一个id-->
            <div class="swiper-container" id="swiper-container-two">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播2-1.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播2-2.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播2-3.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播2-4.webp"></div>

                </div>
                <!-- 如果需要分页器 -->
               <%-- <div class="swiper-pagination"></div>--%>

                <!-- 如果需要导航按钮 -->
                <div class="swiper-button-prev"></div>
              <%--  <div class="swiper-button-next"></div>--%>

                <!-- 如果需要滚动条 -->
                <!--<div class="swiper-scrollbar"></div>-->
            </div>
            <script>
                var mySwiper = new Swiper ('#swiper-container-two', {
                    direction: 'horizontal', // 垂直切换选项vertical,横向轮播horizontal
                    loop: true, // 循环模式选项
                    //加入速度
                    speed:150,
                    //自动轮播
                    autoplay:{
                        delay:1500
                    },

                    // 如果需要分页器
                  /*  pagination: {
                        el: '.swiper-pagination',
                    },*/

                    // 如果需要前进后退按钮
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },

                    /* // 如果需要滚动条
                     scrollbar: {
                         el: '.swiper-scrollbar',
                     },*/
                })

            </script>
        </div>
        <div id="lunbotow2">
            <style>
                #swiper-container-three{
                    width: 235px;
                    height: 227px;

                    border-radius:15px;

                }

                     #swiper-container-three{
                         --swiper-theme-color: red;/*设置分页器颜色*/
                         --swiper-pagination-color: red;/*设置按钮颜色*/
                         --swiper-navigation-size:15px;/*设置按钮大小*/
                     }
            </style>

            <!--使用swiper中文文档实现图片轮播-->
            <!--出现多个轮播图的情况，给swiper-container定义一个id-->
            <div class="swiper-container"id="swiper-container-three">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播3-1.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播3-2.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播3-3.webp"></div>
                    <div class="swiper-slide"><img class="imglunbo" src="img/lunbo1/轮播3-4.webp"></div>
                </div>
                <!-- 如果需要分页器 -->
                  <%--  <div class="swiper-pagination"></div>--%>

                    <!-- 如果需要导航按钮 -->
                    <%--<div class="swiper-button-prev"></div>--%>
                    <div class="swiper-button-next"></div>

                <!-- 如果需要滚动条 -->
                <!--<div class="swiper-scrollbar"></div>-->
            </div>
            <script>
                var mySwiper = new Swiper ('#swiper-container-three', {
                    direction: 'horizontal', // 垂直切换选项vertical,横向轮播horizontal
                    loop: true, // 循环模式选项
                    //加入速度
                    speed:150,
                    //自动轮播
                    autoplay:{
                        delay:1500
                    },

                    // 如果需要分页器
                    /*  pagination: {
                          el: '.swiper-pagination',
                      },*/

                    // 如果需要前进后退按钮
                       navigation: {
                           nextEl: '.swiper-button-next',
                           prevEl: '.swiper-button-prev',
                       },

                    /* // 如果需要滚动条
                     scrollbar: {
                         el: '.swiper-scrollbar',
                     },*/
                })

            </script>
        </div>
    </div>

</div>
</div>

<%-- <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-of-product" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-of-product" data-slide-to="1"></li>
        <li data-target="#carousel-of-product" data-slide-to="2"></li>
        <li data-target="#carousel-of-product" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="carousel carouselImage" src="img/lunbo/1.jpg">
        </div>
        <div class="item">
            <img class="carouselImage" src="img/lunbo/2.jpg">
        </div>
        <div class="item">
            <img class="carouselImage" src="img/lunbo/3.jpg">
        </div>

        <div class="item">
            <img class="carouselImage" src="img/lunbo/4.jpg">
        </div>
</div>--%>