<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 70px;">
            图片名称: <input type="text" name="name" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            imgPath: <input  name="imgPath1" class="easyui-filebox" validType="image">
        </div>
        <div style="margin-top: 20px;">
            图片状态:
            <select class="easyui-combobox" name="status"  data-options="width:159">
                <option value="正常">T</option>
                <option value="禁用">F</option>
            </select>
        </div>
    </form>
</div>