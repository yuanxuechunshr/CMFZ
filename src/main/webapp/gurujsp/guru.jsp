<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>
    $(function () {


        //通过js创建datagrid
        $("#dg1").edatagrid({
            url:'${pageContext.request.contextPath}/guru/findAll',//用来请求远程数据
            updateUrl:'${pageContext.request.contextPath}/banner/update',
            destroyUrl:'${pageContext.request.contextPath}/banner/delete',
            saveUrl:'${pageContext.request.contextPath}/banner/save',
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
         //   fit:true,
            onDestroy:function(){
                $("#dg1").edatagrid('reload');//刷新当前datagrid
            },
            columns:[[
                {title:'cks',field:"cks",checkbox:true},
                {title:'id',field:'id',width:120,sortable:true},
                {title:'name',field:'name',width:120,editor:"text",},
                {title:'headPic',field:'headPic',width:120,sortable:true,editor:"text",},
                {title:'sex',field:'sex',width:120,sortable:true,editor:"text",},
                {title:'option',field:'option',width:120,sortable:true,editor:"text",
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"openEditguruDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新信息</a>";
                    }
                }
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic + '" style="height:150px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name + '</p>' +
                    '<p>Status: ' + rowData.sex + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },

            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            toolbar:'#tb1',

        });
        $("#dg1").edatagrid('disableEditing');


    });
    function guid() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    }
    function updatedRows() {
        $("#dg1").edatagrid('enableEditing');
        
    }
    function closedRows() {
        $("#dg1").edatagrid('disableEditing');
        
    }
    function openSaveUserDialog() {
        $('#dg1').edatagrid('addRow',{
            index: 2,
            row:{
                id:guid(),
            }
        });
    }
    function deleteOne(){

            $('#dg1').edatagrid('destroyRow');
    }



    //批量删除多行
    function delBatchRows(){
        var rows = $("#dg1").datagrid('getSelections');
        if(rows.length<=0){
            $.messager.show({title:'提示',msg:"至少选中一行!!!"});
        }else{
            var ids = [];
            for (var i = 0; i < rows.length ; i++) {
                console.log(rows[i].id);
                ids.push(rows[i].id);
            }
            console.log(ids);
            //发送ajax请求传递数组  注意: $.get $.post 只能传递简单数据(key=value) 不能数组类型的数据
            //                        如果想要传递数组类型的数据只能使用  $.ajax 并且还要设置其中的一个属性
            $.ajax({
                url:"${pageContext.request.contextPath}/guru/deleteAll",
                type:"POST",
                traditional:true,//传递数据类型的数据时必须设置这个属性为true
                data:{ids:ids},
                success:function(result){
                    //消息提示
                    $.messager.show({title:'提示',msg:"删除成功!!!"});
                    //刷新datagrid
                    $("#dg1").datagrid('reload');
                },
                error:function(){
                    //消息提示
                    $.messager.show({title:'提示',msg:"删除失败!!!"});
                    //刷新datagrid
                    $("#dg1").datagrid('reload');
                }
            })
        }
    }
        //打开保存用户对话框函数
        function updateBanner(){
            $("#saveUserDialog").dialog({
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#saveUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/guru/save',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"上师添加成功!!!"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#saveUserDialog").dialog('close');
                                //刷新datagrid
                                $("#dg1").datagrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#saveUserDialog").dialog('close');
                    }
                }]
            });

    }
    //修改上师头像
    function openEditguruDialog(id){
        $("#editGuruDialog").dialog({
            href:'${pageContext.request.contextPath}/gurujsp/edit.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function(){
                        $("#editGuruInputForm").form('submit',{
                            url:"${pageContext.request.contextPath}/guru/update",
                            success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                //关闭dialog
                                $("#editGuruDialog").dialog('close');
                                //刷新datagrid
                                $("#dg1").datagrid('reload');//刷新当前datagrid
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
                        $("#editGuruDialog").dialog('close');
                    }
                },
            ]
        });

    }

</script>




<%--datagrid数据表格--%>
<table id="dg1"></table>

<%--datagrid工具栏--%>
<div id="tb1">
  <%--  <a href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>--%>
    <a href="#" class="easyui-linkbutton" onclick="updateBanner();" data-options="iconCls:'icon-add',plain:true">添加</a>
  <%--  <a href="#" class="easyui-linkbutton" onclick="deleteOne();" data-options="iconCls:'icon-add',plain:true">删除</a>--%>
    <a href="#" class="easyui-linkbutton" onclick="delBatchRows();" data-options="iconCls:'icon-remove',plain:true">删除/批量删除</a>
    <a href="#" class="easyui-linkbutton" onclick="updatedRows();" data-options="iconCls:'icon-ok',plain:true">开启编辑模式</a>
    <a href="#" class="easyui-linkbutton" onclick="closedRows();" data-options="iconCls:'icon-no',plain:true">退出编辑模式</a>
</div>

<%--保存用户对话框--%>
<div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/gurujsp/save.jsp',draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存用户信息'">



</div>

<%--更新用户对话框--%>
<div id="editGuruDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'">
</div>








