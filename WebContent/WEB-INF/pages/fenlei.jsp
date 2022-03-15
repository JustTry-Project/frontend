<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
  <title>Classification</title>
  <style>
    h1{
      text-align: center;
      font-size: 24px;
      background-color: wheat;
      margin: 0;
      padding: 10px;
    }
    .search{
      margin-top: 2px;
      width: 100%;
    }
    .search input{
      width: 80%;
      height: 30px;
      padding-left: 15px;
    }
    .search button{
      width: 18%;
      height: 30px;
    }
    .buy-food{
      position: absolute;
      margin-left: 5px;
      background-color: rgb(100, 100, 100);
      border: 1px solid rgb(90, 90, 90);
    }
  </style>
    <!-- 跳转 -->
  <script>
    //首页跳转
    function index(){
      window.location.href = "index"
      // alert(1);
    }
    //跳转分类
    function fenlei(){
      window.location.href = "fenlei"
    }
    //跳转菜单
    function menu(){
      window.location.href = "menu"
    }
    //跳转个人信息
    function persion(){
      window.location.href = "person"
    }
  </script>
   <!-- 食品事件 -->
  <script>
  	
  //食品添加事件
  function add(item){
     var num = $(item).prev().html();
     if(num<20){
       num++;
       $(item).prev().html(num);
     }else{
       alert('You can only order 20 at most.')
     }
   }
//食品删减按钮事件
  function del(item){
      var num = $(item).next().html();
      if(num>1){
        num--;
        $(item).next().html(num);
      }else{
        alert('It cannot be reduced anymore!')
      }
    }
    
  	//获取高度
 	 var height = 0;
	//获取滚动条的位置
	$(window).scroll(function() {
		height=$(window).scrollTop();
	});
  //购买事件
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
				//定位菜单坐标
				var width = $('.foot').width();
			  	var newWidth = (width/4)+(width/4/2);
		          //进行克隆节点动画效果
		          $(item).clone().insertBefore(item).animate({
		            right:newWidth+'px',
		            bottom:-height+'px',/*根据滚动条定位位置*/
		            width:'0',
		            opacity:0.5
		          },"slow",function(){
		        	  //移除克隆节点
		            $(this).remove();
		        	getFoodNum();
		          })
			}
		},"json")  
	}
  
  	//获取食品数量
  	function getFoodNum(){
  		//定位菜单坐标
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
  <!-- 实现模糊搜索显示 -->
  <script>
  	$(function(){
  		getFoodNum();
  		$('.search-btn').click(function(){
  			var value = $('.search-value').val();
  			//console.log(value);
  			$.get('getFoodByName?fname='+value,{},function(data){
  				//清空原有的结构数据
  				$('.hot').html('');
  				var list = '';
  				for(var item in data){
  	  				list+='	<div class="food">'+
  				  			     '<img src="${pageContext.request.contextPath }'+data[item].fpicture+'" alt="food">'+
  				  		      '<div class="right">'+
  				  		        '<span class="title">'+data[item].fname+'</span><br/>'+
  				  		        '<span class="desc">'+data[item].fdesc+'</span><br>'+
  				  		        '<span class="bom">￥<span class="price">'+data[item].fprice.toFixed(2)+'</span></span>'+
  				  		      '</div>'+
  				  		     ' <div class="add">'+
  				  		        '<button class="food-del" onclick="del(this)">-</button>'+
  				  		        '<span class="food-num">1</span>'+
  				  		        '<button class="food-add" onclick="add(this)">+</button>'+
  				  		        '<button class="buy-food" onclick="buyFood(this)">购买</button>'+
  				  		        '<input type="hidden" value="'+data[item].fid+'"/>'+
  				  		      '</div>'+
  				  		    '</div><hr>';
  				}
  				$('.hot').append(list);
  				//调整样式
  				$('.hot .food .add button').css("margin","3px");
  			},"json")
  		})
  	})
  </script>
</head>
<body>
  <h1>Food List</h1>
  <div class="search">
    <div>
      <button class="search-btn">Search</button>
      <input class="search-value" type="text" placeholder="Please input food name">
    </div>
  </div>
  <!-- 所有菜品 -->
  <div class="hot">
    <c:forEach items="${foods }" var="food">
	   	<div class="food">
	      <img src="${pageContext.request.contextPath }${food.fpicture}" alt="food">
	      <div class="right">
	        <span class="title">${food.fname}</span><br/>
	        <span class="desc">${food.fdesc }</span><br>
	        <span class="bom">￥<span class="price">${food.fprice }</span></span>
	      </div>
	      <div class="add">
	        <button class="food-del" onclick="del(this)">-</button>
	        <span class="food-num">1</span>
	        <button class="food-add" onclick="add(this)">+</button>
	        <button class="buy-food" onclick="buyFood(this)">purchase</button>
	        <input type="hidden" value="${food.fid }"/>
	      </div>
	    </div><hr>
    </c:forEach>

  </div>
  <!-- 信息选择 -->
  <div class="foot">
    <div onclick="index()">
      <img src="${pageContext.request.contextPath }/images/shou-ico.jpg" alt="shou-ico">
      <span >Home</span>
    </div>
    <div onclick="fenlei()">
      <img src="${pageContext.request.contextPath }/images/fen-ico.jpg" alt="shou-ico">
      <span class="active">Food</span>
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
  
</body>
</html>
