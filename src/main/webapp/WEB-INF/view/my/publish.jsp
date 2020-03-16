<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/resource/kindeditor/plugins/code/prettify.js"></script>
	<script charset="utf-8" src="/resource/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="/resource/kindeditor/lang/zh-CN.js"></script>
	<script
		src="/resource/js/jquery-3.2.1.js"></script>

	<script>
		KindEditor.ready(function(K) {
			window.editor1 = K.create('textarea[name="content1"]', {
				cssPath : '/resource/kindeditor/plugins/code/prettify.css',
				uploadJson : '/resource/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '/resource/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		function query(){
		alert(editor1.html())
			//alert( $("[name='content1']").attr("src"))
		}
	</script>
	<script type="text/javascript">
		//文档就绪函数
		$(function(){
			//二级联动
			$.post("/channel/queryAllChannel",function(list){
				$(list).each(function(i,val){
					$("#channels").append("<option value='"+val.id+"'>"+val.name+"</option>");
				})
				
				$("#channels").change(function(){
					var channelId=$(this).val();
					$.post("/channel/queryCategoryByChannelId","channelId="+channelId,function(list2){
						$("#categorys").empty();
						$(list2).each(function(i,val2){
							$("#categorys").append("<option value='"+val2.id+"'>"+val2.name+"</option>");
						})
					},"json")
				})
			},"json")
		})
	</script>
	<script type="text/javascript">
			function publish(){
				var formData = new FormData($("#form1")[0]);
				formData.set("content",editor1.html());
				$.ajax({
					type:"post",
					url:"/my/addArticle",
					processData:false,
					contentType:false,
					data:formData,
					success:function(flag){
						if(flag){
							alert("发布成功");
							location.href="/my/";
						}else{
							alert("发布失败");
						}
							
					}
					
				})
			}
	</script>
</head>
<body>
	<%=htmlData%>
	<form id="form1">
		<div class="form-group">
			<label for="title">文章标题:</label>
			<input type="text" name="title" id="title" class="form-control form-control-sm col-sm-10" style="width: 1000px">
		</div>
		<div  class="form-group form-inline">
		    <label for="title">所属栏目</label>
		    <select class="form-control form-control-sm col-sm-1" id="channels" name="channelId">
		    	<option >请选择</option>
		    </select>
			<label for="title">所属分类</label>
			<select class="form-control form-control-sm col-sm-1" id="categorys" name="categoryId">
			  <option>请选择</option>
			</select>
   		</div>
   		<div  class="form-group">
   			标题图片:<input type="file" name="file">
   		</div>
   		
		<textarea name="content1" cols="100" rows="8" style="width:1000px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		
		<br />
		<input type="button" onclick="publish()" name="button" class="btn btn-primary" value="发布文章" />
		
	</form>
	
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>