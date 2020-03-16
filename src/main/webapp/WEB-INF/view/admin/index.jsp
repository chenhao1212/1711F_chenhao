<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resource/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resource/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resource/css/index.css">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/popper.min.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
<script type="text/javascript">
	//给li添加点击事件
	$(function() {
		$("#center").load("/admin/queryAllArticle");
		//默认显示我的文章
		$("#center").load("/my/queryAllArticles");
		$("a").click(function() {
			var url = $(this).attr("data");
			//去除样式
			$("a").removeClass("active");
			//让当前点击的li 添加选中样式
			$(this).addClass("list-group-item active")
			//在中间区域显示url的内容
			$("#center").load(url);
		})
	})
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头 -->
		<div class="row">
			<div class="col-md-12" style="background-color: pink;">
				<img alt="" src="/resource/images/1.png"
					style="height: 50px; width: 50px"> <span>今日头条-管理员中心</span>
				
				<div class="btn-group dropleft" style="float: right;">
					<button type="button"
						class="btn btn-secondary btn-sm dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="height: 35px; background-color: blue;">登录信息</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">${sessionScope.admin.username}</a>
						<a class="dropdown-item" href="/passport/logout">注销</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 左侧菜单 -->
			<div class="col-md-2" style="background-color: #FFE1FF">
				<nav class="nav flex-column"
					style="background-color: #FFBBFF; margin-top: 10px">
					<a class="list-group-item active" href="#"
						data="/admin/queryAllArticle" style="background-color: #FFBBFF;">文章审核</a>
					<a class="list-group-item" href="#" data="/admin/queryAllUser"
						style="background-color: #FFBBFF;">用户管理</a> <a
						class="list-group-item" href="#"
						style="background-color: #FFBBFF;">栏目管理</a> <a
						class="list-group-item" href="#"
						style="background-color: #FFBBFF;">分类管理</a> <a
						class="list-group-item" href="#"
						style="background-color: #FFBBFF;">系统设置</a>
				</nav>
			</div>
			<!-- 右侧内容 -->
			<div class="col-md-10" id="center"></div>
		</div>
	</div>
</body>
</html>