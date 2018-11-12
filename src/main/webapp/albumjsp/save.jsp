<%@page pageEncoding="UTF-8" %>

<div style="text-align: center;">
    <form id="saveUserInputForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <div style="margin-top: 40px;">
            name: <input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 10px;">
            star: <input type="text" name="star" class="easyui-textbox" >
        </div>
        <div style="margin-top: 10px;">
            autor: <input type="text" name="author" class="easyui-textbox" >
        </div>
        <div style="margin-top: 10px;">
            broadCasts: <input type="text" name="broadCasts" class="easyui-textbox" >
        </div>
        <div style="margin-top: 10px;">
            publishDate: <input type="text" name="publishDate" class="easyui-datebox" >
        </div>
        <div style="margin-top: 10px;">
            brief: <input type="text" name="brief" class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            封面: <input  name="coverImg1"  class="easyui-filebox" validType="image">
        </div>


    </form>
</div>