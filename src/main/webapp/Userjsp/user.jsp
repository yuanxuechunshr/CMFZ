<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>
    $(function () {
        $("#dguser").edatagrid({
            url:'${pageContext.request.contextPath}/user/findAll',//用来请求远程数据
            autoSave:true,
            fitColumns:true,
            pagination:true,//显示分页工具栏
            pageNumber:1,//当前页
            pageSize:2 ,//每页显示记录数
            pageList:[2,5,10,15,30,500],
            striped:true,
            rownumbers:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
            fit:true,
            columns:[[
                {title:'cks',field:"cks",checkbox:true},
                {title:'id',field:'id',width:120,sortable:true},
                {title:'法号',field:'name',width:120,sortable:true,editor:"text",},
                {title:'电话',field:'phoneNum',width:120,editor:"text",},
                {title:'性别',field:'sex',width:120,editor:"text",},
                {title:'城市',field:'city',width:120,editor:"text",},
                {title:'用户名',field:'username',width:120,editor:"text",},
                {title:'密码',field:'password',width:120,sortable:true,editor:"text",},
                {title:'签名',field:'sign',width:120,editor:"text",},
                {title:'头像',field:'headImg',width:120,editor:"text",},
                {title:'创建时间',field:'addtime',width:120,sortable:true,editor:"datebox",},
                {title:'用户状态',field:'start',width:120,editor:"text",}
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headImg + '" style="height:150px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name + '</p>' +
                    '<p>Status: ' + rowData.addtime + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },
            toolbar:'#tbuser',

        });
        $("#dguser").edatagrid('disableEditing');


    });
    function updateuser() {
        var row = $("#dguser").treegrid("getSelected");
        if (row==null) {
            $.messager.show({title: '提示', msg: "请选择你要修改的用户"});
        }else{
        $("#updateUserDialog").dialog({
            href:'${pageContext.request.contextPath}/Userjsp/save.jsp?id='+ row.id,
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#updateUserInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/user/update?id='+row.id,
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"用户修改成功!!!"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //关闭对话框
                            $("#updateUserDialog").dialog('close');
                            //刷新datagrid
                            $("#dguser").datagrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#updateUserDialog").dialog('close');
                }
            }]
        });

    }
    }

</script>


<table id="dguser"></table>
<div id="tbuser">
    <a href="#" class="easyui-linkbutton" onclick="updateuser();" data-options="iconCls:'icon-add',plain:true">更新</a>
</div>
<%--修改用户用户对话框--%>
<div id="updateUserDialog" data-options="draggable:false,iconCls:'icon-save',width:600,height:400,title:'更新用户信息'">

</div>
