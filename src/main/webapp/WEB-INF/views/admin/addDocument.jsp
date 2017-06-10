<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 添加文件</title>

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
    <h3> 添加软件</h3>
    <hr/>
    <form:form action="${ctx}/admin/documents/add" method="post" commandName="document"  enctype="multipart/form-data"
               role="form">
        <div class="form-group">
            <label for="title">标题:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题:"/>
        </div>
        <div class="form-group">
            <label for="filename">文件名称:</label>
            <input type="text" class="form-control" id="filename" name="filename" placeholder="请输入文件名称:"/>
        </div>
        <div class="form-group">
            <label for="remark">文件描述:</label>
            <textarea class="form-control" id="remark" name="remark" rows="3" placeholder="请输入文件描述:"></textarea>
        </div>

        <div class="form-group">
            <label for="type">文件类型:</label>
            <select class="form-control" id="type" name="type">
                <c:forEach items="${documentTypeMap}" var="type">
                    <option value= ${type.key} >${type.value}  </option>
                </c:forEach>
            </select>

        </div>
        <div class="form-group">
            <label for="createDate">上传日期:</label>
            <input type="date" class="form-control" id="createDate" name="createDate"/>
        </div>

        <div class="form-group">
            <label for="file"> 文件:</label>
            <input type="file" class="form-control" id="file" name="file" />
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>