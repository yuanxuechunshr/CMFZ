<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}")
        $("#updateCourseInputForm2").form('load','${pageContext.request.contextPath}/user/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}

    })

</script>

<div style="text-align: center;">
    <form id="updateCourseInputForm2" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 30px;">
            法号: <input type="text" name="name" class="easyui-textbox" data-options="required:true,">
        </div>
        <div style="margin-top: 20px;">
            签名: <input type="text" name="sign"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
        成绩: <input type="text" name="marking2"  class="easyui-textbox">
    </div>
        <div style="margin-top: 20px;">
            <input type="hidden" name="marking1" value="${param.marking1}">
            <input type="hidden" name="phoneNum" value="${param.phoneNum}">
            <input type="hidden" name="username" value="${param.username}">
            <input type="hidden" name="password" value="${param.password}">
            <input type="hidden" name="city" value="${param.city}">
            <input type="hidden" name="sex" value="${param.sex}">
            <input type="hidden" name="headImg" value="${param.headImg}">
            <input type="hidden" name="addtime" value="${param.addtime}">
            <input type="hidden" name="start" value="${param.start}">
        </div>
       <%-- <div style="margin-top: 20px;">
            headImg: <input type="file" name="headImg1">
        </div>--%>
    </form>
</div>