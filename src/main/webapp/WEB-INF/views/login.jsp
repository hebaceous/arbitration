<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath }/login/login.css" rel="stylesheet" type="text/css" />
<title>安阳仲裁委员会办案管理系统</title>
<script type="text/javascript">
window.onload = function(){
	if('${message }' == 'false'){
		alert("用户名或密码错误！");
		<% session.removeAttribute("message"); %>
	}
};
</script>
</head>
<body>
<div id="LoginMainMid"></div>
<form action="${pageContext.request.contextPath }/login/" method="post">
  <div id="LoginMainBox">
    <div id="input1">
      <input class="text" type="text" name="username" />
    </div>
    <div id="input2">
      <input class="text" type="password" name="password" />
    </div>
    <div id="button1">
      <input id="button11" type="submit" value=""/>
    </div>
    <div id="button2">
      <input id="button12" type="reset" value=""/>
    </div>
  </div>
</form>
</body>
</html>