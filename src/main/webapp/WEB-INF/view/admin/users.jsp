<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<script type="text/javascript">
	function goPage(page){
		$("#center").load("/admin/queryAllUser?page="+page)
	}
	
	function query(){
		var locked=$("[name=locked]").val();
		var username=$("[name=username]").val();
		$("#center").load("/admin/queryAllUser?locked="+locked+"&username="+username);
	}
	//改变用户状态   0正常，1禁用
	function updateuser(id,obj){
		var locked=$(obj).text()=="正常"?1:0;
		$.post("/admin/updateUserStatus",{id:id,locked:locked},function(flag){
			if(flag){
				if($(obj).text()=="禁用"){
					$(obj).text("正常");
					$(obj).attr("class","btn btn-info btn-sm")
				}else{
					$(obj).attr("class","btn btn-danger btn-sm")
					$(obj).text("禁用");
				}
			}else{
				alert("修改失败");
			}
		})
	}
	
	
</script>
</head>
<body>
	<div class="form-group form-inline" style="padding-bottom: 5px">
		用户名称:<input type="text" name="username" class="form-control form-control-sm" value="${user.username}">&nbsp;&nbsp;
		用户状态:
		<select name="locked" class="form-control form-control-sm col-sm-1">
			<option value="0" ${user.locked=="0"?"selected":"" }>正常</option>
			<option value="1" ${user.locked=="1"?"selected":"" }>禁用</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-success btn-sm" onclick="query()">查询</button>
	</div>
	
	<table class="table table-bordered  table-hover table-sm" style="text-align: center;">
		<tr>
			<Td>序号</Td>
			<Td>用户名</Td>
			<Td>昵称</Td>
			<Td>性别</Td>
			<Td>生日</Td>
			<Td>注册时间</Td>
			<Td>状态</Td>
		</tr>
		
		<c:forEach items="${info.list}" var="user" varStatus="i">
			<Tr>
				<td>${i.count}</td>
				<td>${user.username}</td>
				<td>${user.nickname}</td>
				<td>${user.gender==0?"女":"男"}</td>
				<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test="${user.locked==0}">
						<button type="button" class="btn btn-info btn-sm" onclick="updateuser(${user.id},this)">正常</button>
					</c:if>
					<c:if test="${user.locked==1}">
						<button type="button" class="btn btn-danger btn-sm" onclick="updateuser(${user.id},this)">禁用</button>
					</c:if>
				</td>
				
			</Tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
</body>
</html>