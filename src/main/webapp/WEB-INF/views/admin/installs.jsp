<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>软件下载中心 系统 - 安装记录管理</title>

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
    <h3> 软件安装中心系统 - 安装记录管理</h3>
    <hr/>

    <h4>所有记录：</h4>
    <a  type="button" href="${ctx}/admin/installs" class="btn btn-sm btn-info">查看所有</a>
    <hr/>
    <form:form action="${ctx}/admin/installs/get" method="post"  commandName="userFind" role="form">
        <div class="form-group">
            <label >查询安装记录</label>
        </div>
        <div class="form-group">
            <label for="id">用户名称</label>
            <select class="form-control" id="id" name="id">
                <c:forEach items="${userList}" var="user">
                    <option value="${user.id}">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">查询</button>
        </div>
    </form:form>
    <hr/>
    <form:form action="${ctx}/admin/installs/getByDocument" method="post"  commandName="documentFind" role="form">
        <div class="form-group">
            <label >查询某种软件安装记录</label>
        </div>
        <div class="form-group">
            <label for="id">软件名称</label>
            <select class="form-control" id="id" name="id">
                <c:forEach items="${documentList}" var="document">
                    <option value="${document.id}">${document.title} ${document.filename}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">查询</button>
        </div>
    </form:form>

    <!-- 如果安装列表为空 -->
    <c:if test="${empty installList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>安装记录表为空，请
            <a href="#" type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>

    <!-- 如果安装列表非空 -->
    <c:if test="${!empty installList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>安装状态</th>
                <th>安装用户</th>
                <th>软件信息</th>
                <th>安装日期</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${installList}" var="install">
                <tr>
                    <td>${install.id}</td>
                    <td>${install.type}</td>
                    <td>${install.userByUserId.nickname}<%--, ${install.userByUserId.firstName} ${install.userByUserId.lastName}--%></td>
                    <td>${install.documentByDocumentId.title}  , ${install.documentByDocumentId.filename}</td>
                    <td><fmt:formatDate value="${install.installDate }" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <%--<a href="${ctx}/admin/installs/show/${install.id}" type="button" class="btn btn-sm btn-success">
                            详情</a>
                        <a href="${ctx}/admin/installs/update/${install.id}" type="button"
                           class="btn btn-sm btn-warning">修改</a>--%>
                        <a href="${ctx}/admin/installs/delete/${install.id}" type="button"
                           class="btn btn-sm btn-danger">删除</a>
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