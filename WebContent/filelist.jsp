<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>文档下载专区</title>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script>
	function check() {
		if (document.getElementById('file').value == '') {
			alert('选择一个上传文件！');
			return false;
		}
	}

	function p_del() {
		var msg = "确定要删除吗？\n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<style type="text/css">
body {
	text-align: center;
}

.div {
	margin: 0 auto;
}
</style>
</head>
<body>
	欢迎你：
	<s:property value="#session.user.username" />
	<div>
		<form action="${pageContext.request.contextPath}/upload"
			onSubmit="return check();" enctype="multipart/form-data"
			method="post">
			文件:<input type="file" name="file" id="file"> <input
				type="submit" value="上传" name="fileUpload" />
		</form>
	</div>
	<br />
	<s:fielderror />
	<div>
		<form action="${pageContext.request.contextPath}/search" method="post">
			文件名：<input type="text" name="docname" id="docname"> <input
				type="submit" value="查询">
		</form>
	</div>
	<table align="center">
		<tr
			style="background-color: #A7A5B1; font-family: 楷体; font-size: 25px;">
			<th>文件名</th>
			<th>文件类型</th>
			<th>上传时间</th>
			<th>上传者</th>
			<th>下载次数</th>
			<th>删除</th>
			<th>下载</th>
		</tr>
		<s:iterator value="documents" id="doc" status="st">
			<tr <s:if test="#st.odd"> style="background-color:#dbf2f4"</s:if>
				<s:else>style="background-color:#eff7f8"</s:else>>
				<td><s:property value="#doc.filename" /></td>
				<td><s:property value="#doc.filetype" /></td>
				<td>20<s:property value="#doc.uploadtime" /></td>
				<td><s:property value="#doc.author" /></td>
				<td><s:property value="#doc.downloadcount" /></td>
				<td align=center><a
					href="DeleteDoc?documentId=${doc.documentId}"
					onclick="javascript:return p_del()"><img src="img/del.png"
						style="width: 30px; height: 30px;" /></a></td>
				<td align=center><a
					href="FileDownload?documentId=${doc.documentId}"><img
						src="img/54.png" style="width: 30px; height: 30px;" /></a></td>
			</tr>
		</s:iterator>
	</table>


</body>
</html>