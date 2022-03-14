<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/register.css">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <title>注册</title>
  <style>
  	.index_a{
  		font-size:12px;
  		margin-left:20px;
  		text-decoration:none;
  	}
  </style>
</head>
<body>
  <div class="bg">
    <div class="content">
      <h2>注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</h2>
      <div class="inp">
        <span>用&nbsp;&nbsp;户&nbsp;名&nbsp;：</span>
        <input type="text" name="username"> 
      </div>
      <span class="umsg"></span>
      <div class="inp">
        <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
        <input type="password" name="password">
      </div>
      <span class="pmsg"></span>
      <div class="inp">
        <span>确认密码：</span>
        <input type="password" name="check">
      </div>
      <span class="cmsg"></span>
      <div class="inp">
        <span>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</span>
        <input type="text" name="phone">
      </div>
      <span class="tmsg"></span>
      <div class="inp">
        <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
        <input type="text" name="nike">
      </div>
      <span class="nmsg"></span>
      <div class="res">
        <input type="submit" value="提交" class="btn">
      </div>
      <a class="index_a" href="${pageContext.request.contextPath }/user/index">首页</a>
    </div>
  </div>
  <!-- 表单验证js -->
  <script>
    $(function(){
      var uflag = false;
      var pflag = false;
      var tflag = false;
      var nflag = false;
      var cflag = false;
      $('.btn').click(function(){
        if(uflag&&pflag&&tflag&&nflag&&cflag){
        	var username =  $('[name="username"]').val().trim();
        	var password = 	$('[name="password"]').val().trim();
        	var nike = $('[name="nike"]').val().trim();
        	var phone = $('[name="phone"]').val().trim();
          $.post('addUser',{
        	  username:username,
        	  password:password,
        	  nike:nike,
        	  phone:phone
          },function(data){
        	  if(data){
        		  window.location.href = "toLogin";
        	  }
          })
        }
      })
      //校验用户名
      $('[name="username"]').blur(function(){
        var reg = /^\w{6,16}$/
        if(reg.test(this.value)){
          $.get('checkUser?username='+this.value,{},function(data){
        	  if(data){
        		  uflag = false;
                  $('.umsg').html("用户名已存在！");
        	  }else{
        		  uflag = true;
                  $('.umsg').html("")
        	  }
          },'json')
        }else{
          uflag = false;
          $('.umsg').html("用户名6~16位数字、字母、下划线组成");
        }
      })
      //校验密码
      $('[name="password"]').blur(function(){
        if(this.value.trim().length>=6&&this.value.trim().length<=16){
          cflag = true;
          $('.pmsg').html("");
        }else{
          cflag = false;
          $('.pmsg').html('密码为6~16位');
        }
      })
      //确认密码
      $('[name="check"]').blur(function(){
        var p1 = $('[name="password"]').val();
        var p2 = $('[name="check"]').val();
        if(p1==p2){
          pflag = true;
          $('.cmsg').html("");
        }else{
          pflag = false;
          $('.cmsg').html("两次密码不一致！");
        }
      })
      //手机号验证
      $('[name="phone"]').blur(function(){
        var reg = /^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
        if(reg.test(this.value)){
          tflag = true;
          $('.tmsg').html("");
        }else{
          tflag = false;
          $('.tmsg').html("请输入正确的电话号码！");
        }
      })
      //昵称不能为空
      $('[name="nike"]').blur(function(){
        if(this.value.trim().length>0){
          nflag = true;
          $('.nmsg').html("");
        }else{
          nflag = false;
          $('.nmsg').html("昵称不能为空！")
        }
      })
    })
  </script>
</body>
</html>