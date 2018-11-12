<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>
    /*    $(function () {
                $("#dologin").click(function () {
                     $.ajax({
                         type:"post",
                         url:"",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success:function (data) {
                             alert(data);
                             
                         }
                     })
                })
        })*/
        //打开保存用户对话框函数
        function doright(){
            $("#saveAdmin").dialog({
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#rightAdmin").form('submit',{
                            url:'${pageContext.request.contextPath}/admin/right',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"用户注册成功!!!"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#doright").dialog('close');

                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#rightAdmin").dialog('close');
                    }
                }]
            });
        }


    </script>
</head>
<body>

<div id="w" class="easyui-dialog" title="管理员登录"
     data-options="modal:true,iconCls:'Lockgo',closable:false,minimizable:false"
     style="width:400px;padding:20px 70px 20px 70px;">

    <div style="margin-bottom:10px">
        <input class="easyui-textbox" name="username" style="width:100%;height:30px;padding:12px"
               data-options="prompt:'登录账号',iconCls:'icon-man',iconWidth:38">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" name="password" type="password" style="width:100%;height:30px;padding:12px"
               data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38">
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/admin/login" id="dologin" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           style="padding:5px 0px;width:100%;">
            <span style="font-size:14px;">登录</span>
        </a>
    </div>
    <div>
        <a href="#" onclick="doright();" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
           style="padding:5px 0px;width:100%;">
            <span style="font-size:14px;">注册</span>
        </a>
    </div>


</div>
<%--保存用户对话框--%>
<div id="saveAdmin" data-options="href:'${pageContext.request.contextPath}/back/Admin/right.jsp',draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存用户信息'">

</div>


</body>
</html>