<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>补丁下载页面</title>
</head>
<body>
	<form action="patchDownLoad" method="post">
		版本号: <input type="text" name="versionNo" id="versionNo"><br />
		<input type="submit" value="下载" />
	</form>
	<div>
		<s:property value="msg" />
	</div>
</body>
</html>