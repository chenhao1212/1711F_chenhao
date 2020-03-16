<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章审核</title>
<script type="text/javascript">
	var articleId;
	function goPage(page){
		$("#center").load("/admin/queryAllArticle?page="+page)
	}
	
	function query(){
		var status=$("[name='status']").val();
		var title=$("[name='title']").val();
		$("#center").load("/admin/queryAllArticle?status="+status+"&title="+title);
	}
	function update(id,obj){
		var hot=$(obj).text()=="是"?0:1;
		$.post("/admin/updateHotAndStatus",{id:id,hot:hot},function(flag){
			if(flag){
				if($(obj).text()=="是"){
					$(obj).text("否");
					$(obj).attr("class","btn btn-danger btn-sm")
				}else{
					$(obj).attr("class","btn btn-info btn-sm")
					$(obj).text("是");
				}
			}else{
				alert("修改失败");
			}
		})
	}
	
	function queryArticleById(id){
		articleId=id;
		$.post("/admin/queryArticleById",{id:id},function(article){
			$("#title").empty();
			$("#content").empty();
			$("#title").append(article.title);
			$("#content").append(article.content);
			
		},"json")
	}
	
	function updateStatus(status){
		$.post("/admin/updateHotAndStatus",{id:articleId,status:status},function(flag){
			if(flag){
				$("#msg").empty();
				$("#msg").append("操作成功");
				if(status==1){
					$("[name=td]").each(function(){
						if($(this).prop("id")==articleId){
							$(this).text("通过");
						}
					})
				}else{
					if(status==-1){
						$("[name=td]").each(function(){
							if($(this).prop("id")==articleId){
								$(this).text("驳回");
							}
						})
					}
				}
			}else{
				$("#msg").empty();
				$("#msg").append("操作失败");
			}
			
		})
		
	}
</script>
</head>
<body>
	<div class="form-group form-inline" style="padding-bottom: 5px">
		文章标题:<input type="text" name="title" class="form-control form-control-sm" value="${article.title}">&nbsp;&nbsp;
		审核状态:
		<select name="status" class="form-control form-control-sm col-sm-1">
			<option value="0" ${article.status=="0"?"selected":"" }>待审</option>
			<option value="1" ${article.status=="1"?"selected":"" }>已审</option>
			<option value="-1" ${article.status=="-1"?"selected":"" }>驳回</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-success btn-sm" onclick="query()">查询</button>
	</div>
	
	<table class="table table-bordered  table-hover table-sm" style="text-align: center;">
		<tr>
			<Td>序号</Td>
			<Td>标题</Td>
			<Td>作者</Td>
			<Td>发布时间</Td>
			<Td>所属栏目</Td>
			<Td>所属分类</Td>
			<Td>状态</Td>
			<Td>是否热门</Td>
			<Td>点击量</Td>
			<td>操作</td>
		</tr>
		
		<c:forEach items="${info.list}" var="article" varStatus="i">
			<Tr>
				<td>${i.count}</td>
				<td>${article.title}</td>
				<td>${article.user.username}</td>
				<td><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${article.channel.name}</td>
				<td>${article.category.name}</td>
				<td id="${article.id}" name="td">${article.status==1?"通过":article.status==-1?"驳回":"未审核"}</td>
				<td>
					<c:if test="${article.hot==0}">
						<button type="button" class="btn btn-danger btn-sm" onclick="update(${article.id},this)">否</button>
					</c:if>
					<c:if test="${article.hot==1}">
						<button type="button" class="btn btn-info btn-sm" onclick="update(${article.id},this)">是</button>
					</c:if>
				
				</td>
				<td>${article.hits}</td>
				<td>
					<button type="button" onclick="queryArticleById(${article.id})" class="btn btn-link" data-toggle="modal" data-target="#exampleModalLong">
					  详情
					</button>
				</td>
			</Tr>
		</c:forEach>
	</table>
	
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
		      	<span id="msg"></span>
		      	<button type="button" class="btn btn-primary" onclick="updateStatus(1)">通过</button>
		        <button type="button" class="btn btn-danger" onclick="updateStatus(-1)">驳回</button>
		        
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
	<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
	
</body>
</html>