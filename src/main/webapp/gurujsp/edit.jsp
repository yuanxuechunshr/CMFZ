<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
            $("#editGuruInputForm").form('load','${pageContext.request.contextPath}/guru/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}
    })
</script>
<div style="text-align: center;">
    <form id="editGuruInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 20px;">
            imgPath: <input  name="headPic1"  class="easyui-filebox" validType="image">
        </div>
        <div style="margin-top: 20px;">
            上师法号:<input type="text" name="name" class="easyui-textbox" value="${param.name}">
        </div>
        <div style="margin-top: 20px;">
            上师性别:
            <select class="easyui-combobox" name="sex"  data-options="width:159">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </form>
</div>