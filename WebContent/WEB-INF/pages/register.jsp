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
  <title>register</title>
  <style>
  	.index_a{
  		font-size:12px;
  		margin-left:20px;
  		text-decoration:none;
  	}
      body{
  margin: 0;
  padding: 0;
}
.bg{
  width: 100%;
  height: 100vh;
  background-color: white;
  position: relative;
}
.content{
  width: 350px;
  height: 450px;
  background-color: rgb(112,227,227);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-175px,-225px);
  border-radius: 10px;
  box-shadow: 2px 2px 10px 3px rgb(196, 195, 195);
}
.content h2{
  text-align: center;
}
.content .inp{
  height: 30px;
  width: 100%;
  line-height: 30px;
  margin-left: 10%;
  margin-top: 20px;
  padding: 5px;
}
.content .inp span{
  width: 80px;
  display: inline-block;
  height: 25px;
  line-height: 25px;
}
.content .inp input{
  border: 1px solid #000;
  padding-left: 8px;
  height: 25px;
  line-height: 25px;
}

.res{
  width: 100%;
  height: 35px;
  margin-top: 20px;
}
.res input{
  width: 50%;
  margin-left: 25%;
  height: 35px;
  font-size: 16px;
  border: none;
  background-color: royalblue;
  border-radius: 5px;
  box-shadow: 1px 1px 8px 1px rgb(39, 89, 230);
}
.umsg,.pmsg,.cmsg,.tmsg,.nmsg{
  display: block;
  width: 100%;
  text-align: center;
  font-size: 12px;
  color: red;
}
  </style>
</head>
<body>
  <div class="bg">
    <div class="content">
      <h2>Register</h2>
      <div class="inp">
        <span>username&nbsp;：</span>
        <input type="text" name="username"> 
      </div>
      <span class="umsg"></span>
      <div class="inp">
        <span>password&nbsp;：</span>
        <input type="password" name="password">
      </div>
      <span class="pmsg"></span>
      <div class="inp">
        <span>confirm&nbsp;&nbsp;：</span>
        <input type="password" name="check">
      </div>
      <span class="cmsg"></span>
      <div class="inp">
        <span>phone&nbsp;&nbsp;&nbsp;&nbsp;：</span>
        <input type="text" name="phone">
      </div>
      <span class="tmsg"></span>
      <div class="inp">
        <span>nickname&nbsp;：</span>
        <input type="text" name="nike">
      </div>
      <span class="nmsg"></span>
      <div class="res">
        <input type="submit" value="submit" class="btn">
      </div>
      <a class="index_a" href="${pageContext.request.contextPath }/user/index">home</a>
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
                  $('.umsg').html("User name already exists！");
        	  }else{
        		  uflag = true;
                  $('.umsg').html("")
        	  }
          },'json')
        }else{
          uflag = false;
          $('.umsg').html("The user name is composed of 6 ~ 16 digits of numbers, letters and underscores!");
        }
      })
      //校验密码
      $('[name="password"]').blur(function(){
        if(this.value.trim().length>=6&&this.value.trim().length<=16){
          cflag = true;
          $('.pmsg').html("");
        }else{
          cflag = false;
          $('.pmsg').html('The password is 6 ~ 16 digits!');
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
          $('.cmsg').html("The two passwords are inconsistent!");
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
          $('.tmsg').html("Please enter the correct phone number!");
        }
      })
      //昵称不能为空
      $('[name="nike"]').blur(function(){
        if(this.value.trim().length>0){
          nflag = true;
          $('.nmsg').html("");
        }else{
          nflag = false;
          $('.nmsg').html("Nickname cannot be empty!")
        }
      })
    })
  </script>
</body>
</html>
