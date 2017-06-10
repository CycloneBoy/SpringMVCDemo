<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 博文详情</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <h3>软件下载中心 系统 - 软件详情</h3>
    <hr/>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${document.id}</td>
        </tr>
        <tr>
            <th>标题</th>
            <td>${document.title}</td>
        </tr>
        <tr>
            <th>文件名</th>
            <td>${document.filename}</td>
        </tr>
        <tr>
            <th>描述</th>
            <td>${document.remark}</td>
        </tr>
        <tr>
            <th>文件类型</th>
            <td>${documentType}</td>
        </tr>
        <tr>
            <th>创建日期</th>
            <td><fmt:formatDate value="${document.createDate}" pattern="yyyy年MM月dd日"/></td>
        </tr>
    </table>

    <div class="form-group">
        <button type="submit" class="btn btn-sm btn-success">下载</button>
    </div>

    <hr>
    <p>
        <a onclick="myFunction()" class="btn btn-success btn-lg" role="button">下载安装</a>
        <a href="${ctx}/admin/documents" class="btn btn-primary btn-lg " role="button">返回</a>
    </p>

    <%--<input type="button" class="btn btn-success btn-lg" value="下载软件" id="btn_download" onclick="myFunction()">
    <button class="btn btn-info btn-lg" onclick="myFunction()">点我</button>
    <p id="demo"></p>--%>
</div>

<script>
    function myFunction(){
        var x;
        var r=confirm("亲：请确认下载安装软件？ ");
        if (r==true){
            x="你按下了\"确定\"按钮!";
            window.location = "${ctx}/admin/documents/download/${document.id}";
        }
        else{
            x="你按下了\"取消\"按钮!";
            window.location = "${ctx}/admin/documents/downloadUninstall/${document.id}";
        }
        //document.getElementById("demo").innerHTML=x;
    }
</script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>