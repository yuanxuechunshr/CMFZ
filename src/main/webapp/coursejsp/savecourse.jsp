<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#updateCourseInputForm1").form('load','${pageContext.request.contextPath}/course/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}

    })

</script>

<div style="text-align: center;">
    <form id="updateCourseInputForm1" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 70px;">
            功课名称: <input type="text" name="name" class="easyui-textbox" data-options="required:true,">
        </div>
      <%--  <div style="margin-top: 20px;">
            创建日期:<input type="text" name="creatTime" class="easyui-datebox" value="${param.creatTime}">
        </div>--%>
        <div style="margin-top: 20px;">
          <input type="hidden" name="id" value="${param.id}">
        </div>

    </form>
</div>