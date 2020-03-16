<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link rel="stylesheet" type="text/css" href="/resource/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resource/jqerycss/screen.css">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
<script type="text/javascript" src="/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form1").validate({
			rules:{
				username:{//验证用户名
					required:true,
				},
				password:{//验证密码
					required:true,
				}
				
			},
			messages:{
				username:{
					required:"用户名不能为空",
				},
				password:{
					required:"密码不能为空",
				}
			},
			submitHandler:function(flag){
				$.post("/passport/login",$("#form1").serialize(),function(result){
					if(result.code==200){
						location.href="/";
					}else{
						$("#msg").html("<font color='red'>登录失败</font>")
					}
				})
			}
		})
	})
</script>
</head>
<body>
	<div class="container" style="width: 500px;height: 500px;background-image: url('/resource/images/3.png');">
		<span style="color: red">${msg}</span>
		<form id="form1">
			<div class="form-group">
				<label for="username">用&nbsp;户&nbsp;名&nbsp;:&nbsp;</label>
				<input id="username" type="text" class="form-control" name="username">
			</div>
			<div class="form-group">
				<label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;</label>
				<input id="password" class="form-control" type="password" name="password">
			</div>
			<div class="form-group">
				<input type="submit" value="登录">
				<input type="reset" value="重置">
				<span id="msg"></span>
			</div>
		</form>
	</div>
</body>
</html>