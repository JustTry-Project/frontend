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
  <title>login</title>
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
	  body{
  margin: 0;
  padding: 0;
}
.bg{
  width: 100%;
  height: 100vh;
  background-color: wheat;
  position: relative;
}
.content{
  width: 300px;
  height: 250px;
  background-color: azure;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-150px,-125px);
  border-radius: 10px;
  box-shadow: 2px 2px 10px 3px rgb(196, 195, 195);
}
.content h2{
  text-align: center;
}
.content .inp{
  height: 30px;
  width: 80%;
  line-height: 30px;
  margin-left: 10%;
  margin-top: 20px;
  border: 1px solid #000;
  padding: 5px;
}
.content .inp img{
  height: 30px;
  width: 30px;
  display: block;
  float: left;
}
.content .inp input{
  border: none;
  outline: none;
  padding-left: 8px;
  height: 30px;
  width: 80%;
  line-height: 30px;
  font-size: 18px;
  background-color: azure;
  display: block;
  float: left;
}
.content .login{
  width: 40%;
  text-align: center;
  margin-left: 30%;
  padding: 0;
  border: none;
}

.content .login input{
  width: 100%;
  margin: 0;
  border: 1px solid rgb(46, 121, 233);
  background-color: rgb(107, 122, 130);
  border-radius: 25px;
}
.content .login input:hover{
  box-shadow: 1px 2px 10px 2px rgb(107, 152, 150);
}

.res{
  position: absolute;
  right: 20px;
  bottom: 10px;
  font-size: 13px;

}
  </style>
</head>
<body>
  <div class="bg">
    <div class="content">
      <h2>login</h2>
      <div class="inp">
        <img src="${pageContext.request.contextPath }/images/login-ico.jpg" alt="user">
        <input type="text" name="username" placeholder="please input user name">
      </div>
      <span class="umsg"></span>
      <div class="inp">
        <img src="${pageContext.request.contextPath }/images/lock-ico.jpg" alt="lock">
        <input type="password" name="password" placeholder="please input password ">
      </div>
      <span class="pmsg"></span>
      <div class="inp login">
          <input class="login-btn" type="submit" value="login">
      </div>
      <span class="res"><a href="${pageContext.request.contextPath }/user/toRegister">register</a></span>
      <span class="index"><a href="${pageContext.request.contextPath }/user/index">home</a></span>
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
  						alert('Wrong user name or password！');
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
          $('.umsg').html("The user name is composed of 6 ~ 16 digits of numbers, letters and underscores");
        }
      })
       //校验密码
      $('[name="password"]').blur(function(){
        if(this.value.trim().length>=6&&this.value.trim().length<=16){
          pflag = true;
          $('.pmsg').html("");
        }else{
          pflag = false;
          $('.pmsg').html('The password is 6 ~ 16 digits');
        }
      })
  	})
  </script>
</body>
</html>
