<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<a class="menu-toggler" id="menu-toggler" href="#"> <span
	class="menu-text"></span>
</a>

<div class="sidebar" id="sidebar">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="nav nav-list" id="left-list">
		<script type="text/javascript"
			src='${pageContext.request.contextPath}/config/js/jquery.min.js'></script>
		<script type="text/javascript"
			src='${pageContext.request.contextPath}/config/js/confLeft.js'></script>


		<script type="text/javascript">
			leftInit();
		</script>

	</ul>
	<!-- /.nav-list -->


	<!-- left and head-->


	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
			data-icon2="icon-double-angle-right"></i>
	</div>

	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
</div>