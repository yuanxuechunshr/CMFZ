<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
            $("#saveAlbumInputForm").form('load','${pageContext.request.contextPath}/album/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}

    })
</script>
<div style="text-align: center;">
    <form id="saveAlbumInputForm" class="easyui-form" method="post" >
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 35px;">
            name: <input type="text"  name="name"  class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            publishDate: <input type="text" name="publishDate"  class="easyui-textebox">
        </div>
        <div style="margin-top: 20px;">
            coverImg: <input type="text" name="coverImg"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            star: <input type="text" name="star"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            author: <input type="text" name="author"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            broadCasts: <input type="text" name="broadCasts"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            brief: <input type="text" name="brief"  class="easyui-textbox">
        </div>
    </form>
</div>