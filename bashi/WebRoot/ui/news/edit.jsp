<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<%@include file='/config/css.jsp'%></head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/config/layer/skin/layer.css" />
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
						<li class="active"><s:if test="#news == null">添加信息</s:if> <s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form id="form1" onsubmit="return onsub()" method="post"
								action="news_<s:if test='#news == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form" enctype="multipart/form-data">
								<s:if test="#news != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 类型</label>
									<div class="col-sm-9" id="s1">
										<select class="father" data-value="${news.type.id }"></select>
										<select class="son"></select>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 标题</label>
									<div class="col-sm-9">
										<input name="title" value="${news.title }" type="text"
											id="form-field-0"
											class="col-xs-10 col-sm-5 validate[required]" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 内容</label>
									<div class="col-sm-9">
									
										<textarea name="content" rows="10" id="editor2">${news.content }</textarea>
										
										<!-- <button type="button" class="btn btn-xs btn-danger"
											onclick="addContent()">添加内容</button>
										<input name="content" id="ueContent" type="hidden"> -->
										<%-- <input name="content" value="${news.content }" type="text"
											id="form-field-1" class="col-xs-10 col-sm-5 validate[required]" /> --%>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 作者</label>
									<div class="col-sm-9">
										<input name="auther" value="${news.auther }" type="text"
											id="form-field-2" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 点击量</label>
									<div class="col-sm-9">
										<input name="click" value="${news.click }" type="text"
											id="form-field-3"
											class="col-xs-10 col-sm-5 validate[custom[number]]" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 电子杂志网址</label>
									<div class="col-sm-9">
										<input name="url" value="${news.url }" type="text"
											id="form-field-3"
											class="col-xs-10 col-sm-5 " />
									</div>
								</div>
								<div class="space-4"></div>
							
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-5"> 首页大图</label>
									<div class="col-sm-9 col-xs-10 imgfile">
										<div class="col-xs-10 col-sm-5">
											<img src="${pageContext.request.contextPath}/file/${news.topImg}" height="100px">
											<input name="file" type="file" value="${news.topImg}" />
										</div>
									</div>
									<%-- <div class="col-sm-9">
										<input name="topImg" value="${news.topImg }" type="text"
											id="form-field-5" class="col-xs-10 col-sm-5" />
									</div> --%>
								</div>
								<div class="space-4"></div>
								<%-- <div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-6"> 附件</label>
									<div class="col-sm-9">
										<input name="file" value="${news.file }" type="text"
											id="form-field-6" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div> --%>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-7"> 介绍</label>
									<div class="col-sm-9">
									<textarea name="brief" rows="4" cols=""
											class="col-xs-10 col-sm-5">${news.brief }</textarea>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-8"> 状态</label>
									<div class="col-sm-9">
										<input name="flag" value="${news.flag }" type="text"
											id="form-field-8"
											class="col-xs-10 col-sm-5 validate[custom[number]]" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-9"> 创建时间</label>
									<div class="col-sm-4 input-group input-group-sm">
										<input name="time" value="${news.time }" type="text"
											id="datepicker9" class="form-control" /><span
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
	<div id="lay" style="display:none">
		<div>
			<textarea id='editor' rows='' cols='' style='height:410px'></textarea>
			<button class='btn btn-sm btn-danger saveContent pull-right'>保存</button>
		</div>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<%@include file='/config/js.jsp'%>
	<%@include file='/config/ueditor/cssjs.jsp'%>
	<script src="${pageContext.request.contextPath}/config/layer/layer.js"></script>
	<script
		src="${pageContext.request.contextPath}/config/js/jquery.cxselect.min.js"></script>
	<script>
		var flag = 0;
		var ue;
		function addContent() {
			layer.open({
				type : 1,
				area : [ '1100px', '650px' ],
				title : '添加内容',
				shadeClose : false, //点击遮罩关闭
				content : $("#lay")
			});
			if (flag == 0) {
				ue = UE.getEditor('editor');
				//ue.setContent("hello")
				ue.setContent('hello');
				flag = 1;
			}
			//alert($("#ueContent").val().length);
			if ($("#ueContent").val().length > 0) {
				//alert($("#ueContent").val());
				$("#editor").val($("#ueContent").val());
				//ue.setContent($("#ueContent").val());
			}
		}
		$(function() {
			UE.getEditor('editor2');
			
			$(".saveContent").on("click", function() {
				$("#ueContent").val(ue.getContent());
				layer.closeAll(); //疯狂模式，关闭所有层
			});
			$.cxSelect.defaults.url = 'news_writeType.htm';
			//            $.cxSelect.defaults.url = 'http://code.ciaoca.com/jquery/cxselect/demo/js/cityData.min.json';
			$("#s1").cxSelect({
				selects : [ 'father', 'son' ],
				nodata : 'none'
			})

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
	<!-- page specific plugin scripts -->
</body>
</html>
