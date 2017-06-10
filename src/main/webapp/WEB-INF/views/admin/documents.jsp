<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 博客管理</title>

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
    <h3>软件下载中心 系统  - 软件管理</h3>
    <hr/>

    <h3>所有软件 <a href="${ctx}/admin/documents/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>

    <!-- 如果文件列表为空 -->
    <c:if test="${empty documentList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>当前类型软件列表表为空，请<a
                href="/admin/blogs/add"
                                                                                           type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>

    <!-- 如果文件列表非空 -->
    <c:if test="${!empty documentList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>文件名</th>
                <th>描述</th>
                <th>文件类型</th>
                <th>创建日期</th>
                <th>创建人</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${documentList}" var="document">
                <tr>
                    <td>${document.id}</td>
                    <td>${document.title}</td>
                    <td>${document.filename}</td>
                    <td>${document.remark}</td>
                    <td>${document.type}</td>
                    <td>${document.userByUserId.nickname}, ${document.userByUserId.firstName} ${document.userByUserId.lastName}</td>
                    <td><fmt:formatDate value="${document.createDate }" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <a href="${ctx}/admin/documents/show/${document.id}" type="button" class="btn btn-sm btn-info">详情</a>
                        <a href="${ctx}/admin/documents/download/${document.id}" type="button" class="btn btn-sm btn-success"  >下载</a>

                        <a href="${ctx}/admin/documents/update/${document.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="${ctx}/admin/documents/delete/${document.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>




<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
