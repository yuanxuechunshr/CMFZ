<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
            $("#editBannerInputForm").form('load','${pageContext.request.contextPath}/banner/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}
    })
</script>
<div style="text-align: center;">
    <form id="editBannerInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 20px;">
            图片名称:<input type="text" name="name" class="easyui-textbox" value="${param.name}">
        </div>
        <div style="margin-top: 20px;">
            图片状态:
            <select class="easyui-combobox" name="status"  data-options="width:159">
                <option value="正常">T</option>
                <option value="禁用">F</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            修改日期: <input type="text" name="date"  class="easyui-datebox">
        </div>
        <div style="margin-top: 20px;">
            图片更新: <input   name="imgPath1"  class="easyui-filebox" validType="image">
        </div>

    </form>
</div>