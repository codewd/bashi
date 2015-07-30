<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">try{ace.settings.check('navbar' , 'fixed')}catch(e){}</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							巴士旅游管理系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<i class="nav-user-photo icon-user"></i>
								<span class="user-info">
									<small>欢迎你,</small>
									${user.name }
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										个人信息
									</a>
								</li>

								<li>
									<a href="javascript:logout()">
										<i class="icon-off"></i>
										退出系统
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>