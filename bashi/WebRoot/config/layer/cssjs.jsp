<link rel="stylesheet" href="${pageContext.request.contextPath}/config/layer/skin/layer.css" />
<script src="${pageContext.request.contextPath}/config/layer/layer.js"></script>
	<script>
		
		function layerIframe(){
			layer.open({
			    type: 2,
			    title: '旅游攻略',
			    shadeClose: true,
			    shade: 0.8,
			    area: ['380px', '450px'],
			    content: '／file/wuxi' //iframe的url
			}); 
		}
	</script>