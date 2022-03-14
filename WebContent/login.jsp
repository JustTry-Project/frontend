<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <title>登录</title>
  <style>
  	.umsg,.pmsg{
  		display:block;
  		width:100%;
  		text-align:center;
  		color:red;
  		font-size:12px;
  	}
  	.index{
  		position: absolute;
 		left: 20px;
		bottom: 10px;
  		font-size: 13px;
  	}
  </style>
</head>
<body>
  <div class="bg">
    <div class="content">
      <h2>登录</h2>
      <div class="inp">
        <img src="${pageContext.request.contextPath }/images/login-ico.jpg" alt="user">
        <input type="text" name="username" placeholder="请输入用户名">
      </div>
      <span class="umsg"></span>
      <div class="inp">
        <img src="${pageContext.request.contextPath }/images/lock-ico.jpg" alt="lock">
        <input type="password" name="password" placeholder="请输入密码">
      </div>
      <span class="pmsg"></span>
      <div class="inp login">
          <input class="login-btn" type="submit" value="登录">
      </div>
      <span class="res"><a href="${pageContext.request.contextPath }/user/toRegister">注册</a></span>
      <span class="index"><a href="${pageContext.request.contextPath }/user/index">首页</a></span>
    </div>
  </div>
  
  <script>
  	//登录
  	$(function(){
  		var uflag = false;
  		var pflag = false;
  		$('.login-btn').click(function(){
  			if(uflag&&pflag){
  				var username = $('[name="username"]').val();
  				var password = $('[name="password"]').val();
  				$.post('login?username='+username+'&password='+password,{},function(data){
  					if(data){
  						window.location.href = "person";
  					}else{
  						alert('用户名或密码错误！');
  					}
  				},'json')
  			}
  		})
  		
  		 //校验用户名
      $('[name="username"]').blur(function(){
        var reg = /^\w{6,16}$/
        if(reg.test(this.value)){
          uflag = true;
          $('.umsg').html("")
        }else{
          uflag = false;
          $('.umsg').html("用户名6~16位数字、字母、下划线组成");
        }
      })
       //校验密码
      $('[name="password"]').blur(function(){
        if(this.value.trim().length>=6&&this.value.trim().length<=16){
          pflag = true;
          $('.pmsg').html("");
        }else{
          pflag = false;
          $('.pmsg').html('密码为6~16位');
        }
      })
  	})
  </script>
</body>
</html>