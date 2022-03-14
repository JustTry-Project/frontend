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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/person.css">
  <title>个人信息</title>
  <style>
  	.person-top{
  		 background-image: linear-gradient(45deg,#f1eefc,#9dc6ff 70%,#a5bcff);
  		 height:165px;
  	}
  	.person-top .cz-btn{
  		border:none;
  		background:rgba(0,0,205,0.7);
  		color:#F0FFFF;
  		padding:4px 8px;
  		border:1px solid blue;
  		border-radius:4px;
  	}
  	.person-top .logout{
  		border:none;
  		background:rgba(238,0,0,0.7);
  		color:#F0FFFF;
  		padding:4px 8px;
  		border:1px solid red;
  		border-radius:4px;
  	}
  	.info-con{
  		width:100%;
  		margin-top:50px;
  		margin-bottom:50px;
  	}
  	.info-con h2{
  		background-color:#fff;
  		text-align:left;
  	}
  	.info-con .msg{
  		padding:10px;
  		width:150px;
  		height:150px;
  		border-radius: 50%;
  		background-color:yellow;
  		margin:10px auto;
  	}
  	.info-con .msg p{
  		text-align:center;
  		line-height:40px;
  		font-size:16px;
  	}
  	.card{
      width: 100%;
      height: 100px;
      position: relative;
      /* padding: 5px;   */
    }
    .card img{
      margin-left: 5px;
      margin-top:10px;
      width: 90px;
      height: 90px;
      display: block;
      float: left;
    }
    .card .right{
      float: left;
      position: relative;
      padding-left: 10px;
      width: 180px;
      height: 90px;
    }
    .card .right .title,.desc,.bom{
      display: inline-block;
      width: 180px;
      text-align: left;
    }
    .card .right .price{
      color: red;
      font-size: 1.4em;
    }
    .card .del{
      position: absolute;
      width: 60px;
      right: 0px;
      top: 50px;
      height: 30px;
    }
    .card .del button{
      background-color: rgb(252, 29, 29);
      border: 1px solid rgb(247, 31, 31);
      box-shadow: 1px 1px 1px 1px rgb(247, 31, 31);
    }
    .bottom .n1 .can-btn{
    	border:none;
  		background:rgba(0,0,205,0.7);
  		color:rgba(255,255,255,0.8);
  		border:1px solid blue;
  		height:35px;
  		line-height:35px;
    }
    .bottom .n2 .menu-btn{
    	border:none;
  		background:rgba(0,0,205,0.7);
  		color:rgba(255,255,255,0.8);
  		border:1px solid blue;
  		height:35px;
  		line-height:35px;
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
</head>
<body>
  
  <h2>个人信息</h2>
  <!-- 头部个人信息 -->
  <c:if test="${empty user}">
  	 <div class="no-login">
	    <h2>您尚未登陆，请先登录！</h2>
	    <button class="login">立即登录</button>
	  </div>
  </c:if>
  <c:if test="${!empty user}">
  	<div class="person-top">
    <p>${user.nike }</p>
    <div class="right">
      <div class="acount">
        <span>账户剩余：￥<span class="a-price">${user.acount }</span></span>
        <button class="cz-btn">立即充值</button>
      </div>
      <p>联系电话：${user.phone }</p>
      <button class="logout">退出登录</button>
    </div>
    <div class="bottom">
      <div class="n1"><button class="can-btn">我的餐号</button></div>
      <div class="n2"><button class="menu-btn">历史点单</button></div>
    </div>
  </div>
  </c:if>
  
  <div class="info-con">
  	
  </div>
   <!-- 信息选择 -->
   <div class="foot">
    <div onclick="index()">
      <img src="${pageContext.request.contextPath }/images/shou-ico.jpg" alt="shou-ico">
      <span >主页</span>
    </div>
    <div onclick="fenlei()">
      <img src="${pageContext.request.contextPath }/images/fen-ico.jpg" alt="shou-ico">
      <span>菜品</span>
    </div>
    <div onclick="menu()">
      <img src="${pageContext.request.contextPath }/images/caidan-ico.jpg" alt="shou-ico">
      <span>菜单</span>
    </div>
    <div onclick="persion()">
      <img src="${pageContext.request.contextPath }/images/person-ico.jpg" alt="shou-ico">
      <span class="active">我的</span>
    </div>
  </div>
  <span class="tag">1</span>
  <div class="add-acount">
  	<div class="cont">
  		<input type="number" placeholder="请输入充值金额" class="acount-number">
  		<button class="add-zc">确认充值</button>
  	</div>
  </div>
  <script>
  	$(function(){
  		getFoodNum();
  		
  		//获取餐号信息
  		$.post('getCanhao',{},function(data){
  			if(data.length>0){
  				canHao(data);
  			}
  		},'json')
  		//我的餐号点击事件
  		$('.can-btn').click(function(){
  			//获取餐号信息
  	  		$.post('getCanhao',{},function(data){
  	  			if(data.length>0){
  	  				canHao(data);
  	  			}else{
  	  				$('.info-con').html("<h3>您还没有餐号信息</h3>")
  	  			}
  	  		},'json')
  		})
  		//我的历史订单点击事件
  		$('.menu-btn').click(function(){
  			//获取餐号信息
  	  		$.get('getOrders',{},function(data){
  	  			if(data.length>0){
  	  				orders(data);
  	  			}else{
  	  				$('.info-con').html("<h3>您没有相关信息</h3>")
  	  			}
  	  			
  	  		},'json')
  		})
  		//跳转登录页面
  		$('.login').click(function(){
  			 window.location.href = "toLogin";
  		})
  		
  		//退出登录
  		$('.logout').click(function(){
  			window.location.href="logout";
  		})
  		//充值按钮事件
  		$('.cz-btn').click(function(){
  			$('.add-acount').css("display","block").animate({
  				opacity:1,
  			},'slow')
  		})
  		//隐藏充值页面
  		$('.add-acount').click(function(event){
  			$(this).animate({opacity:0.5},200,function(){
  				$(this).css('display','none');
  			});
  		})
  		$('.cont').click(function(event){
  			//阻止冒泡事件
  			event.stopPropagation();
  		})
  		//充值
  		$('.add-zc').click(function(){
  			var num = $('.acount-number').val();
  			if(num>0){
  				$.post('addAcount?price='+num,{},function(data){
  					$('.add-acount').animate({opacity:0.5},200,function(){
  	  	  				$(this).css('display','none');
  	  	  			});
  					if(data>0){
  						//充值成功
  						window.location.href = "person";
  					}else{
  						alert('充值失败，请重新尝试！');
  					}
  				},'json')
  			}
  		})
  		

  		
  	})
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
  	
  	//餐号渲染
  	function canHao(data){
  		var list='';
  		$('.info-con').html("");
  		list+='<h2>您有'+data.length+'个餐号：</h2>'
  		for(var item in data){
  			list+= '<div class="msg">'+
  	  					'<p>您的餐号'+(parseInt(item)+1)+'</p>'+
  	  					'<p class="wait">'+data[item].wait+'</p>';
  	  				
  	  		if(data[item].wstate==0){
  	  			list+='<p>备餐中</p>';
  	  		}else if(data[item].wstate==1){
  	  			list+='<p style="color:red">待取餐</p>';
  	  		}
  	  		
  	  		list+='</div>';
  		}
  		$('.info-con').html(''+list);
  	}
  	
  	//历史订单渲染
  	function orders(ors){
  		var list='';
  		$('.info-con').html("");
  		list+='<h4>历史点餐信息：</h4>'
  		for(var item in ors){
  			list +='<div class="card">'+
		      '<img src="${pageContext.request.contextPath }'+ors[item].card.food.fpicture+'" alt="food">'+
		      '<div class="right">'+
		        '<span class="title">'+ors[item].card.food.fname+'——'+dateTime(ors[item].otime)+'</span><br/>'+
		        '<span class="desc">'+ors[item].card.food.fdesc+'</span><br>'+
		        '<span class="bom">单价：￥<span class="price">'+ors[item].card.food.fprice.toFixed(2)+'</span></span><br/>'+
		        '<span>个数：x'+ors[item].card.num+'</span>'+
		        '<span>总价：￥<span class="price">'+ors[item].card.tprice.toFixed(2)+'</span></span>'+
		      '</div>'+
		      '<div class="del">'+
		      	'<input type="hidden" value="'+ors[item].oid+'">'+
		        '<button class="del-order">删除</button>'+
		      '</div>'+
		    '</div><hr/>';
  		}
  		$('.info-con').html(''+list);
  		
  		$('.del-order').click(function(){
  			if(confirm("您确定要删除吗？")){
	  			var oid = $('.del-order').prev().val();
	  			$.get('deleteOrder',{oid:oid},function(data){
	  				if(data>0){
	  					//重新获取餐号信息
	  		  	  		$.get('getOrders',{},function(data){
		  		  	  		if(data.length>0){
		  	  	  				orders(data);
		  	  	  			}else{
		  	  	  				$('.info-con').html("<h3>您没有相关信息</h3>")
		  	  	  			}
	  		  	  		},'json')
	  				}else{
	  					alert('删除失败，请重新尝试！')
	  				}
	  			})
  			}
  		})
  	}
  	//时间格式转换
  	function dateTime(time){
  		var date='';
  		var da = new Date(time);
  		date+=da.getFullYear()+'.';
  		date+=(da.getMonth()+1)+'.';
  		date+=da.getDate();
  		return date;
  	}
  </script>


</body>
</html>