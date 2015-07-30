<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
		<!--[if !IE]> -->

		<script src="${pageContext.request.contextPath}/config/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/config/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/config/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/config/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/config/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/config/assets/js/typeahead-bs2.min.js"></script>

		<!-- ace scripts -->

		<script src="${pageContext.request.contextPath}/config/assets/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath}/config/assets/js/ace.min.js"></script>
    
    	<script src="${pageContext.request.contextPath}/config/assets/js/jquery-ui-1.10.3.full.min.js"></script>
		<script src="${pageContext.request.contextPath}/config/assets/js/jquery.ui.touch-punch.min.js"></script>
    
    	<!-- validation engine -->
    	<script src="${pageContext.request.contextPath}/config/validation-engine/js/jquery.validationEngine.js"></script>
    	<script src="${pageContext.request.contextPath}/config/validation-engine/js/languages/jquery.validationEngine-zh_CN.js"></script>
    
    	<script>
    	
    		//validation engine setting
    		$(function(){
    			$("#form1").validationEngine();
    		})
    	
    		$(function(){
    			$( "#datepicker0" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker1" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker2" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker3" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker4" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker5" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker6" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker7" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker8" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			$( "#datepicker9" ).datepicker({
					showOtherMonths: true,
					selectOtherMonths: false,
					dateFormat: 'yy-mm-dd',
					//isRTL:true,
					/*
					changeMonth: true,
					changeYear: true,
					
					showButtonPanel: true,*/
					beforeShow: function() {
						//change button colors
						var datepicker = $(this).datepicker( "widget" );
						setTimeout(function(){
							var buttons = datepicker.find('.ui-datepicker-buttonpane')
							.find('button');
							buttons.eq(0).addClass('btn btn-xs');
							buttons.eq(1).addClass('btn btn-xs btn-success');
							buttons.wrapInner('<span class="bigger-110" />');
						}, 0);
					}
			
				});
    			
    		})
    	</script>
    
    