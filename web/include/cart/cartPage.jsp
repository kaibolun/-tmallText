<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>


<script>
    var deleteOrderItem = false;
    var deleteOrderItemid = 0;
    // 删除删除弹窗 并记录删除的商品项id //
    $(function () {
        $("a.deleteOrderItem").click(function () {
            deleteOrderItem = false;
            var orderItem = $(this).attr("orderItem");
            deleteOrderItemid = orderItem;
            $("#deleteConfirmModal").modal('show');
        });

        $("button.deleteConfirmButton").click(function () {
            deleteOrderItem = true;
            /*  $(".cartProductItemIfSelected").attr("selectit","false");*/
            $("#deleteConfirmModal").modal('hide');
        });

        //删除商品 盒子//
        $('#deleteConfirmModal').on('hidden.bs.modal', function () {
            if (deleteOrderItem) {
                var url = "foredeleteOrderItem";
                $.post(
                    page,
                    {"orderItem": deleteOrderItemid},
                    function (result) {
                        if ("success" == result) {
                            // if($("img.cartProductItemIfSelected[orderItem=" + deleteOrderItemid + "]").attr("selectit")=="selectit"&&
                            //     $("img.selectAllItem").attr("selectit")=="selectit"){
                            // }
                            $("img.cartProductItemIfSelected[orderItem=" + deleteOrderItemid + "]").attr("selectit","false");
                            syncCreateOrderButton(); //结算变化//
                            calcCartSumPriceAndNumber();//总价变化//
                            syncCreateOrderButton();//结算按钮是否明亮//
                            checkall();//查看是否全选
                            syncSelect(); //单选框变化//

                            $("tr.cartProductItemTR[orderItem=" + deleteOrderItemid + "]").remove();
                        }
                        else {
                            location.href = "login.jsp";
                        }
                    }
                );

            }
        });
        // 单选选项//
        $("img.cartProductItemIfSelected").click(function () {
            var selectit = $(this).attr("selectit");
            if ("selectit" == selectit) {
                $(this).attr("src", "img/site/cartNotSelected.png");
                $(this).attr("selectit", "false");
                $(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
            }
            else {
                $(this).attr("src", "img/site/cartSelected.png");
                $(this).attr("selectit", "selectit");
                $(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
            }
            syncSelect(); //单选框变化//
            syncCreateOrderButton(); //结算变化//
            calcCartSumPriceAndNumber();//总价变化//
        });
        //全选//
        $("img.selectAllItem").click(function () {
            var selectit = $(this).attr("selectit");
            if ("selectit" == selectit) {
                $("img.selectAllItem").attr("src", "img/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit", "false");
                $(".cartProductItemIfSelected").each(function () {
                    $(this).attr("src", "img/site/cartNotSelected.png");
                    $(this).attr("selectit", "false");
                    $(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
                });
            }
            else {
                $("img.selectAllItem").attr("src", "img/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit", "selectit");
                $(".cartProductItemIfSelected").each(function () {
                    $(this).attr("src", "img/site/cartSelected.png");
                    $(this).attr("selectit", "selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
                });
            }
            syncCreateOrderButton();//结算按钮变化//
            calcCartSumPriceAndNumber();//总价计算和显示//
        });
       function checkall() {

           var selectit = $("img.selectAllItem").attr("selectit");
           if ("selectit" == selectit) {
               $("img.selectAllItem").attr("src", "img/site/cartSelected.png");
               $("img.selectAllItem").attr("selectit", "selectit");
               $(".cartProductItemIfSelected").each(function () {
                   $(this).attr("src", "img/site/cartSelected.png");
                   $(this).attr("selectit", "selectit");
               });
           }
           else {
               $("img.selectAllItem").attr("src", "img/site/cartNotSelected.png");
               $("img.selectAllItem").attr("selectit", "false");
               $(".cartProductItemIfSelected").each(function () {
                   $(this).attr("src", "img/site/cartNotSelected.png");
                   $(this).attr("selectit", "false");
               });
           }
       }
        //数量设置//
        $(".orderItemNumberSetting").keyup(function () {
            var pid = $(this).attr("pid");
            var stock = $("span.orderItemStock[pid=" + pid + "]").text();
            var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
            var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
            num = parseInt(num);
            if (isNaN(num))
                num = 1;
            if (num <= 0)
                num = 1;
            if (num > stock)
                num = stock;

            syncPrice(pid, num, price);//数量变后总价改变，数量传入后端//
        });

        //增加商品数//
        $(".numberPlus").click(function () {

            var pid = $(this).attr("pid");
            console.log("pid=" + pid);
            console.log("no no cache");
            var stock = $("span.orderItemStock[pid=" + pid + "]").text();
            console.log("stock=" + stock);
            var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
            console.log("price=" + price);
            var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
            num++;
            if (num > stock)
                num = stock;
            syncPrice(pid, num, price); //数量变后总价改变，数量传入后端//
        });
        //减少商品数//
        $(".numberMinus").click(function () {
            var pid = $(this).attr("pid");
            var stock = $("span.orderItemStock[pid=" + pid + "]").text();
            var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
            var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
            --num;
            if (num <= 0)
                num = 1;
            syncPrice(pid, num, price);//数量变后总价改变，数量传入后端//
        });

        $("button.createOrderButton").click(function () {
            var params = "";
            $(".cartProductItemIfSelected").each(function () {
                if ("selectit" == $(this).attr("selectit")) {
                    var orderItem = $(this).attr("orderItem");
                    params += "&orderItemId=" + orderItem;
                }
            });
            params = params.substring(1);
            location.href = "forebuy?" + params;
        });


    });
    //结算按钮，有选就亮，否则暗//
    function syncCreateOrderButton() {
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function () {
            if ("selectit" == $(this).attr("selectit")) {
                selectAny = true;
            }
        });

        if (selectAny) {
            $("button.createOrderButton").css("background-color", "#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else {
            $("button.createOrderButton").css("background-color", "#AAAAAA");
            $("button.createOrderButton").attr("disabled", "disabled");
        }

    }
    //单选框变化//
    function syncSelect() {
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function () {
            if ("false" == $(this).attr("selectit")) {
                selectAll = false;
            }
        });

        if (selectAll)
            $("img.selectAllItem").attr("src", "img/site/cartSelected.png");
        else
            $("img.selectAllItem").attr("src", "img/site/cartNotSelected.png");


    }

    //编辑价格格式转换为可计算格式计算后并显示在页面//
    function calcCartSumPriceAndNumber() {
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function () {
            var orderItem = $(this).attr("orderItem");
            var price = $(".cartProductItemSmallSumPrice[orderItem=" + orderItem + "]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += Number(price);

            var num = $(".orderItemNumberSetting[orderItem=" + orderItem + "]").val();
            totalNumber += Number(num);

        });

        $("span.cartSumPrice").html("￥" + formatMoney(sum));
        $("span.cartTitlePrice").html("￥" + formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }
        //计算价格再转回带￥格式，传入后端加入订单商品数量//
    function syncPrice(pid, num, price) {
        $(".orderItemNumberSetting[pid=" + pid + "]").val(num);
        var cartProductItemSmallSumPrice = formatMoney(num * price);
        $(".cartProductItemSmallSumPrice[pid=" + pid + "]").html("￥" + cartProductItemSmallSumPrice);
        calcCartSumPriceAndNumber();

        var page = "forechangeOrderItem";
        $.post(
            page,
            {"pid": pid, "number": num},
            function (result) {
                if ("success" != result) {
                    location.href = "login.jsp";
                }
            }
        );

    }
</script>

<title>购物车</title>
<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" disabled="disabled">结 算</button>
    </div>


    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
                    全选

                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderItems }" var="oi">
                <tr orderItem="${oi.id}" class="cartProductItemTR">
                    <td>
                        <img selectit="false" orderItem="${oi.id}" class="cartProductItemIfSelected"
                             src="img/site/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="img/site/cartSelected.png"></a>
                        <img class="cartProductImg"
                             src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg">
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a href="foreproduct?pid=${oi.product.id}" class="cartProductLink">${oi.product.name}</a>
                            <div class="cartProductLinkInnerDiv">
                                <img src="img/site/creditcard.png" title="支持信用卡支付">
                                <img src="img/site/7day.png" title="消费者保障服务,承诺7天退货">
                                <img src="img/site/promise.png" title="消费者保障服务,承诺如实描述">
                            </div>
                        </div>

                    </td>
                    <td>
                        <span class="cartProductItemOringalPrice">￥${oi.product.originalPrice}</span>
                        <span class="cartProductItemPromotionPrice">￥${oi.product.promotePrice}</span>

                    </td>
                    <td>

                        <div class="cartProductChangeNumberDiv">
                            <span class="hidden orderItemStock " pid="${oi.product.id}">${oi.product.stock}</span>
                            <span class="hidden orderItemPromotePrice "
                                  pid="${oi.product.id}">${oi.product.promotePrice}</span>
                            <a pid="${oi.product.id}" class="numberMinus" href="#nowhere">-</a>
                            <input pid="${oi.product.id}" orderItem="${oi.id}" class="orderItemNumberSetting"
                                   autocomplete="off" value="${oi.number}">
                            <a stock="${oi.product.stock}" pid="${oi.product.id}" class="numberPlus"
                               href="#nowhere">+</a>
                        </div>

                    </td>
                    <td>
							<span class="cartProductItemSmallSumPrice" orderItem="${oi.id}" pid="${oi.product.id}">
							￥<fmt:formatNumber type="number" value="${oi.product.promotePrice*oi.number}"
                                               minFractionDigits="2"/>
							</span>

                    </td>
                    <td>
                        <a class="deleteOrderItem" orderItem="${oi.id}" href="#nowhere">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="cartFoot">
        <img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
        <span>全选</span>
        <!-- 		<a href="#">删除</a> -->

        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber">0</span> 件</span>

            <span>合计 (不含运费): </span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" disabled="disabled">结 算</button>
        </div>

    </div>

</div>