<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>今日头条-----主页界面</title>
<link rel="stylesheet" type="text/css" href="/resource/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resource/css/index.css">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/popper.min.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
<script type="text/javascript">
	//分页加查询
	function goPage(page){
		var channelId = '${article.channelId}';//栏目ID
		var categoryId= '${article.categoryId}';//分类ID
		var url="/?channelId="+channelId+"&page="+page;
		if(categoryId!="")//如果分类不为空，则传递分类的查询条件
			url=url+"&categoryId="+categoryId;
		location.href= url;
	}
	//注册
	function reg(){
		$("#title").append("注册")
		$("#passport").load("/passport/reg");
	}
	//登录
	function login(){
		$("#title").append("登录")
		$("#passport").load("/passport/login");
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头 -->
		<div class="row">
			<div class="col-md-12" style="background-color: #222222;height: 34px;">
				<font color="white" size="3px" style="margin-left: 5px;">下载APP</font>
				<!-- 注册 -->
				<div style="float: right;">
					<!-- 从session获取当前有没有登陆，如果一登录，就不显示登录注册 -->
					<c:if test="${null==sessionScope.user}">
						<button onclick="reg()" type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">
							注册
						</button>
						<button onclick="login()" type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">
							登录
						</button>
					</c:if>
					<c:if test="${null!=sessionScope.user}">
						<!-- Default dropleft button -->
							<div class="btn-group dropleft">
							  <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 35px;background-color: blue;">
							   	 登录信息
							  </button>
							  <div class="dropdown-menu">
							      <a class="dropdown-item" href="#">${sessionScope.user.username}</a>
								  <a class="dropdown-item" href="/my/">个人中心</a>
								  <a class="dropdown-item" href="/passport/logout">注销</a>
							  </div>
							</div>
						
					</c:if>
				</div>
			</div>
			
		</div>
		<div class="row">
			<!-- 左 栏目-->
			<div class="col-md-2" style="padding-top: 10px">
				<ul>
					<li style="padding-bottom: 10px"><a class="channel" href="/"> <img alt="" src="/resource/images/1.png"
							style="width: 108px; height: 27px">
					</a></li>
					<li><a href="/?hot=1" class="channel-item ${article.channelId==null?'active':''}" >热点</a></li>
					<c:forEach items="${channel}" var="channel">
						<li><a href="/?channelId=${channel.id}" class="channel-item ${article.channelId==channel.id?'active':''}" >${channel.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 中 -->
			<div class="col-md-7" >
				<!-- 如果栏目id为null，说明为热点，加广告 -->
				<c:if test="${article.channelId==null}">
					<!-- 轮播图广告 -->
					<div style="margin-top: 10px;margin-bottom: 10px">
						<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
						  </ol>
						  <div class="carousel-inner">
							  <c:forEach items="${slides}" var="slide" varStatus="i">
  								    <div class="carousel-item ${i.index==0?'active':'' }">
								      <img src="/pic/tu/${slide.url}" class="d-block w-100" alt="..." style="width: 3500px;height: 320px;">
								      <div class="carousel-caption d-none d-md-block">
								        <h5>${slide.title}</h5>
								      </div>
								    </div>
							  </c:forEach>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
					</div>
					<!-- 轮播图结束 -->
				</c:if>
				
				<!--如果栏目id不为null，显示 分类 -->
				<c:if test="${article.channelId!=null}">
					<div class="subchannel">
						<ul>
							<li class="sub-item ${article.categoryId==null?'sub-selected':''}"><a href="#">全部</a></li>
							<c:forEach items="${category}" var="category">
								<li class="sub-item ${article.categoryId==category.id?'sub-selected':''}"><a href="/?channelId=${article.channelId}&categoryId=${category.id}">${category.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				
				<!-- 分类下面显示的文章 -->
				<div>
					<c:forEach items="${info.list}" var="article">
						<div class="media">
						  <img style="width: 100px;height: 100px" src="/pic/${article.picture}" class="mr-3 rounded" alt="...">
						  <div class="media-body">
						    <h5 class="mt-0"><a href="/queryOneArticleById?id=${article.id}" target="_blank">${article.title}</a></h5>
						    <p>${article.user.username}·${article.hits} 浏览 ·<fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd"/></p>
						  </div>
						</div>
						<hr>
					</c:forEach>
					<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
				</div>
			</div>
			<!-- 右 -->
			<div class="col-md-3" >
				<div class="card" style="width: 18rem;margin-top: 10px">
					<div class="card-header">最新文章</div>
					 <div class="card-body">
						<c:forEach items="${infolist.list}" var="lastarticle">
							<div class="media" style="margin-top: 5px">
							  <img src="/pic/${lastarticle.picture}" class="mr-3" alt="..." style="width: 60px;height: 60px;">
							  <div class="media-body">
							    <h7 class="mt-0"><a href="/queryOneArticleById?id=${lastarticle.id}" target="_blank">${lastarticle.title}</a></h7>
							  </div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>	
			</div>
		</div>
		<!-- 登录注册Modal -->
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel"><span id="title"></span></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" id="passport">
			        
			      </div>
			     
			    </div>
			  </div>
			</div>
	</div>
</body>
</html>