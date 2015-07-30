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
						<li class="active"><s:if test="#subzt == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form onsubmit="return onsub()" method="post"
								action="subzt_<s:if test='#subzt == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form" enctype="multipart/form-data">
								<s:if test="#subzt != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 标题</label>
									<div class="col-sm-9">
										<input name="title" value="${subzt.title }" type="text"
											id="form-field-0" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 简介</label>
									<div class="col-sm-9">
										<textarea name="brief" rows="5" class="col-xs-10 col-sm-5">${subzt.brief}</textarea>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 内容</label>
									<div class="col-sm-9">
										<textarea name="content" id="form-field-2" rows="10" style="width: 500px">${subzt.content }</textarea>
										
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 图片</label>
									<div class="col-sm-9 imgfile">
										<div class="col-xs-10 col-sm-5">
										<input name="file" type="file" value="${subzt.img}" />
										</div>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 电子杂志</label>
									<div class="col-sm-9">
										<input name="url" value="${subzt.url }" type="text"
											id="form-field-3" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-4"> 专题</label>
									<div class="col-sm-9">
									
										<s:select name="zhuanti.id" list="#zhuantis"  listKey="id" listValue="zbt" headerKey="-1" headerValue="＝＝空＝＝" value="#subzt.zhuanti.id"/>
									
										<%-- <input name="zhuanti" value="${subzt.zhuanti }" type="text"
											id="form-field-4" class="col-xs-10 col-sm-5" /> --%>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-5"> 地区</label>
									<div id="a_select" class="col-sm-9">
<%-- 										<select name="address1" class="father" data-value="${father_address.id }"></select>
										<select name="address2" class="son" data-value="${son_address.id }"/> --%>
										<select name="address1" class="father" data-value="${subzt.father_address.id }"></select>
										<select name="address2" class="son" data-value="${subzt.son_address.id }"></select>
										<%-- <input name="address" value="${subzt.address }" type="text"
											id="form-field-5" class="col-xs-10 col-sm-5" /> --%>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-6"> 时间</label>
									<div class="col-sm-4 input-group input-group-sm">
										<input name="time" value="${subzt.time }" type="text"
											id="datepicker6" class="form-control" /><span
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
	<%@include file='/config/ueditor/cssjs.jsp'%>
	<script
		src="${pageContext.request.contextPath}/config/js/jquery.cxselect.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$.cxSelect.defaults.url = 'address_jsonAddress.htm';
			//            $.cxSelect.defaults.url = 'http://code.ciaoca.com/jquery/cxselect/demo/js/cityData.min.json';
			$("#a_select").cxSelect({
				selects : [ 'father', 'son' ],
				nodata : 'none'
			})
			
			UE.getEditor('form-field-2');
			
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
			
		});
	</script>
	
	<!-- page specific plugin scripts -->
</body>
</html>
