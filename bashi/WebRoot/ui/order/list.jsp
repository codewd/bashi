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
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover"
								style="margin-bottom: 0px;">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" onclick="checkedAll(this,'ids')" id="check-row" />
												<span class="lbl"></span></label></th>
										<th>用户姓名</th>
										<th>身份证号</th>
										<th>联系电话</th>
										<th>居住地</th>
										<th>成人</th>
										<th>儿童</th>
										<th>老人</th>
										<th>合同</th>
										<th>愿望</th>
										<th>出行时间</th>
										<th>价格档次</th>
										<th>返回时间</th>
										<th>提交时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="xx">
									<s:iterator value="recordList">
										<tr>
											<td class="center"><label> <input name="ids"
													type="checkbox" class="ace" value="${id }" /> <span
													class="lbl"></span></label></td>
											<th>${name}</th>
											<th>${idCard}</th>
											<th>${phone}</th>
											<th>${address}</th>
											<th>${cr}</th>
											<th>${et}</th>
											<th>${lr}</th>
											<th>${ht}</th>
											<th>
												<a href="#" onclick="showContent('${id }')">点击查看</a>
												
											</th>
											<th>${gotime}</th>
											<th>${jg}</th>
											<th>${backtime}</th>
											<th>${time}</th>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-info" data-rel="tooltip"
														title="修改"
														onclick="bHref('${pageContext.request.contextPath}/ui/order_editUI.htm?id=${id}')">
														<i class="icon-edit bigger-120"></i>
													</button>
													<button class="btn btn-xs btn-danger del-confirm"
														data-rel="tooltip" title="删除"
														onclick="del('${pageContext.request.contextPath}/ui/order_delete.htm?ids=${id }')">
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
												onclick="bHref('${pageContext.request.contextPath}/ui/order_addUI.htm')">
												<i class="icon-plus-sign bigger-150"></i>
											</button>
											<button id="bootbox-confirm" class="btn btn-xs btn-danger"
												data-rel="tooltip" title="删除选中行"
												onclick="del('${pageContext.request.contextPath}/ui/order_delete.htm?ids='+checkedValue('ids'))">
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
	<%@include file='/config/layer/cssjs.jsp'%>
	<!-- page specific plugin scripts -->
	<script type="text/javascript">
	function showContent(id){
		var c = "";
		$.post("order_f_getOne.htm?id="+id,function(data){
			$.each(JSON.parse(data),function(i,v){
				c = v.yuanwang
			})
		});
		alert(c)
		
	    layer.open({
	        type: 1,
	        area: ['800px', '600px'],
	        shadeClose: true, //点击遮罩关闭
	        content:c		 //注意，如果str是object，那么需要字符拼接。
		});
	}
		function gotoPage(pageNum) {
			window.location.href = "order_list.action?pageNum=" + pageNum;
		}
		$(function() {
			$('[data-rel=tooltip]').tooltip();
		});
	</script>
</body>
</html>