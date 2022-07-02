<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<style>
    #swiper-container-one{
        width: 500px;
        height: 280px;
        border-radius:15px;

    }

    .imglunbo1{
        width: 100%;
        height: 100%;
    }

    #swiper-container-one{

        --swiper-theme-color: red;/*设置按钮颜色*/
        --swiper-pagination-color: red;/*设置分页器颜色*/
        --swiper-navigation-size:20px;/*设置按钮大小*/
    }
</style>

<!--使用swiper中文文档实现图片轮播-->
<!--出现多个轮播图的情况，给swiper-container定义一个id-->
<div class="swiper-container"id="swiper-container-one">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img class="imglunbo1" src="img/lunbo1/轮播1-1.webp"></div>
        <div class="swiper-slide"><img class="imglunbo1" src="img/lunbo1/轮播1-2.webp"></div>
        <div class="swiper-slide"><img class="imglunbo1" src="img/lunbo1/轮播1-3.jpg"></div>
        <div class="swiper-slide"><img class="imglunbo1" src="img/lunbo1/轮播1-4.webp"></div>
        <div class="swiper-slide"><img class="imglunbo1" src="img/lunbo1/轮播1-5.jpg"></div>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>

    <!-- 如果需要导航按钮 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>

    <!-- 如果需要滚动条 -->
    <!--<div class="swiper-scrollbar"></div>-->
</div>
<script>
    var mySwiper = new Swiper ('#swiper-container-one', {
        direction: 'horizontal', // 垂直切换选项vertical,横向轮播horizontal
        loop: true, // 循环模式选项
        //加入速度
        speed:150,
        //自动轮播
        autoplay:{
            delay:1500
        },

        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
        },

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