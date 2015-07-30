<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<%@include file='/config/css.jsp'%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/config/assets/css/jquery-ui-1.10.3.full.min.css" />
</head>
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
						<li class="active"><s:if test="#gonglue == null">添加信息</s:if>
							<s:else>修改信息</s:else></li>
					</ul>
				</div>
				<!------------------------------CONTENT------------------------------------------->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- list head and query content -->
							<form onsubmit="return onsub()" method="post"
								action="gonglue_<s:if test='#gonglue == null'>add</s:if><s:else>edit</s:else>.htm"
								class="form-horizontal" role="form"
								enctype="multipart/form-data">
								<s:if test="#gonglue != null">
									<input type="hidden" name="id" value="${id }">
								</s:if>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 标题</label>
									<div class="col-sm-9">
										<input name="title" value="${gonglue.title }" type="text"
											id="form-field-0" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-0"> 选择地区</label>
									<div class="col-sm-9" id="s1">
										<select name="address1" class="father"></select>
										<select name="address2" class="son"></select>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 文字描述</label>
									<div class="col-sm-9">
										<%-- <input name="miaoshu" value="${gonglue.miaoshu }" type="text"
											id="form-field-1" class="col-xs-10 col-sm-5" /> --%>
										<textarea name="miaoshu" rows="4" cols=""
											class="col-xs-10 col-sm-5">${gonglue.miaoshu }</textarea>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 正文</label>
									<div class="col-sm-9">
										<input name="content" id="ueContent" type="hidden">
										<a href="javascript:void(0)" class="btn btn-xs btn-danger"
											onclick="addContent()">添加正文</a> <input type="hidden"
											id="content" name="content" value="">
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2"> 地址杂志路径</label>
									<div class="col-sm-9">
										<input name="filePath" type="text" id="form-field-2"
											class="col-xs-10 col-sm-5" value="${gonglue.filePath }" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-3"> 推荐指数</label>
									<div class="col-sm-9">
										<%-- <input name="tjzs" value="${gonglue.tjzs }" type="text"
											id="form-field-3" class="col-xs-10 col-sm-5" /> --%>
										<input id="spinner" name="tjzs" type="text"
											value="${gonglue.tjzs }" />
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-4"> 封面图片</label>
									<div class="col-sm-9 col-xs-10 imgfile">
										<%-- <input name="headImg" value="${gonglue.headImg }" type="text"
											id="form-field-4" class="" /> --%>
										<div class="col-xs-10 col-sm-5">
											<input name="file" type="file" value="${gonglue.headImg }" />
											300 ＊ 313 
										</div>
									</div>
								</div>
								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-5"> 时间</label>
									<div class="col-sm-4 input-group input-group-sm">
										<input name="time" value="${gonglue.time }" type="text"
											id="datepicker5" class="form-control" /><span
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
			<button class='btn btn-sm btn-danger saveContent pull-right' >保存</button>
		</div>
	</div>


	<!-- /.main-container -->
	<!-- basic scripts -->
	<%@include file='/config/js.jsp'%>
	<!-- page specific plugin scripts -->
	<%@include file='/config/layer/cssjs.jsp'%>
	<%@include file='/config/ueditor/cssjs.jsp'%>
	<script
		src="${pageContext.request.contextPath}/config/js/jquery.cxselect.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/config/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/config/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript">
		var flag = 0;
		var ue;
		function addContent() {
			layer.open({
				type : 1,
				area : [ '1000px', '600px' ],
				title : '添加新闻内容',
				shadeClose : false, //点击遮罩关闭
				content : $("#lay")
			});
			if (flag == 0) {
				ue = UE.getEditor('editor');
				flag = 1;
			}
			if ($("#ueContent").val().length > 0) {
				//alert($("#ueContent").val());
				$("#editor").val($("#ueContent").val());
				//ue.setContent($("#ueContent").val());
			}
		}
		$(function() {
			
			$.cxSelect.defaults.url = 'address_jsonAddress.htm';
			//            $.cxSelect.defaults.url = 'http://code.ciaoca.com/jquery/cxselect/demo/js/cityData.min.json';
			$("#s1").cxSelect({
				selects : [ 'father', 'son' ],
				nodata : 'none'
			});
			
			$(".saveContent").on("click", function() {
				$("#ueContent").val(ue.getContent());
				layer.closeAll(); //疯狂模式，关闭所有层
			});
			var spinner = $("#spinner").spinner(
					{
						create : function(event, ui) {
							//add custom classes and icons
							$(this).next().addClass('btn btn-success').html(
									'<i class="icon-plus"></i>').next()
									.addClass('btn btn-danger').html(
											'<i class="icon-minus"></i>')

							//larger buttons on touch devices
							if (ace.click_event == "tap")
								$(this).closest('.ui-spinner').addClass(
										'ui-spinner-touch');
						}
					});

			$('.imgfile').find('input[type=file]').ace_file_input(
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
