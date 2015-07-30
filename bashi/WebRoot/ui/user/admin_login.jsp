<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<title>登陆</title>
		<%@include file="/config/css.jsp" %>
	</head>

	<body class="login-layout" style="background-image: url(${pageContext.request.contextPath}/ui/user/login_bac.jpg)">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf white"></i>
									<span class="white">巴士旅游管理系统</span>
								</h1>
								<h4 class="blue">&copy; 巴士公司</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border" style="background-color:#ffffff;">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												请登陆
											</h4>

											<div class="space-6"></div>

											<form action="admin_login.htm" method="post">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="account" class="form-control" placeholder="用户名" value="${user.account }" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="psw" class="form-control" placeholder="密码" value="${user.psw }" />
															<i class="icon-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="vCode" class="col-xs-6" alt="点击更换" style="padding:8px" placeholder="验证码" width="50"/>
															<img class="col-xs-6" src="vcode.htm" height="34" onclick="this.src = 'user_vCode.htm'"/>
														</span>
													</label>
													<label class="block clearfix">
														<span id="msg" class="block input-icon input-icon-right">
															${msg }
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl">记住</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															登陆
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">巴士旅游后台管理系统登陆</span>
											</div>


										</div><!-- /widget-main -->

										<div class="toolbar clearfix">


											<div class="pull-right">
												<a href="${pageContext.request.contextPath}/"  class="user-signup-link pull-right">
													去首页
													<i class="icon-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<%@include file="/config/js.jsp" %>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
</body>
</html>
