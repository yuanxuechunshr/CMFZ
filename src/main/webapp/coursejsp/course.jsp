<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

    <script>
        $(function () {
          $("#dgcourse1").treegrid({
            url:'${pageContext.request.contextPath}/course/findAllone',
            method: 'get',
            idField: 'id',
            treeField: 'name',
            animate:true,
            autoSave:true,
            fitColumns:true,
            striped:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
              height:290,
            //  showFooter:true,
            columns:[[
                // {title:'cks',field:"cks",checkbox:true},

                {title:'必修功课1 / 用户',field:'name',width:120,editor:"text",},
                {title:'sign',field:'sign',width:120,sortable:true},
                {title:'分数',field:'marking1',width:120,sortable:true,editor:"text",}
            ]],
              toolbar:'#tabcourse',
          })

        $("#dgcourse2").treegrid({
            url:'${pageContext.request.contextPath}/course/findAlltwo',
            method: 'get',
            idField: 'id',
            treeField: 'name',
            animate:true,
            autoSave:true,
            fitColumns:true,
            striped:true,
            singleSelect:false,
            ctrlSelect:true,
            remoteSort:false,
            multiSort:true,
            //  showFooter:true,
            columns:[[
                // {title:'cks',field:"cks",checkbox:true},
                {title:'必修功课2 / 用户',field:'name',width:120,editor:"text",},
                {title:'sign',field:'sign',width:120,sortable:true},
                {title:'分数',field:'marking2',width:120,sortable:true,editor:"text",}
            ]],
            toolbar:'#tabcourse2',
        })
        })
    function updateUser() {
        var row = $("#dgcourse1").treegrid("getSelected");
        if (row==null||row.creatTime!=null) {
            $.messager.show({title: '提示', msg: "请选择你要修改的用户信息"});
        }else {

                $("#updateCourseDialog").dialog({
                    href:'${pageContext.request.contextPath}/coursejsp/saveuser.jsp?id='+ row.id,
                    buttons:[{
                        iconCls:'icon-save',
                        text:'保存',
                        handler:function(){
                            //保存用户信息
                            $("#updateCourseInputForm").form('submit',{
                                url:'${pageContext.request.contextPath}/user/update?id='+row.id,
                                success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                    var resultObj = $.parseJSON(result);
                                    if(resultObj.success){
                                        //提示信息
                                        $.messager.show({title:'提示',msg:"修改成功!!!"});
                                    }else{
                                        //提示信息
                                        $.messager.show({title:'提示',msg:resultObj.message});
                                    }
                                    //关闭对话框
                                    $("#updateCourseDialog").dialog('close');
                                    //刷新datagrid
                                    $("#dgcourse1").treegrid('reload');
                                }
                            });
                        }
                    },{
                        iconCls:'icon-cancel',
                        text:'关闭',
                        handler:function(){
                            $("#updateCourseDialog").dialog('close');
                        }
                    }]
                });
            }

    }
    function updateUser2() {
        var row = $("#dgcourse2").treegrid("getSelected");
        if (row==null||row.creatTime!=null) {
            $.messager.show({title: '提示', msg: "请选择你要修改的用户信息"});
        }else {
            $("#updateCourseDialog2").dialog({
                href:'${pageContext.request.contextPath}/coursejsp/saveuser2.jsp?id='+ row.id,
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#updateCourseInputForm2").form('submit',{
                            url:'${pageContext.request.contextPath}/user/update?id='+row.id,
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"修改成功!!!"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#updateCourseDialog2").dialog('close');
                                //刷新datagrid
                                $("#dgcourse2").treegrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#updateCourseDialog2").dialog('close');
                    }
                }]
            });
        }
    }
    function updateCourse() {
        var row = $("#dgcourse1").treegrid("getSelected");
        if (row==null||row.children==null) {
            $.messager.show({title: '提示', msg: "请选择你要更新的功课"});
        }else {
            $("#updateCourseDialog3").dialog({
                href:'${pageContext.request.contextPath}/coursejsp/savecourse.jsp?id='+ row.id,
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户信息
                        $("#updateCourseInputForm1").form('submit',{
                            url:'${pageContext.request.contextPath}/course/update?id='+row.id,
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"修改成功!!!"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#updateCourseDialog3").dialog('close');
                                //刷新datagrid
                                $("#dgcourse1").treegrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#updateCourseDialog3").dialog('close');
                    }
                }]
            });
    }
    }
        function updateCourse2() {
            var row = $("#dgcourse2").treegrid("getSelected");
            console.log(row)
            if (row==null||row.children==null) {
                $.messager.show({title: '提示', msg: "请选择你要更新的功课"});
            }else {
                $("#updateCourseDialog3").dialog({
                    href:'${pageContext.request.contextPath}/coursejsp/savecourse.jsp?id='+ row.id,
                    buttons:[{
                        iconCls:'icon-save',
                        text:'保存',
                        handler:function(){
                            //保存用户信息
                            $("#updateCourseInputForm1").form('submit',{
                                url:'${pageContext.request.contextPath}/course/update?id='+row.id,
                                success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                    var resultObj = $.parseJSON(result);
                                    if(resultObj.success){
                                        //提示信息
                                        $.messager.show({title:'提示',msg:"修改成功!!!"});
                                    }else{
                                        //提示信息
                                        $.messager.show({title:'提示',msg:resultObj.message});
                                    }
                                    //关闭对话框
                                    $("#updateCourseDialog3").dialog('close');
                                    //刷新datagrid
                                    $("#dgcourse2").treegrid('reload');
                                }
                            });
                        }
                    },{
                        iconCls:'icon-cancel',
                        text:'关闭',
                        handler:function(){
                            $("#updateCourseDialog3").dialog('close');
                        }
                    }]
                });
            }
        }


    </script>

<div id="tabcourse">
    <a href="#" class="easyui-linkbutton" onclick="updateCourse();" data-options="iconCls:'icon-add',plain:true">更新课程</a>
    <a href="#" class="easyui-linkbutton" onclick="updateUser();" data-options="iconCls:'icon-add',plain:true">修改</a>
</div>
<div id="tabcourse2">
    <a href="#" class="easyui-linkbutton" onclick="updateCourse2();" data-options="iconCls:'icon-add',plain:true">更新课程</a>
    <a href="#" class="easyui-linkbutton" onclick="updateUser2();" data-options="iconCls:'icon-add',plain:true">修改</a>
</div>
<table id="dgcourse1"></table>
<table id="dgcourse2"></table>
<%--修改必修课1用户对话框--%>
<div id="updateCourseDialog" data-options="draggable:false,iconCls:'icon-save',width:500,height:250,title:'更新用户信息'">
</div>
<%--修改必修课2用户对话框--%>
<div id="updateCourseDialog2" data-options="draggable:false,iconCls:'icon-save',width:500,height:250,title:'更新用户信息'">
</div>
<%--修改必课程用户对话框--%>
<div id="updateCourseDialog3" data-options="draggable:false,iconCls:'icon-save',width:400,height:230,title:'更新课程信息'">
</div>

