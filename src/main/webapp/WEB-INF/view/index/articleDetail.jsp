<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>${article.title}</title>
<link rel="stylesheet" type="text/css" href="/resource/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resource/css/index.css">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
<script type="text/javascript">
	function addComment(){
		var articleId='${article.id}';
		var content=$("[name='content']").val();
		$.post("/addComment",{article_id:articleId,content:content},function(flag){
			if(flag){
				alert("评论成功")
				window.location.reload();
			}else{
				alert("请先登录");
			}
		})
	}
	
	function addcollect(){
		var title='${article.title}';
		var url=window.location.href;
		$.post("/addCollect",{text:title,url:url},function(flag){
			if(flag){
				alert("收藏成功")
				window.location.reload();
			}else{
				alert("收藏失败,需要登录后收藏");
			}
		})
	}
	function deletecollect(){
		var id='${collect.id}';
		$.post("/deleteCollect",{id:id},function(flag){
			if(flag){
				alert("取消成功")
				window.location.reload();
			}else{
				alert("取消失败,需要登录后收藏");
			}
		})
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头 -->
		<div class="row">
			<div class="col-md-12" style="background-color: #222222;height: 34px;">
				<font color="white" size="3px" style="margin-left: 5px;">下载APP</font>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-1"></div>
			<div class="col-md-7">
				<h1>${article.title}</h1>
				<p>${article.user.username}<fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd"/></p>
				<c:if test="${collect!=null}">
					<button class="btn btn-link" type="button" onclick="deletecollect()">★取消收藏</button>
				</c:if>
				<c:if test="${collect==null}">
					<button class="btn btn-link" type="button" onclick="addcollect()">☆未收藏</button>
				</c:if>
				<hr>
				${article.content}
				<hr>
				<!-- 文章评论 -->
				<c:if test="${null!=user}">
					<div>
						<h5>文章评论:</h5>
						<textarea rows="8" cols="20" style="width: 753px" name="content"></textarea>
						<button type="button" onclick="addComment()" class="btn btn-info">提交评论</button>
					</div>
				</c:if>
					<div>
						<!-- 显示评论内容 -->
						<hr>
						<c:forEach items="${info.list}" var="comment">
							<h5>${comment.user.username}  <fmt:formatDate value="${comment.created}" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
								${comment.content}
							<hr>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;margin-top: 10px">
						<div class="card-header">评论排行榜</div>
						 <div class="card-body">
							<c:forEach items="${infotwo.list}" var="article" varStatus="i">
								<p>${i.count} ${article.title}</p>
							</c:forEach>
						</div>
					</div>	
				</div>
			
		</div>
		
	</div>
</body>
</html>