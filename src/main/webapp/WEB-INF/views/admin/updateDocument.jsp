<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 修改博客</title>

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
    <h3>软件下载中心 系统 - 修改软件</h3>
    <hr/>
    <form:form action="${ctx}/admin/documents/update" method="post" commandName="documentP" role="form">

        <div class="form-group">
            <label for="title">标题:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题:" value="${document.title}"/>
        </div>
        <div class="form-group">
            <label for="remark">文件描述:</label>
            <input class="form-control" id="remark" name="remark" rows="3" value="${document.remark}" placeholder="请输入文件描述:"
                      ></input>
        </div>

        <div class="form-group">
            <label for="type">文件类型:</label>
            <select class="form-control" id="type" name="type">
                <c:forEach items="${documentTypeMap}" var="type">
                    <option value= ${type.key}
                            <c:if test="${document.type == type.key}">
                                    selected
                            </c:if>
                    >${type.value} </option>

                </c:forEach>
            </select>
        </div>
        <!-- 把 id 一并写入 blogP 中 -->
        <input type="hidden" id="id" name="id" value="${document.id}"/>
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