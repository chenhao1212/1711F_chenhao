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
					rangelength:[2,10],
					remote:{
						type:"post",
						data:{
							username:function(){
								return $("#username").val();
							}
						},
						url:"/passport/checkName"
					}
				},
				password:{//验证密码
					required:true,
					rangelength:[6,10],
				},
				repassword:{//确认两次密码一致
					equalTo:"#password"
				}
				
			},
			messages:{
				username:{
					required:"用户名不能为空",
					rangelength:"长度必须在2-10之间",
					remote:"用户名已存在"
				},
				password:{
					required:"密码不能为空",
					rangelength:"密码必须6-10位"
				},
				repassword:{//确认两次密码一致
					equalTo:"两次密码必须一致"
				}
			},
			submitHandler:function(flag){
				$.post("/passport/insert",$("#form1").serialize(),function(result){
					if(result.code==200){
						$("#title").html("<font color='red'>注册成功,请登录</font>")
						//注册成功，跳转到登录页面
						$("#passport").load("/passport/login")
					}else{
						alert(result.msg)
					}
				},"json")
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
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
				<label for="repassword">确认密码:</label>
				<input id="repassword" class="form-control" type="password" name="repassword">
			</div>
			<div class="form-group">
				<label for="sex">性别:</label>
				<input type="radio" name="gender" checked="checked" value="0">男
				<input type="radio" name="gender" value="1">女
			</div>
			<div class="form-group">
				<input type="submit" value="注册">
				<input type="button" value="重置">
			</div>
		</form>
	</div>
</body>
</html>