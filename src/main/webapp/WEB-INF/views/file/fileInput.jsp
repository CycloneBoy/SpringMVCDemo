<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link
            href="${ctx}/static/common/fileinput/css/fileinput.min.css"
            rel="stylesheet">
    <!--引入bootstrap -->
    <link href="${ctx}/static/common/bootstrap/css/bootstrap.css"
          rel="stylesheet">
    <link href="${ctx}/static/common/bootstrap/css/bootstrap-theme.min.css"
          rel="stylesheet">

    <!--引入bootstrap -->
    <script src="${ctx}/statics/common/bootstrap/js/bootstrap.js"></script>
    <script
            src="${ctx}/statics/common/bootstrap-fileinput/js/fileinput.min.js"
            type="text/javascript"></script>
    <script src="${ctx}/statics/common/bootstrap-fileinputt/js/locales/zh.js"
            type="text/javascript"></script>

    <!-- js -->
    <script type="text/javascript">
        $("#myFile").fileinput({
            language : 'zh',
            uploadUrl : "${ctx}/admin/files/upload/photo",
            autoReplace : true,
            maxFileCount : 1,
            allowedFileExtensions : [ "jpg", "png", "gif" ],
            browseClass : "btn btn-primary", //按钮样式
            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
        }).on("fileuploaded", function(e, data) {
            var res = data.response;
            alert(res.success);
            $("#logo").attr("value", res.success);
        })
    </script>
</head>
<body>
<div class="container">

    <h1>SpringMVC 添加文件</h1>
    <hr/>
    <h3>  <label id="message"> 消息:${showmessage}</label></h3>
    <hr/>
    <form:form action="${ctx}/admin/files/upload/photo " method="post" enctype="multipart/form-data" role="form">
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">个人头像</label>
            <div class="col-sm-10">
                <input id="myFile" type="file" name="myFile" class="fileloading">
            </div>
            <input type="hidden" name="user.logo" id="logo">
        </div>
        <div class="form-group">
            <button type="submit" id="fileuploaded" class="btn btn-sm btn-success">上传</button>
        </div>
    </form:form>



</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
