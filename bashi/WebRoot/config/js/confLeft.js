/**
 * Created by wangdong on 14/10/29.
 */

/*
 规则：先配置顶级菜单，然后子菜单,空值需填空字符串
 1.设置菜单级别（必填）
 2.菜单编号
 3.菜单显示的文字（可填）
 4.菜单图标（可填）(可查图标字典)
 5.菜单的URL（可填）
 6.父级菜单的编号（可填）
 7.是否为打开状态（或是选择状态）(true：打开；false：关闭)
 8.是否有子菜单（true:有；false：没有）
 */
var conf = [
  
	['0','1','控制台','icon-home','#','1','false','false'],
	['0','289','首页大图上传','icon-home','news_uploadImg.htm','1','false','false'],
	
	['0','112','管理文章','icon-food','#','3','false','true'],
		['1','11','文章添加','','news_addUI.htm','112','false','true'],
		['1','11','文章列表','','news_list.htm?pageNum=1','112','false','false'],
		['1','11','管理文章类型','','type_list.htm','112','false','false'],
	['0','111','管理旅游地区','icon-food','#','3','false','true'],
		['1','11','旅游地区添加','','address_addUI.htm','111','false','true'],
		['1','11','一级地区列表','','address_list_father.htm','111','false','false'],
		['1','11','二级地区列表','','address_list.htm','111','false','false'],
	['0','222','管理专题旅游','icon-food','#','3','false','true'],
		['1','11','专题旅游添加','','zhuanti_addUI.htm','222','false','true'],
		['1','11','专题旅游列表','','zhuanti_list.htm','222','false','false'],
		['1','11','专题子页面添加','','subzt_addUI.htm','222','false','true'],
		['1','11','专题子页面列表','','subzt_list.htm','222','false','false'],
	['0','2','管理旅游攻略','icon-food','#','3','false','true'],
		['1','11','旅游攻略添加','','gonglue_addUI.htm','2','false','true'],
	    ['1','11','旅游攻略列表','','gonglue_list.htm','2','false','false'],
    ['0','3','管理时间胶囊','icon-food','#','3','false','true'],
	    ['1','11','时间胶囊图片添加','','jiaonuan_upLoadImg.htm','3','false','false'],
	    ['1','11','时间胶囊添加','','jiaonuan_addUI.htm','3','false','false'],
	    ['1','11','时间胶囊列表','','jiaonuan_list.htm','3','false','false'],
//    ['0','8','管理促销','icon-truck','#','3','false','true'],
//	    ['1','11','管理促销添加','','shougou_addUI.htm','8','false','false'],
//	    ['1','11','管理促销列表','','shougou_list.htm','8','false','false'],
//    ['0','9','管理用户',' icon-food','#','4','false','true'],
//	    ['1','11','管理用户添加','','user_addUI.htm','9','false','false'],
//	    ['1','11','管理用户列表','','user_list.htm','9','false','false'],
    ['0','10','管理管理员','icon-truck','#','5','false','true'],
	    ['1','11','管理员添加','','admin_addUI.htm','10','false','false'],
	    ['1','11','管理员列表','','admin_list.htm','10','false','false'],
    ['0','11','订单管理','icon-truck','#','1','false','true'],
	    ['1','11','订单管理添加','','order_addUI.htm','11','false','false'],
	    ['1','11','订单管理列表','','order_list.htm','11','false','false'],
];

function leftInit() {
    $(function(){
        createNode();
    });
}


/**
 * 已表单的方式提交参数
 * @param name 隐藏字段名
 * @param value 值 
 */
function initFORM(){
    var f = document.createElement("form");
    f.id = 'formx1';
    f.method='post';
    f.action='xxx.html';
    f.name='formx1';
    var h = document.createElement("input");
    h.type='hidden';
    h.id = "idX1";
    f.appendChild(h);
    document.body.appendChild(f);
}

function submitFORM(name,value,url){
    var hidden = document.getElementById('idX1');
    document.getElementById("formx1").action = url;
    hidden.name = name;
    hidden.value = value;
    document.formx1.submit();
}

function logout(){
	var b = confirm("您确定要退出系统吗");
	if(b){
		//window.close();
		window.location.href = "user_logout.htm";
	}
}

/**
 * 根据地址跳转
 */
function bHref(href){
	window.location.href = href;
}
/**
 * 确认删除
 */
function del(href){
	if(confirm("确定永久删除数据吗")){
		window.location.href = href;
	}
}

/**
 * 选择全部的选择按钮
 * @param t this对象
 * @param cName checkbox name
 */
function checkedAll(t,cName){
    var a = document.getElementsByName(cName)
    for(var i=0;i< a.length;i++){
        a[i].checked = t.checked;
    }
}

/**
 * 获取多选择按钮的值
 * @param cName 多选择按钮名字
 * @returns {String}
 */
function checkedValue (cName) {
    var v = "";
    var a = document.getElementsByName(cName)
    for(var i=0;i< a.length;i++){

        if(a[i].checked){
            v += a[i].value+",";
        }

    }
   return v;
}


/**
 * 初始化下拉列表
 * @param id select ID
 * @param f 标志 
 */
function initNow(id,f){
	
	var now = new Date();
	var year = now.getFullYear();
	var mouth = now.getMonth()+1;
	var day = now.getDate();
	if(f == "year"){
	 $("#"+id).val(year);	
	}else if(f == 'mouth'){
		$("#"+id).val(mouth);	
	}else{
		$("#"+id).val(day<10?'0'+day:day+'');//
	}
}

/**
 * 
 * @param t
 * @param msg 弹出的消息
 */
function vNum(t){
//    var reg = new RegExp("^[0-9]*$");
//    if(!reg.test(t.value)){
//    	t.value="";
//    	alert("不能有非数字字符！")
//    	t.focus();
//    	return false;
//    }
//    
////    alert(t.value)?
	return true;
}



function createNode(){
    var mUl = $("#left-list");
    for(var i = 0;i < conf.length;i++){
        if(conf[i][0] == '0'){

            if(conf[i][7] == 'false'){
                //没有子节点 li a i span
                var li = $("<li class='open'>",{class:conf[i][4],id:"father"+i });
                var a =$('<a>',{href:conf[i][4]});
                var ii = $('<i>',{class:conf[i][3]});

                var span = $('<span>',{class:'menu-text',text:conf[i][2]});
                span.id='span'+i;
                a.append(ii);
                mUl.append(li);
                li.append(a);
                a.append(span);
            }
            else{
                //有子节点 (li a i span b) (ul li a i span)
                var li = $("<li class='open'>",{class:'',id:"father"+i});
                var a =$('<a>',{href:conf[i][4],class:'dropdown-toggle'});
                var ii = $('<i>',{class:conf[i][3]});
                var span = $('<span>',{class:'menu-text',text:conf[i][2]});
                span.id='span'+i;
                var b = $("<b>",{class:'arrow icon-angle-down'});
                mUl.append(li);
                li.append(a);
                a.append(ii);
                a.append(span);
                a.append(b);
                //遍历所有子菜单
                var ul = $('<ul>',{class:'submenu'});
                li.append(ul);

                for(var j=0;j<conf.length;j++){
                  //  alert(conf[j][5]+':'+conf[i][1]);
                	if(conf[j][0] != '0'){
                		 if(conf[j][5] == conf[i][1]){
	                        var subLi = $('<li>',{class:'',id:'subLi'+j});
	                        var subA =$('<a>',{href:conf[j][4]});
	                        var subI = $('<i>',{class:'icon-double-angle-right'});
	                        var subSpan = $('<span>',{class:'xx',text:conf[j][2]});
	                        ul.append(subLi);
	                        subLi.append(subA);
	                        subA.append(subI);
	                        subA.append(subSpan);
	                    }
                	}
                   
                }
            }
        }
    }
}