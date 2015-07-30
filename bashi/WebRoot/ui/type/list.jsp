<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<%@include file='/config/css.jsp'%>
</head>
<body>
	<%@include file='/config/head.jsp'%>
	<div class="main-container" id="main-container">
		<div class="main-container-inner">
			<%@include file='/config/left.jsp'%>
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">${title1 }</a></li>
						<li class="active">${titile2 }</li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box transparent collapsed">
								<div class="widget-header widget-header-flat">
									<h4 class="lighter">
										<i class="icon-bar-chart orange"></i> 列表内容
									</h4>
									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> 条件查询 <i
											class="icon-chevron-up"></i></a>
									</div>
								</div>
								<div class="widget-body">查询的内容</div>
							</div>

							<style>
								.well ul li {
									list-style: none;
									padding: 6px;
								}
								
								.well ul {
									font-size: 18px;
								}
								</style>
								
							<s:iterator value="recordList" var="t">
								<div class="well">
									<font size="3">${title }&nbsp;&nbsp;&nbsp;</font><button onclick="bHref('${pageContext.request.contextPath}/type_addSonUI.htm?fatherId=${id }')">添加子类</button>
									<button onclick="bHref('${pageContext.request.contextPath}/type_editFatherUI.htm?id=${id }')">修改</button>
									<button onclick="del('${pageContext.request.contextPath}/type_delete.htm?ids=${id }')">删除</button>
									<hr>
									<ul style="list-style: none">
										<s:iterator value="childs" id="inner">
											<li>${inner.title }
												<button class="btn btn-minier btn-info" data-rel="tooltip"
													title="修改"
													onclick="bHref('${pageContext.request.contextPath}/ui/type_editUI.htm?id=${id}&fatherId=${t.id}')">
													<i class="icon-edit bigger-120"></i>
												</button>
												<button class="btn btn-minier btn-danger del-confirm"
													data-rel="tooltip" title="删除"
													onclick="del('${pageContext.request.contextPath}/ui/type_delete.htm?ids=${id }')">
													<i class="icon-trash bigger-120"></i>
												</button>
											</li>
										</s:iterator>
										
									</ul>
									
								</div>
							</s:iterator>
							<button class="btn btn-sm btn-danger" onclick="bHref('${pageContext.request.contextPath}/type_addFatherUI.htm')">添加父类</button>

							<div class="pull-right">
								<ul class="pagination">

									<s:if test="currentPage == 1">
										<li class="disabled"><a href="#"> <i
												class="icon-double-angle-left"></i></a></li>
									</s:if>
									<s:else>
										<li class=""><a
											href="javascript:gotoPage(${currentPage - 1})"><i
												class="icon-double-angle-left"></i></a></li>
									</s:else>
									<s:iterator begin="%{beginPageIndex}" end="%{endPageIndex}"
										var="num">



										<s:if test="#num == currentPage">
											<li class="active"><a href="#">${num }</a></li>
										</s:if>


										<s:else>
											<li><a href="javascript:gotoPage(${num })">${num }</a></li>
										</s:else>
									</s:iterator>
									<s:if test="currentPage == pageCount">
										<li class="disabled"><a href="#"> <i
												class="icon-double-angle-right"></i></a></li>
									</s:if>
									<s:else>
										<li class=""><a
											href="javascript:gotoPage(${currentPage + 1})"><i
												class="icon-double-angle-right"></i></a></li>
									</s:else>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i></a>
	</div>
	<!-- basic scripts -->
	<%@include file='/config/js.jsp'%>
	<!-- page specific plugin scripts -->
	<script type="text/javascript">
		function gotoPage(pageNum) {
			window.location.href = "type_list.action?pageNum=" + pageNum;
		}
		$(function() {
			$('[data-rel=tooltip]').tooltip();
		});
	</script>
</body>
</html>