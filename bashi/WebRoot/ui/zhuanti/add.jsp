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
						<li class="active"><s:if test="#zhuanti == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form onsubmit="return onsub()" method="post"
								action="zhuanti_<s:if test='#zhuanti == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form" enctype="multipart/form-data">
								<s:if test="#zhuanti != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 主标题</label>
									<div class="col-sm-9">
										<input name="zbt" value="${zhuanti.zbt }" type="text"
											id="form-field-0" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 副标题</label>
									<div class="col-sm-9">
										<input name="fbt" value="${zhuanti.fbt }" type="text"
											id="form-field-1" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 图片</label>
									<div class="col-sm-9 col-xs-10 imgfile">
										<div class="col-xs-10 col-sm-5">
											<input name="file" type="file" value="${zhuanti.headImg }" />分辨率 300＊364
										</div>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 电子杂志网址</label>
									<div class="col-sm-9">
										<input name="dzzz" value="${zhuanti.dzzz }" type="text"
											id="form-field-3" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-4"> 简介</label>
									<div class="col-sm-9">
										<textarea name="jianjie" rows="5" cols="" class="col-xs-10 col-sm-5">${zhuanti.jianjie }</textarea>	
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-5"> 路线</label>
									<div class="col-sm-9">
										<textarea name="luxian" rows="5" cols="" class="col-xs-10 col-sm-5">${zhuanti.luxian }</textarea>
										多个路径，中间用数字 0 隔开，例如：北京－天津0天津－广州0上海－北京
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
	<script type="text/javascript">
		$(function(){

			$('.imgfile')
					.find('input[type=file]')
					.ace_file_input(
							{
								style : 'well',
								btn_choose : '上传图片',
								btn_change : null,
								no_icon : 'icon-picture',
								thumbnail : 'large',
								droppable : true,
								before_change : function(files, dropped) {
									var file = files[0];
									if (typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
										if (!(/\.(jpe?g|png|gif)$/i).test(file))
											return false;
									} else {//file is a File object
										var type = $.trim(file.type);
										if ((type.length > 0 && !(/^image\/(jpe?g|png|gif)$/i)
												.test(type))
												|| (type.length == 0 && !(/\.(jpe?g|png|gif)$/i)
														.test(file.name))//for android default browser!
										)
											return false;

										if (file.size > 1110000) {//~1M
											return false;
										}
									}

									return true;
								}
							})
		})
	</script>
</body>
</html>
