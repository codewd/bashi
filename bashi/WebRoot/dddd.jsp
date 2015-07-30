<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<script src="config/js/jquery.min.js"></script>
<script src="config/js/jquery.cxselect.min.js"></script>
</head>
<body>


	<div id="s1">
		<select class="father"></select> <select class="son"></select>
	</div>
	<script>
		$(function() {
			$.cxSelect.defaults.url = 'news_writeType.htm';
			//            $.cxSelect.defaults.url = 'http://code.ciaoca.com/jquery/cxselect/demo/js/cityData.min.json';
			$("#s1").cxSelect({
				selects : [ 'father', 'son' ]
			})
		})

		[
			 {
				"v" : "1",
				"s" : {},
				"n" : "将要到来的狂欢"
			 },
			 {
				"v" : "2",
				"s" : {},
				"n" : "首页图文"
			 },
			 {
				"v" : "5",
				"s" : 
					{
						"v" : "6",
						"n" : "子类1"
					},
				"n" : "巴客一族"
			 }
		 ]
	</script>

</body>
</html>
