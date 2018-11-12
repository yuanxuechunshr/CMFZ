<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 70px;">
            name: <input type="text" name="name" class="easyui-textbox" data-options="required:true,">
        </div>
        <div style="margin-top: 20px;">
            headPic: <input  name="headPic1"  class="easyui-filebox" validType="image">
        </div>
        <div style="margin-top: 20px;">
            性别:
            <select class="easyui-combobox" name="sex"  data-options="width:159">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>

    </form>
</div>