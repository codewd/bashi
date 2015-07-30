<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<%@include file='/config/css.jsp'%></head>
<body>
	<!------------------------HEAD----------------------------------------><%@include
		file='/config/head.jsp'%>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-container-inner">
			<!-----------------------LEFT--------------------------------------------------><%@include
				file='/config/left.jsp'%>
			<div class="main-content">
				<!---------------------------------TITLE---------------------------------------->
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">${title1}</a>
						</li>
						<li class="active"><s:if test="#user == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							
							<font><h1>欢迎使用系统</h1></font>
							
							
						</div>
						<!-- col-xs-12 -->
					</div>
					<!-- row -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
		</div>
		<!-- /.main-container-inner -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i></a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<%@include file='/config/js.jsp'%>
	<!-- page specific plugin scripts -->
</body>
</html>
