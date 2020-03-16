<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的文章</title>
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function goPage(page){
		$("#center").load("/my/queryAllArticles?page="+page)
	}
	
	function queryArticleById(id){
		$.post("/my/queryArticleById",{id:id},function(article){
			$("#title").empty();
			$("#content").empty();
			$("#title").append(article.title);
			$("#content").append(article.content);
			
		},"json")
	}
</script>
</head>
<body>
	<c:forEach items="${info.list}" var="article">
		<div class="media">
		  <img src="/pic/${article.picture}" class="mr-3 rounded" alt="..." style="width:100px;height: 100px">
		  <div class="media-body">
		    <h5 class="mt-0">${article.title}</h5>
		    <div style="float: right;">
		    	<!-- Button trigger modal -->
				<button type="button" onclick="queryArticleById(${article.id})" class="btn btn-link" data-toggle="modal" data-target="#exampleModalLong">
				  详情
				</button>
		    </div>
		  </div>
		</div>
		<hr/>
	</c:forEach>
	<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
		<!-- Modal -->
		<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle"><span id="title"><!-- 模态窗口标题 --></span></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="content">
		        <!-- 模态窗口内容 -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>