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
	['0','0','用户列表','icon-group','/ui/user_query.htm','','false','false'],
	['0','1','添加用户','icon-bolt','/ui/user_addUI.htm','','false','false'],

];

function leftInit() {
    $(function(){
        createNode();
    });
}
function logout(){
	if(confirm("您确定要退出系统吗")){
		window.close;
	}
}
function createNode(){
    var mUl = $("#left-list");
    for(var i = 0;i < conf.length;i++){
        if(conf[i][0] == '0'){

            if(conf[i][7] == 'false'){
                //没有子节点 li a i span
                var li = $('<li>',{class:conf[i][4]});
                var a =$('<a>',{href:conf[i][4]});
                var ii = $('<i>',{class:conf[i][3]});

                var span = $('<span>',{class:'menu-text',text:conf[i][2]});

                a.append(ii);
                mUl.append(li);
                li.append(a);
                a.append(span);
            }
            else{
                //有子节点 (li a i span b) (ul li a i span)
                var li = $('<li>',{class:''});
                var a =$('<a>',{href:conf[i][4],class:'dropdown-toggle'});
                var ii = $('<i>',{class:conf[i][3]});
                var span = $('<span>',{class:'menu-text',text:conf[i][2]});
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
                    if(conf[j][5] == conf[i][1]){
                        var subLi = $('<li>',{class:''});
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