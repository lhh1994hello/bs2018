<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.metadata.js"></script>
<title>jquery validate使用</title>
</head>
<body>
	<script>
$.validator.setDefaults({
    submitHandler: function() {
      alert("提交事件!");
    }
});
$().ready(function() {
    $("#commentForm").validate();
});
</script>

<form class="cmxform" id="commentForm" method="get" action="">
  <fieldset>
    <legend>输入您的名字，邮箱，URL，备注。</legend>
    <p>
      <label for="cname">Name (必需, 最小两个字母)</label>
      <input id="cname" name="name" minlength="2" type="text" required>
    </p>
    <p>
      <label for="cemail">E-Mail (必需)</label>
      <input id="cemail" type="email" name="email" required>
    </p>
    <p>
      <label for="curl">URL (可选)</label>
      <input id="curl" type="url" name="url">
    </p>
    <p>
      <label for="ccomment">备注 (必需)</label>
      <textarea id="ccomment" name="comment" required></textarea>
    </p>
    <p>
      <input class="submit" type="submit" value="Submit">
    </p>
  </fieldset>
</form>
</body>
</html>