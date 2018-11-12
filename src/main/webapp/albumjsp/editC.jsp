<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
</script>
<div style="text-align: center;">
    <form id="saveChapterInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
      <%--  <input type="hidden" name="a_id" value="${param.id}">--%>
        <div style="margin-top: 35px;">
            name: <input type="text"  name="name"  class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            url: <input type="file" name="url1">
        </div>
        <div style="margin-top: 20px;">
           <input type="hidden" name="a_id" value="${param.id}">
        </div>

    </form>
</div>