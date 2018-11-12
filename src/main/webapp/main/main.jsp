<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>

   <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.etree.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.etree.lang.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
    <script type="text/javascript">
	<!--菜单处理-->
</script>
    <script>

        $(function () {
            if ('${sessionScope.admin1.name}'==''){
               /* $.messager.confirm('警告','请确认登录',function (result){
                    if (result!='session'){*/
                        window.location="${pageContext.request.contextPath}/admin/adminOut";
                    }

                })

        $(function () {
            $.post("${pageContext.request.contextPath }/menu/findAll",function (menu) {
                $.each(menu,function (index,m) {
                    var content = "<div style='text-align: center';>";
                    $.each(m.children,function(idx,child){
                        content += "<a  onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%; margin:10px 0px;border: 2px #b7d2ff solid' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>"

                    })
                    //用div包住设置样式
                    content+="</div>"
                    //分类 中的add方法 传父类的名字 图标和 遍历后的子类对象
                    $("#menu").accordion('add',{
                        title:m.name,
                        iconCls:m.iconCls,
                        content:content,
                    })
                })
            });
        });
        //添加选项卡
        function addTabs(title,iconCls,href) {
            //判断他是否打开
            if(!$("#tabs").tabs('exists',title)){
                //如果不存在 则调用添加方法
                $("#tabs").tabs('add',{
                    //传参数  头内容 图标 路径  设置属性
                    title:title,
                    iconCls:iconCls,
                    closable:true,
                    fit:true,
                    href:"${pageContext.request.contextPath}/"+href,
                });
                console.log(title,iconCls);

                //如果存在 则调用选择制定面板属性  跳到该选项卡
            }else{
                $("#tabs").tabs('select',title);

            }


        }
                

        function Out() {
            $.messager.confirm('确认','您确定要退出系统么?',function (result) {
              //  console.log(result);
                if (result){
                    window.location="${pageContext.request.contextPath}/admin/adminOut";
                }

            });
            
        }
        //打开修改用户的对话框
        function edit(id){

            $("#updateAdmin").dialog({
                href:'${pageContext.request.contextPath}/edit.jsp?id='+id,

                buttons:[
                    {
                        iconCls:'icon-save',
                        text:"修改",
                        handler:function(){
                            $("#editAdminInputForm").form('submit',{
                                url:"${pageContext.request.contextPath}/admin/update",
                                success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                    //关闭dialog
                                    $("#updateAdmin").dialog('close');
                                    //刷新datagrid
                                    $("#dg").datagrid('reload');//刷新当前datagrid
                                    //提示修改信息
                                    $.messager.show({title:'提示',msg:"用户信息修改成功!!!"});
                                }
                            })
                        }
                    },
                    {
                        iconCls:'icon-cancel',
                        text:"取消",
                        handler:function(){
                            $("#updateAdmin").dialog('close');
                        }
                    },
                ]
            });

        }




    </script>

</head>
<body class="easyui-layout">
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>

    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin1.name} &nbsp;<a href="javascript:;"  onclick="edit('${sessionScope.admin1.id}')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="#" onclick="Out()" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>

    </div>
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       <%--//左边菜单栏--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="menu" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>


   <%-- //主页--%>
     <div data-options="region:'center'">
         <div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
             <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
     </div>
     </div>
    <%--更新用户对话框--%>
    <div id="updateAdmin" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'">

    </div>
</body> 
</html>