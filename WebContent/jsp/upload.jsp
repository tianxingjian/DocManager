<!---------------------文件名：upload.jsp----------------->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>上传文件</title>
	</head>
	<body>
	<!-- 上传文件表单定义 -->
	<s:form action="upload" method="post" enctype="multipart/form-data">
		<tr>
	<!-- 上传文件标签定义 -->
	<td>上传文件:<s:file name="file"></s:file></td>
	</tr>
	<tr>
	<td>再次上传文件:<s:file name="file"></s:file></td>
	</tr>
	<tr>
	<td align="left"><s:submit name="submit" value="提交"></s:submit></td>
	</tr>
	</s:form>
	</body>
</html>