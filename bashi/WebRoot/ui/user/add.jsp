<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<%@include file='/config/css.jsp' %></head>
<body>
<!------------------------HEAD----------------------------------------><%@include file='/config/head.jsp' %>
<div class="main-container" id="main-container">
<script type="text/javascript">
try {ace.settings.check('main-container', 'fixed')
} catch (e) {
}
</script>
<div class="main-container-inner">
<!-----------------------LEFT--------------------------------------------------><%@include file='/config/left.jsp' %>
<div class="main-content">
<!---------------------------------TITLE----------------------------------------><div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">
try {
ace.settings.check('breadcrumbs', 'fixed')} catch (e) {}
</script>
<ul class="breadcrumb">
<li><i class="icon-home home-icon"></i> <a href="#">${title1}</a>
</li>
<li class="active"><s:if test="#user == null">添加信息</s:if><s:else>修改信息</s:else></li>
</ul>
</div>
<!------------------------------CONTENT------------------------------------------->
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<!-- list head and query content -->
<form onsubmit="return onsub()" method="post" action="user_<s:if test='#user == null'>add</s:if><s:else>edit</s:else>.htm" class="form-horizontal" role="form">
<s:if test="#user != null">
<input type="hidden" name="id" value="${id }">
 </s:if> 
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-0"> 账号</label>
<div class="col-sm-9">
<input name="account" value="${user.account }" type="text" id="form-field-0"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 密码</label>
<div class="col-sm-9">
<input name="psw" value="${user.psw }" type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 用户名</label>
<div class="col-sm-9">
<input name="name" value="${user.name }" type="text" id="form-field-2"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-3"> 电话号</label>
<div class="col-sm-9">
<input name="phone" value="${user.phone }" type="text" id="form-field-3"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-4"> 身份证</label>
<div class="col-sm-9">
<input name="idCard" value="${user.idCard }" type="text" id="form-field-4"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-5"> 地址</label>
<div class="col-sm-9">
<input name="address" value="${user.address }" type="text" id="form-field-5"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-6"> 类型</label>
<div class="col-sm-9">
<input name="type" value="${user.type }" type="text" id="form-field-6"  class="col-xs-10 col-sm-5" />
</div>
</div>
<div class="space-4"></div>
<div class="form-group">
<label class="col-sm-3 control-label no-padding-right" for="form-field-7"> 时间</label>
<div class="col-sm-4 input-group input-group-sm"><input name="time" value="${user.time }" type="text" id="datepicker7" class="form-control" /><span class="input-group-addon"><i class="icon-calendar"></i></span></div>
</div>
<div class="space-4"></div>
<div class="clearfix form-actions">
<div class="col-md-offset-3 col-md-9">
<button class="btn btn-info" type="submit">
<i class="icon-ok bigger-110"></i>提交</button>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
<button class="btn" type="reset"><i class="icon-undo bigger-110"></i>重置</button>
</div>
</div>
</form>
</div><!-- col-xs-12 -->
</div><!-- row -->
</div><!-- /.page-content --></div><!-- /.main-content -->
</div>
<!-- /.main-container-inner -->
<a href="#" id="btn-scroll-up"
class="btn-scroll-up btn btn-sm btn-inverse"> <i class="icon-double-angle-up icon-only bigger-110"></i></a>
</div>
<!-- /.main-container -->
<!-- basic scripts -->
<%@include file='/config/js.jsp' %>
<!-- page specific plugin scripts -->
</body>
</html>
