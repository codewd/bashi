<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover"
								style="margin-bottom: 0px;">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" onclick="checkedAll(this,'ids')" id="check-row" />
												<span class="lbl"></span></label></th>
										<th>标题</th>
										<th>文字描述</th>
										<th>文件路径</th>
										<th>推荐指数</th>
										<th>封面图片</th>
										<th>时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="xx">
									<s:iterator value="recordList">
										<tr>
											<td class="center"><label> <input name="ids"
													type="checkbox" class="ace" value="${id }" /> <span
													class="lbl"></span></label></td>
											<th>${title}</th>
											<th><a href="">查看</a> </th>
											<th>${filePath}</th>
											<th>${tjzs}</th>
											<th><a href="${pageContext.request.contextPath}/file/${headImg}" target="_blank">查看</a></th>
											<th>${time}</th>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-info" data-rel="tooltip"
														title="修改"
														onclick="bHref('${pageContext.request.contextPath}/ui/gonglue_editUI.htm?id=${id}')">
														<i class="icon-edit bigger-120"></i>
													</button>
													<button class="btn btn-xs btn-danger del-confirm"
														data-rel="tooltip" title="删除"
														onclick="del('${pageContext.request.contextPath}/ui/gonglue_delete.htm?ids=${id }')">
														<i class="icon-trash bigger-120"></i>
													</button>
												</div>
											</td>
										</tr>
									</s:iterator>
									<tr>
										<td></td>
										<td colspan="13">
											<button class="btn btn-xs btn-success" data-rel="tooltip"
												title="增加一行"
												onclick="bHref('${pageContext.request.contextPath}/ui/gonglue_addUI.htm')">
												<i class="icon-plus-sign bigger-150"></i>
											</button>
											<button id="bootbox-confirm" class="btn btn-xs btn-danger"
												data-rel="tooltip" title="删除选中行"
												onclick="del('${pageContext.request.contextPath}/ui/gonglue_delete.htm?ids='+checkedValue('ids'))">
												<i class="icon-trash bigger-150"></i>
											</button> <span class="pull-right center">共${pageCount}页，${recordCount }条数据</span>
										</td>
									</tr>
								</tbody>
							</table>
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
			window.location.href = "gonglue_list.action?pageNum=" + pageNum;
		}
		$(function() {
			$('[data-rel=tooltip]').tooltip();
		});
	</script>
</body>
</html>