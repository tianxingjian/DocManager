<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/baidu.css" rel="stylesheet" type="text/css">
<title>补丁下载页面</title>
</head>
<body>
	<div id="center">
		<p id="lg" class="s-p-top" align="center">
			<img src="img/jinrong.png" width="150" height="80">
		</p>
		<div id="s_fm" class="s_form">
			<div class="s_form_wrapper" id="s_form_wrapper">
				<form name="f" id="form" action="patchDownLoad" class="fm">
					<span id="s_kw_wrap" class="bg s_ipt_wr"> <input type="text"
						class="s_ipt" name="versionNo" id="versionNo" maxlength="100"
						autocomplete="off"></span> <span class="btn_wr s_btn_wr bg"
						id="s_btn_wr"><input type="submit" value="补丁下载" id="su"
						class="btn self-btn bg s_btn"></span>
				</form>
			</div>

		</div>
		<div>
			<s:property value="msg" />
		</div>
	</div>
</body>
</html>