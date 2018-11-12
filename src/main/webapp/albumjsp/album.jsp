<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>


    $(function () {


        $("#dg3").treegrid({
           url:'${pageContext.request.contextPath}/album/findAll',
            method: 'get',
            idField: 'id',
            treeField: 'name',
            toolbar:'#tab3',
            animate:true,
            autoSave:true,
            fitColumns:true,
            striped:true,
           // rownumbers:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
           fit:true,
          //  showFooter:true,
            columns:[[
               // {title:'cks',field:"cks",checkbox:true},

                {title:'name',field:'name',width:120,editor:"text",},
                {title:'url',field:'url',width:120,sortable:true},
                {title:'size',field:'size',width:120,sortable:true,editor:"text",},
                {title:'hour',field:'hour',width:120,sortable:true,editor:"text",}
            ]],



        })
    })
    //打开保存用户对话框函数
    function updateAlbum(){

        $("#saveUserDialog").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#saveUserInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/album/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //关闭对话框
                            $("#saveUserDialog").dialog('close');
                            //刷新datagrid
                            $("#dg3").treegrid('reload');
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


    //打开展示用户的对话框
    function selectAlbum(){
        var row = $("#dg3").treegrid("getSelected");
        if (row==null||row.star==undefined) {
            $.messager.show({title: '提示', msg: "请选择一个专辑"});
        }else{
            console.log(row.name);
        $("#editUserDialog").dialog({
            href:'${pageContext.request.contextPath}/albumjsp/edit.jsp?id='+ row.id,
            buttons:[
                {

                    iconCls:'icon-cancel',
                    text:"取消",
                    handler:function(){
                        $("#editUserDialog").dialog('close');
                    }
                },
            ]
        });

    }
    }
    //添加音频
    function updateChapter() {
        var row = $("#dg3").treegrid("getSelected");
        if (row==null||row.star==undefined) {
                $.messager.show({title: '提示', msg: "请选择专辑再进行添加"});
        } else {
            $("#updateClapterDialog").dialog({
                href:'${pageContext.request.contextPath}/albumjsp/editC.jsp?id='+ row.id,
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#saveChapterInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/chapter/save',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象

                                if(result=='success'){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"音频添加成功!!!"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#updateClapterDialog").dialog('close');
                                //刷新datagrid
                                $("#dg3").treegrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#updateClapterDialog").dialog('close');
                    }
                }]
            });

        }
    }
    function selectChapter() {

        var row = $("#dg3").treegrid("getSelected");
        if (row==null||row.url==undefined) {
            $.messager.show({title: '提示', msg: "请选择你要下载的音频"});
        } else {
            window.location="${pageContext.request.contextPath}/chapter/download?fileName="+row.url;
        }

    }


</script>



<div id="tab3">
    <a href="#" class="easyui-linkbutton" onclick="selectAlbum();" data-options="iconCls:'icon-add',plain:true">专辑详情</a>
    <a href="#" class="easyui-linkbutton" onclick="updateAlbum();" data-options="iconCls:'icon-add',plain:true">添加专辑</a>
    <a href="#" class="easyui-linkbutton" onclick="updateChapter();" data-options="iconCls:'icon-add',plain:true">添加音频</a>
    <a href="#" class="easyui-linkbutton" onclick="selectChapter();" data-options="iconCls:'icon-add',plain:true">音频下载</a>
</div>

<%--保存专辑对话框--%>
<div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/albumjsp/save.jsp',draggable:false,iconCls:'icon-save',width:600,height:400,title:'添加专辑'">

</div>
<%--保存音频对话框--%>
<div id="updateClapterDialog" data-options="draggable:false,iconCls:'icon-save',width:600,height:400,title:'添加音频',">

</div>
<%--datagrid数据表格--%>
<table id="dg3"></table>





</div>

<%--展示信息--%>
<div id="editUserDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'专辑展示'">
</div>--%>








