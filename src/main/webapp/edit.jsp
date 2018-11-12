<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {


            $("#editAdminInputForm").form('load','${pageContext.request.contextPath}/admin/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}


    })
</script>
<div style="text-align: center;">
    <form id="editAdminInputForm" class="easyui-form" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            真实姓名: <input type="text"  name="name"  class="easyui-textbox" data-options="required:true,readonly:true,">
        </div>
        <div style="margin-top: 20px;">
            用户名: <input type="text" name="username"  class="easyui-textbox" data-options="readonly:true,">
        </div>
        <div style="margin-top: 20px;">
            密码: <input type="text" name="password"  class="easyui-textbox">
        </div>
    </form>
</div>