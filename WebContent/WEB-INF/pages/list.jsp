<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
    <style>
        h2{
            text-align:center;
            font-size: 24px;
            padding: 10px;
            margin: 0;
            background-color: rgb(232, 233, 230);
        }
	    .center{
  width: 100%;
}
.item{
  width: 50%;
  padding: 0 15px;
  height: 50px;
  line-height: 50px;
  background-color: grey;
  border: 1px solid black;
  text-align: center;
  float: left;
  font-size: 1.2em;
}
.item a{
  text-decoration: none;
  color: #000;
  font-weight: 900;
}
.item a:hover{
  color:red;
}
.i2{
  background-color: grey;
  border: 1px solid black;
}
.i3{
  background-color: grey;
  border: 1px solid black;
}
.i4{
  background-color: grey;
  border: 1px solid black;
}

.hot{
  margin-top: 10px;
  margin-bottom:51px;
}
.hot h2{
  font-size: 24px;
  padding: 10px;
  margin: 0;
  background-color: rgb(232, 233, 230);
}
.hot .food{
  width: 100%;
  height: 90px;
}
.hot .food img{
  width: 90px;
  height: 90px;
  display: block;
  float: left;
}

.hot .food .right{
  float: left;
  position: relative;
  padding-left: 10px;
  width: 155px;
  height: 90px;
}
.hot .food .right span{
  margin-top: 10px; 
}
.hot .food .right .title{
  font-size: 20px;
}
.hot .food .right .desc{
  font-size: 12px;
  color: rgb(100, 100, 100);
}
.hot .food .right .bom{
  position: absolute;
  bottom: 5px;
}
.hot .food .right .price{
  font-size: 1.4em;
  color: red;
}


.hot .food .add{
  float: left;
  width: 130px;
  margin-top:35px;
  height: 30px;
}

.hot .food .add .buy-food{
  position: absolute;
  margin-left: 5px;
  background-color: rgb(100, 100, 100);
  border: 1px solid rgb(90, 90, 90);
}

.foot{
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 50px;
  background-color: #fff;
}
.foot div{
  width: 25%;
  height: 65px;
  line-height: 25px;
  padding:0 10px;
  padding-top: 5px;
  float: left;
  text-align: center;
  border: 1px solid rgb(199, 199, 199);
}
.foot div img{
  width: 25px;
  margin-left: 25px;
  display: block;
  height: 24px;
}
.foot div .active{
  color: blue;
}
.tag{
  display: none;
  position: fixed;
  width: 20px;
  height: 20px;
  text-align: center;
  line-height: 20px;
  color: red;
  bottom: 30px;
  border: 1px solid red;
  border-radius: 50%;
}
    </style>
    <script>
        //????????????
        function index(){
            window.location.href = 'index';
            // alert(1);
        }
        //????????????
        function fenlei(){
            window.location.href = "fenlei"
        }
        //????????????
        function menu(){
            window.location.href = "menu"
        }
        //??????????????????
        function persion(){
            window.location.href = "person"
        }

    </script>
</head>

<body>
<c:if test="${title==1 }">
    <h2>Appetizer</h2>
</c:if>
<c:if test="${title==2 }">
    <h2>Main dish</h2>
</c:if>
<c:if test="${title==3 }">
    <h2>Special dishes</h2>
</c:if>
<c:if test="${title==4 }">
    <h2>Drinks</h2>
</c:if>

<div class="hot">
    <!-- ???????????? -->
    <c:forEach items="${foods }" var="food">
        <div class="food">
            <img src="${pageContext.request.contextPath }${food.fpicture}" alt="food">
            <div class="right">
                <span class="title">${food.fname}</span><br/>
                <span class="desc">${food.fdesc }</span><br>
                <span class="bom">???<span class="price">${food.fprice }</span></span>
            </div>
            <div class="add">
                <button class="food-del">-</button>
                <span class="food-num">1</span>
                <button class="food-add">+</button>
                <button class="buy-food" onclick="buyFood(this)">purchase</button>
                <input type="hidden" value="${food.fid }"/>
            </div>
        </div><hr>
    </c:forEach>
</div>
<!-- ???????????? -->
<div class="foot">
    <div onclick="index()">
        <img src="${pageContext.request.contextPath }/images/shou-ico.jpg" alt="shou-ico">
        <span>Home</span>
    </div>
    <div onclick="fenlei()">
        <img src="${pageContext.request.contextPath }/images/fen-ico.jpg" alt="shou-ico">
        <span>Food</span>
    </div>
    <div onclick="menu()">
        <img src="${pageContext.request.contextPath }/images/caidan-ico.jpg" alt="shou-ico">
        <span>Menu</span>
    </div>
    <div onclick="persion()">
        <img src="${pageContext.request.contextPath }/images/person-ico.jpg" alt="shou-ico">
        <span>Mine</span>
    </div>
</div>
<span class="tag">1</span>
<script>

    $(function(){
        getFoodNum();
        //????????????????????????
        $('.food-del').click(function(){
            var num = $(this).next().html();
            if(num>1){
                num--;
                $(this).next().html(num);
            }else{
                alert('It cannot be reduced anymore???')
            }
        })

        //??????????????????
        $('.food-add').click(function(){
            var num = $(this).prev().html();
            if(num<20){
                num++;
                $(this).prev().html(num);
            }else{
                alert('You can only order 20 copies at most!')
            }
        })
    })

    //????????????
    var height = 0;
    //????????????????????????
    $(window).scroll(function() {
        height=$(window).scrollTop();
    });

    //????????????
    function buyFood(item){
        var num = $(item).prev().prev().html();
        var fid = $(item).next().val();
        var tprice = $(item).parent().prev().children('.bom').children('.price').html()*num;
        $.get('addCard?fid='+fid+'&num='+num+'&tprice='+tprice,{},function(data){
            if(data.state==-1){
                if(confirm("You haven't logged in yet. Do you want to jump to login?")){
                    window.location.href = "toLogin"
                }
            }else if(data.state==0){
                alert("Failed to add menu, please add again!")
            }else{
                //??????????????????
                var width = $('.foot').width();
                var newWidth = (width/4)+(width/4/2);
                //??????????????????????????????
                $(item).clone().insertBefore(item).animate({
                    right:newWidth+'px',
                    bottom:-height+'px',/*???????????????????????????*/
                    width:'0',
                    opacity:0.5
                },"slow",function(){
                    //??????????????????
                    $(this).remove();
                    getFoodNum();
                })
            }
        },"json")
    }



    //??????????????????
    function getFoodNum(){
        //??????????????????
        var width = $('.foot').width();
        $.get('getFoodNum',{},function(data){
            if(data>0){
                $('.tag').html(data+"");
                $('.tag').css({
                    display:'block',
                    right:(width/4+5)+'px'
                })
            }else{
                $('.tag').html("0");
                $('.tag').css({
                    display:'none',
                    right:(width/4+5)+'px'
                })
            }
        },'json')
    }
</script>
</body>
</html>
