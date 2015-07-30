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
						<li class="active"><s:if test="#admin == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form onsubmit="return onsub()" method="post"
								action="admin_<s:if test='#admin == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form">
								<s:if test="#admin != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 账号</label>
									<div class="col-sm-9">
										<input name="account" value="${admin.account }" type="text"
											id="form-field-0" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 密码</label>
									<div class="col-sm-9">
										<input name="psw" value="${admin.psw }" type="text"
											id="form-field-1" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 用户名</label>
									<div class="col-sm-9">
										<input name="name" value="${admin.name }" type="text"
											id="form-field-2" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 备注</label>
									<div class="col-sm-9">
										<input name="bz" value="${admin.bz }" type="text"
											id="form-field-3" class="col-xs-10 col-sm-5" />
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
