<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>巴士－攻略</title>
    <meta charset="utf-8">
    <meta name="keywords" content="巴士旅游网,让生活简单,旅游看攻略,专题旅游,许愿出行,旅行" />
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="logo.ico">
    <link rel="shortcut icon" href="logo.ico"/>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/script.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/jquery.ui.totop.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/myjs.js"></script>
    <script>
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });
        });
    </script>
    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
                 height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <link rel="stylesheet" media="screen" href="css/ie.css">
    <![endif]-->
</head>
<body>
<!--==============================header=================================-->
<header>
    <div class="container_12">
        <div class="grid_12">
            <div class="menu_block">
                <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                    <ul class="sf-menu">
                        <li><a href="index.html">主页</a></li>
                        <li><a href="index-1.html">专题旅游</a></li>
                        <li class="current"><a href="index-2.html">看攻略</a></li>
                        <li><a href="index-3.html">巴客一族</a></li>
                        <li><a href="index-4.html">时间胶囊</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
        </div>
        <div class="grid_12">
            <h1>
                <a href="index-gird.html">
							<img src="images/logo.png" alt="巴士旅游网">
						</a>
            </h1>
        </div>
    </div>
</header>
<!--==============================Content=================================-->
<div class="content">
    <div class="container_12">
        <div class="grid_8 articles">
            <h3>世界在你眼前</h3>

            
            
            
          
           
        </div>
        <div class="grid_3 prefix_1">
            <h5>选择地区</h5>
            <ul class="list address" id="address_json">
               
            </ul>
            <a href="index-2.html" class="link1">所有攻略</a>
        </div>
    </div>
</div>
<!--==============================footer=================================-->
<script type="text/javascript" src="js/footer.js"></script>
<!-- <a href="javascript:void(0)" onclick="showLogin()" id="login" style="margin-right: -550px; right: 50%; display: block;"></a> -->
<script>
	var pageNum = 1;
    $(function () {
    		
        $.post("gonglueflist.htm?pageNum=1",function(data){
	        	$.each(JSON.parse(data),function(i,v){
	        		var a = "<div class='block2'><img src='../file/"+v.headImg+"' alt='' class='img_inner fleft'>";
	        		var b = "<div class='extra_wrapper'><div class='text1 col1'><a href='#'>"+v.title+"</a></div>";
	        		var c = "<p>"+v.miaoshu+"</p><br><a href='"+v.filePath+"'target='_blank' class='link1'>查看电子杂志</a></div></div>";
	        		$(".articles").append(a+b+c);
	        		
	        	})
	        	addLoadContent();
        })
        
        
        function address_id(address_name){
        	var id = 0;
        	$.ajax({ 
        		url: "addressfgetId.htm",
        		type:'post',
        		data:{name:address_name},
        		async:false,
        		success: function(result){
					id=result;
        		}
        	});
        	
        	/* $.post("addressfgetId.htm",{name:address_name},function(result){
        		id = result;
        	}); */
        	return id;
        }
        
        //加载地区
        $.post("addressflist.htm",function(data){
	        	$.each(JSON.parse(data),function(i,v){
	        		var a = "<li><a>"+v[0]+"</a><ul>"
	        		var b = "";
	        		var ss = v[1].split(",")
	        		for(var i =0;i<ss.length;i++){
	        			var id = address_id(ss[i]);
		        		b += "<li><a href='index-2-1.html?id="+id+"'>"+ss[i]+"</a></li>"
	        		}
	        		var c = "</ul></li>"
	        		$("#address_json").append(a+b+c);
	        	})
	        }).success(function(){
	        	$(".address li ul").hide();
	        	$(".address li a").on("click",function(){
	    	        var a = $(this).siblings("ul");
	    	        var fu = $(this).parent();
	    	        if(a.is(":visible")==false){
	    	//               fu.attr("background","url(../images/marker2.png) no-repeat")
	    	               fu.css("background","url(images/marker2.png) 0 6px no-repeat");
	    	                a.slideDown();
	    	        }
	    	        else{
	    	            a.slideUp();
	    	            fu.css("background","url(images/marker.png) 0 6px no-repeat");
	    	        }
	
	        	})
        })
    })
    
    function reLoad(){
    		pageNum ++;
    		$('.gl_addmore').html("正在加载...")
    		$.post("gonglueflist.htm?pageNum="+pageNum,function(data){
	        	$.each(JSON.parse(data),function(i,v){
	        		var a = "<div class='block2'><img src='../file/"+v.headImg+"' alt='' class='img_inner fleft'>";
	        		var b = "<div class='extra_wrapper'><div class='text1 col1'><a href='#'>"+v.title+"</a></div>";
	        		var c = "<p>"+v.miaoshu+"</p><br><a href='"+v.filePath+"'target='_blank' class='link1'>查看电子杂志</a></div></div>";
	        		removeLoadContent();
	        		$(".articles").append(a+b+c);
	        	})

        		if(!noData(data)){
        			addLoadContent();
        		}
        })
    }
    
    function addLoadContent(){
    		var c = "<div class='block2 gl_addmore' onclick='reLoad()'><div>您使劲点</div></div>";
    		$(".articles").append(c);
    }
    function removeLoadContent(){
    		$(".gl_addmore").remove();
    }
    function noData(data){
		if(data.length <= 2){
			//已经到底了
			 $(".gl_addmore").html("已经到底了");
			return true;
		}
		return false;
	}
    
</script>
</body>
</html>