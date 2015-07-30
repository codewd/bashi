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
		<div class="main-container-inner">
			<!-----------------------LEFT--------------------------------------------------><%@include
				file='/config/left.jsp'%>
			<div class="main-content">
				<!---------------------------------TITLE---------------------------------------->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">${title1}</a>
						</li>
						<li class="active"><s:if test="#order == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form onsubmit="return onsub()" method="post"
								action="order_<s:if test='#order == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form">
								<s:if test="#order != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 用户姓名</label>
									<div class="col-sm-9">
										<input name="name" value="${order.name }" type="text"
											id="form-field-0" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 身份证号</label>
									<div class="col-sm-9">
										<input name="idCard" value="${order.idCard }" type="text"
											id="form-field-1" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 联系电话</label>
									<div class="col-sm-9">
										<input name="phone" value="${order.phone }" type="text"
											id="form-field-2" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 居住地</label>
									<div class="col-sm-9">
										<input name="address" value="${order.address }" type="text"
											id="form-field-3" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-4"> 成人</label>
									<div class="col-sm-9">
										<input name="cr" value="${order.cr }" type="text"
											id="form-field-4" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-5"> 儿童</label>
									<div class="col-sm-9">
										<input name="et" value="${order.et }" type="text"
											id="form-field-5" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-6"> 老人</label>
									<div class="col-sm-9">
										<input name="lr" value="${order.lr }" type="text"
											id="form-field-6" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-7"> 合同</label>
									<div class="col-sm-9">
										<input name="ht" value="${order.ht }" type="text"
											id="form-field-7" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-8"> 出行时间</label>
									<div class="col-sm-4 input-group input-group-sm">
										<input name="time" value="${order.time }" type="text"
											id="datepicker8" class="form-control" /><span
											class="input-group-addon"><i class="icon-calendar"></i></span>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-8"> 返回时间</label>
									<div class="col-sm-4 input-group input-group-sm">
										<input name="time" value="${order.time }" type="text"
											id="datepicker8" class="form-control" /><span
											class="input-group-addon"><i class="icon-calendar"></i></span>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="icon-ok bigger-110"></i>提交
										</button>
										&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset">
											<i class="icon-undo bigger-110"></i>重置
										</button>
									</div>
								</div>
							</form>
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
