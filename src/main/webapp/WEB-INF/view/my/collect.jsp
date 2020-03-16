<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function deletecollect(id){
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
	<div>
		<c:forEach items="${info.list}" var="collect">
			<div>
				<h5>${collect.text}</h5><br>
				${collect.created} &nbsp; &nbsp; &nbsp; &nbsp;
				<button type="button" class="btn btn-sm" style="background-color: yellow" onclick="deletecollect(${collect.id})">取消收藏</button>
				<hr>
			</div>
		</c:forEach>
	</div>
</body>
</html>