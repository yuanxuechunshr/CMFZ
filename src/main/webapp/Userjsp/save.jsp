<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}")
        $("#updateUserInputForm").form('load','${pageContext.request.contextPath}/user/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}

    })

</script>

<div style="text-align: center;">
    <form id="updateUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 30px;">
            法号: <input type="text" name="name" class="easyui-textbox" data-options="required:true,">
        </div>
        <div style="margin-top: 20px;">
            手机: <input type="text" name="phoneNum"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            账号: <input type="text" name="username"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            密码: <input type="text" name="password"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            城市: <input type="text" name="city"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            性别:
            <select class="easyui-combobox" name="sex"  data-options="width:159">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            签名: <input type="text" name="sign"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            创建时间: <input type="text" name="addtime"  class="easyui-datebox">
        </div>
        <div style="margin-top: 20px;">
            必修1成绩: <input type="text" name="marking1"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            必修2成绩: <input type="text" name="marking2"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            状态管理:
            <select class="easyui-combobox" name="start"  data-options="width:159">
                <option value="冻结中">冻结中</option>
                <option value="正常">正常</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            headImg: <input type="text" name="headImg"  class="easyui-textbox">
        </div>
     <%--  <div style="margin-top: 20px;">
            headImg: <input type="file" name="headImg1" value="${param.headImg}">
        </div>--%>
    </form>
</div>