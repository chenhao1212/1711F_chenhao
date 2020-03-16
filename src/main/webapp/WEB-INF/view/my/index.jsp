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
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/popper.min.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头 -->
		<div class="row">
			<div class="col-md-12"
				style="background-color: #563D7C; height: 60px;">
				<span style="color: white;">项目头</span>
				<div style="float: right;">
				<!-- 从session获取当前有没有登陆，如果一登录，就不显示登录注册 -->
				
				<c:if test="${null!=sessionScope.user}">
					<!-- Default dropleft button -->
					<div class="btn-group dropleft">
						<button type="button"
							class="btn btn-secondary btn-sm dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="height: 35px; background-color: blue;">登录信息</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">${sessionScope.user.username}</a>
							<a class="dropdown-item" href="/my">个人中心</a> <a
								class="dropdown-item" href="/passport/logout">注销</a>
						</div>
					</div>
						
					</c:if>
				</div>
			</div>
			
		</div>
		<!-- body -->
		<div class="row">
			<!-- 左侧菜单 -->
			<div class="col-md-2">
				<ul class="list-group">
					<li class="list-group-item active"><a href="#"
						data="/my/queryAllArticles" style="color: black">我的文章</a></li>
					<li class="list-group-item" ><a style="color: black" href="#" data="/my/publish">发布文章</a></li>
					<li class="list-group-item"><a style="color: black" href="#" data="/my/queryAllCollect">我的收藏</a></li>
					<li class="list-group-item"><a style="color: black" href="#">我的评论</a></li>
					<li class="list-group-item"><a style="color: black" href="#">我的信息</a></li>
				</ul>
			</div>
			<!-- 右侧内容 -->
			<div class="col-md-10" id="center">
				<!-- 先加载富文本编辑器的样式 -->
				<div style="display: none;">
					<jsp:include page="/resource/kindeditor/jsp/demo.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//给li添加点击事件
		$(function(){
			
			
			//默认显示我的文章
			 $("#center").load("/my/queryAllArticles");
			$("li").click(function(){
				var url = $(this).children().attr("data");
			 //去除样式
			    $("li").removeClass("active");
			   //让当前点击的li 添加选中样式
				 $(this).addClass("list-group-item active")
				//在中间区域显示url的内容
				$("#center").load(url);
	})
})
	</script>

</body>
</html>